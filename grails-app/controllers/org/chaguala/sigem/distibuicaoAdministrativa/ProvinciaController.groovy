package org.chaguala.sigem.distibuicaoAdministrativa


import org.grails.plugin.filterpane.FilterPaneUtils
import org.chaguala.sigem.general.SuperController
import org.springframework.dao.DataIntegrityViolationException

class ProvinciaController extends SuperController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    static navigation = [
            [group: 'Provincia', action: 'create', title: 'Criar', order: 0, isVisible: {
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

        [provinciaInstanceList: Provincia.list(params), provinciaInstanceTotal: Provincia.count()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, Provincia))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [provinciaInstanceList: filterPaneService.filter(params, Provincia),
                                     provinciaInstanceTotal: filterPaneService.count(params, Provincia),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')
        session.create = true
        [provinciaInstance: new Provincia(params)]
    }

    def save() {
        def provinciaInstance = new Provincia(params)

        if(session.paisInstance)
            provinciaInstance.pais = Pais.get(session.paisInstance.id)

        if (!provinciaInstance.save(flush: true)) {
            render(view: "create", model: [provinciaInstance: provinciaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'provincia.label', default: 'Provincia'), provinciaInstance.id])
        redirect(action: "show", id: provinciaInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def provinciaInstance = Provincia.get(id)

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

        if (!provinciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'provincia.label', default: 'Provincia'), id])
            redirect(action: "list")
            return
        }
        session.provinciaInstance = provinciaInstance
        [provinciaInstance: provinciaInstance, tabContent1: tabContent1, tabContent2: tabContent2, tabContent3: tabContent3, tabContent4: tabContent4]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        session.edit = true
        def provinciaInstance = Provincia.get(id)
        if (!provinciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'provincia.label', default: 'Provincia'), id])
            redirect(action: "list")
            return
        }

        [provinciaInstance: provinciaInstance]
    }

    def update(Long id, Long version) {
        def provinciaInstance = Provincia.get(id)
        if (!provinciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'provincia.label', default: 'Provincia'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (provinciaInstance.version > version) {
                provinciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'provincia.label', default: 'Provincia')] as Object[],
                        "Another user has updated this Provincia while you were editing")
                render(view: "edit", model: [provinciaInstance: provinciaInstance])
                return
            }
        }

        provinciaInstance.properties = params

        if (!provinciaInstance.save(flush: true)) {
            render(view: "edit", model: [provinciaInstance: provinciaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'provincia.label', default: 'Provincia'), provinciaInstance.id])
        redirect(action: "show", id: provinciaInstance.id)
    }

    def delete(Long id) {
        def provinciaInstance = Provincia.get(id)
        if (!provinciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'provincia.label', default: 'Provincia'), id])
            redirect(action: "list")
            return
        }

        try {
            provinciaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'provincia.label', default: 'Provincia'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'provincia.label', default: 'Provincia'), id])
            redirect(action: "show", id: id)
        }
    }
}
