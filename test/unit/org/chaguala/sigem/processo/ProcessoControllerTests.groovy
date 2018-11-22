package org.chaguala.sigem.processo



import org.junit.*
import grails.test.mixin.*

@TestFor(ProcessoController)
@Mock(Processo)
class ProcessoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/processo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.processoInstanceList.size() == 0
        assert model.processoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.processoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.processoInstance != null
        assert view == '/processo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/processo/show/1'
        assert controller.flash.message != null
        assert Processo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/processo/list'

        populateValidParams(params)
        def processo = new Processo(params)

        assert processo.save() != null

        params.id = processo.id

        def model = controller.show()

        assert model.processoInstance == processo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/processo/list'

        populateValidParams(params)
        def processo = new Processo(params)

        assert processo.save() != null

        params.id = processo.id

        def model = controller.edit()

        assert model.processoInstance == processo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/processo/list'

        response.reset()

        populateValidParams(params)
        def processo = new Processo(params)

        assert processo.save() != null

        // test invalid parameters in update
        params.id = processo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/processo/edit"
        assert model.processoInstance != null

        processo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/processo/show/$processo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        processo.clearErrors()

        populateValidParams(params)
        params.id = processo.id
        params.version = -1
        controller.update()

        assert view == "/processo/edit"
        assert model.processoInstance != null
        assert model.processoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/processo/list'

        response.reset()

        populateValidParams(params)
        def processo = new Processo(params)

        assert processo.save() != null
        assert Processo.count() == 1

        params.id = processo.id

        controller.delete()

        assert Processo.count() == 0
        assert Processo.get(processo.id) == null
        assert response.redirectedUrl == '/processo/list'
    }
}
