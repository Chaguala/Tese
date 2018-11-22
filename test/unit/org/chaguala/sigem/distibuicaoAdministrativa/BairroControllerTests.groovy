package org.chaguala.sigem.distibuicaoAdministrativa



import org.junit.*
import grails.test.mixin.*

@TestFor(BairroController)
@Mock(Bairro)
class BairroControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/bairro/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.bairroInstanceList.size() == 0
        assert model.bairroInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.bairroInstance != null
    }

    void testSave() {
        controller.save()

        assert model.bairroInstance != null
        assert view == '/bairro/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/bairro/show/1'
        assert controller.flash.message != null
        assert Bairro.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/bairro/list'

        populateValidParams(params)
        def bairro = new Bairro(params)

        assert bairro.save() != null

        params.id = bairro.id

        def model = controller.show()

        assert model.bairroInstance == bairro
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/bairro/list'

        populateValidParams(params)
        def bairro = new Bairro(params)

        assert bairro.save() != null

        params.id = bairro.id

        def model = controller.edit()

        assert model.bairroInstance == bairro
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/bairro/list'

        response.reset()

        populateValidParams(params)
        def bairro = new Bairro(params)

        assert bairro.save() != null

        // test invalid parameters in update
        params.id = bairro.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/bairro/edit"
        assert model.bairroInstance != null

        bairro.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/bairro/show/$bairro.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        bairro.clearErrors()

        populateValidParams(params)
        params.id = bairro.id
        params.version = -1
        controller.update()

        assert view == "/bairro/edit"
        assert model.bairroInstance != null
        assert model.bairroInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/bairro/list'

        response.reset()

        populateValidParams(params)
        def bairro = new Bairro(params)

        assert bairro.save() != null
        assert Bairro.count() == 1

        params.id = bairro.id

        controller.delete()

        assert Bairro.count() == 0
        assert Bairro.get(bairro.id) == null
        assert response.redirectedUrl == '/bairro/list'
    }
}
