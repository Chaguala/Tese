package org.chaguala.sigem.tipocombustivel

import org.chaguala.sigem.distibuicaoAdministrativa.Pais
import org.chaguala.sigem.general.SuperController
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

class TipoCombustivelController extends SuperController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    static navigation = [
            [group: 'TipoCombustivel', action: 'create', title: 'Criar', order: 0, isVisible: {
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

        [tipocombustivelInstanceList: TipoCombustivel.list(params), tipocombustivelInstanceTotal: TipoCombustivel.count()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, TipoCombustivel))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [tipocombustivelInstanceList: filterPaneService.filter(params, TipoCombustivel),
                                     tipocombustivelInstanceTotal: filterPaneService.count(params, TipoCombustivel),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')
        session.create = true
        [tipocombustivelInstance: new TipoCombustivel(params)]
    }

    def save() {
        def tipocombustivelInstance = new TipoCombustivel(params)

        if(session.paisInstance)
            tipocombustivelInstance.pais = Pais.get(session.paisInstance.id)

        if (!tipocombustivelInstance.save(flush: true)) {
            render(view: "create", model: [tipocombustivelInstance: tipocombustivelInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipocombustivel.label', default: 'TipoCombustivel'), tipocombustivelInstance.id])
        redirect(action: "show", id: tipocombustivelInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def tipocombustivelInstance = TipoCombustivel.get(id)

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

        if (!tipocombustivelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipocombustivel.label', default: 'TipoCombustivel'), id])
            redirect(action: "list")
            return
        }
        session.tipocombustivelInstance = tipocombustivelInstance
        [tipocombustivelInstance: tipocombustivelInstance, tabContent1: tabContent1, tabContent2: tabContent2, tabContent3: tabContent3, tabContent4: tabContent4]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        session.edit = true
        def tipocombustivelInstance = TipoCombustivel.get(id)
        if (!tipocombustivelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipocombustivel.label', default: 'TipoCombustivel'), id])
            redirect(action: "list")
            return
        }

        [tipocombustivelInstance: tipocombustivelInstance]
    }

    def update(Long id, Long version) {
        def tipocombustivelInstance = TipoCombustivel.get(id)
        if (!tipocombustivelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipocombustivel.label', default: 'TipoCombustivel'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipocombustivelInstance.version > version) {
                tipocombustivelInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'tipocombustivel.label', default: 'TipoCombustivel')] as Object[],
                        "Another user has updated this TipoCombustivel while you were editing")
                render(view: "edit", model: [tipocombustivelInstance: tipocombustivelInstance])
                return
            }
        }

        tipocombustivelInstance.properties = params

        if (!tipocombustivelInstance.save(flush: true)) {
            render(view: "edit", model: [tipocombustivelInstance: tipocombustivelInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipocombustivel.label', default: 'TipoCombustivel'), tipocombustivelInstance.id])
        redirect(action: "show", id: tipocombustivelInstance.id)
    }

    def delete(Long id) {
        def tipocombustivelInstance = TipoCombustivel.get(id)
        if (!tipocombustivelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipocombustivel.label', default: 'TipoCombustivel'), id])
            redirect(action: "list")
            return
        }

        try {
            tipocombustivelInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipocombustivel.label', default: 'TipoCombustivel'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipocombustivel.label', default: 'TipoCombustivel'), id])
            redirect(action: "show", id: id)
        }
    }
}
