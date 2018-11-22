package org.chaguala.sigem.funcionaro

import org.grails.plugin.filterpane.FilterPaneUtils
import org.chaguala.sigem.general.SuperController
import org.springframework.dao.DataIntegrityViolationException

    class FuncionarioController extends SuperController{

        static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
        def filterPaneService
        static navigation = [
                [group: 'Funcionaro', action: 'create', title: 'Criar', order: 0, isVisible: {
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

            [funcionaroInstanceList: Funcionaro.list(params), funcionaroInstanceTotal: Funcionaro.count()]
        }

        def filter = {
            if (!params.max) params.max = 10

            if (!filterPaneService.filter(params, Funcionaro))
                flash.message = "Não foi encontrado nenhum resultado"
            else
                flash.message = null

            render(view: 'list', model: [funcionaroInstanceList: filterPaneService.filter(params, Funcionaro),
                                         funcionaroInstanceTotal: filterPaneService.count(params, Funcionaro),
                                         filterParams: FilterPaneUtils.extractFilterParams(params),
                                         params: params])
        }

        def create() {
            updateCurrentAction('create')
            session.create = true
            [funcionaroInstance: new Funcionario(params)]
        }

        def save() {
            def funcionaroInstance = new Funcionario(params)

            if(session.paisInstance)
                funcionaroInstance.pais = Pais.get(session.paisInstance.id)

            if (!funcionaroInstance.save(flush: true)) {
                render(view: "create", model: [funcionaroInstance: funcionaroInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'funcionaro.label', default: 'Funcionario'), provinciaInstance.id])
            redirect(action: "show", id: funcionaroInstance.id)
        }

        def show(Long id) {
            updateCurrentAction('show')
            def funcionaroInstance = Funcionario.get(id)

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

            if (!funcionaroInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'funcionaro.label', default: 'Funcionario'), id])
                redirect(action: "list")
                return
            }
            session.funcionaroInstance = funcionaroInstance
            [funcionaroInstance: funcionaroInstance, tabContent1: tabContent1, tabContent2: tabContent2, tabContent3: tabContent3, tabContent4: tabContent4]
        }

        def edit(Long id) {
            updateCurrentAction('edit')
            session.edit = true
            def funcionaroInstance = Funcionario.get(id)
            if (!funcionaroInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'funcionaro.label', default: 'Funcionario'), id])
                redirect(action: "list")
                return
            }

            [funcionaroInstance: funcionaroInstance]
        }

        def update(Long id, Long version) {
            def funcionaroInstance = Funcionario.get(id)
            if (!funcionaroInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'funcionaro.label', default: 'Funcionario'), id])
                redirect(action: "list")
                return
            }

            if (version != null) {
                if (funcionaroInstance.version > version) {
                    funcionaroInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'funcionaro.label', default: 'Funcionario')] as Object[],
                            "Another user has updated this Funcionario while you were editing")
                    render(view: "edit", model: [provinciaInstance: provinciaInstance])
                    return
                }
            }

            funcionaroInstance.properties = params

            if (!funcionaroInstance.save(flush: true)) {
                render(view: "edit", model: [funcionaroInstance: funcionaroInstance])
                return
            }

            flash.message = message(code: 'default.updated.message', args: [message(code: 'funcionaroInstance.label', default: 'Funcionario'), funcionaroInstance.id])
            redirect(action: "show", id: funcionaroInstance.id)
        }

        def delete(Long id) {
            def funcionaroInstance = Funcionario.get(id)
            if (!funcionaroInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'funcionaroInstance.label', default: 'Funcionario'), id])
                redirect(action: "list")
                return
            }

            try {
                funcionaroInstance.delete(flush: true)
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'funcionaroInstance.label', default: 'Funcionario'), id])
                redirect(action: "list")
            }
            catch (DataIntegrityViolationException e) {
                flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'funcionaroInstance.label', default: 'Funcionario'), id])
                redirect(action: "show", id: id)
            }
        }
    }
