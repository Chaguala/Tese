package org.chaguala.sigem.requerente



import org.junit.*
import grails.test.mixin.*

@TestFor(RequerenteController)
@Mock(Requerente)
class RequerenteControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/requerente/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.requerenteInstanceList.size() == 0
        assert model.requerenteInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.requerenteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.requerenteInstance != null
        assert view == '/requerente/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/requerente/show/1'
        assert controller.flash.message != null
        assert Requerente.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/requerente/list'

        populateValidParams(params)
        def requerente = new Requerente(params)

        assert requerente.save() != null

        params.id = requerente.id

        def model = controller.show()

        assert model.requerenteInstance == requerente
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/requerente/list'

        populateValidParams(params)
        def requerente = new Requerente(params)

        assert requerente.save() != null

        params.id = requerente.id

        def model = controller.edit()

        assert model.requerenteInstance == requerente
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/requerente/list'

        response.reset()

        populateValidParams(params)
        def requerente = new Requerente(params)

        assert requerente.save() != null

        // test invalid parameters in update
        params.id = requerente.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/requerente/edit"
        assert model.requerenteInstance != null

        requerente.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/requerente/show/$requerente.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        requerente.clearErrors()

        populateValidParams(params)
        params.id = requerente.id
        params.version = -1
        controller.update()

        assert view == "/requerente/edit"
        assert model.requerenteInstance != null
        assert model.requerenteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/requerente/list'

        response.reset()

        populateValidParams(params)
        def requerente = new Requerente(params)

        assert requerente.save() != null
        assert Requerente.count() == 1

        params.id = requerente.id

        controller.delete()

        assert Requerente.count() == 0
        assert Requerente.get(requerente.id) == null
        assert response.redirectedUrl == '/requerente/list'
    }
}
