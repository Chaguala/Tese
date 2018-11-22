package org.chaguala.sigem.parcela



import org.junit.*
import grails.test.mixin.*

@TestFor(ParcelaController)
@Mock(Parcela)
class ParcelaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/parcela/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.parcelaInstanceList.size() == 0
        assert model.parcelaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.parcelaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.parcelaInstance != null
        assert view == '/parcela/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/parcela/show/1'
        assert controller.flash.message != null
        assert Parcela.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/parcela/list'

        populateValidParams(params)
        def parcela = new Parcela(params)

        assert parcela.save() != null

        params.id = parcela.id

        def model = controller.show()

        assert model.parcelaInstance == parcela
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/parcela/list'

        populateValidParams(params)
        def parcela = new Parcela(params)

        assert parcela.save() != null

        params.id = parcela.id

        def model = controller.edit()

        assert model.parcelaInstance == parcela
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/parcela/list'

        response.reset()

        populateValidParams(params)
        def parcela = new Parcela(params)

        assert parcela.save() != null

        // test invalid parameters in update
        params.id = parcela.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/parcela/edit"
        assert model.parcelaInstance != null

        parcela.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/parcela/show/$parcela.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        parcela.clearErrors()

        populateValidParams(params)
        params.id = parcela.id
        params.version = -1
        controller.update()

        assert view == "/parcela/edit"
        assert model.parcelaInstance != null
        assert model.parcelaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/parcela/list'

        response.reset()

        populateValidParams(params)
        def parcela = new Parcela(params)

        assert parcela.save() != null
        assert Parcela.count() == 1

        params.id = parcela.id

        controller.delete()

        assert Parcela.count() == 0
        assert Parcela.get(parcela.id) == null
        assert response.redirectedUrl == '/parcela/list'
    }
}
