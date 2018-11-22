package org.chaguala.sigem.tiposeguro

import org.chaguala.sigem.distibuicaoAdministrativa.Pais
import org.chaguala.sigem.general.SuperController
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

class TipoSeguroController extends SuperController{
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    static navigation = [
            [group: 'TipoSeguro', action: 'create', title: 'Criar', order: 0, isVisible: {
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

        [tiposeguroInstanceList: TipoSeguro.list(params), tiposeguroInstanceTotal: TipoSeguro.count()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, TipoSeguro))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [tiposeguroInstanceList: filterPaneService.filter(params, TipoSeguro),
                                     tiposeguroInstanceTotal: filterPaneService.count(params, TipoSeguro),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')
        session.create = true
        [tiposeguroInstance: new TipoSeguro(params)]
    }

    def save() {
        def tiposeguroInstance = new TipoSeguro(params)

        if(session.paisInstance)
            tiposeguroInstance.pais = Pais.get(session.paisInstance.id)

        if (!tiposeguroInstance.save(flush: true)) {
            render(view: "create", model: [tiposeguroInstance: tiposeguroInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tiposeguro.label', default: 'TipoSeguro'), tiposeguroInstance.id])
        redirect(action: "show", id: tiposeguroInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def tiposeguroInstance = TipoSeguro.get(id)

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

        if (!tiposeguroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requerente.label', default: 'TipoSeguro'), id])
            redirect(action: "list")
            return
        }
        session.tiposeguroInstance = tiposeguroInstance
        [tiposeguroInstance: tiposeguroInstance, tabContent1: tabContent1, tabContent2: tabContent2, tabContent3: tabContent3, tabContent4: tabContent4]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        session.edit = true
        def tiposeguroInstance = TipoSeguro.get(id)
        if (!tiposeguroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requerente.label', default: 'TipoSeguro'), id])
            redirect(action: "list")
            return
        }

        [tiposeguroInstance: tiposeguroInstance]
    }

    def update(Long id, Long version) {
        def tiposeguroInstance = TipoSeguro.get(id)
        if (!tiposeguroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requerente.label', default: 'TipoSeguro'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tiposeguroInstance.version > version) {
                tiposeguroInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'requerente.label', default: 'TipoSeguro')] as Object[],
                        "Another user has updated this TipoSeguro while you were editing")
                render(view: "edit", model: [tiposeguroInstance: tiposeguroInstance])
                return
            }
        }

        tiposeguroInstance.properties = params

        if (!tiposeguroInstance.save(flush: true)) {
            render(view: "edit", model: [tiposeguroInstance: tiposeguroInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'requerente.label', default: 'TipoSeguro'), tiposeguroInstance.id])
        redirect(action: "show", id: tiposeguroInstance.id)
    }

    def delete(Long id) {
        def tiposeguroInstance = TipoSeguro.get(id)
        if (!tiposeguroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requerente.label', default: 'TipoSeguro'), id])
            redirect(action: "list")
            return
        }

        try {
            tiposeguroInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'requerente.label', default: 'TipoSeguro'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'requerente.label', default: 'TipoSeguro'), id])
            redirect(action: "show", id: id)
        }
    }
}
