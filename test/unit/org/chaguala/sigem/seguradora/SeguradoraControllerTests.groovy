package org.chaguala.sigem.seguradora



import org.junit.*
import grails.test.mixin.*

@TestFor(SeguradoraController)
@Mock(Seguradora)
class SeguradoraControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/seguradora/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.seguradoraInstanceList.size() == 0
        assert model.seguradoraInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.seguradoraInstance != null
    }

    void testSave() {
        controller.save()

        assert model.seguradoraInstance != null
        assert view == '/seguradora/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/seguradora/show/1'
        assert controller.flash.message != null
        assert Seguradora.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/seguradora/list'

        populateValidParams(params)
        def seguradora = new Seguradora(params)

        assert seguradora.save() != null

        params.id = seguradora.id

        def model = controller.show()

        assert model.seguradoraInstance == seguradora
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/seguradora/list'

        populateValidParams(params)
        def seguradora = new Seguradora(params)

        assert seguradora.save() != null

        params.id = seguradora.id

        def model = controller.edit()

        assert model.seguradoraInstance == seguradora
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/seguradora/list'

        response.reset()

        populateValidParams(params)
        def seguradora = new Seguradora(params)

        assert seguradora.save() != null

        // test invalid parameters in update
        params.id = seguradora.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/seguradora/edit"
        assert model.seguradoraInstance != null

        seguradora.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/seguradora/show/$seguradora.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        seguradora.clearErrors()

        populateValidParams(params)
        params.id = seguradora.id
        params.version = -1
        controller.update()

        assert view == "/seguradora/edit"
        assert model.seguradoraInstance != null
        assert model.seguradoraInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/seguradora/list'

        response.reset()

        populateValidParams(params)
        def seguradora = new Seguradora(params)

        assert seguradora.save() != null
        assert Seguradora.count() == 1

        params.id = seguradora.id

        controller.delete()

        assert Seguradora.count() == 0
        assert Seguradora.get(seguradora.id) == null
        assert response.redirectedUrl == '/seguradora/list'
    }
}
