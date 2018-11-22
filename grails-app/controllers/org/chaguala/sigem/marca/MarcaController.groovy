package org.chaguala.sigem.marca

import org.chaguala.sigem.distibuicaoAdministrativa.Pais
import org.chaguala.sigem.general.SuperController
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

class MarcaController extends SuperController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    static navigation = [
            [group: 'Marca', action: 'create', title: 'Criar', order: 0, isVisible: {
                session.currentAction.equals('list') || session.currentAction.equals('show')
            }],
            [action: 'list', title: 'Voltar', order: 1, isVisible: {
                session.currentAction.equals('show') || session.currentAction.equals('create')
            }],
            [action: 'fechar', title: 'Sair', order: 2, isVisible: { !session.currentAction.equals('edit1') }]
    ]

    def index() {
        session.paisInstance = false
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        updateCurrentAction('list')
        session.tabContentc = 1
        session.list = true
        params.max = Math.min(max ?: 10, 100)

        if(session.paisInstance)
            redirect(controller: 'pais',action: 'show',id: session.paisInstance.id)

        [marcaInstanceList: Marca.list(params), marcaInstanceTotal: Marca.count()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, Marca))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [marcaInstanceList: filterPaneService.filter(params, Marca),
                                     marcaInstanceTotal: filterPaneService.count(params, Marca),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')
        session.create = true
        [marcaInstance: new Marca(params)]
    }

    def save() {
        def marcaInstance = new Marca(params)

        if(session.paisInstance)
            marcaInstance.pais = Pais.get(session.paisInstance.id)

        if (!marcaInstance.save(flush: true)) {
            render(view: "create", model: [marcaInstance: marcaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'marca.label', default: 'Marca'), marcaInstance.id])
        redirect(action: "show", id: marcaInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def marcaInstance = Marca.get(id)

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

        if (!marcaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marca.label', default: 'Marca'), id])
            redirect(action: "list")
            return
        }
        session.marcaInstance = marcaInstance
        [marcaInstance: marcaInstance, tabContent1: tabContent1, tabContent2: tabContent2, tabContent3: tabContent3, tabContent4: tabContent4]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        session.edit = true
        def marcaInstance = Marca.get(id)
        if (!marcaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marca.label', default: 'Marca'), id])
            redirect(action: "list")
            return
        }

        [marcaInstance: marcaInstance]
    }

    def update(Long id, Long version) {
        def marcaInstance = Marca.get(id)
        if (!marcaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marca.label', default: 'Marca'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (marcaInstance.version > version) {
                marcaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'marca.label', default: 'Marca')] as Object[],
                        "Another user has updated this Marca while you were editing")
                render(view: "edit", model: [marcaInstance: marcaInstance])
                return
            }
        }

        marcaInstance.properties = params

        if (!marcaInstance.save(flush: true)) {
            render(view: "edit", model: [marcaInstance: marcaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'marca.label', default: 'Marca'), marcaInstance.id])
        redirect(action: "show", id: marcaInstance.id)
    }

    def delete(Long id) {
        def marcaInstance = Marca.get(id)
        if (!marcaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marca.label', default: 'Marca'), id])
            redirect(action: "list")
            return
        }

        try {
            marcaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'marca.label', default: 'Marca'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'marca.label', default: 'Marca'), id])
            redirect(action: "show", id: id)
        }
    }
}
