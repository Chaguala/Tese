package org.chaguala.sigem.pedido



import org.junit.*
import grails.test.mixin.*

@TestFor(PrePedidoController)
@Mock(PrePedido)
class PrePedidoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/prePedido/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.prePedidoInstanceList.size() == 0
        assert model.prePedidoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.prePedidoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.prePedidoInstance != null
        assert view == '/prePedido/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/prePedido/show/1'
        assert controller.flash.message != null
        assert PrePedido.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/prePedido/list'

        populateValidParams(params)
        def prePedido = new PrePedido(params)

        assert prePedido.save() != null

        params.id = prePedido.id

        def model = controller.show()

        assert model.prePedidoInstance == prePedido
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/prePedido/list'

        populateValidParams(params)
        def prePedido = new PrePedido(params)

        assert prePedido.save() != null

        params.id = prePedido.id

        def model = controller.edit()

        assert model.prePedidoInstance == prePedido
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/prePedido/list'

        response.reset()

        populateValidParams(params)
        def prePedido = new PrePedido(params)

        assert prePedido.save() != null

        // test invalid parameters in update
        params.id = prePedido.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/prePedido/edit"
        assert model.prePedidoInstance != null

        prePedido.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/prePedido/show/$prePedido.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        prePedido.clearErrors()

        populateValidParams(params)
        params.id = prePedido.id
        params.version = -1
        controller.update()

        assert view == "/prePedido/edit"
        assert model.prePedidoInstance != null
        assert model.prePedidoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/prePedido/list'

        response.reset()

        populateValidParams(params)
        def prePedido = new PrePedido(params)

        assert prePedido.save() != null
        assert PrePedido.count() == 1

        params.id = prePedido.id

        controller.delete()

        assert PrePedido.count() == 0
        assert PrePedido.get(prePedido.id) == null
        assert response.redirectedUrl == '/prePedido/list'
    }
}
