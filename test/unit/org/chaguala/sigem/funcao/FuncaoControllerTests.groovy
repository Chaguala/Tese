package org.chaguala.sigem.funcao



import org.junit.*
import grails.test.mixin.*

@TestFor(FuncaoController)
@Mock(Funcao)
class FuncaoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/funcao/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.funcaoInstanceList.size() == 0
        assert model.funcaoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.funcaoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.funcaoInstance != null
        assert view == '/funcao/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/funcao/show/1'
        assert controller.flash.message != null
        assert Funcao.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/funcao/list'

        populateValidParams(params)
        def funcao = new Funcao(params)

        assert funcao.save() != null

        params.id = funcao.id

        def model = controller.show()

        assert model.funcaoInstance == funcao
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/funcao/list'

        populateValidParams(params)
        def funcao = new Funcao(params)

        assert funcao.save() != null

        params.id = funcao.id

        def model = controller.edit()

        assert model.funcaoInstance == funcao
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/funcao/list'

        response.reset()

        populateValidParams(params)
        def funcao = new Funcao(params)

        assert funcao.save() != null

        // test invalid parameters in update
        params.id = funcao.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/funcao/edit"
        assert model.funcaoInstance != null

        funcao.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/funcao/show/$funcao.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        funcao.clearErrors()

        populateValidParams(params)
        params.id = funcao.id
        params.version = -1
        controller.update()

        assert view == "/funcao/edit"
        assert model.funcaoInstance != null
        assert model.funcaoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/funcao/list'

        response.reset()

        populateValidParams(params)
        def funcao = new Funcao(params)

        assert funcao.save() != null
        assert Funcao.count() == 1

        params.id = funcao.id

        controller.delete()

        assert Funcao.count() == 0
        assert Funcao.get(funcao.id) == null
        assert response.redirectedUrl == '/funcao/list'
    }
}
