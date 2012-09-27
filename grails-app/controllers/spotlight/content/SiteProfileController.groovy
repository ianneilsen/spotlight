package spotlight.content

import org.springframework.dao.DataIntegrityViolationException

class SiteProfileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [siteProfileInstanceList: SiteProfile.list(params), siteProfileInstanceTotal: SiteProfile.count()]
    }

    def create() {
        [siteProfileInstance: new SiteProfile(params)]
    }

    def save() {
        def siteProfileInstance = new SiteProfile(params)
        if (!siteProfileInstance.save(flush: true)) {
            render(view: "create", model: [siteProfileInstance: siteProfileInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'siteProfile.label', default: 'SiteProfile'), siteProfileInstance.id])
        redirect(action: "show", id: siteProfileInstance.id)
    }

    def show(Long id) {
        def siteProfileInstance = SiteProfile.get(id)
        if (!siteProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteProfile.label', default: 'SiteProfile'), id])
            redirect(action: "list")
            return
        }

        [siteProfileInstance: siteProfileInstance]
    }

    def edit(Long id) {
        def siteProfileInstance = SiteProfile.get(id)
        if (!siteProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteProfile.label', default: 'SiteProfile'), id])
            redirect(action: "list")
            return
        }

        [siteProfileInstance: siteProfileInstance]
    }

    def update(Long id, Long version) {
        def siteProfileInstance = SiteProfile.get(id)
        if (!siteProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteProfile.label', default: 'SiteProfile'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (siteProfileInstance.version > version) {
                siteProfileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'siteProfile.label', default: 'SiteProfile')] as Object[],
                          "Another user has updated this SiteProfile while you were editing")
                render(view: "edit", model: [siteProfileInstance: siteProfileInstance])
                return
            }
        }

        siteProfileInstance.properties = params

        if (!siteProfileInstance.save(flush: true)) {
            render(view: "edit", model: [siteProfileInstance: siteProfileInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'siteProfile.label', default: 'SiteProfile'), siteProfileInstance.id])
        redirect(action: "show", id: siteProfileInstance.id)
    }

    def delete(Long id) {
        def siteProfileInstance = SiteProfile.get(id)
        if (!siteProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteProfile.label', default: 'SiteProfile'), id])
            redirect(action: "list")
            return
        }

        try {
            siteProfileInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'siteProfile.label', default: 'SiteProfile'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'siteProfile.label', default: 'SiteProfile'), id])
            redirect(action: "show", id: id)
        }
    }
}
