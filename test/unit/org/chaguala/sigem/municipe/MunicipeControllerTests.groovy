package org.chaguala.sigem.municipe



import org.junit.*
import grails.test.mixin.*

@TestFor(MunicipeController)
@Mock(Municipe)
class MunicipeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/municipe/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.municipeInstanceList.size() == 0
        assert model.municipeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.municipeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.municipeInstance != null
        assert view == '/municipe/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/municipe/show/1'
        assert controller.flash.message != null
        assert Municipe.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/municipe/list'

        populateValidParams(params)
        def municipe = new Municipe(params)

        assert municipe.save() != null

        params.id = municipe.id

        def model = controller.show()

        assert model.municipeInstance == municipe
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/municipe/list'

        populateValidParams(params)
        def municipe = new Municipe(params)

        assert municipe.save() != null

        params.id = municipe.id

        def model = controller.edit()

        assert model.municipeInstance == municipe
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/municipe/list'

        response.reset()

        populateValidParams(params)
        def municipe = new Municipe(params)

        assert municipe.save() != null

        // test invalid parameters in update
        params.id = municipe.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/municipe/edit"
        assert model.municipeInstance != null

        municipe.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/municipe/show/$municipe.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        municipe.clearErrors()

        populateValidParams(params)
        params.id = municipe.id
        params.version = -1
        controller.update()

        assert view == "/municipe/edit"
        assert model.municipeInstance != null
        assert model.municipeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/municipe/list'

        response.reset()

        populateValidParams(params)
        def municipe = new Municipe(params)

        assert municipe.save() != null
        assert Municipe.count() == 1

        params.id = municipe.id

        controller.delete()

        assert Municipe.count() == 0
        assert Municipe.get(municipe.id) == null
        assert response.redirectedUrl == '/municipe/list'
    }
}
