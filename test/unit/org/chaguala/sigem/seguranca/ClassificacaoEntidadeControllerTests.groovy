package org.chaguala.sigem.seguranca



import org.junit.*
import grails.test.mixin.*

@TestFor(ClassificacaoEntidadeController)
@Mock(ClassificacaoEntidade)
class ClassificacaoEntidadeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/classificacaoEntidade/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.classificacaoEntidadeInstanceList.size() == 0
        assert model.classificacaoEntidadeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.classificacaoEntidadeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.classificacaoEntidadeInstance != null
        assert view == '/classificacaoEntidade/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/classificacaoEntidade/show/1'
        assert controller.flash.message != null
        assert ClassificacaoEntidade.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/classificacaoEntidade/list'

        populateValidParams(params)
        def classificacaoEntidade = new ClassificacaoEntidade(params)

        assert classificacaoEntidade.save() != null

        params.id = classificacaoEntidade.id

        def model = controller.show()

        assert model.classificacaoEntidadeInstance == classificacaoEntidade
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/classificacaoEntidade/list'

        populateValidParams(params)
        def classificacaoEntidade = new ClassificacaoEntidade(params)

        assert classificacaoEntidade.save() != null

        params.id = classificacaoEntidade.id

        def model = controller.edit()

        assert model.classificacaoEntidadeInstance == classificacaoEntidade
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/classificacaoEntidade/list'

        response.reset()

        populateValidParams(params)
        def classificacaoEntidade = new ClassificacaoEntidade(params)

        assert classificacaoEntidade.save() != null

        // test invalid parameters in update
        params.id = classificacaoEntidade.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/classificacaoEntidade/edit"
        assert model.classificacaoEntidadeInstance != null

        classificacaoEntidade.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/classificacaoEntidade/show/$classificacaoEntidade.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        classificacaoEntidade.clearErrors()

        populateValidParams(params)
        params.id = classificacaoEntidade.id
        params.version = -1
        controller.update()

        assert view == "/classificacaoEntidade/edit"
        assert model.classificacaoEntidadeInstance != null
        assert model.classificacaoEntidadeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/classificacaoEntidade/list'

        response.reset()

        populateValidParams(params)
        def classificacaoEntidade = new ClassificacaoEntidade(params)

        assert classificacaoEntidade.save() != null
        assert ClassificacaoEntidade.count() == 1

        params.id = classificacaoEntidade.id

        controller.delete()

        assert ClassificacaoEntidade.count() == 0
        assert ClassificacaoEntidade.get(classificacaoEntidade.id) == null
        assert response.redirectedUrl == '/classificacaoEntidade/list'
    }
}
