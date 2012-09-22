package spotlight

import org.springframework.dao.DataIntegrityViolationException

class SiteSummaryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [siteSummaryInstanceList: SiteSummary.list(params), siteSummaryInstanceTotal: SiteSummary.count()]
    }

    def create() {
        [siteSummaryInstance: new SiteSummary(params)]
    }

    def save() {
        def siteSummaryInstance = new SiteSummary(params)
        if (!siteSummaryInstance.save(flush: true)) {
            render(view: "create", model: [siteSummaryInstance: siteSummaryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'siteSummary.label', default: 'SiteSummary'), siteSummaryInstance.id])
        redirect(action: "show", id: siteSummaryInstance.id)
    }

    def show(Long id) {
        def siteSummaryInstance = SiteSummary.get(id)
        if (!siteSummaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteSummary.label', default: 'SiteSummary'), id])
            redirect(action: "list")
            return
        }

        [siteSummaryInstance: siteSummaryInstance]
    }

    def edit(Long id) {
        def siteSummaryInstance = SiteSummary.get(id)
        if (!siteSummaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteSummary.label', default: 'SiteSummary'), id])
            redirect(action: "list")
            return
        }

        [siteSummaryInstance: siteSummaryInstance]
    }

    def update(Long id, Long version) {
        def siteSummaryInstance = SiteSummary.get(id)
        if (!siteSummaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteSummary.label', default: 'SiteSummary'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (siteSummaryInstance.version > version) {
                siteSummaryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'siteSummary.label', default: 'SiteSummary')] as Object[],
                          "Another user has updated this SiteSummary while you were editing")
                render(view: "edit", model: [siteSummaryInstance: siteSummaryInstance])
                return
            }
        }

        siteSummaryInstance.properties = params

        if (!siteSummaryInstance.save(flush: true)) {
            render(view: "edit", model: [siteSummaryInstance: siteSummaryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'siteSummary.label', default: 'SiteSummary'), siteSummaryInstance.id])
        redirect(action: "show", id: siteSummaryInstance.id)
    }

    def delete(Long id) {
        def siteSummaryInstance = SiteSummary.get(id)
        if (!siteSummaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteSummary.label', default: 'SiteSummary'), id])
            redirect(action: "list")
            return
        }

        try {
            siteSummaryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'siteSummary.label', default: 'SiteSummary'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'siteSummary.label', default: 'SiteSummary'), id])
            redirect(action: "show", id: id)
        }
    }
}
