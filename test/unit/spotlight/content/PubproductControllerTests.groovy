package spotlight.content



import org.junit.*
import grails.test.mixin.*

@TestFor(PubproductController)
@Mock(Pubproduct)
class PubproductControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pubproduct/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pubproductInstanceList.size() == 0
        assert model.pubproductInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pubproductInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pubproductInstance != null
        assert view == '/pubproduct/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pubproduct/show/1'
        assert controller.flash.message != null
        assert Pubproduct.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pubproduct/list'

        populateValidParams(params)
        def pubproduct = new Pubproduct(params)

        assert pubproduct.save() != null

        params.id = pubproduct.id

        def model = controller.show()

        assert model.pubproductInstance == pubproduct
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pubproduct/list'

        populateValidParams(params)
        def pubproduct = new Pubproduct(params)

        assert pubproduct.save() != null

        params.id = pubproduct.id

        def model = controller.edit()

        assert model.pubproductInstance == pubproduct
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pubproduct/list'

        response.reset()

        populateValidParams(params)
        def pubproduct = new Pubproduct(params)

        assert pubproduct.save() != null

        // test invalid parameters in update
        params.id = pubproduct.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pubproduct/edit"
        assert model.pubproductInstance != null

        pubproduct.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pubproduct/show/$pubproduct.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pubproduct.clearErrors()

        populateValidParams(params)
        params.id = pubproduct.id
        params.version = -1
        controller.update()

        assert view == "/pubproduct/edit"
        assert model.pubproductInstance != null
        assert model.pubproductInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pubproduct/list'

        response.reset()

        populateValidParams(params)
        def pubproduct = new Pubproduct(params)

        assert pubproduct.save() != null
        assert Pubproduct.count() == 1

        params.id = pubproduct.id

        controller.delete()

        assert Pubproduct.count() == 0
        assert Pubproduct.get(pubproduct.id) == null
        assert response.redirectedUrl == '/pubproduct/list'
    }
}
