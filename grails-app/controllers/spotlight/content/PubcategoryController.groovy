package spotlight.content

import org.springframework.dao.DataIntegrityViolationException

class PubcategoryController {

    static scaffold = true

/*    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pubcategoryInstanceList: Pubcategory.list(params), pubcategoryInstanceTotal: Pubcategory.count()]
    }

    def create() {
        [pubcategoryInstance: new Pubcategory(params)]
    }

    def save() {
        def pubcategoryInstance = new Pubcategory(params)
        if (!pubcategoryInstance.save(flush: true)) {
            render(view: "create", model: [pubcategoryInstance: pubcategoryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pubcategory.label', default: 'Pubcategory'), pubcategoryInstance.id])
        redirect(action: "show", id: pubcategoryInstance.id)
    }

    def show(Long id) {
        def pubcategoryInstance = Pubcategory.get(id)
        if (!pubcategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubcategory.label', default: 'Pubcategory'), id])
            redirect(action: "list")
            return
        }

        [pubcategoryInstance: pubcategoryInstance]
    }

    def edit(Long id) {
        def pubcategoryInstance = Pubcategory.get(id)
        if (!pubcategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubcategory.label', default: 'Pubcategory'), id])
            redirect(action: "list")
            return
        }

        [pubcategoryInstance: pubcategoryInstance]
    }

    def update(Long id, Long version) {
        def pubcategoryInstance = Pubcategory.get(id)
        if (!pubcategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubcategory.label', default: 'Pubcategory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pubcategoryInstance.version > version) {
                pubcategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'pubcategory.label', default: 'Pubcategory')] as Object[],
                        "Another user has updated this Pubcategory while you were editing")
                render(view: "edit", model: [pubcategoryInstance: pubcategoryInstance])
                return
            }
        }

        pubcategoryInstance.properties = params

        if (!pubcategoryInstance.save(flush: true)) {
            render(view: "edit", model: [pubcategoryInstance: pubcategoryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pubcategory.label', default: 'Pubcategory'), pubcategoryInstance.id])
        redirect(action: "show", id: pubcategoryInstance.id)
    }

    def delete(Long id) {
        def pubcategoryInstance = Pubcategory.get(id)
        if (!pubcategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pubcategory.label', default: 'Pubcategory'), id])
            redirect(action: "list")
            return
        }

        try {
            pubcategoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pubcategory.label', default: 'Pubcategory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pubcategory.label', default: 'Pubcategory'), id])
            redirect(action: "show", id: id)
        }
    }*/
}
