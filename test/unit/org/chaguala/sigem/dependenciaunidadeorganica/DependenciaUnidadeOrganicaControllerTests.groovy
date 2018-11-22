package org.chaguala.sigem.dependenciaunidadeorganica



import org.junit.*
import grails.test.mixin.*

@TestFor(DependenciaUnidadeOrganicaController)
@Mock(DependenciaUnidadeOrganica)
class DependenciaUnidadeOrganicaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/dependenciaUnidadeOrganica/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.dependenciaUnidadeOrganicaInstanceList.size() == 0
        assert model.dependenciaUnidadeOrganicaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.dependenciaUnidadeOrganicaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.dependenciaUnidadeOrganicaInstance != null
        assert view == '/dependenciaUnidadeOrganica/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/dependenciaUnidadeOrganica/show/1'
        assert controller.flash.message != null
        assert DependenciaUnidadeOrganica.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dependenciaUnidadeOrganica/list'

        populateValidParams(params)
        def dependenciaUnidadeOrganica = new DependenciaUnidadeOrganica(params)

        assert dependenciaUnidadeOrganica.save() != null

        params.id = dependenciaUnidadeOrganica.id

        def model = controller.show()

        assert model.dependenciaUnidadeOrganicaInstance == dependenciaUnidadeOrganica
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dependenciaUnidadeOrganica/list'

        populateValidParams(params)
        def dependenciaUnidadeOrganica = new DependenciaUnidadeOrganica(params)

        assert dependenciaUnidadeOrganica.save() != null

        params.id = dependenciaUnidadeOrganica.id

        def model = controller.edit()

        assert model.dependenciaUnidadeOrganicaInstance == dependenciaUnidadeOrganica
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dependenciaUnidadeOrganica/list'

        response.reset()

        populateValidParams(params)
        def dependenciaUnidadeOrganica = new DependenciaUnidadeOrganica(params)

        assert dependenciaUnidadeOrganica.save() != null

        // test invalid parameters in update
        params.id = dependenciaUnidadeOrganica.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/dependenciaUnidadeOrganica/edit"
        assert model.dependenciaUnidadeOrganicaInstance != null

        dependenciaUnidadeOrganica.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/dependenciaUnidadeOrganica/show/$dependenciaUnidadeOrganica.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        dependenciaUnidadeOrganica.clearErrors()

        populateValidParams(params)
        params.id = dependenciaUnidadeOrganica.id
        params.version = -1
        controller.update()

        assert view == "/dependenciaUnidadeOrganica/edit"
        assert model.dependenciaUnidadeOrganicaInstance != null
        assert model.dependenciaUnidadeOrganicaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/dependenciaUnidadeOrganica/list'

        response.reset()

        populateValidParams(params)
        def dependenciaUnidadeOrganica = new DependenciaUnidadeOrganica(params)

        assert dependenciaUnidadeOrganica.save() != null
        assert DependenciaUnidadeOrganica.count() == 1

        params.id = dependenciaUnidadeOrganica.id

        controller.delete()

        assert DependenciaUnidadeOrganica.count() == 0
        assert DependenciaUnidadeOrganica.get(dependenciaUnidadeOrganica.id) == null
        assert response.redirectedUrl == '/dependenciaUnidadeOrganica/list'
    }
}
