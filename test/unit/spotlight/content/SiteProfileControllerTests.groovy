package spotlight.content



import org.junit.*
import grails.test.mixin.*

@TestFor(SiteProfileController)
@Mock(SiteProfile)
class SiteProfileControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/siteProfile/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.siteProfileInstanceList.size() == 0
        assert model.siteProfileInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.siteProfileInstance != null
    }

    void testSave() {
        controller.save()

        assert model.siteProfileInstance != null
        assert view == '/siteProfile/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/siteProfile/show/1'
        assert controller.flash.message != null
        assert SiteProfile.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/siteProfile/list'

        populateValidParams(params)
        def siteProfile = new SiteProfile(params)

        assert siteProfile.save() != null

        params.id = siteProfile.id

        def model = controller.show()

        assert model.siteProfileInstance == siteProfile
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/siteProfile/list'

        populateValidParams(params)
        def siteProfile = new SiteProfile(params)

        assert siteProfile.save() != null

        params.id = siteProfile.id

        def model = controller.edit()

        assert model.siteProfileInstance == siteProfile
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/siteProfile/list'

        response.reset()

        populateValidParams(params)
        def siteProfile = new SiteProfile(params)

        assert siteProfile.save() != null

        // test invalid parameters in update
        params.id = siteProfile.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/siteProfile/edit"
        assert model.siteProfileInstance != null

        siteProfile.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/siteProfile/show/$siteProfile.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        siteProfile.clearErrors()

        populateValidParams(params)
        params.id = siteProfile.id
        params.version = -1
        controller.update()

        assert view == "/siteProfile/edit"
        assert model.siteProfileInstance != null
        assert model.siteProfileInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/siteProfile/list'

        response.reset()

        populateValidParams(params)
        def siteProfile = new SiteProfile(params)

        assert siteProfile.save() != null
        assert SiteProfile.count() == 1

        params.id = siteProfile.id

        controller.delete()

        assert SiteProfile.count() == 0
        assert SiteProfile.get(siteProfile.id) == null
        assert response.redirectedUrl == '/siteProfile/list'
    }
}
