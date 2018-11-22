package org.chaguala.sigem.municipe

import org.chaguala.sigem.distibuicaoAdministrativa.Pais
import org.chaguala.sigem.distibuicaoAdministrativa.Provincia
import org.chaguala.sigem.municipe.Municipe
import org.chaguala.sigem.general.SuperController
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

class MunicipeController extends SuperController{

        static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
        def filterPaneService
        static navigation = [
                [group: 'Municipe', action: 'create', title: 'Criar', order: 0, isVisible: {
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

            [municipeInstanceList: Municipe.list(params), municipeInstanceTotal: Municipe.count()]
        }

        def filter = {
            if (!params.max) params.max = 10
            if (!filterPaneService.filter(params, Municipe))
                flash.message = "Não foi encontrado nenhum resultado"
            else
                flash.message = null

            render(view: 'list', model: [municipeInstanceList: filterPaneService.filter(params, Municipe),
                                         municipeInstanceTotal: filterPaneService.count(params, Municipe),
                                         filterParams: FilterPaneUtils.extractFilterParams(params),
                                         params: params])
        }

        def create() {
            updateCurrentAction('create')
            session.create = true
            [municipeInstance: new Municipe(params)]
        }

        def save() {
            def municipeInstance = new Municipe(params)

            if(session.paisInstance)
                municipeInstance.pais = Pais.get(session.paisInstance.id)

            if (!municipeInstance.save(flush: true)) {
                render(view: "create", model: [municipeInstance: municipeInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'municipe.label', default: 'Municipe'), municipeInstance.id])
            redirect(action: "show", id: municipeInstance.id)
        }

        def show(Long id) {
            updateCurrentAction('show')
            def municipeInstance = Municipe.get(id)

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

            if (!municipeInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'municipe.label', default: 'Municipe'), id])
                redirect(action: "list")
                return
            }
            session.municipeInstance = municipeInstance
            [municipeInstance: municipeInstance, tabContent1: tabContent1, tabContent2: tabContent2, tabContent3: tabContent3, tabContent4: tabContent4]
        }

        def edit(Long id) {
            updateCurrentAction('edit')
            session.edit = true
            def municipeInstance = Municipe.get(id)
            if (!municipeInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'municipe.label', default: 'Municipe'), id])
                redirect(action: "list")
                return
            }

            [municipeInstance: municipeInstance]
        }

        def update(Long id, Long version) {
            def municipeInstance = Municipe.get(id)
            if (!municipeInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'municipe.label', default: 'Municipe'), id])
                redirect(action: "list")
                return
            }

            if (version != null) {
                if (municipeInstance.version > version) {
                    municipeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'municipe.label', default: 'Municipe')] as Object[],
                            "Another user has updated this Municipe while you were editing")
                    render(view: "edit", model: [municipeInstance: municipeInstance])
                    return
                }
            }

            municipeInstance.properties = params

            if (!municipeInstance.save(flush: true)) {
                render(view: "edit", model: [municipeInstance: municipeInstance])
                return
            }

            flash.message = message(code: 'default.updated.message', args: [message(code: 'municipe.label', default: 'Municipe'), municipeInstance.id])
            redirect(action: "show", id: municipeInstance.id)
        }

        def delete(Long id) {
            def municipeInstance = Municipe.get(id)
            if (!municipeInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'municipe.label', default: 'Municipe'), id])
                redirect(action: "list")
                return
            }

            try {
                municipeInstance.delete(flush: true)
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'municipe.label', default: 'Municipe'), id])
                redirect(action: "list")
            }
            catch (DataIntegrityViolationException e) {
                flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'municipe.label', default: 'Municipe'), id])
                redirect(action: "show", id: id)
            }
        }
    }
