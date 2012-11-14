package spotlight.pubtemplates


import org.springframework.dao.DataIntegrityViolationException
import spotlight.content.Portfolio
import spotlight.content.Publication

class TemplatepublicationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [templatepublicationInstanceList: Templatepublication.list(params), templatepublicationInstanceTotal: Templatepublication.count()]
    }

    def portfoliotemps (){
        def portfolio = Portfolio.list(params.id)
          def templatepublications = findAll(Portfolio)
        [portfoliotemps: templatepublications]
    }
    def create() {
        [templatepublicationInstance: new Templatepublication(params)]
    }

    def save() {
        def templatepublicationInstance = new Templatepublication(params)
        if (!templatepublicationInstance.save(flush: true)) {
            render(view: "create", model: [templatepublicationInstance: templatepublicationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'templatepublication.label', default: 'Templatepublication'), templatepublicationInstance.id])
        redirect(action: "show", id: templatepublicationInstance.id)
    }

    def show(Long id) {
        def templatepublicationInstance = Templatepublication.get(id)
        if (!templatepublicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'templatepublication.label', default: 'Templatepublication'), id])
            redirect(action: "list")
            return
        }

        [templatepublicationInstance: templatepublicationInstance]
    }

    def edit(Long id) {
        def templatepublicationInstance = Templatepublication.get(id)
        if (!templatepublicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'templatepublication.label', default: 'Templatepublication'), id])
            redirect(action: "list")
            return
        }

        [templatepublicationInstance: templatepublicationInstance]
    }

    def update(Long id, Long version) {
        def templatepublicationInstance = Templatepublication.get(id)
        if (!templatepublicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'templatepublication.label', default: 'Templatepublication'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (templatepublicationInstance.version > version) {
                templatepublicationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'templatepublication.label', default: 'Templatepublication')] as Object[],
                          "Another user has updated this Templatepublication while you were editing")
                render(view: "edit", model: [templatepublicationInstance: templatepublicationInstance])
                return
            }
        }

        templatepublicationInstance.properties = params

        if (!templatepublicationInstance.save(flush: true)) {
            render(view: "edit", model: [templatepublicationInstance: templatepublicationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'templatepublication.label', default: 'Templatepublication'), templatepublicationInstance.id])
        redirect(action: "show", id: templatepublicationInstance.id)
    }

    def delete(Long id) {
        def templatepublicationInstance = Templatepublication.get(id)
        if (!templatepublicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'templatepublication.label', default: 'Templatepublication'), id])
            redirect(action: "list")
            return
        }

        try {
            templatepublicationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'templatepublication.label', default: 'Templatepublication'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'templatepublication.label', default: 'Templatepublication'), id])
            redirect(action: "show", id: id)
        }
    }
}