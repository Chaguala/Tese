package org.chaguala.sigem.tipotrassao



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoTrassaoController)
@Mock(TipoTrassao)
class TipoTrassaoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoTrassao/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoTrassaoInstanceList.size() == 0
        assert model.tipoTrassaoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoTrassaoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoTrassaoInstance != null
        assert view == '/tipoTrassao/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoTrassao/show/1'
        assert controller.flash.message != null
        assert TipoTrassao.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoTrassao/list'

        populateValidParams(params)
        def tipoTrassao = new TipoTrassao(params)

        assert tipoTrassao.save() != null

        params.id = tipoTrassao.id

        def model = controller.show()

        assert model.tipoTrassaoInstance == tipoTrassao
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoTrassao/list'

        populateValidParams(params)
        def tipoTrassao = new TipoTrassao(params)

        assert tipoTrassao.save() != null

        params.id = tipoTrassao.id

        def model = controller.edit()

        assert model.tipoTrassaoInstance == tipoTrassao
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoTrassao/list'

        response.reset()

        populateValidParams(params)
        def tipoTrassao = new TipoTrassao(params)

        assert tipoTrassao.save() != null

        // test invalid parameters in update
        params.id = tipoTrassao.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoTrassao/edit"
        assert model.tipoTrassaoInstance != null

        tipoTrassao.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoTrassao/show/$tipoTrassao.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoTrassao.clearErrors()

        populateValidParams(params)
        params.id = tipoTrassao.id
        params.version = -1
        controller.update()

        assert view == "/tipoTrassao/edit"
        assert model.tipoTrassaoInstance != null
        assert model.tipoTrassaoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoTrassao/list'

        response.reset()

        populateValidParams(params)
        def tipoTrassao = new TipoTrassao(params)

        assert tipoTrassao.save() != null
        assert TipoTrassao.count() == 1

        params.id = tipoTrassao.id

        controller.delete()

        assert TipoTrassao.count() == 0
        assert TipoTrassao.get(tipoTrassao.id) == null
        assert response.redirectedUrl == '/tipoTrassao/list'
    }
}
