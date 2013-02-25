package spotlight.comments

import org.springframework.dao.DataIntegrityViolationException

class AuthorcommentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [authorcommentInstanceList: Authorcomment.list(params), authorcommentInstanceTotal: Authorcomment.count()]
    }

    def create() {
        [authorcommentInstance: new Authorcomment(params)]
        redirect(action: "show", id: params.id)
    }

    def save() {
        def authorcommentInstance = new Authorcomment(params)
        if (!authorcommentInstance.save(flush: true)) {
            render(view: "create", model: [authorcommentInstance: authorcommentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'authorcomment.label', default: 'Authorcomment'), authorcommentInstance.id])
        redirect(action: "show", id: authorcommentInstance.id)
    }

    def show(Long id) {
        def authorcommentInstance = Authorcomment.get(id)
        if (!authorcommentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'authorcomment.label', default: 'Authorcomment'), id])
            redirect(action: "list")
            return
        }

        [authorcommentInstance: authorcommentInstance]
    }

    def edit(Long id) {
        def authorcommentInstance = Authorcomment.get(id)
        if (!authorcommentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'authorcomment.label', default: 'Authorcomment'), id])
            redirect(action: "list")
            return
        }

        [authorcommentInstance: authorcommentInstance]
    }

    def update(Long id, Long version) {
        def authorcommentInstance = Authorcomment.get(id)
        if (!authorcommentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'authorcomment.label', default: 'Authorcomment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (authorcommentInstance.version > version) {
                authorcommentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'authorcomment.label', default: 'Authorcomment')] as Object[],
                          "Another user has updated this Authorcomment while you were editing")
                render(view: "edit", model: [authorcommentInstance: authorcommentInstance])
                return
            }
        }

        authorcommentInstance.properties = params

        if (!authorcommentInstance.save(flush: true)) {
            render(view: "edit", model: [authorcommentInstance: authorcommentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'authorcomment.label', default: 'Authorcomment'), authorcommentInstance.id])
        redirect(action: "show", id: authorcommentInstance.id)
    }

    def delete(Long id) {
        def authorcommentInstance = Authorcomment.get(id)
        if (!authorcommentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'authorcomment.label', default: 'Authorcomment'), id])
            redirect(action: "list")
            return
        }

        try {
            authorcommentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'authorcomment.label', default: 'Authorcomment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'authorcomment.label', default: 'Authorcomment'), id])
            redirect(action: "show", id: id)
        }
    }
}
