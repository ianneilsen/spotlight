package spotlight.pubtemplates

import org.springframework.dao.DataIntegrityViolationException

class TemplateemailController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [templateemailInstanceList: Templateemail.list(params), templateemailInstanceTotal: Templateemail.count()]
    }

    def create() {
        [templateemailInstance: new Templateemail(params)]
    }

    def save() {
        def templateemailInstance = new Templateemail(params)
        if (!templateemailInstance.save(flush: true)) {
            render(view: "create", model: [templateemailInstance: templateemailInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'templateemail.label', default: 'Templateemail'), templateemailInstance.id])
        redirect(action: "show", id: templateemailInstance.id)
    }

    def show(Long id) {
        def templateemailInstance = Templateemail.get(id)
        if (!templateemailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'templateemail.label', default: 'Templateemail'), id])
            redirect(action: "list")
            return
        }

        [templateemailInstance: templateemailInstance]
    }

    def edit(Long id) {
        def templateemailInstance = Templateemail.get(id)
        if (!templateemailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'templateemail.label', default: 'Templateemail'), id])
            redirect(action: "list")
            return
        }

        [templateemailInstance: templateemailInstance]
    }

    def update(Long id, Long version) {
        def templateemailInstance = Templateemail.get(id)
        if (!templateemailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'templateemail.label', default: 'Templateemail'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (templateemailInstance.version > version) {
                templateemailInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'templateemail.label', default: 'Templateemail')] as Object[],
                        "Another user has updated this Templateemail while you were editing")
                render(view: "edit", model: [templateemailInstance: templateemailInstance])
                return
            }
        }

        templateemailInstance.properties = params

        if (!templateemailInstance.save(flush: true)) {
            render(view: "edit", model: [templateemailInstance: templateemailInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'templateemail.label', default: 'Templateemail'), templateemailInstance.id])
        redirect(action: "show", id: templateemailInstance.id)
    }

    def delete(Long id) {
        def templateemailInstance = Templateemail.get(id)
        if (!templateemailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'templateemail.label', default: 'Templateemail'), id])
            redirect(action: "list")
            return
        }

        try {
            templateemailInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'templateemail.label', default: 'Templateemail'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'templateemail.label', default: 'Templateemail'), id])
            redirect(action: "show", id: id)
        }
    }
}
