package spotlight.grails



import org.junit.*
import grails.test.mixin.*

@TestFor(SiteDetailController)
@Mock(SiteDetail)
class SiteDetailControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/siteDetail/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.siteDetailInstanceList.size() == 0
        assert model.siteDetailInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.siteDetailInstance != null
    }

    void testSave() {
        controller.save()

        assert model.siteDetailInstance != null
        assert view == '/siteDetail/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/siteDetail/show/1'
        assert controller.flash.message != null
        assert SiteDetail.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/siteDetail/list'

        populateValidParams(params)
        def siteDetail = new SiteDetail(params)

        assert siteDetail.save() != null

        params.id = siteDetail.id

        def model = controller.show()

        assert model.siteDetailInstance == siteDetail
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/siteDetail/list'

        populateValidParams(params)
        def siteDetail = new SiteDetail(params)

        assert siteDetail.save() != null

        params.id = siteDetail.id

        def model = controller.edit()

        assert model.siteDetailInstance == siteDetail
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/siteDetail/list'

        response.reset()

        populateValidParams(params)
        def siteDetail = new SiteDetail(params)

        assert siteDetail.save() != null

        // test invalid parameters in update
        params.id = siteDetail.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/siteDetail/edit"
        assert model.siteDetailInstance != null

        siteDetail.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/siteDetail/show/$siteDetail.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        siteDetail.clearErrors()

        populateValidParams(params)
        params.id = siteDetail.id
        params.version = -1
        controller.update()

        assert view == "/siteDetail/edit"
        assert model.siteDetailInstance != null
        assert model.siteDetailInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/siteDetail/list'

        response.reset()

        populateValidParams(params)
        def siteDetail = new SiteDetail(params)

        assert siteDetail.save() != null
        assert SiteDetail.count() == 1

        params.id = siteDetail.id

        controller.delete()

        assert SiteDetail.count() == 0
        assert SiteDetail.get(siteDetail.id) == null
        assert response.redirectedUrl == '/siteDetail/list'
    }
}
