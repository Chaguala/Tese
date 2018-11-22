package org.chaguala.sigem.proprietario

import org.chaguala.sigem.distibuicaoAdministrativa.Pais
import org.chaguala.sigem.general.SuperController
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

class ProprietarioController extends SuperController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    static navigation = [
            [group: 'Proprietario', action: 'create', title: 'Criar', order: 0, isVisible: {
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

        [proprietarioInstanceList: Proprietario.list(params), proprietarioInstanceTotal: Proprietario.count()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, Proprietario))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [proprietarioInstanceList: filterPaneService.filter(params, Proprietario),
                                     proprietarioInstanceTotal: filterPaneService.count(params, Proprietario),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')
        session.create = true
        [proprietarioInstance: new Proprietario(params)]
    }

    def save() {
        def proprietarioInstance = new Proprietario(params)

        if(session.paisInstance)
            proprietarioInstance.pais = Pais.get(session.paisInstance.id)

        if (!proprietarioInstance.save(flush: true)) {
            render(view: "create", model: [proprietarioInstance: proprietarioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'proprietario.label', default: 'Proprietario'), proprietarioInstance.id])
        redirect(action: "show", id: proprietarioInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def proprietarioInstance = Proprietario.get(id)

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

        if (!proprietarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proprietario.label', default: 'Proprietario'), id])
            redirect(action: "list")
            return
        }
        session.proprietarioInstance = proprietarioInstance
        [proprietarioInstance: proprietarioInstance, tabContent1: tabContent1, tabContent2: tabContent2, tabContent3: tabContent3, tabContent4: tabContent4]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        session.edit = true
        def proprietarioInstance = proprietario.get(id)
        if (!proprietarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proprietario.label', default: 'Proprietario'), id])
            redirect(action: "list")
            return
        }

        [proprietarioInstance: proprietarioInstance]
    }

    def update(Long id, Long version) {
        def proprietarioInstance = proprietario.get(id)
        if (!proprietarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proprietario.label', default: 'Proprietario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (proprietarioInstance.version > version) {
                proprietarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'proprietario.label', default: 'proprietario')] as Object[],
                        "Another user has updated this proprietario while you were editing")
                render(view: "edit", model: [proprietarioInstance: proprietarioInstance])
                return
            }
        }

        proprietarioInstance.properties = params

        if (!proprietarioInstance.save(flush: true)) {
            render(view: "edit", model: [proprietarioInstance: proprietarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'proprietario.label', default: 'proprietario'), proprietarioInstance.id])
        redirect(action: "show", id: proprietarioInstance.id)
    }

    def delete(Long id) {
        def proprietarioInstance = Proprietario.get(id)
        if (!proprietarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proprietario.label', default: 'Proprietario'), id])
            redirect(action: "list")
            return
        }

        try {
            proprietarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'proprietario.label', default: 'Proprietario'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'proprietario.label', default: 'Proprietario'), id])
            redirect(action: "show", id: id)
        }
    }
}
