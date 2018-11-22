package org.chaguala.sigem.tipocombustivel



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoCombustivelController)
@Mock(TipoCombustivel)
class TipoCombustivelControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoCombustivel/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoCombustivelInstanceList.size() == 0
        assert model.tipoCombustivelInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoCombustivelInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoCombustivelInstance != null
        assert view == '/tipoCombustivel/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoCombustivel/show/1'
        assert controller.flash.message != null
        assert TipoCombustivel.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoCombustivel/list'

        populateValidParams(params)
        def tipoCombustivel = new TipoCombustivel(params)

        assert tipoCombustivel.save() != null

        params.id = tipoCombustivel.id

        def model = controller.show()

        assert model.tipoCombustivelInstance == tipoCombustivel
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoCombustivel/list'

        populateValidParams(params)
        def tipoCombustivel = new TipoCombustivel(params)

        assert tipoCombustivel.save() != null

        params.id = tipoCombustivel.id

        def model = controller.edit()

        assert model.tipoCombustivelInstance == tipoCombustivel
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoCombustivel/list'

        response.reset()

        populateValidParams(params)
        def tipoCombustivel = new TipoCombustivel(params)

        assert tipoCombustivel.save() != null

        // test invalid parameters in update
        params.id = tipoCombustivel.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoCombustivel/edit"
        assert model.tipoCombustivelInstance != null

        tipoCombustivel.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoCombustivel/show/$tipoCombustivel.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoCombustivel.clearErrors()

        populateValidParams(params)
        params.id = tipoCombustivel.id
        params.version = -1
        controller.update()

        assert view == "/tipoCombustivel/edit"
        assert model.tipoCombustivelInstance != null
        assert model.tipoCombustivelInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoCombustivel/list'

        response.reset()

        populateValidParams(params)
        def tipoCombustivel = new TipoCombustivel(params)

        assert tipoCombustivel.save() != null
        assert TipoCombustivel.count() == 1

        params.id = tipoCombustivel.id

        controller.delete()

        assert TipoCombustivel.count() == 0
        assert TipoCombustivel.get(tipoCombustivel.id) == null
        assert response.redirectedUrl == '/tipoCombustivel/list'
    }
}
