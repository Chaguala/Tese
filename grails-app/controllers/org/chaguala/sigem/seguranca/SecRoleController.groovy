package org.chaguala.sigem.seguranca


import org.grails.plugin.filterpane.FilterPaneUtils
import org.chaguala.sigem.general.SuperController
import org.springframework.dao.DataIntegrityViolationException

class SecRoleController extends SuperController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    static navigation = [
            [group: 'SecRole', action: 'create', title: 'Criar', order: 0, isVisible: { session.currentAction.equals('list') || session.currentAction.equals('show') }],
            [action: 'list', title: 'Voltar', order: 1, isVisible: { session.currentAction.equals('show') || session.currentAction.equals('create') }],
            [action: 'fechar', title: 'Sair', order: 2, isVisible: { !session.currentAction.equals('edit1') }]
    ]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        updateCurrentAction('list')
        params.max = Math.min(max ?: 10, 100)
        [secRoleInstanceList: SecRole.list(params), secRoleInstanceTotal: SecRole.count()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, SecRole))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [secRoleInstanceList: filterPaneService.filter(params, SecRole),
                                     secRoleInstanceTotal: filterPaneService.count(params, SecRole),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')
        [secRoleInstance: new SecRole(params)]
    }

    def save() {
        def secRoleInstance = new SecRole(params)
        if (!secRoleInstance.save(flush: true)) {
            render(view: "create", model: [secRoleInstance: secRoleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'secRole.label', default: 'SecRole'), secRoleInstance.id])
        redirect(action: "show", id: secRoleInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def secRoleInstance = SecRole.get(id)
        if (!secRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secRole.label', default: 'SecRole'), id])
            redirect(action: "list")
            return
        }

        [secRoleInstance: secRoleInstance]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        def secRoleInstance = SecRole.get(id)
        if (!secRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secRole.label', default: 'SecRole'), id])
            redirect(action: "list")
            return
        }

        [secRoleInstance: secRoleInstance]
    }

    def update(Long id, Long version) {
        def secRoleInstance = SecRole.get(id)
        if (!secRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secRole.label', default: 'SecRole'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (secRoleInstance.version > version) {
                secRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'secRole.label', default: 'SecRole')] as Object[],
                        "Another user has updated this SecRole while you were editing")
                render(view: "edit", model: [secRoleInstance: secRoleInstance])
                return
            }
        }

        secRoleInstance.properties = params

        if (!secRoleInstance.save(flush: true)) {
            render(view: "edit", model: [secRoleInstance: secRoleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'secRole.label', default: 'SecRole'), secRoleInstance.id])
        redirect(action: "show", id: secRoleInstance.id)
    }

    def delete(Long id) {
        def secRoleInstance = SecRole.get(id)
        if (!secRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secRole.label', default: 'SecRole'), id])
            redirect(action: "list")
            return
        }

        try {
            secRoleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'secRole.label', default: 'SecRole'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'secRole.label', default: 'SecRole'), id])
            redirect(action: "show", id: id)
        }
    }
}
