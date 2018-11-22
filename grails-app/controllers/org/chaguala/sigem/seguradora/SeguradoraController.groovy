package org.chaguala.sigem.seguradora

import org.chaguala.sigem.distibuicaoAdministrativa.Pais
import org.chaguala.sigem.general.SuperController
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

class SeguradoraController extends SuperController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    static navigation = [
            [group: 'Seguradora', action: 'create', title: 'Criar', order: 0, isVisible: {
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

        [seguradoraInstanceList: Seguradora.list(params), seguradoraInstanceTotal: Seguradora.count()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, Seguradora))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [seguradoraInstanceList: filterPaneService.filter(params, Seguradora),
                                     seguradoraInstanceTotal: filterPaneService.count(params, Seguradora),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')
        session.create = true
        [seguradoraInstance: new Seguradora(params)]
    }

    def save() {
        def seguradoraInstance = new Seguradora(params)

        if(session.paisInstance)
            seguradoraInstance.pais = Pais.get(session.paisInstance.id)

        if (!seguradoraInstance.save(flush: true)) {
            render(view: "create", model: [seguradoraInstance: seguradoraInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'seguradora.label', default: 'Seguradora'), seguradoraInstance.id])
        redirect(action: "show", id: seguradoraInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def seguradoraInstance = Seguradora.get(id)

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

        if (!seguradoraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seguradora.label', default: 'Seguradora'), id])
            redirect(action: "list")
            return
        }
        session.seguradoraInstance = seguradoraInstance
        [seguradoraInstance: seguradoraInstance, tabContent1: tabContent1, tabContent2: tabContent2, tabContent3: tabContent3, tabContent4: tabContent4]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        session.edit = true
        def seguradoraInstance = Seguradora.get(id)
        if (!seguradoraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seguradora.label', default: 'Seguradora'), id])
            redirect(action: "list")
            return
        }

        [seguradoraInstance: seguradoraInstance]
    }

    def update(Long id, Long version) {
        def seguradoraInstance = Seguradora.get(id)
        if (!seguradoraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seguradora.label', default: 'Seguradora'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (seguradoraInstance.version > version) {
                seguradoraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'seguradora.label', default: 'Seguradora')] as Object[],
                        "Another user has updated this Seguradora while you were editing")
                render(view: "edit", model: [seguradoraInstance: seguradoraInstance])
                return
            }
        }

        seguradoraInstance.properties = params

        if (!seguradoraInstance.save(flush: true)) {
            render(view: "edit", model: [seguradoraInstance: seguradoraInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'seguradora.label', default: 'Seguradora'), seguradoraInstance.id])
        redirect(action: "show", id: seguradoraInstance.id)
    }

    def delete(Long id) {
        def seguradoraInstance = Seguradora.get(id)
        if (!seguradoraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seguradora.label', default: 'Seguradora'), id])
            redirect(action: "list")
            return
        }

        try {
            seguradoraInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'seguradora.label', default: 'Seguradora'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'seguradora.label', default: 'Seguradora'), id])
            redirect(action: "show", id: id)
        }
    }
}
