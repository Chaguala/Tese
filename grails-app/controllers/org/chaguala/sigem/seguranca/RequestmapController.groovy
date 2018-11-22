package org.chaguala.sigem.seguranca


import org.grails.plugin.filterpane.FilterPaneUtils
import org.chaguala.sigem.general.SuperController
import org.springframework.dao.DataIntegrityViolationException

class RequestmapController extends SuperController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService
    def springSecurityService
    def requestmapService
    static navigation = [
            [group: 'Requestmap', action: 'create', title: 'Criar', order: 0, isVisible: { session.currentAction.equals('list') || session.currentAction.equals('show') }],
            [action: 'list', title: 'Voltar', order: 1, isVisible: { session.currentAction.equals('show') || session.currentAction.equals('create') }],
            [action: 'fechar', title: 'Sair', order: 2, isVisible: { !session.currentAction.equals('edit1') }]
    ]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        updateCurrentAction('list')
        params.max = Math.min(max ?: 10, 100)
        [requestmapInstanceList: Requestmap.list(params), requestmapInstanceTotal: Requestmap.count()]
    }

    def filter = {
        if (!params.max) params.max = 10

        if (!filterPaneService.filter(params, Requestmap))
            flash.message = "Não foi encontrado nenhum resultado"
        else
            flash.message = null

        render(view: 'list', model: [requestmapInstanceList: filterPaneService.filter(params, Requestmap),
                                     requestmapInstanceTotal: filterPaneService.count(params, Requestmap),
                                     filterParams: FilterPaneUtils.extractFilterParams(params),
                                     params: params])
    }

    def create() {
        updateCurrentAction('create')

        def entidadesList = ""

        if (params.id)
            entidadesList = Entidades.findAllByClassificacaoEntidade(ClassificacaoEntidade.get(params.id))

        params.max = Math.min(params.max ? params.int('max') : 15, 1000)
        def max = params.max//?:(pessoaList.size()>10 ? 10:pessoaList.size())
        def offset = params.offset ?: (0)
        offset = offset as int
        max = max as int

        def start = offset > entidadesList.size() - 1 ? entidadesList.size() - 1 : offset

        def end = (offset + max - 1) > entidadesList.size() - 1 ? entidadesList.size() - 1 : (offset + max - 1)

        def listaController1 = entidadesList.size() > 0 ? entidadesList[(start)..(end)] : entidadesList

        [requestmap: new Requestmap(params), entidadesList: listaController1, params: params]

    }

    def save() {
//        def requestmapInstance = new Requestmap(params)
//        if (!requestmapInstance.save(flush: true)) {
//            render(view: "create", model: [requestmapInstance: requestmapInstance])
//            return
//        }
//
//        flash.message = message(code: 'default.created.message', args: [message(code: 'requestmap.label', default: 'Requestmap'), requestmapInstance.id])
//        redirect(action: "show", id: requestmapInstance.id)

        List entidades = params.entidade

        // criacao de permissoes de cria��o
        if (params.create != 'null' && params.create != null)
            if (requestmapService.verificaArrey(params.create.toString()) < -2) {
                List criar = params.create

                for (int i = 0; i < entidades.size(); i++) {
                    for (int j = 0; j < criar.size(); j++)
                        if (i == Integer.parseInt(criar[j].toString())) {
                            def requestmap = new Requestmap(params)
                            requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/create"
                            requestmap.configAttribute = params.configAttribute
                            requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                            requestmap.save(flush: true)
                            springSecurityService.clearCachedRequestmaps()

                        }
                }
            } else {
                for (int i = 0; i < entidades.size(); i++) {

                    if (i == Integer.parseInt(params.create)) {
                        def requestmap = new Requestmap(params)
                        requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/create"
                        requestmap.configAttribute = params.configAttribute
                        requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                        requestmap.save(flush: true)
                        springSecurityService.clearCachedRequestmaps()

                        i = entidades.size()
                    }
                }

            }

        // criacao de permissoes de edicao
        if (params.edit != 'null' && params.edit != null)
            if (requestmapService.verificaArrey(params.edit.toString()) < -2) {
                List editar = params.edit

                for (int i = 0; i < entidades.size(); i++) {
                    for (int j = 0; j < editar.size(); j++)
                        if (i == Integer.parseInt(editar[j].toString())) {
                            def requestmap = new Requestmap(params)
                            requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/edit"
                            requestmap.configAttribute = params.configAttribute
                            requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                            requestmap.save(flush: true)
                            springSecurityService.clearCachedRequestmaps()

                        }
                }
            } else {
                for (int i = 0; i < entidades.size(); i++) {

                    if (i == Integer.parseInt(params.edit)) {
                        def requestmap = new Requestmap(params)
                        requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/edit"
                        requestmap.configAttribute = params.configAttribute
                        requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                        requestmap.save(flush: true)
                        springSecurityService.clearCachedRequestmaps()

                        i = entidades.size()
                    }
                }
            }

        // criacao de permissoes de Remo��o
        if (params.delete != 'null' && params.delete != null)
            if (requestmapService.verificaArrey(params.delete.toString()) < -2) {
                List apagar = params.delete

                for (int i = 0; i < entidades.size(); i++) {
                    for (int j = 0; j < apagar.size(); j++)
                        if (i == Integer.parseInt(apagar[j].toString())) {
                            def requestmap = new Requestmap(params)
                            requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/delete"
                            requestmap.configAttribute = params.configAttribute
                            requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                            requestmap.save(flush: true)
                            springSecurityService.clearCachedRequestmaps()

                        }
                }
            } else {
                for (int i = 0; i < entidades.size(); i++) {

                    if (i == Integer.parseInt(params.delete.toString())) {
                        def requestmap = new Requestmap(params)
                        requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/delete"
                        requestmap.configAttribute = params.configAttribute
                        requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                        requestmap.save(flush: true)
                        springSecurityService.clearCachedRequestmaps()

                        i = entidades.size()
                    }
                }
            }

        // criacao de permissoes de listagem
        if (params.list != 'null' && params.list != null)
            if (requestmapService.verificaArrey(params.list.toString()) < -2) {
                List lista = params.list

                for (int i = 0; i < entidades.size(); i++) {
                    for (int j = 0; j < lista.size(); j++)
                        if (i == Integer.parseInt(lista[j].toString())) {
                            def requestmap = new Requestmap(params)
                            requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/list"
                            requestmap.configAttribute = params.configAttribute
                            requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                            requestmap.save(flush: true)
                            springSecurityService.clearCachedRequestmaps()

                        }
                }
            } else {
                for (int i = 0; i < entidades.size(); i++) {

                    if (i == Integer.parseInt(params.list)) {
                        def requestmap = new Requestmap(params)
                        requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/list"
                        requestmap.configAttribute = params.configAttribute
                        requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                        requestmap.save(flush: true)
                        springSecurityService.clearCachedRequestmaps()

                        i = entidades.size()
                    }
                }
            }

        redirect(action: 'list')

    }

    def show(Long id) {
        updateCurrentAction('show')
        def requestmapInstance = Requestmap.get(id)
        if (!requestmapInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requestmap.label', default: 'Requestmap'), id])
            redirect(action: "list")
            return
        }

        [requestmapInstance: requestmapInstance]
    }

    def edit(Long id) {
        updateCurrentAction('edit')
        def requestmapInstance = Requestmap.get(id)
        if (!requestmapInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requestmap.label', default: 'Requestmap'), id])
            redirect(action: "list")
            return
        }

        [requestmapInstance: requestmapInstance]
    }

    def update(Long id, Long version) {
        def requestmapInstance = Requestmap.get(id)
        if (!requestmapInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requestmap.label', default: 'Requestmap'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (requestmapInstance.version > version) {
                requestmapInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'requestmap.label', default: 'Requestmap')] as Object[],
                        "Another user has updated this Requestmap while you were editing")
                render(view: "edit", model: [requestmapInstance: requestmapInstance])
                return
            }
        }

        requestmapInstance.properties = params

        if (!requestmapInstance.save(flush: true)) {
            render(view: "edit", model: [requestmapInstance: requestmapInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'requestmap.label', default: 'Requestmap'), requestmapInstance.id])
        redirect(action: "show", id: requestmapInstance.id)
    }

    def delete(Long id) {
        def requestmapInstance = Requestmap.get(id)
        if (!requestmapInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requestmap.label', default: 'Requestmap'), id])
            redirect(action: "list")
            return
        }

        try {
            requestmapInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'requestmap.label', default: 'Requestmap'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'requestmap.label', default: 'Requestmap'), id])
            redirect(action: "show", id: id)
        }
    }

    def verificaEntidades = {
        List<Entidades> entidadesList = null
        def contaPermicao = 0
        Requestmap permissoes = null

        if (params.classificacao != "null" && params.classificacao != null) {
            session.role = params.configAttribute
            session.classificacao = params.classificacao
            entidadesList = Entidades.findAllByClassificacaoEntidade(ClassificacaoEntidade.get(params.classificacao))
            contaPermicao = entidadesList.size()
        }

        if (requestmapService.existePermicao(entidadesList))
            redirect(action: 'actualizaPermissao')

        [requestmap: new Requestmap(params), entidadesList: entidadesList, params: params, contaPermicao: contaPermicao]
    }

    def actualizaPermissao = {
        List<Entidades> entidadesList = null

        List create = []
        List edit = []
        List remove = []
        List list = []

        Requestmap permissoes = null

        def role = session.role
        def classificacao = session.classificacao

        if (classificacao != "null" && classificacao != null) {
            params.configAttribute = role
            params.classificacao = session.classificacao
            ClassificacaoEntidade classificacaoEntidade = ClassificacaoEntidade.get(classificacao)
            entidadesList = Entidades.findAllByClassificacaoEntidade(classificacaoEntidade)



            for (int i = 0; i < entidadesList.size(); i++) {

                def requestmapCreate = Requestmap.findAllByUrlIlikeAndConfigAttributeLike("%" + entidadesList[i].nomeClasse + "/create" + "%", "%" + role + "%")
                if (!requestmapCreate.empty)
                    requestmapCreate = Requestmap.findAllByIdInListAndClassificacaoEntidade(requestmapCreate?.id, classificacaoEntidade)
                def requestmapEdit = Requestmap.findAllByUrlIlikeAndConfigAttributeLike("%" + entidadesList[i].nomeClasse + "/edit" + "%", "%" + role + "%")
                if (!requestmapEdit.empty)
                    requestmapEdit = Requestmap.findAllByIdInListAndClassificacaoEntidade(requestmapEdit?.id, classificacaoEntidade)
                def requestmapRemove = Requestmap.findAllByUrlIlikeAndConfigAttributeLike("%" + entidadesList[i].nomeClasse + "/delete" + "%", "%" + role + "%")
                if (!requestmapRemove.empty)
                    requestmapRemove = Requestmap.findAllByIdInListAndClassificacaoEntidade(requestmapRemove?.id, classificacaoEntidade)
                def requestmapList = Requestmap.findAllByUrlIlikeAndConfigAttributeLike("%" + entidadesList[i].nomeClasse + "/list" + "%", "%" + role + "%")
                if (!requestmapList.empty)
                    requestmapList = Requestmap.findAllByIdInListAndClassificacaoEntidade(requestmapList?.id, classificacaoEntidade)

                if (requestmapCreate)
                    create = create + i
                else
                    create = create + (-1)

                if (requestmapEdit)
                    edit = edit + i
                else
                    edit = edit + (-1)

                if (requestmapRemove)
                    remove = remove + i
                else
                    remove = remove + (-1)

                if (requestmapList)
                    list = list + i
                else
                    list = list + (-1)
            }

        }
        [entidadesList: entidadesList, params: params, createList: create, editList: edit, removeList: remove, listaList: list]
    }

    def actualiza = {

        def entidades = params.entidade
        String grupo = params.configAttribute
        for (int i = 0; i < entidades.size(); i++) {
            def apagaRequestmap = Requestmap.findAllByUrlIlikeAndConfigAttributeIlike("%" + entidades[i] + "%", "%" + grupo + "%")

            if (apagaRequestmap)
                for (int j = 0; j < apagaRequestmap.size(); j++) {
                    def apaga = Requestmap.get(apagaRequestmap[j].id)
                    if (apaga)
                        if (apaga.configAttribute.contains(',')) {
                            if (apaga.configAttribute.startsWith(grupo + ",")) {
                                grupo = grupo + ","
                                apaga.configAttribute = apaga.configAttribute.replace(grupo, '')
                                apaga.save()
                                grupo = params.configAttribute
                            } else {
                                grupo = "," + grupo
                                apaga.configAttribute = apaga.configAttribute.replace(grupo, '')
                                apaga.save()
                                grupo = params.configAttribute
                            }
                        } else
                            apaga.delete()
                }
        }
//        criacao de permissoes de criacao
        if (params.create != 'null' && params.create != null)
            if (requestmapService.verificaArrey(params.create.toString()) < -2) {
                List criar = params.create

                if (Integer.parseInt(criar[0].toString()) == -2)
                    criar[0] = 0

                for (int i = 0; i < entidades.size(); i++) {
                    for (int j = 0; j < criar.size(); j++)
                        if (i == Integer.parseInt(criar[j].toString())) {
                            def requestmap = new Requestmap(params)
                            requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/create"
                            def criaActualizaPermissao = Requestmap.findByUrl(requestmap.url)

                            if (criaActualizaPermissao) {
                                requestmap = criaActualizaPermissao
                                requestmap.configAttribute = requestmap.configAttribute + "," + params.configAttribute
                            } else
                                requestmap.configAttribute = params.configAttribute
                            requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                            requestmap.save(flush: true)
                            springSecurityService.clearCachedRequestmaps()

                        }
                }
            } else {
                for (int i = 0; i < entidades.size(); i++) {
                    if (Integer.parseInt(params.create.toString()) == -2)
                        params.create = 0
                    if (i == Integer.parseInt(params.create.toString())) {
                        def requestmap = new Requestmap(params)
                        requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/create"
                        def criaActualizaPermissao = Requestmap.findByUrl(requestmap.url)

                        if (criaActualizaPermissao) {
                            requestmap = criaActualizaPermissao
                            requestmap.configAttribute = requestmap.configAttribute + "," + params.configAttribute
                        } else
                            requestmap.configAttribute = params.configAttribute
                        requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                        requestmap.save(flush: true)
                        springSecurityService.clearCachedRequestmaps()

                        i = entidades.size()
                    }
                }

            }

        // criacao de permissoes de edicao
        if (params.edit != 'null' && params.edit != null)
            if (requestmapService.verificaArrey(params.edit.toString()) < -2) {
                List editar = params.edit
                if (Integer.parseInt(params.edit[0].toString()) == -2)
                    editar[0] = 0

                for (int i = 0; i < entidades.size(); i++) {
                    for (int j = 0; j < editar.size(); j++)
                        if (i == Integer.parseInt(editar[j].toString())) {
                            def requestmap = new Requestmap(params)
                            requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/edit"
                            def criaActualizaPermissao = Requestmap.findByUrl(requestmap.url)

                            if (criaActualizaPermissao) {
                                requestmap = criaActualizaPermissao
                                requestmap.configAttribute = requestmap.configAttribute + "," + params.configAttribute
                            } else
                                requestmap.configAttribute = params.configAttribute
                            requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                            requestmap.save(flush: true)
                            springSecurityService.clearCachedRequestmaps()

                        }
                }
            } else {
                for (int i = 0; i < entidades.size(); i++) {

                    if (Integer.parseInt(params.edit.toString()) == -2)
                        params.edit = 0

                    if (i == Integer.parseInt(params.edit.toString())) {
                        def requestmap = new Requestmap(params)
                        requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/edit"
                        def criaActualizaPermissao = Requestmap.findByUrl(requestmap.url)

                        if (criaActualizaPermissao) {
                            requestmap = criaActualizaPermissao
                            requestmap.configAttribute = requestmap.configAttribute + "," + params.configAttribute
                        } else
                            requestmap.configAttribute = params.configAttribute
                        requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                        requestmap.save(flush: true)
                        springSecurityService.clearCachedRequestmaps()

                        i = entidades.size()
                    }
                }
            }

        // criacao de permissoes de Remover
        if (params.delete != 'null' && params.delete != null)
            if (requestmapService.verificaArrey(params.delete.toString()) < -2) {
                List apagar = params.delete
                if (Integer.parseInt(apagar[0].toString()) == -2)
                    apagar[0] = 0

                for (int i = 0; i < entidades.size(); i++) {
                    for (int j = 0; j < apagar.size(); j++)
                        if (i == Integer.parseInt(apagar[j].toString())) {
                            def requestmap = new Requestmap(params)
                            requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/delete"
                            def criaActualizaPermissao = Requestmap.findByUrl(requestmap.url)

                            if (criaActualizaPermissao) {
                                requestmap = criaActualizaPermissao
                                requestmap.configAttribute = requestmap.configAttribute + "," + params.configAttribute
                            } else
                                requestmap.configAttribute = params.configAttribute
                            requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                            requestmap.save(flush: true)
                            springSecurityService.clearCachedRequestmaps()

                        }
                }
            } else {
                for (int i = 0; i < entidades.size(); i++) {

                    if (Integer.parseInt(params.delete.toString()) == -2)
                        params.delete = 0

                    if (i == Integer.parseInt(params.delete.toString())) {
                        def requestmap = new Requestmap(params)
                        requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/delete"
                        def criaActualizaPermissao = Requestmap.findByUrl(requestmap.url)

                        if (criaActualizaPermissao) {
                            requestmap = criaActualizaPermissao
                            requestmap.configAttribute = requestmap.configAttribute + "," + params.configAttribute
                        } else
                            requestmap.configAttribute = params.configAttribute
                        requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                        requestmap.save(flush: true)
                        springSecurityService.clearCachedRequestmaps()

                        i = entidades.size()
                    }
                }
            }

        // criacao de permissoes de listagem
        if (params.list != 'null' && params.list != null)
            if (requestmapService.verificaArrey(params.list.toString()) < -2) {
                List lista = params.list
                if (Integer.parseInt(lista[0].toString()) == -2)
                    lista[0] = 0

                for (int i = 0; i < entidades.size(); i++) {
                    for (int j = 0; j < lista.size(); j++)
                        if (i == Integer.parseInt(lista[j].toString())) {
                            def requestmap = new Requestmap(params)
                            requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/list"
                            def criaActualizaPermissao = Requestmap.findByUrl(requestmap.url)

                            if (criaActualizaPermissao) {
                                requestmap = criaActualizaPermissao
                                requestmap.configAttribute = requestmap.configAttribute + "," + params.configAttribute
                            } else
                                requestmap.configAttribute = params.configAttribute
                            requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                            requestmap.save(flush: true)
                            springSecurityService.clearCachedRequestmaps()

                        }
                }
            } else {
                for (int i = 0; i < entidades.size(); i++) {
                    if (Integer.parseInt(params.list.toString()) == -2)
                        params.list = 0

                    if (i == Integer.parseInt(params.list.toString())) {
                        def requestmap = new Requestmap(params)
                        requestmap.url = "/" + requestmapService.devolveController(params.entidade[i].toString()) + "/list"
                        def criaActualizaPermissao = Requestmap.findByUrl(requestmap.url)

                        if (criaActualizaPermissao) {
                            requestmap = criaActualizaPermissao
                            requestmap.configAttribute = requestmap.configAttribute + "," + params.configAttribute
                        } else
                            requestmap.configAttribute = params.configAttribute
                        requestmap.classificacaoEntidade = ClassificacaoEntidade.get(params.classificacao)
                        requestmap.save(flush: true)
                        springSecurityService.clearCachedRequestmaps()

                        i = entidades.size()
                    }
                }

            }

        redirect(action: 'list')
    }

}
