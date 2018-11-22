package org.chaguala.sigem.seguranca

import org.grails.plugin.filterpane.FilterPaneUtils
import org.chaguala.sigem.general.SuperController
import org.springframework.dao.DataIntegrityViolationException

class SecUserController extends SuperController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def filterPaneService
    static navigation = [
            [group: 'SecUser', action: 'create', title: 'Criar', order: 0, isVisible: {
                session.currentAction.equals('list') || session.currentAction.equals('show')
            }],
            [action: 'list', title: 'Voltar', order: 1, isVisible: {
                session.currentAction.equals('show') || session.currentAction.equals('create')
            }],
            [action: 'fechar', title: 'Sair', order: 2, isVisible: { !session.currentAction.equals('edit1') }]
    ]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        updateCurrentAction('list')
        params.max = Math.min(max ?: 10, 100)
        List<SecUser> secUserList = null

            secUserList = SecUser.list(params)

        [secUserInstanceList: secUserList, secUserInstanceTotal: secUserList.size()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, SecUser))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [secUserInstanceList: filterPaneService.filter(params, SecUser),
                                     secUserInstanceTotal: filterPaneService.count(params, SecUser),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')
        [secUserInstance: new SecUser(params), authorityList: SecRole.list()]
    }

    def save() {
        def secUserInstance = new SecUser(params)
        if (!secUserInstance.save(flush: true)) {
            render(view: "create", model: [authorityList: SecRole.list(), secUserInstance: secUserInstance])
            return
        }
        addRoles(secUserInstance)
        flash.message = message(code: 'default.created.message', args: [message(code: 'secUser.label', default: 'SecUser'), secUserInstance.id])
        redirect(action: "show", id: secUserInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def secUserInstance = SecUser.get(id)
        if (!secUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUser.label', default: 'SecUser'), id])
            redirect(action: "list")
            return
        }
        List roleNames = []
        for (role in secUserInstance.authorities) {
            roleNames << role.authority
        }
        roleNames.sort { n1, n2 ->
            n1<=>n2
        }
        [secUserInstance: secUserInstance, roleNames: roleNames]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        def secUserInstance = SecUser.get(id)
        if (!secUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUser.label', default: 'SecUser'), id])
            redirect(action: "list")
            return
        }

        List<SecRole> roles = SecRole.list()
        roles.sort { r1, r2 ->
            r1.authority<=>r2.authority
        }
        Set userRoleNames = []
        for (role in secUserInstance.authorities) {
            userRoleNames << role.authority
        }
        LinkedHashMap<SecRole, Boolean> roleMap = [:]
        for (role in roles) {
            roleMap[(role)] = userRoleNames.contains(role.authority)
        }

        return [secUserInstance: secUserInstance, authorityList: roles, roleMap: roleMap]
    }

    def update(Long id, Long version) {
        def secUserInstance = SecUser.get(id)
        if (!secUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUser.label', default: 'SecUser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (secUserInstance.version > version) {
                secUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'secUser.label', default: 'SecUser')] as Object[],
                        "Another user has updated this SecUser while you were editing")
                render(view: "edit", model: [secUserInstance: secUserInstance])
                return
            }
        }

        def oldPassword = secUserInstance.password
        def newPassord = springSecurityService.encodePassword(params.password)

        secUserInstance.properties = params

        if (!params.password.equals(oldPassword)) {
            //person.password = newPassord
            println "password " + springSecurityService.encodePassword(params.password)
        }



        if (!secUserInstance.save(flush: true)) {
//            render(view: "edit", model: [secUserInstance: secUserInstance])
            render(view: "edit", model: buildPersonModel(secUserInstance))
            return
        }

        SecUserSecRole.removeAll(secUserInstance)
        addRoles(secUserInstance)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'secUser.label', default: 'SecUser'), secUserInstance.id])
        redirect(action: "show", id: secUserInstance.id)
    }

    def delete(Long id) {
        def secUserInstance = SecUser.get(id)
        if (!secUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUser.label', default: 'SecUser'), id])
            redirect(action: "list")
            return
        } else {
            def authPrincipal = springSecurityService.currentUser
            //avoid self-delete if the logged-in user is an admin
            if (!(authPrincipal instanceof String) && authPrincipal == secUserInstance.username) {
                flash.message = "You can not delete yourself, please login as another admin and try again"
                return
            }
            //		else {
            //first, delete this person from People_Authorities table.
            //UserRole.findAll().each { it.removeFromPeople(person) }
            SecUserSecRole.removeAll(secUserInstance)
            secUserInstance.delete()
            flash.message = "Usuario removido com Sucesso."

            redirect(action: "list")
        }

//        try {
//            secUserInstance.delete(flush: true)
//            flash.message = message(code: 'default.deleted.message', args: [message(code: 'secUser.label', default: 'SecUser'), id])
//            redirect(action: "list")
//        }
//        catch (DataIntegrityViolationException e) {
//            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'secUser.label', default: 'SecUser'), id])
//            redirect(action: "show", id: id)
//        }
    }

    private void addRoles(person) {
        for (String key in params.keySet()) {
            if (key.contains('ROLE') && 'on' == params.get(key)) {
                SecUserSecRole.create(person, SecRole.findByAuthority(key), true)
                // Role.findByAuthority(key).addToPeople(person)
            }
        }
    }

    private Map buildPersonModel(SecUser person) {

        List<SecRole> roles = SecRole.list()
        roles.sort { r1, r2 ->
            r1.authority<=>r2.authority
        }
        Set userRoleNames = []
        for (role in person.authorities) {
            userRoleNames << role.authority
        }
        LinkedHashMap<SecRole, Boolean> roleMap = [:]
        for (role in roles) {
            roleMap[(role)] = userRoleNames.contains(role.authority)
        }

        return [secUserInstance: person, authorityList: roleMap]
    }

}
