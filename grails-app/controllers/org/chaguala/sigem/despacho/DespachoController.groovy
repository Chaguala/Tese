package org.chaguala.sigem.despacho

import org.grails.plugin.filterpane.FilterPaneUtils
import org.chaguala.sigem.general.SuperController
import org.springframework.dao.DataIntegrityViolationException

class DespachoController extends SuperController{

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    //Acrescentar
    def filterPaneService

    //Acrescentar
    static navigation = [
            [group: 'Despacho', action: 'create', title: 'Criar', order: 0, isVisible: {
                session.currentAction.equals('list') || session.currentAction.equals('show')
            }],
            [action: 'list', title: 'Voltar', order: 1, isVisible: {
                session.currentAction.equals('show') || session.currentAction.equals('create')
            }],
            [action: 'fechar', title: 'Sair', order: 2, isVisible: { !session.currentAction.equals('edit')
            }]
    ]

    //def index = { redirect(action: "list", params: params) }

    def index() {
        redirect(action: "list", params: params)
    }

    /*Acrescentar*/
    def list(Integer max) {
        updateCurrentAction('list')
        session.tabContentc = 1
        session.list = true
        params.max = Math.min(max ?: 10, 100)
        [despachoInstanceList: Despacho.list(params), despachoInstanceTotal: Despacho.count()]
    }

    //Acrescentar
    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, Despacho))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [despachoInstanceList: filterPaneService.filter(params, Despacho),
                                     despachoInstanceTotal: filterPaneService.count(params, Despacho),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')
        session.create = true
        [despachoInstance: new Despacho(params)]
    }

    def save() {
        def despachoInstance = new Despacho(params)
        if (!despachoInstance.save(flush: true)) {
            render(view: "create", model: [despachoInstance: despachoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'despacho.label', default: 'Despacho'), despachoInstance.id])
        redirect(action: "show", id: despachoInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def despachoInstance = Despacho.get(id)

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

        if (!despachoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'despacho.label', default: 'Despacho'), id])
            redirect(action: "list")
            return
        }
        session.despachoInstance = despachoInstance
        [despachoInstance: despachoInstance, tabContent1: tabContent1, tabContent2: tabContent2, tabContent3: tabContent3, tabContent4: tabContent4]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        session.edit = true
        def despachoInstance = Despacho.get(id)
        if (!despachoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'despacho.label', default: 'Despacho'), id])
            redirect(action: "list")
            return
        }

        [despachoInstance: despachoInstance]
    }

    def update(Long id, Long version) {
        def despachoInstance = Despacho.get(id)
        if (!despachoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'despacho.label', default: 'Despacho'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (despachoInstance.version > version) {
                despachoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: '.label', default: 'Despacho')] as Object[],
                        "Another user has updated this Despacho while you were editing")
                render(view: "edit", model: [despachoInstance: despachoInstance])
                return
            }
        }

        despachoInstance.properties = params

        if (!despachoInstance.save(flush: true)) {
            render(view: "edit", model: [despachoInstance: despachoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'despacho.label', default: 'Despacho'), despachoInstance.id])
        redirect(action: "show", id: despachoInstance.id)
    }

    def delete(Long id) {
        def despachoInstance = Despacho.get(id)
        if (!despachoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'despacho.label', default: 'Despacho'), id])
            redirect(action: "list")
            return
        }

        try {
            despachoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'despacho.label', default: 'Despacho'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'despacho.label', default: 'Despacho'), id])
            redirect(action: "show", id: id)
        }
    }
}
