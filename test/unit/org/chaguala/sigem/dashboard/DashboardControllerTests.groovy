package org.chaguala.sigem.dashboard



import org.junit.*
import grails.test.mixin.*

@TestFor(DashboardController)
@Mock(Dashboard)
class DashboardControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/dashboard/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.dashboardInstanceList.size() == 0
        assert model.dashboardInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.dashboardInstance != null
    }

    void testSave() {
        controller.save()

        assert model.dashboardInstance != null
        assert view == '/dashboard/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/dashboard/show/1'
        assert controller.flash.message != null
        assert Dashboard.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dashboard/list'

        populateValidParams(params)
        def dashboard = new Dashboard(params)

        assert dashboard.save() != null

        params.id = dashboard.id

        def model = controller.show()

        assert model.dashboardInstance == dashboard
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dashboard/list'

        populateValidParams(params)
        def dashboard = new Dashboard(params)

        assert dashboard.save() != null

        params.id = dashboard.id

        def model = controller.edit()

        assert model.dashboardInstance == dashboard
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dashboard/list'

        response.reset()

        populateValidParams(params)
        def dashboard = new Dashboard(params)

        assert dashboard.save() != null

        // test invalid parameters in update
        params.id = dashboard.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/dashboard/edit"
        assert model.dashboardInstance != null

        dashboard.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/dashboard/show/$dashboard.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        dashboard.clearErrors()

        populateValidParams(params)
        params.id = dashboard.id
        params.version = -1
        controller.update()

        assert view == "/dashboard/edit"
        assert model.dashboardInstance != null
        assert model.dashboardInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/dashboard/list'

        response.reset()

        populateValidParams(params)
        def dashboard = new Dashboard(params)

        assert dashboard.save() != null
        assert Dashboard.count() == 1

        params.id = dashboard.id

        controller.delete()

        assert Dashboard.count() == 0
        assert Dashboard.get(dashboard.id) == null
        assert response.redirectedUrl == '/dashboard/list'
    }
}
