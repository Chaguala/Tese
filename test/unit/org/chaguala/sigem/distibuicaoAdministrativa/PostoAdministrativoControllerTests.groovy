package org.chaguala.sigem.distibuicaoAdministrativa



import org.junit.*
import grails.test.mixin.*

@TestFor(PostoAdministrativoController)
@Mock(PostoAdministrativo)
class PostoAdministrativoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/postoAdministrativo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.postoAdministrativoInstanceList.size() == 0
        assert model.postoAdministrativoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.postoAdministrativoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.postoAdministrativoInstance != null
        assert view == '/postoAdministrativo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/postoAdministrativo/show/1'
        assert controller.flash.message != null
        assert PostoAdministrativo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/postoAdministrativo/list'

        populateValidParams(params)
        def postoAdministrativo = new PostoAdministrativo(params)

        assert postoAdministrativo.save() != null

        params.id = postoAdministrativo.id

        def model = controller.show()

        assert model.postoAdministrativoInstance == postoAdministrativo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/postoAdministrativo/list'

        populateValidParams(params)
        def postoAdministrativo = new PostoAdministrativo(params)

        assert postoAdministrativo.save() != null

        params.id = postoAdministrativo.id

        def model = controller.edit()

        assert model.postoAdministrativoInstance == postoAdministrativo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/postoAdministrativo/list'

        response.reset()

        populateValidParams(params)
        def postoAdministrativo = new PostoAdministrativo(params)

        assert postoAdministrativo.save() != null

        // test invalid parameters in update
        params.id = postoAdministrativo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/postoAdministrativo/edit"
        assert model.postoAdministrativoInstance != null

        postoAdministrativo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/postoAdministrativo/show/$postoAdministrativo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        postoAdministrativo.clearErrors()

        populateValidParams(params)
        params.id = postoAdministrativo.id
        params.version = -1
        controller.update()

        assert view == "/postoAdministrativo/edit"
        assert model.postoAdministrativoInstance != null
        assert model.postoAdministrativoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/postoAdministrativo/list'

        response.reset()

        populateValidParams(params)
        def postoAdministrativo = new PostoAdministrativo(params)

        assert postoAdministrativo.save() != null
        assert PostoAdministrativo.count() == 1

        params.id = postoAdministrativo.id

        controller.delete()

        assert PostoAdministrativo.count() == 0
        assert PostoAdministrativo.get(postoAdministrativo.id) == null
        assert response.redirectedUrl == '/postoAdministrativo/list'
    }
}
