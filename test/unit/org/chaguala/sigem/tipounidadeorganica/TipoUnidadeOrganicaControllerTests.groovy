package org.chaguala.sigem.tipounidadeorganica



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoUnidadeOrganicaController)
@Mock(TipoUnidadeOrganica)
class TipoUnidadeOrganicaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoUnidadeOrganica/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoUnidadeOrganicaInstanceList.size() == 0
        assert model.tipoUnidadeOrganicaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoUnidadeOrganicaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoUnidadeOrganicaInstance != null
        assert view == '/tipoUnidadeOrganica/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoUnidadeOrganica/show/1'
        assert controller.flash.message != null
        assert TipoUnidadeOrganica.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoUnidadeOrganica/list'

        populateValidParams(params)
        def tipoUnidadeOrganica = new TipoUnidadeOrganica(params)

        assert tipoUnidadeOrganica.save() != null

        params.id = tipoUnidadeOrganica.id

        def model = controller.show()

        assert model.tipoUnidadeOrganicaInstance == tipoUnidadeOrganica
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoUnidadeOrganica/list'

        populateValidParams(params)
        def tipoUnidadeOrganica = new TipoUnidadeOrganica(params)

        assert tipoUnidadeOrganica.save() != null

        params.id = tipoUnidadeOrganica.id

        def model = controller.edit()

        assert model.tipoUnidadeOrganicaInstance == tipoUnidadeOrganica
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoUnidadeOrganica/list'

        response.reset()

        populateValidParams(params)
        def tipoUnidadeOrganica = new TipoUnidadeOrganica(params)

        assert tipoUnidadeOrganica.save() != null

        // test invalid parameters in update
        params.id = tipoUnidadeOrganica.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoUnidadeOrganica/edit"
        assert model.tipoUnidadeOrganicaInstance != null

        tipoUnidadeOrganica.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoUnidadeOrganica/show/$tipoUnidadeOrganica.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoUnidadeOrganica.clearErrors()

        populateValidParams(params)
        params.id = tipoUnidadeOrganica.id
        params.version = -1
        controller.update()

        assert view == "/tipoUnidadeOrganica/edit"
        assert model.tipoUnidadeOrganicaInstance != null
        assert model.tipoUnidadeOrganicaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoUnidadeOrganica/list'

        response.reset()

        populateValidParams(params)
        def tipoUnidadeOrganica = new TipoUnidadeOrganica(params)

        assert tipoUnidadeOrganica.save() != null
        assert TipoUnidadeOrganica.count() == 1

        params.id = tipoUnidadeOrganica.id

        controller.delete()

        assert TipoUnidadeOrganica.count() == 0
        assert TipoUnidadeOrganica.get(tipoUnidadeOrganica.id) == null
        assert response.redirectedUrl == '/tipoUnidadeOrganica/list'
    }
}
