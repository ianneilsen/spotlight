package spotlight.pubtemplates



import org.junit.*
import grails.test.mixin.*

@TestFor(EmailtemplateController)
@Mock(Emailtemplate)
class EmailtemplateControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/emailtemplate/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.emailtemplateInstanceList.size() == 0
        assert model.emailtemplateInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.emailtemplateInstance != null
    }

    void testSave() {
        controller.save()

        assert model.emailtemplateInstance != null
        assert view == '/emailtemplate/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/emailtemplate/show/1'
        assert controller.flash.message != null
        assert Emailtemplate.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/emailtemplate/list'

        populateValidParams(params)
        def emailtemplate = new Emailtemplate(params)

        assert emailtemplate.save() != null

        params.id = emailtemplate.id

        def model = controller.show()

        assert model.emailtemplateInstance == emailtemplate
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/emailtemplate/list'

        populateValidParams(params)
        def emailtemplate = new Emailtemplate(params)

        assert emailtemplate.save() != null

        params.id = emailtemplate.id

        def model = controller.edit()

        assert model.emailtemplateInstance == emailtemplate
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/emailtemplate/list'

        response.reset()

        populateValidParams(params)
        def emailtemplate = new Emailtemplate(params)

        assert emailtemplate.save() != null

        // test invalid parameters in update
        params.id = emailtemplate.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/emailtemplate/edit"
        assert model.emailtemplateInstance != null

        emailtemplate.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/emailtemplate/show/$emailtemplate.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        emailtemplate.clearErrors()

        populateValidParams(params)
        params.id = emailtemplate.id
        params.version = -1
        controller.update()

        assert view == "/emailtemplate/edit"
        assert model.emailtemplateInstance != null
        assert model.emailtemplateInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/emailtemplate/list'

        response.reset()

        populateValidParams(params)
        def emailtemplate = new Emailtemplate(params)

        assert emailtemplate.save() != null
        assert Emailtemplate.count() == 1

        params.id = emailtemplate.id

        controller.delete()

        assert Emailtemplate.count() == 0
        assert Emailtemplate.get(emailtemplate.id) == null
        assert response.redirectedUrl == '/emailtemplate/list'
    }
}
