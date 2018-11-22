package org.chaguala.sigem.seguranca


import org.grails.plugin.filterpane.FilterPaneUtils
import org.chaguala.sigem.general.SuperController
import org.springframework.dao.DataIntegrityViolationException

class ClassificacaoEntidadeController extends SuperController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    static navigation = [
            [group: 'ClassificacaoEntidade', action: 'create', title: 'Criar', order: 0, isVisible: { session.currentAction.equals('list') }],
            [action: 'list', title: 'Voltar', order: 1, isVisible: { session.currentAction.equals('show') || session.currentAction.equals('create') }],
//            [action: 'entidade', title: 'Alocar Entidade', order: 2, isVisible: { session.currentAction.equals('show') }],
            [action: 'fechar', title: 'Sair', order: 3, isVisible: { !session.currentAction.equals('edit1') }]
    ]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        updateCurrentAction('list')
        session.tabContentCe = 1
        params.max = Math.min(max ?: 10, 100)
        [classificacaoEntidadeInstanceList: ClassificacaoEntidade.list(params), classificacaoEntidadeInstanceTotal: ClassificacaoEntidade.count()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, ClassificacaoEntidade))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [classificacaoEntidadeInstanceList: filterPaneService.filter(params, ClassificacaoEntidade),
                                     classificacaoEntidadeInstanceTotal: filterPaneService.count(params, ClassificacaoEntidade),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')
        [classificacaoEntidadeInstance: new ClassificacaoEntidade(params)]
    }

    def save() {
        def classificacaoEntidadeInstance = new ClassificacaoEntidade(params)
        if (!classificacaoEntidadeInstance.save(flush: true)) {
            render(view: "create", model: [classificacaoEntidadeInstance: classificacaoEntidadeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'classificacaoEntidade.label', default: 'ClassificacaoEntidade'), classificacaoEntidadeInstance.id])
        redirect(action: "show", id: classificacaoEntidadeInstance.id)
    }

    def show(Long id) {
        updateCurrentAction('show')
        def classificacaoEntidadeInstance = ClassificacaoEntidade.get(id)


        def entidadesInstanceList = Entidades.findAllByClassificacaoEntidade(classificacaoEntidadeInstance, [sort: 'nomeClasse', order: 'asc'])

        def entidadesInstanceTotal = entidadesInstanceList?.size()

        session.classificacaoEntidade = classificacaoEntidadeInstance
        if (!classificacaoEntidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'classificacaoEntidade.label', default: 'ClassificacaoEntidade'), id])
            redirect(action: "list")
            return
        }

        def tabContent1 = null
        def tabContent2 = null

        if (session.tabContentCe == 1) {
            tabContent1 = 'true'
        } else if (session.tabContentCe == 2) {
            tabContent2 = 'true'
        } else
            tabContent1 = 'true'

        [classificacaoEntidadeInstance: classificacaoEntidadeInstance,
         entidadesInstanceList: entidadesInstanceList, entidadesInstanceTotal: entidadesInstanceTotal,
         tabContent1: tabContent1, tabContent2: tabContent2]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        def classificacaoEntidadeInstance = ClassificacaoEntidade.get(id)
        if (!classificacaoEntidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'classificacaoEntidade.label', default: 'ClassificacaoEntidade'), id])
            redirect(action: "list")
            return
        }

        [classificacaoEntidadeInstance: classificacaoEntidadeInstance]
    }

    def update(Long id, Long version) {
        def classificacaoEntidadeInstance = ClassificacaoEntidade.get(id)
        if (!classificacaoEntidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'classificacaoEntidade.label', default: 'ClassificacaoEntidade'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (classificacaoEntidadeInstance.version > version) {
                classificacaoEntidadeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'classificacaoEntidade.label', default: 'ClassificacaoEntidade')] as Object[],
                        "Another user has updated this ClassificacaoEntidade while you were editing")
                render(view: "edit", model: [classificacaoEntidadeInstance: classificacaoEntidadeInstance])
                return
            }
        }

        classificacaoEntidadeInstance.properties = params

        if (!classificacaoEntidadeInstance.save(flush: true)) {
            render(view: "edit", model: [classificacaoEntidadeInstance: classificacaoEntidadeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'classificacaoEntidade.label', default: 'ClassificacaoEntidade'), classificacaoEntidadeInstance.id])
        redirect(action: "show", id: classificacaoEntidadeInstance.id)
    }

    def delete(Long id) {
        def classificacaoEntidadeInstance = ClassificacaoEntidade.get(id)
        if (!classificacaoEntidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'classificacaoEntidade.label', default: 'ClassificacaoEntidade'), id])
            redirect(action: "list")
            return
        }

        try {
            classificacaoEntidadeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'classificacaoEntidade.label', default: 'ClassificacaoEntidade'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'classificacaoEntidade.label', default: 'ClassificacaoEntidade'), id])
            redirect(action: "show", id: id)
        }
    }

    def entidade = {
        ClassificacaoEntidade classificacaoEntidade = ClassificacaoEntidade.get(session.classificacaoEntidade.id)
        redirect(controller: "entidades", action: "list", id: classificacaoEntidade?.id)
    }

}
