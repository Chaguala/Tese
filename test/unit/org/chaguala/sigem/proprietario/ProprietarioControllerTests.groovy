package org.chaguala.sigem.proprietario



import org.junit.*
import grails.test.mixin.*

@TestFor(ProprietarioController)
@Mock(Proprietario)
class ProprietarioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/proprietario/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.proprietarioInstanceList.size() == 0
        assert model.proprietarioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.proprietarioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.proprietarioInstance != null
        assert view == '/proprietario/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/proprietario/show/1'
        assert controller.flash.message != null
        assert Proprietario.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/proprietario/list'

        populateValidParams(params)
        def proprietario = new Proprietario(params)

        assert proprietario.save() != null

        params.id = proprietario.id

        def model = controller.show()

        assert model.proprietarioInstance == proprietario
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/proprietario/list'

        populateValidParams(params)
        def proprietario = new Proprietario(params)

        assert proprietario.save() != null

        params.id = proprietario.id

        def model = controller.edit()

        assert model.proprietarioInstance == proprietario
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/proprietario/list'

        response.reset()

        populateValidParams(params)
        def proprietario = new Proprietario(params)

        assert proprietario.save() != null

        // test invalid parameters in update
        params.id = proprietario.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/proprietario/edit"
        assert model.proprietarioInstance != null

        proprietario.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/proprietario/show/$proprietario.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        proprietario.clearErrors()

        populateValidParams(params)
        params.id = proprietario.id
        params.version = -1
        controller.update()

        assert view == "/proprietario/edit"
        assert model.proprietarioInstance != null
        assert model.proprietarioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/proprietario/list'

        response.reset()

        populateValidParams(params)
        def proprietario = new Proprietario(params)

        assert proprietario.save() != null
        assert Proprietario.count() == 1

        params.id = proprietario.id

        controller.delete()

        assert Proprietario.count() == 0
        assert Proprietario.get(proprietario.id) == null
        assert response.redirectedUrl == '/proprietario/list'
    }
}
