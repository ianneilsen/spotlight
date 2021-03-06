package spotlight.pubtemplates

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class EmailtemplateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN','ROLE_PUBLISHER'])
    def index() {
        redirect(action: "list", params: params)
    }

    @Secured(['ROLE_ADMIN','ROLE_PUBLISHER'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [emailtemplateInstanceList: Emailtemplate.list(params), emailtemplateInstanceTotal: Emailtemplate.count()]
    }

    @Secured(['ROLE_ADMIN','ROLE_PUBLISHER'])
    def create() {
        [emailtemplateInstance: new Emailtemplate(params)]
    }

    @Secured(['ROLE_ADMIN','ROLE_PUBLISHER'])
    def save() {
        def emailtemplateInstance = new Emailtemplate(params)
        if (!emailtemplateInstance.save(flush: true)) {
            render(view: "create", model: [emailtemplateInstance: emailtemplateInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'emailtemplate.label', default: 'Emailtemplate'), emailtemplateInstance.id])
        redirect(action: "show", id: emailtemplateInstance.id)
    }

    @Secured(['ROLE_ADMIN','ROLE_PUBLISHER'])
    def show(Long id) {
        def emailtemplateInstance = Emailtemplate.get(id)
        if (!emailtemplateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emailtemplate.label', default: 'Emailtemplate'), id])
            redirect(action: "list")
            return
        }

        [emailtemplateInstance: emailtemplateInstance]
    }

    @Secured(['ROLE_ADMIN','ROLE_PUBLISHER'])
    def edit(Long id) {
        def emailtemplateInstance = Emailtemplate.get(id)
        if (!emailtemplateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emailtemplate.label', default: 'Emailtemplate'), id])
            redirect(action: "list")
            return
        }

        [emailtemplateInstance: emailtemplateInstance]
    }

    @Secured(['ROLE_ADMIN','ROLE_PUBLISHER'])
    def update(Long id, Long version) {
        def emailtemplateInstance = Emailtemplate.get(id)
        if (!emailtemplateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emailtemplate.label', default: 'Emailtemplate'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (emailtemplateInstance.version > version) {
                emailtemplateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'emailtemplate.label', default: 'Emailtemplate')] as Object[],
                        "Another user has updated this Emailtemplate while you were editing")
                render(view: "edit", model: [emailtemplateInstance: emailtemplateInstance])
                return
            }
        }

        emailtemplateInstance.properties = params

        if (!emailtemplateInstance.save(flush: true)) {
            render(view: "edit", model: [emailtemplateInstance: emailtemplateInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'emailtemplate.label', default: 'Emailtemplate'), emailtemplateInstance.id])
        redirect(action: "show", id: emailtemplateInstance.id)
    }

    @Secured(['ROLE_ADMIN','ROLE_PUBLISHER'])
    def delete(Long id) {
        def emailtemplateInstance = Emailtemplate.get(id)
        if (!emailtemplateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emailtemplate.label', default: 'Emailtemplate'), id])
            redirect(action: "list")
            return
        }

        try {
            emailtemplateInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'emailtemplate.label', default: 'Emailtemplate'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'emailtemplate.label', default: 'Emailtemplate'), id])
            redirect(action: "show", id: id)
        }
    }
}
