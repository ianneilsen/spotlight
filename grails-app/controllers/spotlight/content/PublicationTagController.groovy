package spotlight.content

import org.springframework.dao.DataIntegrityViolationException

class PublicationTagController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [publicationTagInstanceList: PublicationTag.list(params), publicationTagInstanceTotal: PublicationTag.count()]
    }

    def create() {
        [publicationTagInstance: new PublicationTag(params)]
    }

    def save() {
        def publicationTagInstance = new PublicationTag(params)
        if (!publicationTagInstance.save(flush: true)) {
            render(view: "create", model: [publicationTagInstance: publicationTagInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'publicationTag.label', default: 'Publication Tag'), publicationTagInstance.id])
        redirect(action: "show", id: publicationTagInstance.id)
    }

    def show(Long id) {
        def publicationTagInstance = PublicationTag.get(id)
        if (!publicationTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publicationTag.label', default: 'Publication Tag'), id])
            redirect(action: "list")
            return
        }

        [publicationTagInstance: publicationTagInstance]
    }

    def edit(Long id) {
        def publicationTagInstance = PublicationTag.get(id)
        if (!publicationTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publicationTag.label', default: 'Publication Tag'), id])
            redirect(action: "list")
            return
        }

        [publicationTagInstance: publicationTagInstance]
    }

    def update(Long id, Long version) {
        def publicationTagInstance = PublicationTag.get(id)
        if (!publicationTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publicationTag.label', default: 'Publication Tag'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (publicationTagInstance.version > version) {
                publicationTagInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'publicationTag.label', default: 'Publication Tag')] as Object[],
                          "Another user has updated this Publication Tag while you were editing")
                render(view: "edit", model: [publicationTagInstance: publicationTagInstance])
                return
            }
        }

        publicationTagInstance.properties = params

        if (!publicationTagInstance.save(flush: true)) {
            render(view: "edit", model: [publicationTagInstance: publicationTagInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'publicationTag.label', default: 'Publication Tag'), publicationTagInstance.id])
        redirect(action: "show", id: publicationTagInstance.id)
    }

    def delete(Long id) {
        def publicationTagInstance = PublicationTag.get(id)
        if (!publicationTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publicationTag.label', default: 'Publication Tag'), id])
            redirect(action: "list")
            return
        }

        try {
            publicationTagInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'publicationTag.label', default: 'Publication Tag'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'publicationTag.label', default: 'Publication Tag'), id])
            redirect(action: "show", id: id)
        }
    }
}
