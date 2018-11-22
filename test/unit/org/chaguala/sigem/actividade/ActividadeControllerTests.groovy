package org.chaguala.sigem.actividade



import org.junit.*
import grails.test.mixin.*

@TestFor(ActividadeController)
@Mock(Actividade)
class ActividadeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/actividade/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.actividadeInstanceList.size() == 0
        assert model.actividadeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.actividadeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.actividadeInstance != null
        assert view == '/actividade/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/actividade/show/1'
        assert controller.flash.message != null
        assert Actividade.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/actividade/list'

        populateValidParams(params)
        def actividade = new Actividade(params)

        assert actividade.save() != null

        params.id = actividade.id

        def model = controller.show()

        assert model.actividadeInstance == actividade
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/actividade/list'

        populateValidParams(params)
        def actividade = new Actividade(params)

        assert actividade.save() != null

        params.id = actividade.id

        def model = controller.edit()

        assert model.actividadeInstance == actividade
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/actividade/list'

        response.reset()

        populateValidParams(params)
        def actividade = new Actividade(params)

        assert actividade.save() != null

        // test invalid parameters in update
        params.id = actividade.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/actividade/edit"
        assert model.actividadeInstance != null

        actividade.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/actividade/show/$actividade.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        actividade.clearErrors()

        populateValidParams(params)
        params.id = actividade.id
        params.version = -1
        controller.update()

        assert view == "/actividade/edit"
        assert model.actividadeInstance != null
        assert model.actividadeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/actividade/list'

        response.reset()

        populateValidParams(params)
        def actividade = new Actividade(params)

        assert actividade.save() != null
        assert Actividade.count() == 1

        params.id = actividade.id

        controller.delete()

        assert Actividade.count() == 0
        assert Actividade.get(actividade.id) == null
        assert response.redirectedUrl == '/actividade/list'
    }
}
