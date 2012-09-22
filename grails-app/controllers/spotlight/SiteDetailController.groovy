package spotlight

import org.springframework.dao.DataIntegrityViolationException

class SiteDetailController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [siteDetailInstanceList: SiteDetail.list(params), siteDetailInstanceTotal: SiteDetail.count()]
    }

    def create() {
        [siteDetailInstance: new SiteDetail(params)]
    }

    def save() {
        def siteDetailInstance = new SiteDetail(params)
        if (!siteDetailInstance.save(flush: true)) {
            render(view: "create", model: [siteDetailInstance: siteDetailInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'siteDetail.label', default: 'SiteDetail'), siteDetailInstance.id])
        redirect(action: "show", id: siteDetailInstance.id)
    }

    def show(Long id) {
        def siteDetailInstance = SiteDetail.get(id)
        if (!siteDetailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteDetail.label', default: 'SiteDetail'), id])
            redirect(action: "list")
            return
        }

        [siteDetailInstance: siteDetailInstance]
    }

    def edit(Long id) {
        def siteDetailInstance = SiteDetail.get(id)
        if (!siteDetailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteDetail.label', default: 'SiteDetail'), id])
            redirect(action: "list")
            return
        }

        [siteDetailInstance: siteDetailInstance]
    }

    def update(Long id, Long version) {
        def siteDetailInstance = SiteDetail.get(id)
        if (!siteDetailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteDetail.label', default: 'SiteDetail'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (siteDetailInstance.version > version) {
                siteDetailInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'siteDetail.label', default: 'SiteDetail')] as Object[],
                          "Another user has updated this SiteDetail while you were editing")
                render(view: "edit", model: [siteDetailInstance: siteDetailInstance])
                return
            }
        }

        siteDetailInstance.properties = params

        if (!siteDetailInstance.save(flush: true)) {
            render(view: "edit", model: [siteDetailInstance: siteDetailInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'siteDetail.label', default: 'SiteDetail'), siteDetailInstance.id])
        redirect(action: "show", id: siteDetailInstance.id)
    }

    def delete(Long id) {
        def siteDetailInstance = SiteDetail.get(id)
        if (!siteDetailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteDetail.label', default: 'SiteDetail'), id])
            redirect(action: "list")
            return
        }

        try {
            siteDetailInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'siteDetail.label', default: 'SiteDetail'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'siteDetail.label', default: 'SiteDetail'), id])
            redirect(action: "show", id: id)
        }
    }
}
