package spotlight.content

import org.springframework.dao.DataIntegrityViolationException

class SiteReportController {
	
	def scaffold = true

    def searchreports = {
    }
	
	def reportresults = {
		def reports = SiteReport.findAllByReportName ("%${params.reportName}%")
		return [reports: reports, term: params.reportName]
	}
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [siteReportInstanceList: SiteReport.list(params), siteReportInstanceTotal: SiteReport.count()]
    }

    def create() {
        [siteReportInstance: new SiteReport(params)]
    }

    def save() {
        def siteReportInstance = new SiteReport(params)
        if (!siteReportInstance.save(flush: true)) {
            render(view: "create", model: [siteReportInstance: siteReportInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'siteReport.label', default: 'SiteReport'), siteReportInstance.id])
        redirect(action: "show", id: siteReportInstance.id)
    }

    def show(Long id) {
        def siteReportInstance = SiteReport.get(id)
        if (!siteReportInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteReport.label', default: 'SiteReport'), id])
            redirect(action: "list")
            return
        }

        [siteReportInstance: siteReportInstance]
    }

    def edit(Long id) {
        def siteReportInstance = SiteReport.get(id)
        if (!siteReportInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteReport.label', default: 'SiteReport'), id])
            redirect(action: "list")
            return
        }

        [siteReportInstance: siteReportInstance]
    }

    def update(Long id, Long version) {
        def siteReportInstance = SiteReport.get(id)
        if (!siteReportInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteReport.label', default: 'SiteReport'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (siteReportInstance.version > version) {
                siteReportInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'siteReport.label', default: 'SiteReport')] as Object[],
                          "Another user has updated this SiteReport while you were editing")
                render(view: "edit", model: [siteReportInstance: siteReportInstance])
                return
            }
        }

        siteReportInstance.properties = params

        if (!siteReportInstance.save(flush: true)) {
            render(view: "edit", model: [siteReportInstance: siteReportInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'siteReport.label', default: 'SiteReport'), siteReportInstance.id])
        redirect(action: "show", id: siteReportInstance.id)
    }

    def delete(Long id) {
        def siteReportInstance = SiteReport.get(id)
        if (!siteReportInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteReport.label', default: 'SiteReport'), id])
            redirect(action: "list")
            return
        }

        try {
            siteReportInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'siteReport.label', default: 'SiteReport'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'siteReport.label', default: 'SiteReport'), id])
            redirect(action: "show", id: id)
        }
    }
}
