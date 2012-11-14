package spotlight.pubtemplates

import grails.test.mixin.*

@TestFor(TemplateemailController)
@Mock(Emailtemplate)
class TemplateemailControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/templateemail/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.templateemailInstanceList.size() == 0
        assert model.templateemailInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.templateemailInstance != null
    }

    void testSave() {
        controller.save()

        assert model.templateemailInstance != null
        assert view == '/templateemail/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/templateemail/show/1'
        assert controller.flash.message != null
        assert Emailtemplate.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/templateemail/list'

        populateValidParams(params)
        def templateemail = new Emailtemplate(params)

        assert templateemail.save() != null

        params.id = templateemail.id

        def model = controller.show()

        assert model.templateemailInstance == templateemail
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/templateemail/list'

        populateValidParams(params)
        def templateemail = new Emailtemplate(params)

        assert templateemail.save() != null

        params.id = templateemail.id

        def model = controller.edit()

        assert model.templateemailInstance == templateemail
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/templateemail/list'

        response.reset()

        populateValidParams(params)
        def templateemail = new Emailtemplate(params)

        assert templateemail.save() != null

        // test invalid parameters in update
        params.id = templateemail.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/templateemail/edit"
        assert model.templateemailInstance != null

        templateemail.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/templateemail/show/$templateemail.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        templateemail.clearErrors()

        populateValidParams(params)
        params.id = templateemail.id
        params.version = -1
        controller.update()

        assert view == "/templateemail/edit"
        assert model.templateemailInstance != null
        assert model.templateemailInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/templateemail/list'

        response.reset()

        populateValidParams(params)
        def templateemail = new Emailtemplate(params)

        assert templateemail.save() != null
        assert Emailtemplate.count() == 1

        params.id = templateemail.id

        controller.delete()

        assert Emailtemplate.count() == 0
        assert Emailtemplate.get(templateemail.id) == null
        assert response.redirectedUrl == '/templateemail/list'
    }
}
