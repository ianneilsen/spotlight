package spotlight.comments



import org.junit.*
import grails.test.mixin.*

@TestFor(AuthorcommentController)
@Mock(Authorcomment)
class AuthorcommentControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/authorcomment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.authorcommentInstanceList.size() == 0
        assert model.authorcommentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.authorcommentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.authorcommentInstance != null
        assert view == '/authorcomment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/authorcomment/show/1'
        assert controller.flash.message != null
        assert Authorcomment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/authorcomment/list'

        populateValidParams(params)
        def authorcomment = new Authorcomment(params)

        assert authorcomment.save() != null

        params.id = authorcomment.id

        def model = controller.show()

        assert model.authorcommentInstance == authorcomment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/authorcomment/list'

        populateValidParams(params)
        def authorcomment = new Authorcomment(params)

        assert authorcomment.save() != null

        params.id = authorcomment.id

        def model = controller.edit()

        assert model.authorcommentInstance == authorcomment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/authorcomment/list'

        response.reset()

        populateValidParams(params)
        def authorcomment = new Authorcomment(params)

        assert authorcomment.save() != null

        // test invalid parameters in update
        params.id = authorcomment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/authorcomment/edit"
        assert model.authorcommentInstance != null

        authorcomment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/authorcomment/show/$authorcomment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        authorcomment.clearErrors()

        populateValidParams(params)
        params.id = authorcomment.id
        params.version = -1
        controller.update()

        assert view == "/authorcomment/edit"
        assert model.authorcommentInstance != null
        assert model.authorcommentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/authorcomment/list'

        response.reset()

        populateValidParams(params)
        def authorcomment = new Authorcomment(params)

        assert authorcomment.save() != null
        assert Authorcomment.count() == 1

        params.id = authorcomment.id

        controller.delete()

        assert Authorcomment.count() == 0
        assert Authorcomment.get(authorcomment.id) == null
        assert response.redirectedUrl == '/authorcomment/list'
    }
}
