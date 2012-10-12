package spotlight.content

import org.springframework.dao.DataIntegrityViolationException

class ReportSiteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [reportSiteInstanceList: ReportSite.list(params), reportSiteInstanceTotal: ReportSite.count()]
    }

	//todo - index page redirect or url mapping. is landing home page for app. currently sort does is not working for some reason maybe h2 in mem db issue??
	def _weblist (){
		def weblist = ReportSite.findAll(max: 20, sort:"lastUpdated")
		def reports = Report.list(sort:"lastUpdated", order: "asc", max:'5')
		//render template:"_weblist"
		[weblist: weblist, reports:reports]	  
	}
	// test partial or template to render all sites and last 5 reports splitting by css into 2 columns - not working???
	def _blah (){
		def blah = ReportSite.findAll(max: 20, sort:"lastUpdated")
		def reports = Report.list(sort:"lastUpdated", order:"asc")
		[blah: blah, reports: reports]
	}
	
	
    def create() {
        [reportSiteInstance: new ReportSite(params)]
    }

    def save() {
        def reportSiteInstance = new ReportSite(params)
        if (!reportSiteInstance.save(flush: true)) {
            render(view: "create", model: [reportSiteInstance: reportSiteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'reportSite.label', default: 'ReportSite'), reportSiteInstance.id])
        redirect(action: "show", id: reportSiteInstance.id)
    }

    def show(Long id) {
        def reportSiteInstance = ReportSite.get(id)
        if (!reportSiteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportSite.label', default: 'ReportSite'), id])
            redirect(action: "list")
            return
        }

        [reportSiteInstance: reportSiteInstance]
    }

    def edit(Long id) {
        def reportSiteInstance = ReportSite.get(id)
        if (!reportSiteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportSite.label', default: 'ReportSite'), id])
            redirect(action: "list")
            return
        }

        [reportSiteInstance: reportSiteInstance]
    }

    def update(Long id, Long version) {
        def reportSiteInstance = ReportSite.get(id)
        if (!reportSiteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportSite.label', default: 'ReportSite'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (reportSiteInstance.version > version) {
                reportSiteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reportSite.label', default: 'ReportSite')] as Object[],
                          "Another user has updated this ReportSite while you were editing")
                render(view: "edit", model: [reportSiteInstance: reportSiteInstance])
                return
            }
        }

        reportSiteInstance.properties = params

        if (!reportSiteInstance.save(flush: true)) {
            render(view: "edit", model: [reportSiteInstance: reportSiteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'reportSite.label', default: 'ReportSite'), reportSiteInstance.id])
        redirect(action: "show", id: reportSiteInstance.id)
    }

    def delete(Long id) {
        def reportSiteInstance = ReportSite.get(id)
        if (!reportSiteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportSite.label', default: 'ReportSite'), id])
            redirect(action: "list")
            return
        }

        try {
            reportSiteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'reportSite.label', default: 'ReportSite'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reportSite.label', default: 'ReportSite'), id])
            redirect(action: "show", id: id)
        }
    }
}
