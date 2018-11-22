package org.chaguala.sigem.unidadeorganica



import org.junit.*
import grails.test.mixin.*

@TestFor(UnidadeOrganicaController)
@Mock(UnidadeOrganica)
class UnidadeOrganicaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/unidadeOrganica/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.unidadeOrganicaInstanceList.size() == 0
        assert model.unidadeOrganicaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.unidadeOrganicaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.unidadeOrganicaInstance != null
        assert view == '/unidadeOrganica/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/unidadeOrganica/show/1'
        assert controller.flash.message != null
        assert UnidadeOrganica.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/unidadeOrganica/list'

        populateValidParams(params)
        def unidadeOrganica = new UnidadeOrganica(params)

        assert unidadeOrganica.save() != null

        params.id = unidadeOrganica.id

        def model = controller.show()

        assert model.unidadeOrganicaInstance == unidadeOrganica
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/unidadeOrganica/list'

        populateValidParams(params)
        def unidadeOrganica = new UnidadeOrganica(params)

        assert unidadeOrganica.save() != null

        params.id = unidadeOrganica.id

        def model = controller.edit()

        assert model.unidadeOrganicaInstance == unidadeOrganica
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/unidadeOrganica/list'

        response.reset()

        populateValidParams(params)
        def unidadeOrganica = new UnidadeOrganica(params)

        assert unidadeOrganica.save() != null

        // test invalid parameters in update
        params.id = unidadeOrganica.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/unidadeOrganica/edit"
        assert model.unidadeOrganicaInstance != null

        unidadeOrganica.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/unidadeOrganica/show/$unidadeOrganica.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        unidadeOrganica.clearErrors()

        populateValidParams(params)
        params.id = unidadeOrganica.id
        params.version = -1
        controller.update()

        assert view == "/unidadeOrganica/edit"
        assert model.unidadeOrganicaInstance != null
        assert model.unidadeOrganicaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/unidadeOrganica/list'

        response.reset()

        populateValidParams(params)
        def unidadeOrganica = new UnidadeOrganica(params)

        assert unidadeOrganica.save() != null
        assert UnidadeOrganica.count() == 1

        params.id = unidadeOrganica.id

        controller.delete()

        assert UnidadeOrganica.count() == 0
        assert UnidadeOrganica.get(unidadeOrganica.id) == null
        assert response.redirectedUrl == '/unidadeOrganica/list'
    }
}
