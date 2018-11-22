package org.chaguala.sigem.distibuicaoAdministrativa



import org.junit.*
import grails.test.mixin.*

@TestFor(DistritoUrbanoController)
@Mock(DistritoUrbano)
class DistritoUrbanoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/distritoUrbano/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.distritoUrbanoInstanceList.size() == 0
        assert model.distritoUrbanoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.distritoUrbanoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.distritoUrbanoInstance != null
        assert view == '/distritoUrbano/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/distritoUrbano/show/1'
        assert controller.flash.message != null
        assert DistritoUrbano.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/distritoUrbano/list'

        populateValidParams(params)
        def distritoUrbano = new DistritoUrbano(params)

        assert distritoUrbano.save() != null

        params.id = distritoUrbano.id

        def model = controller.show()

        assert model.distritoUrbanoInstance == distritoUrbano
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/distritoUrbano/list'

        populateValidParams(params)
        def distritoUrbano = new DistritoUrbano(params)

        assert distritoUrbano.save() != null

        params.id = distritoUrbano.id

        def model = controller.edit()

        assert model.distritoUrbanoInstance == distritoUrbano
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/distritoUrbano/list'

        response.reset()

        populateValidParams(params)
        def distritoUrbano = new DistritoUrbano(params)

        assert distritoUrbano.save() != null

        // test invalid parameters in update
        params.id = distritoUrbano.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/distritoUrbano/edit"
        assert model.distritoUrbanoInstance != null

        distritoUrbano.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/distritoUrbano/show/$distritoUrbano.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        distritoUrbano.clearErrors()

        populateValidParams(params)
        params.id = distritoUrbano.id
        params.version = -1
        controller.update()

        assert view == "/distritoUrbano/edit"
        assert model.distritoUrbanoInstance != null
        assert model.distritoUrbanoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/distritoUrbano/list'

        response.reset()

        populateValidParams(params)
        def distritoUrbano = new DistritoUrbano(params)

        assert distritoUrbano.save() != null
        assert DistritoUrbano.count() == 1

        params.id = distritoUrbano.id

        controller.delete()

        assert DistritoUrbano.count() == 0
        assert DistritoUrbano.get(distritoUrbano.id) == null
        assert response.redirectedUrl == '/distritoUrbano/list'
    }
}
