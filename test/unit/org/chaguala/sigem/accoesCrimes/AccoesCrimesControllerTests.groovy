package org.chaguala.sigem.accoesCrimes



import org.junit.*
import grails.test.mixin.*

@TestFor(AccoesCrimesController)
@Mock(AccoesCrimes)
class AccoesCrimesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/accoesCrimes/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.accoesCrimesInstanceList.size() == 0
        assert model.accoesCrimesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.accoesCrimesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.accoesCrimesInstance != null
        assert view == '/accoesCrimes/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/accoesCrimes/show/1'
        assert controller.flash.message != null
        assert AccoesCrimes.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/accoesCrimes/list'

        populateValidParams(params)
        def accoesCrimes = new AccoesCrimes(params)

        assert accoesCrimes.save() != null

        params.id = accoesCrimes.id

        def model = controller.show()

        assert model.accoesCrimesInstance == accoesCrimes
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/accoesCrimes/list'

        populateValidParams(params)
        def accoesCrimes = new AccoesCrimes(params)

        assert accoesCrimes.save() != null

        params.id = accoesCrimes.id

        def model = controller.edit()

        assert model.accoesCrimesInstance == accoesCrimes
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/accoesCrimes/list'

        response.reset()

        populateValidParams(params)
        def accoesCrimes = new AccoesCrimes(params)

        assert accoesCrimes.save() != null

        // test invalid parameters in update
        params.id = accoesCrimes.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/accoesCrimes/edit"
        assert model.accoesCrimesInstance != null

        accoesCrimes.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/accoesCrimes/show/$accoesCrimes.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        accoesCrimes.clearErrors()

        populateValidParams(params)
        params.id = accoesCrimes.id
        params.version = -1
        controller.update()

        assert view == "/accoesCrimes/edit"
        assert model.accoesCrimesInstance != null
        assert model.accoesCrimesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/accoesCrimes/list'

        response.reset()

        populateValidParams(params)
        def accoesCrimes = new AccoesCrimes(params)

        assert accoesCrimes.save() != null
        assert AccoesCrimes.count() == 1

        params.id = accoesCrimes.id

        controller.delete()

        assert AccoesCrimes.count() == 0
        assert AccoesCrimes.get(accoesCrimes.id) == null
        assert response.redirectedUrl == '/accoesCrimes/list'
    }
}
