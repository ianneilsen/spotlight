package spotlight.content

import org.springframework.dao.DataIntegrityViolationException

class PortfolioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    //TODO- index page redirect or url mapping. is landing home page for app. currently sort does is not working for some reason maybe h2 in mem db issue??
	def _webList (){
		def webLists = Portfolio.list(params.id)
		def webreports = Publication.listOrderByLastUpdated(Portfolio:webLists )//.get(5)
        def reportscount = Publication.count()
           [webLists: webLists, webreports: webreports, reportscount: reportscount]

         }

    def reportcount (){
        def sitel = Portfolio.get(params)
            def sitereports = Publication.list(Portfolio.load(params))
                def countreports = sitereports.count(sitereports)
        [countreports: countreports]
    }
     // TODO: apply styling to weblist.gsp - better li ,border, font styling double columns.
    //TODO: fix count - count total reports where site = id
//    def reportcount(){
//       def siteList=Portfolio.list()
//            def reportList = Portfolio? Report.list()
//                def reportcount = Report.count()
//                [reportcount:reportcount]
//    }

//    def rsNumb = Portfolio.count()
    
    def list(Integer max) {
        params.max = Math.min(max ?: 4, 100)
        def rsNumb = Portfolio.count()
        [portfolioInstanceList: Portfolio.list(params), portfolioInstanceTotal: Portfolio.count(), rsNumb: rsNumb]
        
    }
	
    def create() {
        [portfolioInstance: new Portfolio(params)]
    }

    def save() {
        def portfolioInstance = new Portfolio(params)
        if (!portfolioInstance.save(flush: true)) {
            render(view: "create", model: [portfolioInstance: portfolioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'Portfolio.label', default: 'Portfolio'), portfolioInstance.id])
        redirect(action: "show", id: portfolioInstance.id)
    }

    def show(Long id) {
        def portfolioInstance = Portfolio.get(id)
        if (!portfolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Portfolio.label', default: 'Portfolio'), id])
            redirect(action: "list")
            return
        }

        [portfolioInstance: portfolioInstance]
    }

    def edit(Long id) {
        def portfolioInstance = Portfolio.get(id)
        if (!portfolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Portfolio.label', default: 'Portfolio'), id])
            redirect(action: "list")
            return
        }

        [portfolioInstance: portfolioInstance]
    }

    def update(Long id, Long version) {
        def portfolioInstance = Portfolio.get(id)
        if (!portfolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Portfolio.label', default: 'Portfolio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (portfolioInstance.version > version) {
                portfolioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'Portfolio.label', default: 'Portfolio')] as Object[],
                          "Another user has updated this Portfolio while you were editing")
                render(view: "edit", model: [portfolioInstance: portfolioInstance])
                return
            }
        }

        portfolioInstance.properties = params

        if (!portfolioInstance.save(flush: true)) {
            render(view: "edit", model: [portfolioInstance: portfolioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'Portfolio.label', default: 'Portfolio'), portfolioInstance.id])
        redirect(action: "show", id: portfolioInstance.id)
    }

    def delete(Long id) {
        def portfolioInstance = Portfolio.get(id)
        if (!portfolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Portfolio.label', default: 'Portfolio'), id])
            redirect(action: "list")
            return
        }

        try {
            portfolioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'Portfolio.label', default: 'Portfolio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'Portfolio.label', default: 'Portfolio'), id])
            redirect(action: "show", id: id)
        }
    }
}
