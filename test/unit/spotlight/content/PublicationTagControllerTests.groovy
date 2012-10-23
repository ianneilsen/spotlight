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
        assert "/publicationTag/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.publicationTagInstanceList.size() == 0
        assert model.publicationTagInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.publicationTagInstance != null
    }

    void testSave() {
        controller.save()

        assert model.publicationTagInstance != null
        assert view == '/publicationTag/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/publicationTag/show/1'
        assert controller.flash.message != null
        assert PublicationTag.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/publicationTag/list'

        populateValidParams(params)
        def publicationTag = new PublicationTag(params)

        assert publicationTag.save() != null

        params.id = publicationTag.id

        def model = controller.show()

        assert model.publicationTagInstance == publicationTag
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/publicationTag/list'

        populateValidParams(params)
        def publicationTag = new PublicationTag(params)

        assert publicationTag.save() != null

        params.id = publicationTag.id

        def model = controller.edit()

        assert model.publicationTagInstance == publicationTag
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/publicationTag/list'

        response.reset()

        populateValidParams(params)
        def publicationTag = new PublicationTag(params)

        assert publicationTag.save() != null

        // test invalid parameters in update
        params.id = publicationTag.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/publicationTag/edit"
        assert model.publicationTagInstance != null

        publicationTag.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/publicationTag/show/$publicationTag.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        publicationTag.clearErrors()

        populateValidParams(params)
        params.id = publicationTag.id
        params.version = -1
        controller.update()

        assert view == "/publicationTag/edit"
        assert model.publicationTagInstance != null
        assert model.publicationTagInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/publicationTag/list'

        response.reset()

        populateValidParams(params)
        def publicationTag = new PublicationTag(params)

        assert publicationTag.save() != null
        assert PublicationTag.count() == 1

        params.id = publicationTag.id

        controller.delete()

        assert PublicationTag.count() == 0
        assert PublicationTag.get(publicationTag.id) == null
        assert response.redirectedUrl == '/publicationTag/list'
    }
}
