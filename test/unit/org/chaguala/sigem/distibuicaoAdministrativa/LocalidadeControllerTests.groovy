package org.chaguala.sigem.distibuicaoAdministrativa



import org.junit.*
import grails.test.mixin.*

@TestFor(LocalidadeController)
@Mock(Localidade)
class LocalidadeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/localidade/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.localidadeInstanceList.size() == 0
        assert model.localidadeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.localidadeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.localidadeInstance != null
        assert view == '/localidade/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/localidade/show/1'
        assert controller.flash.message != null
        assert Localidade.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/localidade/list'

        populateValidParams(params)
        def localidade = new Localidade(params)

        assert localidade.save() != null

        params.id = localidade.id

        def model = controller.show()

        assert model.localidadeInstance == localidade
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/localidade/list'

        populateValidParams(params)
        def localidade = new Localidade(params)

        assert localidade.save() != null

        params.id = localidade.id

        def model = controller.edit()

        assert model.localidadeInstance == localidade
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/localidade/list'

        response.reset()

        populateValidParams(params)
        def localidade = new Localidade(params)

        assert localidade.save() != null

        // test invalid parameters in update
        params.id = localidade.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/localidade/edit"
        assert model.localidadeInstance != null

        localidade.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/localidade/show/$localidade.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        localidade.clearErrors()

        populateValidParams(params)
        params.id = localidade.id
        params.version = -1
        controller.update()

        assert view == "/localidade/edit"
        assert model.localidadeInstance != null
        assert model.localidadeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/localidade/list'

        response.reset()

        populateValidParams(params)
        def localidade = new Localidade(params)

        assert localidade.save() != null
        assert Localidade.count() == 1

        params.id = localidade.id

        controller.delete()

        assert Localidade.count() == 0
        assert Localidade.get(localidade.id) == null
        assert response.redirectedUrl == '/localidade/list'
    }
}
