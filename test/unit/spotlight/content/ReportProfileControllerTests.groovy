package spotlight.content



import org.junit.*
import grails.test.mixin.*

@TestFor(ReportProfileController)
@Mock(ReportProfile)
class ReportProfileControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/reportProfile/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.reportProfileInstanceList.size() == 0
        assert model.reportProfileInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.reportProfileInstance != null
    }

    void testSave() {
        controller.save()

        assert model.reportProfileInstance != null
        assert view == '/reportProfile/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/reportProfile/show/1'
        assert controller.flash.message != null
        assert ReportProfile.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/reportProfile/list'

        populateValidParams(params)
        def reportProfile = new ReportProfile(params)

        assert reportProfile.save() != null

        params.id = reportProfile.id

        def model = controller.show()

        assert model.reportProfileInstance == reportProfile
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/reportProfile/list'

        populateValidParams(params)
        def reportProfile = new ReportProfile(params)

        assert reportProfile.save() != null

        params.id = reportProfile.id

        def model = controller.edit()

        assert model.reportProfileInstance == reportProfile
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/reportProfile/list'

        response.reset()

        populateValidParams(params)
        def reportProfile = new ReportProfile(params)

        assert reportProfile.save() != null

        // test invalid parameters in update
        params.id = reportProfile.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/reportProfile/edit"
        assert model.reportProfileInstance != null

        reportProfile.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/reportProfile/show/$reportProfile.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        reportProfile.clearErrors()

        populateValidParams(params)
        params.id = reportProfile.id
        params.version = -1
        controller.update()

        assert view == "/reportProfile/edit"
        assert model.reportProfileInstance != null
        assert model.reportProfileInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/reportProfile/list'

        response.reset()

        populateValidParams(params)
        def reportProfile = new ReportProfile(params)

        assert reportProfile.save() != null
        assert ReportProfile.count() == 1

        params.id = reportProfile.id

        controller.delete()

        assert ReportProfile.count() == 0
        assert ReportProfile.get(reportProfile.id) == null
        assert response.redirectedUrl == '/reportProfile/list'
    }
}
