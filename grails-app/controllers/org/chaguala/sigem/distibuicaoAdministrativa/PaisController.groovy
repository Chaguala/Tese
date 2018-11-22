package org.chaguala.sigem.distibuicaoAdministrativa


import org.grails.plugin.filterpane.FilterPaneUtils
import org.chaguala.sigem.general.SuperController
import org.springframework.dao.DataIntegrityViolationException

class PaisController extends SuperController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    static navigation = [
            [group: 'Pais', action: 'create', title: 'Criar', order: 0, isVisible: {session.currentAction.equals('list') || session.currentAction.equals('show')}],
            [action: 'list', title: 'Listar', order: 1, isVisible: {session.currentAction.equals('show') || session.currentAction.equals('create')}],
            [action: 'fechar', title: 'Sair', order: 2, isVisible: {!session.currentAction.equals('edit1')}]
    ]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        updateCurrentAction('list')
        session.tabContentPais = 1
        session.list = true
        params.max = Math.min(max ?: 10, 100)
        [paisInstanceList: Pais.list(params), paisInstanceTotal: Pais.count()]
    }

    def filter = {
        if(!params.max) params.max = 10

        if (!filterPaneService.filter( params, Pais))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render( view:'list', model:[ paisInstanceList: filterPaneService.filter( params, Pais ),
                paisInstanceTotal: filterPaneService.count( params, Pais ),
                filterParams: FilterPaneUtils.extractFilterParams(params),
                params:params ] )
    }

    def create() {
        updateCurrentAction('create')
        session.create = true
        [paisInstance: new Pais(params)]
    }

    def save() {
        def paisInstance = new Pais(params)
        if (!paisInstance.save(flush: true)) {
            render(view: "create", model: [paisInstance: paisInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pais.label', default: 'Pais'), paisInstance.id])
        redirect(action: "show", id: paisInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def paisInstance = Pais.get(id)

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

        if (!paisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pais.label', default: 'Pais'), id])
            redirect(action: "list")
            return
        }
        session.paisInstance = paisInstance
        [paisInstance: paisInstance, tabContent1: tabContent1, tabContent2: tabContent2, tabContent3: tabContent3, tabContent4: tabContent4]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        session.edit = true
        def paisInstance = Pais.get(id)
        if (!paisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pais.label', default: 'Pais'), id])
            redirect(action: "list")
            return
        }

        [paisInstance: paisInstance]
    }

    def update(Long id, Long version) {
        def paisInstance = Pais.get(id)
        if (!paisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pais.label', default: 'Pais'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (paisInstance.version > version) {
                paisInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pais.label', default: 'Pais')] as Object[],
                          "Another user has updated this Pais while you were editing")
                render(view: "edit", model: [paisInstance: paisInstance])
                return
            }
        }

        paisInstance.properties = params

        if (!paisInstance.save(flush: true)) {
            render(view: "edit", model: [paisInstance: paisInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pais.label', default: 'Pais'), paisInstance.id])
        redirect(action: "show", id: paisInstance.id)
    }

    def delete(Long id) {
        def paisInstance = Pais.get(id)
        if (!paisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pais.label', default: 'Pais'), id])
            redirect(action: "list")
            return
        }

        try {
            paisInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pais.label', default: 'Pais'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pais.label', default: 'Pais'), id])
            redirect(action: "show", id: id)
        }
    }
}
