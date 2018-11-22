package org.chaguala.sigem.seguranca


import org.grails.plugin.filterpane.FilterPaneUtils
import org.chaguala.sigem.general.SuperController
import org.springframework.dao.DataIntegrityViolationException

class SecUserSecRoleController extends SuperController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    static navigation = [
            [group: 'SecUserSecRole', action: 'create', title: 'Criar', order: 0, isVisible: { session.currentAction.equals('list') || session.currentAction.equals('show') }],
            [action: 'list', title: 'Voltar', order: 1, isVisible: { session.currentAction.equals('show') || session.currentAction.equals('create') }],
            [action: 'fechar', title: 'Sair', order: 2, isVisible: { !session.currentAction.equals('edit1') }]
    ]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        updateCurrentAction('list')
        params.max = Math.min(max ?: 10, 100)
        [secUserSecRoleInstanceList: SecUserSecRole.list(params), secUserSecRoleInstanceTotal: SecUserSecRole.count()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, SecUserSecRole))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [secUserSecRoleInstanceList: filterPaneService.filter(params, SecUserSecRole),
                                     secUserSecRoleInstanceTotal: filterPaneService.count(params, SecUserSecRole),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')
        [secUserSecRoleInstance: new SecUserSecRole(params)]
    }

    def save() {
        def secUserSecRoleInstance = new SecUserSecRole(params)
        if (!secUserSecRoleInstance.save(flush: true)) {
            render(view: "create", model: [secUserSecRoleInstance: secUserSecRoleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), secUserSecRoleInstance.id])
        redirect(action: "show", id: secUserSecRoleInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def secUserSecRoleInstance = SecUserSecRole.get(id)
        if (!secUserSecRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), id])
            redirect(action: "list")
            return
        }

        [secUserSecRoleInstance: secUserSecRoleInstance]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        def secUserSecRoleInstance = SecUserSecRole.get(id)
        if (!secUserSecRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), id])
            redirect(action: "list")
            return
        }

        [secUserSecRoleInstance: secUserSecRoleInstance]
    }

    def update(Long id, Long version) {
        def secUserSecRoleInstance = SecUserSecRole.get(id)
        if (!secUserSecRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (secUserSecRoleInstance.version > version) {
                secUserSecRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'secUserSecRole.label', default: 'SecUserSecRole')] as Object[],
                        "Another user has updated this SecUserSecRole while you were editing")
                render(view: "edit", model: [secUserSecRoleInstance: secUserSecRoleInstance])
                return
            }
        }

        secUserSecRoleInstance.properties = params

        if (!secUserSecRoleInstance.save(flush: true)) {
            render(view: "edit", model: [secUserSecRoleInstance: secUserSecRoleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), secUserSecRoleInstance.id])
        redirect(action: "show", id: secUserSecRoleInstance.id)
    }

    def delete(Long id) {
        def secUserSecRoleInstance = SecUserSecRole.get(id)
        if (!secUserSecRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), id])
            redirect(action: "list")
            return
        }

        try {
            secUserSecRoleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), id])
            redirect(action: "show", id: id)
        }
    }
}
