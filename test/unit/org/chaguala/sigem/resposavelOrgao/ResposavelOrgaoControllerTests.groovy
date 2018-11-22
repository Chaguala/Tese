package org.chaguala.sigem.resposavelOrgao



import org.junit.*
import grails.test.mixin.*

@TestFor(ResposavelOrgaoController)
@Mock(ResposavelOrgao)
class ResposavelOrgaoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/resposavelOrgao/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.resposavelOrgaoInstanceList.size() == 0
        assert model.resposavelOrgaoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.resposavelOrgaoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.resposavelOrgaoInstance != null
        assert view == '/resposavelOrgao/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/resposavelOrgao/show/1'
        assert controller.flash.message != null
        assert ResposavelOrgao.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/resposavelOrgao/list'

        populateValidParams(params)
        def resposavelOrgao = new ResposavelOrgao(params)

        assert resposavelOrgao.save() != null

        params.id = resposavelOrgao.id

        def model = controller.show()

        assert model.resposavelOrgaoInstance == resposavelOrgao
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/resposavelOrgao/list'

        populateValidParams(params)
        def resposavelOrgao = new ResposavelOrgao(params)

        assert resposavelOrgao.save() != null

        params.id = resposavelOrgao.id

        def model = controller.edit()

        assert model.resposavelOrgaoInstance == resposavelOrgao
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/resposavelOrgao/list'

        response.reset()

        populateValidParams(params)
        def resposavelOrgao = new ResposavelOrgao(params)

        assert resposavelOrgao.save() != null

        // test invalid parameters in update
        params.id = resposavelOrgao.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/resposavelOrgao/edit"
        assert model.resposavelOrgaoInstance != null

        resposavelOrgao.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/resposavelOrgao/show/$resposavelOrgao.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        resposavelOrgao.clearErrors()

        populateValidParams(params)
        params.id = resposavelOrgao.id
        params.version = -1
        controller.update()

        assert view == "/resposavelOrgao/edit"
        assert model.resposavelOrgaoInstance != null
        assert model.resposavelOrgaoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/resposavelOrgao/list'

        response.reset()

        populateValidParams(params)
        def resposavelOrgao = new ResposavelOrgao(params)

        assert resposavelOrgao.save() != null
        assert ResposavelOrgao.count() == 1

        params.id = resposavelOrgao.id

        controller.delete()

        assert ResposavelOrgao.count() == 0
        assert ResposavelOrgao.get(resposavelOrgao.id) == null
        assert response.redirectedUrl == '/resposavelOrgao/list'
    }
}
