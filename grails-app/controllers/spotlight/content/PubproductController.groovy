package spotlight.content

import org.springframework.dao.DataIntegrityViolationException

class PubproductController {

    static scaffold = true

/*    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pubproductInstanceList: Pubproduct.list(params), pubproductInstanceTotal: Pubproduct.count()]
    }

    def create() {
        [pubproductInstance: new Pubproduct(params)]
    }

    def save() {
        def pubproductInstance = new Pubproduct(params)
        if (!pubproductInstance.save(flush: true)) {
            render(view: "create", model: [pubproductInstance: pubproductInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pubproduct.label', default: 'Pubproduct'), pubproductInstance.id])
        redirect(action: "show", id: pubproductInstance.id)
    }

    def show(Long id) {
        def pubproductInstance = Pubproduct.get(id)
        if (!pubproductInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubproduct.label', default: 'Pubproduct'), id])
            redirect(action: "list")
            return
        }

        [pubproductInstance: pubproductInstance]
    }

    def edit(Long id) {
        def pubproductInstance = Pubproduct.get(id)
        if (!pubproductInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubproduct.label', default: 'Pubproduct'), id])
            redirect(action: "list")
            return
        }

        [pubproductInstance: pubproductInstance]
    }

    def update(Long id, Long version) {
        def pubproductInstance = Pubproduct.get(id)
        if (!pubproductInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubproduct.label', default: 'Pubproduct'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pubproductInstance.version > version) {
                pubproductInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'pubproduct.label', default: 'Pubproduct')] as Object[],
                        "Another user has updated this Pubproduct while you were editing")
                render(view: "edit", model: [pubproductInstance: pubproductInstance])
                return
            }
        }

        pubproductInstance.properties = params

        if (!pubproductInstance.save(flush: true)) {
            render(view: "edit", model: [pubproductInstance: pubproductInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pubproduct.label', default: 'Pubproduct'), pubproductInstance.id])
        redirect(action: "show", id: pubproductInstance.id)
    }

    def delete(Long id) {
        def pubproductInstance = Pubproduct.get(id)
        if (!pubproductInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubproduct.label', default: 'Pubproduct'), id])
            redirect(action: "list")
            return
        }

        try {
            pubproductInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pubproduct.label', default: 'Pubproduct'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pubproduct.label', default: 'Pubproduct'), id])
            redirect(action: "show", id: id)
        }
    }*/
}
