package org.chaguala.sigem.distibuicaoAdministrativa


import org.grails.plugin.filterpane.FilterPaneUtils
import org.chaguala.sigem.general.SuperController
import org.springframework.dao.DataIntegrityViolationException

class DistritoController extends SuperController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    static navigation = [
            [group: 'Distrito', action: 'create', title: 'Criar', order: 0, isVisible: {
                session.currentAction.equals('list') || session.currentAction.equals('show')
            }],
            [action: 'list', title: 'Voltar', order: 1, isVisible: {
                session.currentAction.equals('show') || session.currentAction.equals('create')
            }],
            [action: 'fechar', title: 'Sair', order: 2, isVisible: { !session.currentAction.equals('edit1') }]
    ]

    def index() {
        session.provinciaInstance = null
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        updateCurrentAction('list')
        session.tabContentc = 1
        session.list = true
        params.max = Math.min(max ?: 10, 100)

        if(session.provinciaInstance)
            redirect(controller: 'provincia',action: 'show',id: session.provinciaInstance.id)

        [distritoInstanceList: Distrito.list(params), distritoInstanceTotal: Distrito.count()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, Distrito))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [distritoInstanceList : filterPaneService.filter(params, Distrito),
                                     distritoInstanceTotal: filterPaneService.count(params, Distrito),
                                     filterParams         : FilterPaneUtils.extractFilterParams(params),
                                     params               : params])
    }

    def create() {
        updateCurrentAction('create')
        session.create = true
        [distritoInstance: new Distrito(params)]
    }

    def save() {
        def distritoInstance = new Distrito(params)

        if(session.provinciaInstance)
            distritoInstance.provincia = Provincia.get(session.provinciaInstance.id)

        if (!distritoInstance.save(flush: true)) {
            render(view: "create", model: [distritoInstance: distritoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'distrito.label', default: 'Distrito'), distritoInstance.id])
        redirect(action: "show", id: distritoInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def distritoInstance = Distrito.get(id)

        def tabContent1 = null
        def tabContent2 = null
        def tabContent3 = null
        def tabContent4 = null
        def tabContent5 = null

        if (session.tabContentc == 1) {
            tabContent1 = 'true'
        } else if (session.tabContentc == 2) {
            tabContent2 = 'true'
        } else if (session.tabContentc == 3) {
            tabContent3 = 'true'
        } else if (session.tabContentc == 4) {
            tabContent4 = 'true'
        } else if (session.tabContentc == 5) {
            tabContent5 = 'true'
        }

        if (!distritoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'distrito.label', default: 'Distrito'), id])
            redirect(action: "list")
            return
        }
        session.distritoInstance = distritoInstance
        [distritoInstance: distritoInstance, tabContent1: tabContent1, tabContent2: tabContent2, tabContent3: tabContent3, tabContent4: tabContent4,tabContent5:tabContent5]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        session.edit = true
        def distritoInstance = Distrito.get(id)
        if (!distritoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'distrito.label', default: 'Distrito'), id])
            redirect(action: "list")
            return

        } else {
            def provincias = Provincia.all

            return [distritoInstance: distritoInstance, provincias: provincias]
        }

    }

    def update(Long id, Long version) {
        def distritoInstance = Distrito.get(id)
        if (!distritoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'distrito.label', default: 'Distrito'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (distritoInstance.version > version) {
                distritoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'distrito.label', default: 'Distrito')] as Object[],
                        "Another user has updated this Distrito while you were editing")
                render(view: "edit", model: [distritoInstance: distritoInstance])
                return
            }
        }

        distritoInstance.properties = params

        if (!distritoInstance.save(flush: true)) {
            render(view: "edit", model: [distritoInstance: distritoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'distrito.label', default: 'Distrito'), distritoInstance.id])
        redirect(action: "show", id: distritoInstance.id)
    }

    def delete(Long id) {
        def distritoInstance = Distrito.get(id)
        if (!distritoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'distrito.label', default: 'Distrito'), id])
            redirect(action: "list")
            return
        }

        try {
            distritoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'distrito.label', default: 'Distrito'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'distrito.label', default: 'Distrito'), id])
            redirect(action: "show", id: id)
        }
    }

    def refreshProvincias = {

        def provincias = null

        if (params.regiaoId && params.regiaoId != 'null') {
            provincias = Provincia.findAllByPais(Pais.get(params.regiaoId))
        }

        render g.select(noSelection: ['null': 'Seleccione a Província'], style: "width:270px", from: provincias, name: 'provincia.id', value: 'distritoInstance?.provincia?.id', optionKey: 'id')
    }

}
