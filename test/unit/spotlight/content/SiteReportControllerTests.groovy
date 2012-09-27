package spotlight.content



import org.junit.*
import grails.test.mixin.*

@TestFor(SiteReportController)
@Mock(SiteReport)
class SiteReportControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/siteReport/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.siteReportInstanceList.size() == 0
        assert model.siteReportInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.siteReportInstance != null
    }

    void testSave() {
        controller.save()

        assert model.siteReportInstance != null
        assert view == '/siteReport/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/siteReport/show/1'
        assert controller.flash.message != null
        assert SiteReport.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/siteReport/list'

        populateValidParams(params)
        def siteReport = new SiteReport(params)

        assert siteReport.save() != null

        params.id = siteReport.id

        def model = controller.show()

        assert model.siteReportInstance == siteReport
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/siteReport/list'

        populateValidParams(params)
        def siteReport = new SiteReport(params)

        assert siteReport.save() != null

        params.id = siteReport.id

        def model = controller.edit()

        assert model.siteReportInstance == siteReport
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/siteReport/list'

        response.reset()

        populateValidParams(params)
        def siteReport = new SiteReport(params)

        assert siteReport.save() != null

        // test invalid parameters in update
        params.id = siteReport.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/siteReport/edit"
        assert model.siteReportInstance != null

        siteReport.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/siteReport/show/$siteReport.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        siteReport.clearErrors()

        populateValidParams(params)
        params.id = siteReport.id
        params.version = -1
        controller.update()

        assert view == "/siteReport/edit"
        assert model.siteReportInstance != null
        assert model.siteReportInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/siteReport/list'

        response.reset()

        populateValidParams(params)
        def siteReport = new SiteReport(params)

        assert siteReport.save() != null
        assert SiteReport.count() == 1

        params.id = siteReport.id

        controller.delete()

        assert SiteReport.count() == 0
        assert SiteReport.get(siteReport.id) == null
        assert response.redirectedUrl == '/siteReport/list'
    }
}
