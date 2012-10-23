package spotlight.content



import org.junit.*
import grails.test.mixin.*

@TestFor(PublicationTagController)
@Mock(PublicationTag)
class PublicationTagControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/reportTag/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.reportTagInstanceList.size() == 0
        assert model.reportTagInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.reportTagInstance != null
    }

    void testSave() {
        controller.save()

        assert model.reportTagInstance != null
        assert view == '/reportTag/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/reportTag/show/1'
        assert controller.flash.message != null
        assert PublicationTag.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/reportTag/list'

        populateValidParams(params)
        def reportTag = new PublicationTag(params)

        assert reportTag.save() != null

        params.id = reportTag.id

        def model = controller.show()

        assert model.reportTagInstance == reportTag
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/reportTag/list'

        populateValidParams(params)
        def reportTag = new PublicationTag(params)

        assert reportTag.save() != null

        params.id = reportTag.id

        def model = controller.edit()

        assert model.reportTagInstance == reportTag
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/reportTag/list'

        response.reset()

        populateValidParams(params)
        def reportTag = new PublicationTag(params)

        assert reportTag.save() != null

        // test invalid parameters in update
        params.id = reportTag.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/reportTag/edit"
        assert model.reportTagInstance != null

        reportTag.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/reportTag/show/$reportTag.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        reportTag.clearErrors()

        populateValidParams(params)
        params.id = reportTag.id
        params.version = -1
        controller.update()

        assert view == "/reportTag/edit"
        assert model.reportTagInstance != null
        assert model.reportTagInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/reportTag/list'

        response.reset()

        populateValidParams(params)
        def reportTag = new PublicationTag(params)

        assert reportTag.save() != null
        assert PublicationTag.count() == 1

        params.id = reportTag.id

        controller.delete()

        assert PublicationTag.count() == 0
        assert PublicationTag.get(reportTag.id) == null
        assert response.redirectedUrl == '/reportTag/list'
    }
}
