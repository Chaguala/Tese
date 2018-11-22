package org.chaguala.sigem.taxaipa

import org.chaguala.sigem.distibuicaoAdministrativa.Pais
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

class TaxaIPAController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    static navigation = [
            [group: 'TaxaIPA', action: 'create', title: 'Criar', order: 0, isVisible: {
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

        [taxaipaInstanceList: TaxaIPA.list(params), taxaipaInstanceTotal: TaxaIPA.count()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, TaxaIPA))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [taxaipaInstanceList: filterPaneService.filter(params, TaxaIPA),
                                     taxaipaInstanceTotal: filterPaneService.count(params, TaxaIPA),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')
        session.create = true
        [taxaipaInstance: new TaxaIPA(params)]
    }

    def save() {
        def taxaipaInstance = new TaxaIPA(params)

        if(session.paisInstance)
            taxaipaInstance.pais = Pais.get(session.paisInstance.id)

        if (!taxaipaInstance.save(flush: true)) {
            render(view: "create", model: [taxaipaInstance: taxaipaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'taxaipa.label', default: 'taxaipa'), taxaipaInstance.id])
        redirect(action: "show", id: taxaipaInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def taxaipaInstance = TaxaIPA.get(id)

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

        if (!taxaipaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taxaipa.label', default: 'taxaipa'), id])
            redirect(action: "list")
            return
        }
        session.taxaipaInstance = taxaipaInstance
        [taxaipaInstance: taxaipaInstance, tabContent1: tabContent1, tabContent2: tabContent2, tabContent3: tabContent3, tabContent4: tabContent4]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        session.edit = true
        def taxaipaInstance = TaxaIPA.get(id)
        if (!taxaipaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taxaipa.label', default: 'taxaipa'), id])
            redirect(action: "list")
            return
        }

        [taxaipaInstance: taxaipaInstance]
    }

    def update(Long id, Long version) {
        def taxaipaInstance = TaxaIPA.get(id)
        if (!taxaipaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taxaipa.label', default: 'taxaipa'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (taxaipaInstance.version > version) {
                taxaipaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'taxaipa.label', default: 'TaxaIPA')] as Object[],
                        "Another user has updated this TaxaIPA while you were editing")
                render(view: "edit", model: [taxaipaInstance: taxaipaInstance])
                return
            }
        }

        taxaipaInstance.properties = params

        if (!taxaipaInstance.save(flush: true)) {
            render(view: "edit", model: [taxaipaInstance: taxaipaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'taxaipa.label', default: 'taxaipa'), taxaipaInstance.id])
        redirect(action: "show", id: taxaipaInstance.id)
    }

    def delete(Long id) {
        def taxaipaInstance = TaxaIPA.get(id)
        if (!taxaipaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taxaipa.label', default: 'taxaipa'), id])
            redirect(action: "list")
            return
        }

        try {
            taxaipaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'taxaipa.label', default: 'taxaipa'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'taxaipa.label', default: 'taxaipa'), id])
            redirect(action: "show", id: id)
        }
    }
}
