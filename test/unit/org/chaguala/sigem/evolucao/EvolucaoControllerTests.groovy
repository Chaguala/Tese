package org.chaguala.sigem.evolucao



import org.junit.*
import grails.test.mixin.*

@TestFor(EvolucaoController)
@Mock(Evolucao)
class EvolucaoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/evolucao/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.evolucaoInstanceList.size() == 0
        assert model.evolucaoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.evolucaoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.evolucaoInstance != null
        assert view == '/evolucao/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/evolucao/show/1'
        assert controller.flash.message != null
        assert Evolucao.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/evolucao/list'

        populateValidParams(params)
        def evolucao = new Evolucao(params)

        assert evolucao.save() != null

        params.id = evolucao.id

        def model = controller.show()

        assert model.evolucaoInstance == evolucao
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/evolucao/list'

        populateValidParams(params)
        def evolucao = new Evolucao(params)

        assert evolucao.save() != null

        params.id = evolucao.id

        def model = controller.edit()

        assert model.evolucaoInstance == evolucao
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/evolucao/list'

        response.reset()

        populateValidParams(params)
        def evolucao = new Evolucao(params)

        assert evolucao.save() != null

        // test invalid parameters in update
        params.id = evolucao.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/evolucao/edit"
        assert model.evolucaoInstance != null

        evolucao.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/evolucao/show/$evolucao.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        evolucao.clearErrors()

        populateValidParams(params)
        params.id = evolucao.id
        params.version = -1
        controller.update()

        assert view == "/evolucao/edit"
        assert model.evolucaoInstance != null
        assert model.evolucaoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/evolucao/list'

        response.reset()

        populateValidParams(params)
        def evolucao = new Evolucao(params)

        assert evolucao.save() != null
        assert Evolucao.count() == 1

        params.id = evolucao.id

        controller.delete()

        assert Evolucao.count() == 0
        assert Evolucao.get(evolucao.id) == null
        assert response.redirectedUrl == '/evolucao/list'
    }
}
