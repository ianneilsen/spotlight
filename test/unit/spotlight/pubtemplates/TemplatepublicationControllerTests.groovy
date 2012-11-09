package spotlight.pubtemplates



import org.junit.*
import grails.test.mixin.*

@TestFor(TemplatepublicationController)
@Mock(Templatepublication)
class TemplatepublicationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/templatepublication/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.templatepublicationInstanceList.size() == 0
        assert model.templatepublicationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.templatepublicationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.templatepublicationInstance != null
        assert view == '/templatepublication/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/templatepublication/show/1'
        assert controller.flash.message != null
        assert Templatepublication.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/templatepublication/list'

        populateValidParams(params)
        def templatepublication = new Templatepublication(params)

        assert templatepublication.save() != null

        params.id = templatepublication.id

        def model = controller.show()

        assert model.templatepublicationInstance == templatepublication
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/templatepublication/list'

        populateValidParams(params)
        def templatepublication = new Templatepublication(params)

        assert templatepublication.save() != null

        params.id = templatepublication.id

        def model = controller.edit()

        assert model.templatepublicationInstance == templatepublication
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/templatepublication/list'

        response.reset()

        populateValidParams(params)
        def templatepublication = new Templatepublication(params)

        assert templatepublication.save() != null

        // test invalid parameters in update
        params.id = templatepublication.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/templatepublication/edit"
        assert model.templatepublicationInstance != null

        templatepublication.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/templatepublication/show/$templatepublication.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        templatepublication.clearErrors()

        populateValidParams(params)
        params.id = templatepublication.id
        params.version = -1
        controller.update()

        assert view == "/templatepublication/edit"
        assert model.templatepublicationInstance != null
        assert model.templatepublicationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/templatepublication/list'

        response.reset()

        populateValidParams(params)
        def templatepublication = new Templatepublication(params)

        assert templatepublication.save() != null
        assert Templatepublication.count() == 1

        params.id = templatepublication.id

        controller.delete()

        assert Templatepublication.count() == 0
        assert Templatepublication.get(templatepublication.id) == null
        assert response.redirectedUrl == '/templatepublication/list'
    }
}
