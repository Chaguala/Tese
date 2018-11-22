package org.chaguala.sigem.tiposeguro



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoSeguroController)
@Mock(TipoSeguro)
class TipoSeguroControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoSeguro/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoSeguroInstanceList.size() == 0
        assert model.tipoSeguroInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoSeguroInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoSeguroInstance != null
        assert view == '/tipoSeguro/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoSeguro/show/1'
        assert controller.flash.message != null
        assert TipoSeguro.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoSeguro/list'

        populateValidParams(params)
        def tipoSeguro = new TipoSeguro(params)

        assert tipoSeguro.save() != null

        params.id = tipoSeguro.id

        def model = controller.show()

        assert model.tipoSeguroInstance == tipoSeguro
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoSeguro/list'

        populateValidParams(params)
        def tipoSeguro = new TipoSeguro(params)

        assert tipoSeguro.save() != null

        params.id = tipoSeguro.id

        def model = controller.edit()

        assert model.tipoSeguroInstance == tipoSeguro
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoSeguro/list'

        response.reset()

        populateValidParams(params)
        def tipoSeguro = new TipoSeguro(params)

        assert tipoSeguro.save() != null

        // test invalid parameters in update
        params.id = tipoSeguro.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoSeguro/edit"
        assert model.tipoSeguroInstance != null

        tipoSeguro.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoSeguro/show/$tipoSeguro.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoSeguro.clearErrors()

        populateValidParams(params)
        params.id = tipoSeguro.id
        params.version = -1
        controller.update()

        assert view == "/tipoSeguro/edit"
        assert model.tipoSeguroInstance != null
        assert model.tipoSeguroInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoSeguro/list'

        response.reset()

        populateValidParams(params)
        def tipoSeguro = new TipoSeguro(params)

        assert tipoSeguro.save() != null
        assert TipoSeguro.count() == 1

        params.id = tipoSeguro.id

        controller.delete()

        assert TipoSeguro.count() == 0
        assert TipoSeguro.get(tipoSeguro.id) == null
        assert response.redirectedUrl == '/tipoSeguro/list'
    }
}
