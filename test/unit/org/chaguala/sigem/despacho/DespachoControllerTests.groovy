package org.chaguala.sigem.despacho



import org.junit.*
import grails.test.mixin.*

@TestFor(DespachoController)
@Mock(Despacho)
class DespachoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/despacho/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.despachoInstanceList.size() == 0
        assert model.despachoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.despachoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.despachoInstance != null
        assert view == '/despacho/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/despacho/show/1'
        assert controller.flash.message != null
        assert Despacho.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/despacho/list'

        populateValidParams(params)
        def despacho = new Despacho(params)

        assert despacho.save() != null

        params.id = despacho.id

        def model = controller.show()

        assert model.despachoInstance == despacho
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/despacho/list'

        populateValidParams(params)
        def despacho = new Despacho(params)

        assert despacho.save() != null

        params.id = despacho.id

        def model = controller.edit()

        assert model.despachoInstance == despacho
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/despacho/list'

        response.reset()

        populateValidParams(params)
        def despacho = new Despacho(params)

        assert despacho.save() != null

        // test invalid parameters in update
        params.id = despacho.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/despacho/edit"
        assert model.despachoInstance != null

        despacho.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/despacho/show/$despacho.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        despacho.clearErrors()

        populateValidParams(params)
        params.id = despacho.id
        params.version = -1
        controller.update()

        assert view == "/despacho/edit"
        assert model.despachoInstance != null
        assert model.despachoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/despacho/list'

        response.reset()

        populateValidParams(params)
        def despacho = new Despacho(params)

        assert despacho.save() != null
        assert Despacho.count() == 1

        params.id = despacho.id

        controller.delete()

        assert Despacho.count() == 0
        assert Despacho.get(despacho.id) == null
        assert response.redirectedUrl == '/despacho/list'
    }
}
