package spotlight.content

import org.springframework.dao.DataIntegrityViolationException
import spotlight.pubtemplates.Emailtemplate
import org.codehaus.groovy.grails.commons.ConfigurationHolder as Conf
import java.io.File;
import static org.hibernate.criterion.CriteriaSpecification.*
import static java.io.File.*
import groovy.sql.*

class PortfolioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
    //TODO - add in subscription model
    //TODO - add in user profile page - ajax live updates for subscriptions based on categories

//listing portfolios and their publications
    def _webList (){
        //def per = Portfolio.properties
        def portfolios = Portfolio.list(params.id)
            def results = Publication.where {published=='Yes'}.list([sort: "lastUpdated",order: 'desc', max: 5, offset: 0])
        /*def results = Publication.listOrderByLastUpdated([max: 5])*/
                /*def results = Publication.withCriteria {

            eq('published', 'Yes')
            order('lastUpdated', 'desc')
            maxResults(5)
        }*/
        def reportscount = Publication.count()
            [ portfolios: portfolios, results: results, reportscount: reportscount]
    }


    def list(Integer max) {
        params.max = Math.min(max ?: 4, 100)
        def portfolioInstanceList = Portfolio.where {status == 'Active'}
            [portfolioInstanceList: portfolioInstanceList.list(params), portfolioInstanceTotal: Portfolio.count()]

    }

    def archivedportfolios(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def portfolioInstanceList = Portfolio.where {status == 'Closed'}
        [portfolioInstanceList: portfolioInstanceList.list(params), portfolioInstanceTotal: Portfolio.count()]

    }
        //todo check list view from this action
    def unpublishedDocs(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def publicationInstance = Publication.where {published == 'No'}
        [publicationInstance:publicationInstance.list(params), publicationInstanceUnpubTotal: Publication.count()]

    }
        //todo below not returning any results
    def unpublishedcount = {
        def portfolio=Portfolio.get(params)
        println Publication.executeQuery("select count(*) from Publication as a join Publication.portfolio as p where p = :p", [p: 'No'])
    }

/*    def metric = {
         def wordcountsql = new Sql(dataSource)
        (SELECT SUM( LENGTH(publication_content) - LENGTH(REPLACE(publication_content, ' ', ''))+1) FROM publication)
        sql.close()
        *//*def session = sessionFactory.getCurrentSession()
        def result = session.createSQLQuery("SELECT * FROM ITEMS").list()*//*
        [metric: metric, wordcountsql: wordcountsql]
  }*/


    def create () {
        [portfolioInstance: new Portfolio(params)]
    }

//save action saves the portfolio and profile domain classes, following the save a new dir is created in the config path
    def save() {
        def portfolioInstance = new Portfolio(params)
        portfolioInstance.properties = params
        if (!portfolioInstance.save(flush: true)) {
            render(view: "create", model: [portfolioInstance: portfolioInstance])
            return
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'portfolio.label', default: 'Portfolio'), portfolioInstance.id])
        def portfolioDirName = portfolioInstance.id
            def portfolioDir = new File(Conf.config.rootPath + portfolioDirName + "images").mkdir()
                redirect(action: "show", id: portfolioInstance.id)
                  [portfolioDir: portfolioDir]           //todo conf path not valid in a save range used this way find another way
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
