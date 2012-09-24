package spotlight.grails

import org.springframework.dao.DataIntegrityViolationException

class SiteAdminController {
	
	static scaffold = true

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [siteAdminInstanceList: SiteAdmin.list(params), siteAdminInstanceTotal: SiteAdmin.count()]
    }

    def create() {
        [siteAdminInstance: new SiteAdmin(params)]
    }

    def save() {
        def siteAdminInstance = new SiteAdmin(params)
        if (!siteAdminInstance.save(flush: true)) {
            render(view: "create", model: [siteAdminInstance: siteAdminInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), siteAdminInstance.id])
        redirect(action: "show", id: siteAdminInstance.id)
    }

    def show(Long id) {
        def siteAdminInstance = SiteAdmin.get(id)
        if (!siteAdminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), id])
            redirect(action: "list")
            return
        }

        [siteAdminInstance: siteAdminInstance]
    }

    def edit(Long id) {
        def siteAdminInstance = SiteAdmin.get(id)
        if (!siteAdminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), id])
            redirect(action: "list")
            return
        }

        [siteAdminInstance: siteAdminInstance]
    }

    def update(Long id, Long version) {
        def siteAdminInstance = SiteAdmin.get(id)
        if (!siteAdminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (siteAdminInstance.version > version) {
                siteAdminInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'siteAdmin.label', default: 'SiteAdmin')] as Object[],
                          "Another user has updated this SiteAdmin while you were editing")
                render(view: "edit", model: [siteAdminInstance: siteAdminInstance])
                return
            }
        }

        siteAdminInstance.properties = params

        if (!siteAdminInstance.save(flush: true)) {
            render(view: "edit", model: [siteAdminInstance: siteAdminInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), siteAdminInstance.id])
        redirect(action: "show", id: siteAdminInstance.id)
    }

    def delete(Long id) {
        def siteAdminInstance = SiteAdmin.get(id)
        if (!siteAdminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), id])
            redirect(action: "list")
            return
        }

        try {
            siteAdminInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), id])
            redirect(action: "show", id: id)
        }
    }
}
