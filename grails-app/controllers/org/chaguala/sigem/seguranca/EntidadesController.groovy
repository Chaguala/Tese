package org.chaguala.sigem.seguranca


import org.grails.plugin.filterpane.FilterPaneUtils
import org.chaguala.sigem.general.SuperController
import org.springframework.dao.DataIntegrityViolationException

class EntidadesController extends SuperController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    def entidadesService
    static navigation = [
            [group: 'Entidades', action: 'create', title: 'Criar', order: 0, isVisible: {session.currentAction.equals('list') || session.currentAction.equals('show')}],
            [action: 'voltar', title: 'Voltar', order: 1, isVisible: {session.currentAction.equals('show') || session.currentAction.equals('create')}],
            [action: 'classificacaoV', title: 'Voltar', order: 2, isVisible: {session.currentAction.equals('list') }],
            [action: 'fechar', title: 'Sair', order: 3, isVisible: {!session.currentAction.equals('edit1')}]
    ]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        updateCurrentAction('list')
        params.max = Math.min(max ?: 10, 100)
        [entidadesInstanceList: Entidades.list(params), entidadesInstanceTotal: Entidades.count()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, Entidades))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [entidadesInstanceList: filterPaneService.filter(params, Entidades),
                                     entidadesInstanceTotal: filterPaneService.count(params, Entidades),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')
        session.tabContentCe = 2
        List listaController = grailsApplication.controllerClasses.name
        // println("Lista de entidades "+listaController.name)
        def eliminaEntidade = Entidades.list()
        listaController.removeAll(eliminaEntidade.nomeClasse)

        [entidadesInstance: new Entidades(params), eliminaEntidade: listaController.sort()]
    }

    def save() {
        def entidadesInstance = new Entidades(params)

        ClassificacaoEntidade classificacaoEntidade = ClassificacaoEntidade.get(session.classificacaoEntidade.id)
        entidadesInstance.classificacaoEntidade = classificacaoEntidade
        entidadesInstance.nomeClasse = params.configAttribute

        entidadesInstance.designacao = entidadesService.devolveString(entidadesInstance.nomeClasse)

        if (entidadesInstance.nomeClasse.trim().equals(""))
            entidadesInstance.nomeClasse = null

        if (entidadesInstance.designacao.trim().equals(""))
            entidadesInstance.designacao = null

        if (!entidadesInstance.save(flush: true)) {

            List listaController = grailsApplication.controllerClasses.name
            // println("Lista de entidades "+listaController.name)
            def eliminaEntidade = Entidades.list()
            listaController.removeAll(eliminaEntidade.nomeClasse)

            render(view: "create", model: [entidadesInstance: entidadesInstance,eliminaEntidade: listaController.sort()])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'entidades.label', default: 'Entidades'), entidadesInstance.id])
        redirect(action: "show", id: entidadesInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        session.tabContentCe = 2
        def entidadesInstance = Entidades.get(id)
        if (!entidadesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidades.label', default: 'Entidades'), id])
            redirect(action: "list")
            return
        }

        [entidadesInstance: entidadesInstance]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        def entidadesInstance = Entidades.get(id)
        if (!entidadesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidades.label', default: 'Entidades'), id])
            redirect(action: "list")
            return
        }

        [entidadesInstance: entidadesInstance]
    }

    def update(Long id, Long version) {
        def entidadesInstance = Entidades.get(id)
        if (!entidadesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidades.label', default: 'Entidades'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (entidadesInstance.version > version) {
                entidadesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'entidades.label', default: 'Entidades')] as Object[],
                        "Another user has updated this Entidades while you were editing")
                render(view: "edit", model: [entidadesInstance: entidadesInstance])
                return
            }
        }

        entidadesInstance.properties = params

        if (!entidadesInstance.save(flush: true)) {
            render(view: "edit", model: [entidadesInstance: entidadesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'entidades.label', default: 'Entidades'), entidadesInstance.id])
        redirect(action: "show", id: entidadesInstance.id)
    }

    def delete(Long id) {
        def entidadesInstance = Entidades.get(id)
        if (!entidadesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidades.label', default: 'Entidades'), id])
            redirect(action: "list")
            return
        }

        try {
            entidadesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'entidades.label', default: 'Entidades'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'entidades.label', default: 'Entidades'), id])
            redirect(action: "show", id: id)
        }
    }

    def classificacaoV = {
        ClassificacaoEntidade classificacaoEntidade = ClassificacaoEntidade.get(session.classificacaoEntidade.id)
        redirect(controller: 'entidades', action: 'list', id: classificacaoEntidade.id)
    }

    def voltar = {
        ClassificacaoEntidade classificacaoEntidade = ClassificacaoEntidade.get(session.classificacaoEntidade.id)
        redirect(controller: 'classificacaoEntidade', action: 'show', id: classificacaoEntidade.id)
    }

}
