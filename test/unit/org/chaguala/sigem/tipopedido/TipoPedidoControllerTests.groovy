package org.chaguala.sigem.tipopedido



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoPedidoController)
@Mock(TipoPedido)
class TipoPedidoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoPedido/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoPedidoInstanceList.size() == 0
        assert model.tipoPedidoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoPedidoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoPedidoInstance != null
        assert view == '/tipoPedido/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoPedido/show/1'
        assert controller.flash.message != null
        assert TipoPedido.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPedido/list'

        populateValidParams(params)
        def tipoPedido = new TipoPedido(params)

        assert tipoPedido.save() != null

        params.id = tipoPedido.id

        def model = controller.show()

        assert model.tipoPedidoInstance == tipoPedido
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPedido/list'

        populateValidParams(params)
        def tipoPedido = new TipoPedido(params)

        assert tipoPedido.save() != null

        params.id = tipoPedido.id

        def model = controller.edit()

        assert model.tipoPedidoInstance == tipoPedido
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPedido/list'

        response.reset()

        populateValidParams(params)
        def tipoPedido = new TipoPedido(params)

        assert tipoPedido.save() != null

        // test invalid parameters in update
        params.id = tipoPedido.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoPedido/edit"
        assert model.tipoPedidoInstance != null

        tipoPedido.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoPedido/show/$tipoPedido.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoPedido.clearErrors()

        populateValidParams(params)
        params.id = tipoPedido.id
        params.version = -1
        controller.update()

        assert view == "/tipoPedido/edit"
        assert model.tipoPedidoInstance != null
        assert model.tipoPedidoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoPedido/list'

        response.reset()

        populateValidParams(params)
        def tipoPedido = new TipoPedido(params)

        assert tipoPedido.save() != null
        assert TipoPedido.count() == 1

        params.id = tipoPedido.id

        controller.delete()

        assert TipoPedido.count() == 0
        assert TipoPedido.get(tipoPedido.id) == null
        assert response.redirectedUrl == '/tipoPedido/list'
    }
}
