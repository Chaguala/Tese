package org.chaguala.sigem.despachopresidente



import org.junit.*
import grails.test.mixin.*

@TestFor(DespachoPresidenteController)
@Mock(DespachoPresidente)
class DespachoPresidenteControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/despachoPresidente/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.despachoPresidenteInstanceList.size() == 0
        assert model.despachoPresidenteInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.despachoPresidenteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.despachoPresidenteInstance != null
        assert view == '/despachoPresidente/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/despachoPresidente/show/1'
        assert controller.flash.message != null
        assert DespachoPresidente.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/despachoPresidente/list'

        populateValidParams(params)
        def despachoPresidente = new DespachoPresidente(params)

        assert despachoPresidente.save() != null

        params.id = despachoPresidente.id

        def model = controller.show()

        assert model.despachoPresidenteInstance == despachoPresidente
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/despachoPresidente/list'

        populateValidParams(params)
        def despachoPresidente = new DespachoPresidente(params)

        assert despachoPresidente.save() != null

        params.id = despachoPresidente.id

        def model = controller.edit()

        assert model.despachoPresidenteInstance == despachoPresidente
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/despachoPresidente/list'

        response.reset()

        populateValidParams(params)
        def despachoPresidente = new DespachoPresidente(params)

        assert despachoPresidente.save() != null

        // test invalid parameters in update
        params.id = despachoPresidente.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/despachoPresidente/edit"
        assert model.despachoPresidenteInstance != null

        despachoPresidente.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/despachoPresidente/show/$despachoPresidente.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        despachoPresidente.clearErrors()

        populateValidParams(params)
        params.id = despachoPresidente.id
        params.version = -1
        controller.update()

        assert view == "/despachoPresidente/edit"
        assert model.despachoPresidenteInstance != null
        assert model.despachoPresidenteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/despachoPresidente/list'

        response.reset()

        populateValidParams(params)
        def despachoPresidente = new DespachoPresidente(params)

        assert despachoPresidente.save() != null
        assert DespachoPresidente.count() == 1

        params.id = despachoPresidente.id

        controller.delete()

        assert DespachoPresidente.count() == 0
        assert DespachoPresidente.get(despachoPresidente.id) == null
        assert response.redirectedUrl == '/despachoPresidente/list'
    }
}
