package spotlight.content



import org.junit.*
import grails.test.mixin.*

@TestFor(PubcategoryController)
@Mock(Pubcategory)
class PubcategoryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pubcategory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pubcategoryInstanceList.size() == 0
        assert model.pubcategoryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pubcategoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pubcategoryInstance != null
        assert view == '/pubcategory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pubcategory/show/1'
        assert controller.flash.message != null
        assert Pubcategory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pubcategory/list'

        populateValidParams(params)
        def pubcategory = new Pubcategory(params)

        assert pubcategory.save() != null

        params.id = pubcategory.id

        def model = controller.show()

        assert model.pubcategoryInstance == pubcategory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pubcategory/list'

        populateValidParams(params)
        def pubcategory = new Pubcategory(params)

        assert pubcategory.save() != null

        params.id = pubcategory.id

        def model = controller.edit()

        assert model.pubcategoryInstance == pubcategory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pubcategory/list'

        response.reset()

        populateValidParams(params)
        def pubcategory = new Pubcategory(params)

        assert pubcategory.save() != null

        // test invalid parameters in update
        params.id = pubcategory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pubcategory/edit"
        assert model.pubcategoryInstance != null

        pubcategory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pubcategory/show/$pubcategory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pubcategory.clearErrors()

        populateValidParams(params)
        params.id = pubcategory.id
        params.version = -1
        controller.update()

        assert view == "/pubcategory/edit"
        assert model.pubcategoryInstance != null
        assert model.pubcategoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pubcategory/list'

        response.reset()

        populateValidParams(params)
        def pubcategory = new Pubcategory(params)

        assert pubcategory.save() != null
        assert Pubcategory.count() == 1

        params.id = pubcategory.id

        controller.delete()

        assert Pubcategory.count() == 0
        assert Pubcategory.get(pubcategory.id) == null
        assert response.redirectedUrl == '/pubcategory/list'
    }
}
