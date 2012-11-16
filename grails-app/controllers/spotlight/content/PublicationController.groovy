package spotlight.content
import spotlight.content.Pubproduct

import org.springframework.dao.DataIntegrityViolationException
import spotlight.pubtemplates.Templatepublication
import spotlight.pubtemplates.Emailtemplate

class PublicationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def testmarkitup (){

    }
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        if (params.sort==null){
            params.sort = "published"
/*        def list = Publication.list().sort{
            a, b ->
            if (params.order == 'desc') {
                b."${params.sort}" <=> a."${params.sort}"
            } else {
                a."${params.sort}" <=> b."${params.sort}"
            }
        }*/

        }
        [publicationInstanceList: Publication.list(params), publicationInstanceTotal: Publication.count()]
    }

    def emailpublication(){
        if (params.email) {
            sendMail {
                to params.email
                subject params.publicationName
                body params.publicationContent
                     params.footeremailtemplate

            }
            flash.message = "Awesome you just sent an email"
            redirect(action: "show", model: [publicationInstance:Publication, publicationInstance: Publication.get(params['publication.id'] as Long)])

        }

    }



    def create() {
        [publicationInstance: new Publication(params), pubproduct: Pubproduct, templatepublication: Templatepublication, emailtemplates: Emailtemplate]
    }

   /* def countpublishedno = Publication.countByPublished("No")*/


    def save() {
        def publicationInstance = new Publication(params)
        if (!publicationInstance.save(flush: true)) {
            render(view: "create", model: [publicationInstance: publicationInstance, pubproduct: Pubproduct.properties])
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

        [publicationInstance: publicationInstance, pubproduct: Pubproduct, templatepublication: Templatepublication, emailtemplates: Emailtemplate]
    }

    def edit(Long id) {
        def publicationInstance = Publication.get(id)
        if (!publicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(action: "list")
            return
        }

        [publicationInstance: publicationInstance, pubproduct: Pubproduct, templatepublication: Templatepublication]
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
                render(view: "edit", model: [publicationInstance: publicationInstance, pubproduct: Pubproduct])
                return
            }
        }

        publicationInstance.properties = params

        if (!publicationInstance.save(flush: true)) {
            render(view: "edit", model: [publicationInstance: publicationInstance, pubproduct: Pubproduct])
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
            redirect(controller: "portfolio", action: "show", id: "publication.portfolioId")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(action: "show", id: id)
        }                                 //todo - fix redirect on delete action to redirect to portfolio/show/$id  not list
    }
}
