package org.chaguala.sigem.parecerProcesso



import org.junit.*
import grails.test.mixin.*

@TestFor(ParecerProcessoController)
@Mock(ParecerProcesso)
class ParecerProcessoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/parecerProcesso/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.parecerProcessoInstanceList.size() == 0
        assert model.parecerProcessoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.parecerProcessoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.parecerProcessoInstance != null
        assert view == '/parecerProcesso/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/parecerProcesso/show/1'
        assert controller.flash.message != null
        assert ParecerProcesso.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/parecerProcesso/list'

        populateValidParams(params)
        def parecerProcesso = new ParecerProcesso(params)

        assert parecerProcesso.save() != null

        params.id = parecerProcesso.id

        def model = controller.show()

        assert model.parecerProcessoInstance == parecerProcesso
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/parecerProcesso/list'

        populateValidParams(params)
        def parecerProcesso = new ParecerProcesso(params)

        assert parecerProcesso.save() != null

        params.id = parecerProcesso.id

        def model = controller.edit()

        assert model.parecerProcessoInstance == parecerProcesso
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/parecerProcesso/list'

        response.reset()

        populateValidParams(params)
        def parecerProcesso = new ParecerProcesso(params)

        assert parecerProcesso.save() != null

        // test invalid parameters in update
        params.id = parecerProcesso.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/parecerProcesso/edit"
        assert model.parecerProcessoInstance != null

        parecerProcesso.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/parecerProcesso/show/$parecerProcesso.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        parecerProcesso.clearErrors()

        populateValidParams(params)
        params.id = parecerProcesso.id
        params.version = -1
        controller.update()

        assert view == "/parecerProcesso/edit"
        assert model.parecerProcessoInstance != null
        assert model.parecerProcessoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/parecerProcesso/list'

        response.reset()

        populateValidParams(params)
        def parecerProcesso = new ParecerProcesso(params)

        assert parecerProcesso.save() != null
        assert ParecerProcesso.count() == 1

        params.id = parecerProcesso.id

        controller.delete()

        assert ParecerProcesso.count() == 0
        assert ParecerProcesso.get(parecerProcesso.id) == null
        assert response.redirectedUrl == '/parecerProcesso/list'
    }
}
