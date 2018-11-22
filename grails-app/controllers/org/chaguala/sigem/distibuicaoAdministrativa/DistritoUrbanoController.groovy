package org.chaguala.sigem.distibuicaoAdministrativa


import org.grails.plugin.filterpane.FilterPaneUtils
import org.chaguala.sigem.general.SuperController
import org.springframework.dao.DataIntegrityViolationException

class DistritoUrbanoController extends SuperController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    static navigation = [
            [group: 'DistritoUrbano', action: 'create', title: 'Criar', order: 0, isVisible: {
                session.currentAction.equals('list') || session.currentAction.equals('show')
            }],
            [action: 'list', title: 'Voltar', order: 1, isVisible: {
                session.currentAction.equals('show') || session.currentAction.equals('create')
            }],
            [action: 'fechar', title: 'Sair', order: 2, isVisible: { !session.currentAction.equals('edit1') }]
    ]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        updateCurrentAction('list')
        session.tabContentc = 1
        session.list = true
        params.max = Math.min(max ?: 10, 100)
        [distritoUrbanoInstanceList: DistritoUrbano.list(params), distritoUrbanoInstanceTotal: DistritoUrbano.count()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, DistritoUrbano))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [distritoUrbanoInstanceList: filterPaneService.filter(params, DistritoUrbano),
                                     distritoUrbanoInstanceTotal: filterPaneService.count(params, DistritoUrbano),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')
        session.create = true
        [distritoUrbanoInstance: new DistritoUrbano(params)]
    }

    def save() {
        def distritoUrbanoInstance = new DistritoUrbano(params)
        if (!distritoUrbanoInstance.save(flush: true)) {
            render(view: "create", model: [distritoUrbanoInstance: distritoUrbanoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'distritoUrbano.label', default: 'DistritoUrbano'), distritoUrbanoInstance.id])
        redirect(action: "show", id: distritoUrbanoInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def distritoUrbanoInstance = DistritoUrbano.get(id)

        def tabContent1 = null
        def tabContent2 = null
        def tabContent3 = null
        def tabContent4 = null

        if (session.tabContentc == 1) {
            tabContent1 = 'true'
        } else if (session.tabContentc == 2) {
            tabContent2 = 'true'
        } else if (session.tabContentc == 3) {
            tabContent3 = 'true'
        } else if (session.tabContentc == 4) {
            tabContent4 = 'true'
        }

        if (!distritoUrbanoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'distritoUrbano.label', default: 'DistritoUrbano'), id])
            redirect(action: "list")
            return
        }
        session.distritoUrbanoInstance = distritoUrbanoInstance
        [distritoUrbanoInstance: distritoUrbanoInstance, tabContent1: tabContent1, tabContent2: tabContent2, tabContent3: tabContent3, tabContent4: tabContent4]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        session.edit = true
        def distritoUrbanoInstance = DistritoUrbano.get(id)
        if (!distritoUrbanoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'distritoUrbano.label', default: 'DistritoUrbano'), id])
            redirect(action: "list")
            return
        }

        [distritoUrbanoInstance: distritoUrbanoInstance]
    }

    def update(Long id, Long version) {
        def distritoUrbanoInstance = DistritoUrbano.get(id)
        if (!distritoUrbanoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'distritoUrbano.label', default: 'DistritoUrbano'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (distritoUrbanoInstance.version > version) {
                distritoUrbanoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'distritoUrbano.label', default: 'DistritoUrbano')] as Object[],
                        "Another user has updated this DistritoUrbano while you were editing")
                render(view: "edit", model: [distritoUrbanoInstance: distritoUrbanoInstance])
                return
            }
        }

        distritoUrbanoInstance.properties = params

        if (!distritoUrbanoInstance.save(flush: true)) {
            render(view: "edit", model: [distritoUrbanoInstance: distritoUrbanoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'distritoUrbano.label', default: 'DistritoUrbano'), distritoUrbanoInstance.id])
        redirect(action: "show", id: distritoUrbanoInstance.id)
    }

    def delete(Long id) {
        def distritoUrbanoInstance = DistritoUrbano.get(id)
        if (!distritoUrbanoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'distritoUrbano.label', default: 'DistritoUrbano'), id])
            redirect(action: "list")
            return
        }

        try {
            distritoUrbanoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'distritoUrbano.label', default: 'DistritoUrbano'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'distritoUrbano.label', default: 'DistritoUrbano'), id])
            redirect(action: "show", id: id)
        }
    }

    def refreshProvincias = {

        def provincias = null

        if (params.regiaoId && params.regiaoId != 'null') {
            provincias = Provincia.findAllByPais(Pais.get(params.regiaoId))
        }

        render g.select(noSelection: ['null': 'Seleccione a Província'], style: "width:270px", from: provincias, name: 'provinciaId', value: 'params?.provinciaId', optionKey: 'id', onchange: "refreshCidades();")
    }

    def refreshCidades = {

        def cidades = null

        if (params.provinciaId && params.provinciaId != 'null') {
            cidades = Cidade.findAllByProvincia(Provincia.get(params.provinciaId))
        }

        render g.select(noSelection: ['null': 'Seleccione a Cidade'], style: "width:270px", from: cidades, name: 'cidade.id', value: 'distritoUrbanoInstance?.cidade?.id', optionKey: 'id')
    }

}
