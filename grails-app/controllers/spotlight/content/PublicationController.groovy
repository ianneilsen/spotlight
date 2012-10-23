package spotlight.content

import org.springframework.dao.DataIntegrityViolationException

class PublicationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
             [publicationInstanceList: Publication.list(params), publicationInstanceTotal: Publication.count() ]

    }

    def numofpublications (){
        def countpublications = Publication.list()
            def  numofpublications = countpublications.count(Publication: Publication)
        [numofpublications: numofpublications ]
    }

    def create() {
        [publicationInstance: new Publication(params)]
    }

    def save() {
        def publicationInstance = new Publication(params)
        if (!publicationInstance.save(flush: true)) {
            render(view: "create", model: [publicationInstance: publicationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'publication.label', default: 'Publication'), publicationInstance.id])
        redirect(action: "show", id: publicationInstance.id)
    }

    def show(Long id) {
        def publicationInstance = Publication.get(id)
        if (!publicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(action: "list")
            return
        }

        [publicationInstance: publicationInstance]
    }
    
//        def weblistshow(Long id) {
//        def publicationInstance = Publication.get(id)
//        if (!publicationInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publication.label', default: 'Publication'), id])
//            redirect(controller:"publication", action: "show")
//            return
//        }
//
//        [publicationInstance: publicationInstance]
//    }

    def edit(Long id) {
        def publicationInstance = Publication.get(id)
        if (!publicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(action: "list")
            return
        }

        [publicationInstance: publicationInstance]
    }

    def update(Long id, Long version) {
        def publicationInstance = Publication.get(id)
        if (!publicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (publicationInstance.version > version) {
                publicationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'publication.label', default: 'Publication')] as Object[],
                          "Another user has updated this Publication while you were editing")
                render(view: "edit", model: [publicationInstance: publicationInstance])
                return
            }
        }

        publicationInstance.properties = params

        if (!publicationInstance.save(flush: true)) {
            render(view: "edit", model: [publicationInstance: publicationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'publication.label', default: 'Publication'), publicationInstance.id])
        redirect(action: "show", id: publicationInstance.id)
    }

    def delete(Long id) {
        def publicationInstance = Publication.get(id)
        if (!publicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(action: "list")
            return
        }

        try {
            publicationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(action: "show", id: id)
        }
    }
}
