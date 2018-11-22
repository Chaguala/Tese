package org.chaguala.sigem.parecer



import org.junit.*
import grails.test.mixin.*

@TestFor(ParecerController)
@Mock(Parecer)
class ParecerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/parecer/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.parecerInstanceList.size() == 0
        assert model.parecerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.parecerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.parecerInstance != null
        assert view == '/parecer/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/parecer/show/1'
        assert controller.flash.message != null
        assert Parecer.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/parecer/list'

        populateValidParams(params)
        def parecer = new Parecer(params)

        assert parecer.save() != null

        params.id = parecer.id

        def model = controller.show()

        assert model.parecerInstance == parecer
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/parecer/list'

        populateValidParams(params)
        def parecer = new Parecer(params)

        assert parecer.save() != null

        params.id = parecer.id

        def model = controller.edit()

        assert model.parecerInstance == parecer
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/parecer/list'

        response.reset()

        populateValidParams(params)
        def parecer = new Parecer(params)

        assert parecer.save() != null

        // test invalid parameters in update
        params.id = parecer.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/parecer/edit"
        assert model.parecerInstance != null

        parecer.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/parecer/show/$parecer.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        parecer.clearErrors()

        populateValidParams(params)
        params.id = parecer.id
        params.version = -1
        controller.update()

        assert view == "/parecer/edit"
        assert model.parecerInstance != null
        assert model.parecerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/parecer/list'

        response.reset()

        populateValidParams(params)
        def parecer = new Parecer(params)

        assert parecer.save() != null
        assert Parecer.count() == 1

        params.id = parecer.id

        controller.delete()

        assert Parecer.count() == 0
        assert Parecer.get(parecer.id) == null
        assert response.redirectedUrl == '/parecer/list'
    }
}
