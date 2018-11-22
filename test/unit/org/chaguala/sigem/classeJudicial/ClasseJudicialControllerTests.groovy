package org.chaguala.sigem.classeJudicial



import org.junit.*
import grails.test.mixin.*

@TestFor(ClasseJudicialController)
@Mock(ClasseJudicial)
class ClasseJudicialControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/classeJudicial/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.classeJudicialInstanceList.size() == 0
        assert model.classeJudicialInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.classeJudicialInstance != null
    }

    void testSave() {
        controller.save()

        assert model.classeJudicialInstance != null
        assert view == '/classeJudicial/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/classeJudicial/show/1'
        assert controller.flash.message != null
        assert ClasseJudicial.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/classeJudicial/list'

        populateValidParams(params)
        def classeJudicial = new ClasseJudicial(params)

        assert classeJudicial.save() != null

        params.id = classeJudicial.id

        def model = controller.show()

        assert model.classeJudicialInstance == classeJudicial
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/classeJudicial/list'

        populateValidParams(params)
        def classeJudicial = new ClasseJudicial(params)

        assert classeJudicial.save() != null

        params.id = classeJudicial.id

        def model = controller.edit()

        assert model.classeJudicialInstance == classeJudicial
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/classeJudicial/list'

        response.reset()

        populateValidParams(params)
        def classeJudicial = new ClasseJudicial(params)

        assert classeJudicial.save() != null

        // test invalid parameters in update
        params.id = classeJudicial.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/classeJudicial/edit"
        assert model.classeJudicialInstance != null

        classeJudicial.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/classeJudicial/show/$classeJudicial.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        classeJudicial.clearErrors()

        populateValidParams(params)
        params.id = classeJudicial.id
        params.version = -1
        controller.update()

        assert view == "/classeJudicial/edit"
        assert model.classeJudicialInstance != null
        assert model.classeJudicialInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/classeJudicial/list'

        response.reset()

        populateValidParams(params)
        def classeJudicial = new ClasseJudicial(params)

        assert classeJudicial.save() != null
        assert ClasseJudicial.count() == 1

        params.id = classeJudicial.id

        controller.delete()

        assert ClasseJudicial.count() == 0
        assert ClasseJudicial.get(classeJudicial.id) == null
        assert response.redirectedUrl == '/classeJudicial/list'
    }
}
