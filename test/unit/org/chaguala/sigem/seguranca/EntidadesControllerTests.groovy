package org.chaguala.sigem.seguranca



import org.junit.*
import grails.test.mixin.*

@TestFor(EntidadesController)
@Mock(Entidades)
class EntidadesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/entidades/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.entidadesInstanceList.size() == 0
        assert model.entidadesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.entidadesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.entidadesInstance != null
        assert view == '/entidades/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/entidades/show/1'
        assert controller.flash.message != null
        assert Entidades.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/entidades/list'

        populateValidParams(params)
        def entidades = new Entidades(params)

        assert entidades.save() != null

        params.id = entidades.id

        def model = controller.show()

        assert model.entidadesInstance == entidades
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/entidades/list'

        populateValidParams(params)
        def entidades = new Entidades(params)

        assert entidades.save() != null

        params.id = entidades.id

        def model = controller.edit()

        assert model.entidadesInstance == entidades
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/entidades/list'

        response.reset()

        populateValidParams(params)
        def entidades = new Entidades(params)

        assert entidades.save() != null

        // test invalid parameters in update
        params.id = entidades.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/entidades/edit"
        assert model.entidadesInstance != null

        entidades.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/entidades/show/$entidades.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        entidades.clearErrors()

        populateValidParams(params)
        params.id = entidades.id
        params.version = -1
        controller.update()

        assert view == "/entidades/edit"
        assert model.entidadesInstance != null
        assert model.entidadesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/entidades/list'

        response.reset()

        populateValidParams(params)
        def entidades = new Entidades(params)

        assert entidades.save() != null
        assert Entidades.count() == 1

        params.id = entidades.id

        controller.delete()

        assert Entidades.count() == 0
        assert Entidades.get(entidades.id) == null
        assert response.redirectedUrl == '/entidades/list'
    }
}
