package org.chaguala.sigem.historicoAcademico



import org.junit.*
import grails.test.mixin.*

@TestFor(HistoricoAcademicoController)
@Mock(HistoricoAcademico)
class HistoricoAcademicoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/historicoAcademico/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.historicoAcademicoInstanceList.size() == 0
        assert model.historicoAcademicoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.historicoAcademicoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.historicoAcademicoInstance != null
        assert view == '/historicoAcademico/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/historicoAcademico/show/1'
        assert controller.flash.message != null
        assert HistoricoAcademico.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/historicoAcademico/list'

        populateValidParams(params)
        def historicoAcademico = new HistoricoAcademico(params)

        assert historicoAcademico.save() != null

        params.id = historicoAcademico.id

        def model = controller.show()

        assert model.historicoAcademicoInstance == historicoAcademico
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/historicoAcademico/list'

        populateValidParams(params)
        def historicoAcademico = new HistoricoAcademico(params)

        assert historicoAcademico.save() != null

        params.id = historicoAcademico.id

        def model = controller.edit()

        assert model.historicoAcademicoInstance == historicoAcademico
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/historicoAcademico/list'

        response.reset()

        populateValidParams(params)
        def historicoAcademico = new HistoricoAcademico(params)

        assert historicoAcademico.save() != null

        // test invalid parameters in update
        params.id = historicoAcademico.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/historicoAcademico/edit"
        assert model.historicoAcademicoInstance != null

        historicoAcademico.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/historicoAcademico/show/$historicoAcademico.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        historicoAcademico.clearErrors()

        populateValidParams(params)
        params.id = historicoAcademico.id
        params.version = -1
        controller.update()

        assert view == "/historicoAcademico/edit"
        assert model.historicoAcademicoInstance != null
        assert model.historicoAcademicoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/historicoAcademico/list'

        response.reset()

        populateValidParams(params)
        def historicoAcademico = new HistoricoAcademico(params)

        assert historicoAcademico.save() != null
        assert HistoricoAcademico.count() == 1

        params.id = historicoAcademico.id

        controller.delete()

        assert HistoricoAcademico.count() == 0
        assert HistoricoAcademico.get(historicoAcademico.id) == null
        assert response.redirectedUrl == '/historicoAcademico/list'
    }
}
