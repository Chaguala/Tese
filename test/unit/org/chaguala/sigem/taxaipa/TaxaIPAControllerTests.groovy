package org.chaguala.sigem.taxaipa



import org.junit.*
import grails.test.mixin.*

@TestFor(TaxaIPAController)
@Mock(TaxaIPA)
class TaxaIPAControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/taxaIPA/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.taxaIPAInstanceList.size() == 0
        assert model.taxaIPAInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.taxaIPAInstance != null
    }

    void testSave() {
        controller.save()

        assert model.taxaIPAInstance != null
        assert view == '/taxaIPA/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/taxaIPA/show/1'
        assert controller.flash.message != null
        assert TaxaIPA.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/taxaIPA/list'

        populateValidParams(params)
        def taxaIPA = new TaxaIPA(params)

        assert taxaIPA.save() != null

        params.id = taxaIPA.id

        def model = controller.show()

        assert model.taxaIPAInstance == taxaIPA
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/taxaIPA/list'

        populateValidParams(params)
        def taxaIPA = new TaxaIPA(params)

        assert taxaIPA.save() != null

        params.id = taxaIPA.id

        def model = controller.edit()

        assert model.taxaIPAInstance == taxaIPA
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/taxaIPA/list'

        response.reset()

        populateValidParams(params)
        def taxaIPA = new TaxaIPA(params)

        assert taxaIPA.save() != null

        // test invalid parameters in update
        params.id = taxaIPA.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/taxaIPA/edit"
        assert model.taxaIPAInstance != null

        taxaIPA.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/taxaIPA/show/$taxaIPA.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        taxaIPA.clearErrors()

        populateValidParams(params)
        params.id = taxaIPA.id
        params.version = -1
        controller.update()

        assert view == "/taxaIPA/edit"
        assert model.taxaIPAInstance != null
        assert model.taxaIPAInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/taxaIPA/list'

        response.reset()

        populateValidParams(params)
        def taxaIPA = new TaxaIPA(params)

        assert taxaIPA.save() != null
        assert TaxaIPA.count() == 1

        params.id = taxaIPA.id

        controller.delete()

        assert TaxaIPA.count() == 0
        assert TaxaIPA.get(taxaIPA.id) == null
        assert response.redirectedUrl == '/taxaIPA/list'
    }
}
