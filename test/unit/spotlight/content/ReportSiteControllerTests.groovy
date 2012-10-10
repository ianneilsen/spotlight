package spotlight.content



import org.junit.*
import grails.test.mixin.*

@TestFor(ReportSiteController)
@Mock(ReportSite)
class ReportSiteControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/reportSite/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.reportSiteInstanceList.size() == 0
        assert model.reportSiteInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.reportSiteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.reportSiteInstance != null
        assert view == '/reportSite/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/reportSite/show/1'
        assert controller.flash.message != null
        assert ReportSite.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/reportSite/list'

        populateValidParams(params)
        def reportSite = new ReportSite(params)

        assert reportSite.save() != null

        params.id = reportSite.id

        def model = controller.show()

        assert model.reportSiteInstance == reportSite
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/reportSite/list'

        populateValidParams(params)
        def reportSite = new ReportSite(params)

        assert reportSite.save() != null

        params.id = reportSite.id

        def model = controller.edit()

        assert model.reportSiteInstance == reportSite
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/reportSite/list'

        response.reset()

        populateValidParams(params)
        def reportSite = new ReportSite(params)

        assert reportSite.save() != null

        // test invalid parameters in update
        params.id = reportSite.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/reportSite/edit"
        assert model.reportSiteInstance != null

        reportSite.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/reportSite/show/$reportSite.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        reportSite.clearErrors()

        populateValidParams(params)
        params.id = reportSite.id
        params.version = -1
        controller.update()

        assert view == "/reportSite/edit"
        assert model.reportSiteInstance != null
        assert model.reportSiteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/reportSite/list'

        response.reset()

        populateValidParams(params)
        def reportSite = new ReportSite(params)

        assert reportSite.save() != null
        assert ReportSite.count() == 1

        params.id = reportSite.id

        controller.delete()

        assert ReportSite.count() == 0
        assert ReportSite.get(reportSite.id) == null
        assert response.redirectedUrl == '/reportSite/list'
    }
}
