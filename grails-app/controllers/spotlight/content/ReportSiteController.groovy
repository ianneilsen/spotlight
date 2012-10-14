package spotlight.content

import org.springframework.dao.DataIntegrityViolationException
import spotlight.content.Report

class ReportSiteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    //TODO- index page redirect or url mapping. is landing home page for app. currently sort does is not working for some reason maybe h2 in mem db issue??
	def _webList (){
		def webLists = ReportSite.list(params.id)
		def webreports = Report.list([sort:"lastUpdated", order: "asc", max:'5'])
            //render(action: "show", id: webreports.id)
        //def reportscount = Report.count()
        def reportscount = Report.findAll().size()
           [webLists: webLists, webreports: webreports, reportscount: reportscount]
   }
   
//    def reportcount(){
//       def siteList=ReportSite.list()
//            def reportList = ReportSite? Report.list()
//                def reportcount = Report.count()
//                [reportcount:reportcount]
//    }

//    def rsNumb = ReportSite.count() 
    
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def rsNumb = ReportSite.count()
        [reportSiteInstanceList: ReportSite.list(params), reportSiteInstanceTotal: ReportSite.count(), rsNumb: rsNumb]
        
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
