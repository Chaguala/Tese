package org.chaguala.sigem.tipoveiculo

import org.chaguala.sigem.general.SuperController
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

class TipoVeiculoController extends SuperController{

        // the delete, save and update actions only accept POST requests
        static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

        //Acrescentar
        def filterPaneService

        //Acrescentar
        static navigation = [
                [group: 'TipoVeiculo', action: 'create', title: 'Criar', order: 0, isVisible: {
                    session.currentAction.equals('list') || session.currentAction.equals('show')
                }],
                [action: 'list', title: 'Voltar', order: 1, isVisible: {
                    session.currentAction.equals('show') || session.currentAction.equals('create')
                }],
                [action: 'fechar', title: 'Sair', order: 2, isVisible: { !session.currentAction.equals('edit')
                }]
        ]

        //def index = { redirect(action: "list", params: params) }

        def index() {
            redirect(action: "list", params: params)
        }

        /*Acrescentar*/
        def list(Integer max) {
            updateCurrentAction('list')
            session.tabContentc = 1
            session.list = true
            params.max = Math.min(max ?: 10, 100)
            [tipoveiculoInstanceList: TipoVeiculo.list(params), tipoveiculoInstanceTotal: TipoVeiculo.count()]
        }

        //Acrescentar
        def filter = {
            if (!params.max) params.max = 10

            if (!filterPaneService.filter(params, TipoVeiculo))
                flash.message = "Não foi encontrado nenhum resultado"
            else
                flash.message = null

            render(view: 'list', model: [tipoveiculoInstanceList: filterPaneService.filter(params, TipoVeiculo),
                                         tipoveiculoInstanceTotal: filterPaneService.count(params, TipoVeiculo),
                                         filterParams: FilterPaneUtils.extractFilterParams(params),
                                         params: params])
        }

        def create() {
            updateCurrentAction('create')
            session.create = true
            [tipoveiculoInstance: new TipoVeiculo(params)]
        }

        def save() {
            def tipoveiculoInstance = new TipoVeiculo(params)
            if (!tipoveiculoInstance.save(flush: true)) {
                render(view: "create", model: [tipoveiculoInstance: tipoveiculoInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'tipoveiculo.label', default: 'TipoVeiculo'), tipoveiculoInstance.id])
            redirect(action: "show", id: tipoveiculoInstance.id)
        }

        def show(Long id) {
            updateCurrentAction('show')
            def tipoveiculoInstance = TipoVeiculo.get(id)

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

            if (!tipoveiculoInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoveiculo.label', default: 'TipoVeiculo'), id])
                redirect(action: "list")
                return
            }
            session.tipoveiculoInstance = tipoveiculoInstance
            [tipoveiculoInstance: tipoveiculoInstance, tabContent1: tabContent1, tabContent2: tabContent2, tabContent3: tabContent3, tabContent4: tabContent4]
        }

        def edit(Long id) {
            updateCurrentAction('edit')
            session.edit = true
            def tipoveiculoInstance = tipoveiculo.get(id)
            if (!tipoveiculoInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoveiculo.label', default: 'TipoVeiculo'), id])
                redirect(action: "list")
                return
            }

            [tipoveiculoInstance: tipoveiculoInstance]
        }

        def update(Long id, Long version) {
            def tipoveiculoInstance = tipoveiculo.get(id)
            if (!tipoveiculoInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoveiculo.label', default: 'TipoVeiculo'), id])
                redirect(action: "list")
                return
            }

            if (version != null) {
                if (tipoveiculoInstance.version > version) {
                    tipoveiculoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'tipoveiculo.label', default: 'tipoveiculo')] as Object[],
                            "Another user has updated this tipoveiculo while you were editing")
                    render(view: "edit", model: [tipoveiculoInstance: tipoveiculoInstance])
                    return
                }
            }

            tipoveiculoInstance.properties = params

            if (!tipoveiculoInstance.save(flush: true)) {
                render(view: "edit", model: [tipoveiculoInstance: tipoveiculoInstance])
                return
            }

            flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoveiculo.label', default: 'TipoVeiculo'), tipoveiculoInstance.id])
            redirect(action: "show", id: tipoveiculoInstance.id)
        }

        def delete(Long id) {
            def tipoveiculoInstance = tipoveiculo.get(id)
            if (!tipoveiculoInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoveiculo.label', default: 'TipoVeiculo'), id])
                redirect(action: "list")
                return
            }

            try {
                tipoveiculoInstance.delete(flush: true)
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoveiculo.label', default: 'TipoVeiculo'), id])
                redirect(action: "list")
            }
            catch (DataIntegrityViolationException e) {
                flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoveiculo.label', default: 'TipoVeiculo'), id])
                redirect(action: "show", id: id)
            }
        }
    }
