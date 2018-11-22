package org.chaguala.sigem.individuo



import org.junit.*
import grails.test.mixin.*

@TestFor(IndividuoController)
@Mock(Individuo)
class IndividuoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/individuo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.individuoInstanceList.size() == 0
        assert model.individuoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.individuoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.individuoInstance != null
        assert view == '/individuo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/individuo/show/1'
        assert controller.flash.message != null
        assert Individuo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/individuo/list'

        populateValidParams(params)
        def individuo = new Individuo(params)

        assert individuo.save() != null

        params.id = individuo.id

        def model = controller.show()

        assert model.individuoInstance == individuo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/individuo/list'

        populateValidParams(params)
        def individuo = new Individuo(params)

        assert individuo.save() != null

        params.id = individuo.id

        def model = controller.edit()

        assert model.individuoInstance == individuo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/individuo/list'

        response.reset()

        populateValidParams(params)
        def individuo = new Individuo(params)

        assert individuo.save() != null

        // test invalid parameters in update
        params.id = individuo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/individuo/edit"
        assert model.individuoInstance != null

        individuo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/individuo/show/$individuo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        individuo.clearErrors()

        populateValidParams(params)
        params.id = individuo.id
        params.version = -1
        controller.update()

        assert view == "/individuo/edit"
        assert model.individuoInstance != null
        assert model.individuoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/individuo/list'

        response.reset()

        populateValidParams(params)
        def individuo = new Individuo(params)

        assert individuo.save() != null
        assert Individuo.count() == 1

        params.id = individuo.id

        controller.delete()

        assert Individuo.count() == 0
        assert Individuo.get(individuo.id) == null
        assert response.redirectedUrl == '/individuo/list'
    }
}
