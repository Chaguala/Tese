package org.chaguala.sigem.localizacaogeografica



import org.junit.*
import grails.test.mixin.*

@TestFor(LocalizacaoGeograficaController)
@Mock(LocalizacaoGeografica)
class LocalizacaoGeograficaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/localizacaoGeografica/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.localizacaoGeograficaInstanceList.size() == 0
        assert model.localizacaoGeograficaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.localizacaoGeograficaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.localizacaoGeograficaInstance != null
        assert view == '/localizacaoGeografica/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/localizacaoGeografica/show/1'
        assert controller.flash.message != null
        assert LocalizacaoGeografica.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/localizacaoGeografica/list'

        populateValidParams(params)
        def localizacaoGeografica = new LocalizacaoGeografica(params)

        assert localizacaoGeografica.save() != null

        params.id = localizacaoGeografica.id

        def model = controller.show()

        assert model.localizacaoGeograficaInstance == localizacaoGeografica
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/localizacaoGeografica/list'

        populateValidParams(params)
        def localizacaoGeografica = new LocalizacaoGeografica(params)

        assert localizacaoGeografica.save() != null

        params.id = localizacaoGeografica.id

        def model = controller.edit()

        assert model.localizacaoGeograficaInstance == localizacaoGeografica
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/localizacaoGeografica/list'

        response.reset()

        populateValidParams(params)
        def localizacaoGeografica = new LocalizacaoGeografica(params)

        assert localizacaoGeografica.save() != null

        // test invalid parameters in update
        params.id = localizacaoGeografica.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/localizacaoGeografica/edit"
        assert model.localizacaoGeograficaInstance != null

        localizacaoGeografica.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/localizacaoGeografica/show/$localizacaoGeografica.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        localizacaoGeografica.clearErrors()

        populateValidParams(params)
        params.id = localizacaoGeografica.id
        params.version = -1
        controller.update()

        assert view == "/localizacaoGeografica/edit"
        assert model.localizacaoGeograficaInstance != null
        assert model.localizacaoGeograficaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/localizacaoGeografica/list'

        response.reset()

        populateValidParams(params)
        def localizacaoGeografica = new LocalizacaoGeografica(params)

        assert localizacaoGeografica.save() != null
        assert LocalizacaoGeografica.count() == 1

        params.id = localizacaoGeografica.id

        controller.delete()

        assert LocalizacaoGeografica.count() == 0
        assert LocalizacaoGeografica.get(localizacaoGeografica.id) == null
        assert response.redirectedUrl == '/localizacaoGeografica/list'
    }
}
