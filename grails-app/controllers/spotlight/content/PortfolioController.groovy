package spotlight.content

import org.springframework.dao.DataIntegrityViolationException
import spotlight.pubtemplates.Emailtemplate

import static org.hibernate.criterion.CriteriaSpecification.*

class PortfolioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
    //TODO - add in subscription model
    //TODO - add in user profile page - ajax live updates for subscriptions based on categories

//listing portfolios and their publications
/*    def webList (){
        def portfolios = Portfolio.createCriteria().list {
            //if you needed to filter the list by for example portfolio status or something you could add that here
            or {
                eq('status','Active')

            }
            publications(org.hibernate.criterion.CriteriaSpecification.LEFT_JOIN) {
                eq("published", "Yes")
                order("lastUpdated", "desc")
                firstResult(5)
            }
        }

        [portfolios: portfolios, portfolioCount:portfolios.size()]
    }*/

    def list(Integer max) {
        params.max = Math.min(max ?: 4, 100)
        def portfolioInstanceList = Portfolio.where {status == 'Active'}
        [portfolioInstanceList: portfolioInstanceList.list(params), portfolioInstanceTotal: Portfolio.count()]

    }

    def _webList (){
        def portfolios = Portfolio.where {status == 'Active'}.list(params)
        def results = Publication.createCriteria().list {
            eq ('published', 'Yes')
            order('lastUpdated', 'desc')
            firstResult(5)
        }

        def reportscount = Publication.count()

        [ portfolios: portfolios, results: results, reportscount: reportscount]
    }


    def create() {
        [portfolioInstance: new Portfolio(params), profileInstance: new Profile(params)]
    }

    def save() {
        def portfolioInstance = new Portfolio(params)
        portfolioInstance.properties = params
        if (!portfolioInstance.save(flush: true)) {
            render(view: "create", model: [portfolioInstance: portfolioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), portfolioInstance.id])
        redirect(action: "show", id: portfolioInstance.id)
    }

    def show(Long id) {
        def portfolioInstance = Portfolio.get(id)
        if (!portfolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: "portfolio.label", default: 'Portfolio'), id])
            redirect(action: "list")
            return
        }

        [portfolioInstance: portfolioInstance, emailtemplates: Emailtemplate]
    }

    def _publicationlist (Integer max) {
        def portfolioInstance = Portfolio.get(id)
        portfolioInstance.properties=params
        def publications = Publication.list(params)
        render(view: publications)

    }

    def edit(Long id) {
        def portfolioInstance = Portfolio.get(id)
        portfolioInstance.properties = params
        if (!portfolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), id])
            redirect(action: "list")
            return
        }

        [portfolioInstance: portfolioInstance]
    }

    def update(Long id, Long version) {
        def portfolioInstance = Portfolio.get(id)
        if (!portfolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (portfolioInstance.version > version) {
                portfolioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'portfolio.label', default: 'Portfolio')] as Object[],
                          "Another user has updated this Portfolio while you were editing")
                render(view: "edit", model: [portfolioInstance: portfolioInstance])
                return
            }
        }

        portfolioInstance.properties = params

        if (!portfolioInstance.save(flush: true)) {
            render(view: "edit", model: [portfolioInstance: portfolioInstance, profileInstance: profileInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), portfolioInstance.id])
        redirect(action: "show", id: portfolioInstance.id)
    }

    def delete(Long id) {
        def portfolioInstance = Portfolio.get(id)
        if (!portfolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), id])
            redirect(action: "list")
            return
        }

        try {
            portfolioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), id])
            redirect(action: "show", id: id)
        }
    }
}
