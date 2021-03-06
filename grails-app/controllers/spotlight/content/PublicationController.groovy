package spotlight.content
import org.springframework.dao.DataIntegrityViolationException
import spotlight.pubtemplates.Templatepublication
import spotlight.pubtemplates.Emailtemplate
import org.codehaus.groovy.grails.commons.DefaultGrailsDomainClass
import org.xwiki.rendering.*
import org.springframework.mail.MailException
import javax.mail.*
import groovy.json.*
import grails.converters.*
import org.xwiki.rendering.syntax.*
import org.xwiki.rendering.renderer.printer.DefaultWikiPrinter
import org.xwiki.rendering.renderer.printer.WikiPrinter
import org.xwiki.rendering.converter.Converter
import grails.plugins.springsecurity.Secured

class PublicationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN','ROLE_USER','ROLE_PUBLISHER'])
    def index() {
        redirect(action: "list", params: params)
    }
    /*def author = SecUser.get(springSecurityService.principal.id)*/

    def labels = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
    def data = [
            'Visitors': [100, 300, 200, 240, 500, 100, 80],
            'Purchases': [30, 50, 12, 20, 55, 20, 10]
    ]
    /*def readEtherpad(){
        def padurl = new URL('http://hss.pad.engineering.redhat.com/184').text
        def json = JSON.parse(padurl)
        render("json out from etherpad: ${json.toString()}")

    }*/

    @Secured(['ROLE_ADMIN','ROLE_USER','ROLE_PUBLISHER'])
    def readEtherpad(){
        def padurl = new URL('http://hss.pad.engineering.redhat.com/184').text
        def padjson = new JsonSlurper().parseText(padurl)
        render("json: ${padjson}").toString()
    }

    @Secured(['ROLE_ADMIN','ROLE_USER','ROLE_PUBLISHER'])
    def testlive(){

    }

    def reportresults

    @Secured(['ROLE_ADMIN','ROLE_USER','ROLE_PUBLISHER'])
    def xwikiStreamRenderer
    def xwikiRenderer
    def exportService
    def grailsApplication

    def commentonPublication



    @Secured(['ROLE_ADMIN','ROLE_USER','ROLE_PUBLISHER'])
    def exportToDocbook(Long id){
        def publicationInstance = Publication.get(id)
        [publicationInstance:publicationInstance]
    }

    /*() {
        *//*def publicationInstance = Publication.get(params.id)
        if (!publicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(action: "show")
        }*//*
        def renderdocbookAction = {
            StringWriter writer = new StringWriter()
            publicationInstance.withReader { reader ->
                xwikiStreamRenderer.render(reader, Syntax.MARKDOWN_1_0, Syntax.PLAIN_1_0) {
                    writer.write()
                }
            }
            String result = writer.toString()}
        render(view: 'exportToDocbook', modelAndView:[publicationInstance: renderdocbookAction])
       }*/

    @Secured(['ROLE_ADMIN','ROLE_USER','ROLE_PUBLISHER'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 5)
        if (params.sort=='desc'){
            params.sort = "lastUpdated"

        }
        [publicationInstanceList: Publication.list(params), publicationInstanceTotal: Publication.count()]
    }

    def show(Long id) {
        def publicationInstance = Publication.get(id)
        if (params?.format && params.format !="html"){
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition","attachment: filename=publications.${params.extension}")

            List fields = ["publicationName", "publicationContent","publisheddate","dateCreated","lastUpdated"]

            exportService.export(params.format, response.outputStream, Publication.get(params), fields,[:])
        }
        if (!publicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(action: "list")
            return
        }

        [publicationInstance: publicationInstance, pubproduct: Pubproduct, templatepublication: Templatepublication, emailtemplates: Emailtemplate]
    }

//email send function from publication show page using modal pop-up and editable fields prior to sending
    @Secured(['ROLE_ADMIN','ROLE_USER','ROLE_PUBLISHER'])
    def emailpublication(){
        //def recipient = request.getParameterValues('whogetsemail')
        //List<String> recipients = request.getParameterValues("whogetsemail")

        def publicationInstance = Publication.getProperties()
        List<String> recipients = params.whogetsemail.split(',').collect { it.trim() }
        try {
         sendMail{
                 to  recipients         //todo research setting to array
                 from  "hss-rap-list@redhat.com"        //todo - set as user.session.emailaddress if validated and logged in
                 subject params.publicationName
                 text params.publicationURL + "\n"+"\n" + params.emailbodyheader + "\n"+"\n" + params.publicationContent + "\n"+"\n" + params.footeremailtemplate
             }

        }
        catch (MailException e) {
            log.error "Failed to send emails: $e.message", e
        }
        catch (MessagingException e) {
            log.error "Failed to send emails: $e.message", e
        }
        //redirect(uri: "/publication/show/${params}")
        //redirect(action: show(id), controller: Publication)
        //redirect(uri: "/publication/show/${}")
        render(view: 'show', model: [publicationInstance: publicationInstance])
        //redirect(view: "show", model: [publicationInstance: (params.id)])
        flash.message = "${params.publicationName} sent to ${params.emailto}"
    }                               //todo not redirecting correctly to params id. not sure why it is not picking up properties

    @Secured(['ROLE_ADMIN','ROLE_USER','ROLE_PUBLISHER'])
    def insertpublicationtemplate(){

    }

    @Secured(['ROLE_ADMIN','ROLE_USER','ROLE_PUBLISHER'])
    def create() {
        [publicationInstance: new Publication(params)]
    }

    @Secured(['ROLE_ADMIN','ROLE_USER','ROLE_PUBLISHER'])
    def publicationClone(){
        def clonepublication = Publication.getProperties()
        def newPublication = new Publication(clonepublication.each {Publication p ->
        newPublication.addToPublication(p)
        })
        render(action: create())
    }

    @Secured(['ROLE_ADMIN','ROLE_USER','ROLE_PUBLISHER'])
    def save() {
        def publicationInstance = new Publication(params)
        if (!publicationInstance.save(flush: true)) {
            render(view: "create", model: [publicationInstance: publicationInstance, pubproduct: Pubproduct.properties])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'publication.label', default: 'Publication'), publicationInstance.id])
        redirect(action: "show", id: publicationInstance.id)
    }

    @Secured(['ROLE_ADMIN','ROLE_USER','ROLE_PUBLISHER'])
    def edit(Long id) {
        def publicationInstance = Publication.get(id)
        if (!publicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(action: "list")
            return
        }

        [publicationInstance: publicationInstance, pubproduct: Pubproduct, publicationtemplates: Templatepublication]
    }

    @Secured(['ROLE_ADMIN','ROLE_USER','ROLE_PUBLISHER'])
    def update(Long id, Long version) {
        def publicationInstance = Publication.get(id)
        if (!publicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (publicationInstance.version > version) {
                publicationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'publication.label', default: 'Publication')] as Object[],
                          "Another user has updated this Publication while you were editing")
                render(view: "edit", model: [publicationInstance: publicationInstance, pubproduct: Pubproduct])
                return
            }
        }

        publicationInstance.properties = params

        if (!publicationInstance.save(flush: true)) {
            render(view: "edit", model: [publicationInstance: publicationInstance, pubproduct: Pubproduct])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'publication.label', default: 'Publication'), publicationInstance.id])
        redirect(action: "show", id: publicationInstance.id)
    }

    @Secured(['ROLE_ADMIN','ROLE_USER','ROLE_PUBLISHER'])
    def delete(Long id) {
        def publicationInstance = Publication.get(id)
        if (!publicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(action: "list")
            return
        }

        try {
            publicationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(controller: "portfolio", action: "show", id: "publication.portfolioId")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'publication.label', default: 'Publication'), id])
            redirect(action: "show", id: portfolioInstance.id)
        }                                 //todo - fix redirect on delete action to redirect to portfolio/show/$id  not list
    }
}
//todo clone  function still not working correctly


/*
 * Clones a domain object and recursively clones children, clearing ids and
 * attaching children to their new parents. Ownership relationships (indicated
 * by GORM belongsTo keyword) cause "copy as new" (a recursive deep clone),
 * but associations without ownership are shallow copied by reference.
 */
/*
 * Clones a domain object and recursively clones children, clearing ids and
 * attaching children to their new parents. Ownership relationships (indicated
 * by GORM belongsTo keyword) cause "copy as new" (a recursive deep clone),
 * but associations without ownership are shallow copied by reference.
 */
/*    public Object deepClone(publicationContent) {
        //Our target instance for the instance we want to clone
        // recursion
        def newDomainInstance = publicationInstance.getClass().newInstance()
        //Returns a DefaultGrailsDomainClass (as interface GrailsDomainClass) for inspecting properties
        def domainClass = ApplicationHolder.application.getDomainClass(newDomainInstance.getClass().name)
        domainClass?.persistentProperties?.each {prop ->
            if (prop.association) {
                if (prop.owningSide) {
                    //we have to deep clone owned associations
                    if (prop.oneToOne) {
                        def newAssociationInstance = deepClone(publicationInstance?."${prop.publicationContent}")
                        newDomainInstance."${prop.publicationContent}" = newAssociationInstance
                    }
                    else {
                        publicationInstance."${prop.publicationContent}".each { associationInstance ->
                            def newAssociationInstance = deepClone(associationInstance)
                            newDomainInstance."addTo${StringUtils.capitalize(prop.publicationContent)}"(newAssociationInstance)
                        }
                    }
                }
                else {
                    if (!prop.bidirectional) {
                        //If the association isn't owned or the owner, then we can just do a  shallow copy of the reference.
                        newDomainInstance."${prop.publicationContent}" = publicationInstance."${prop.publicationContent}"
                    }
                    // @@JR
                    // Yes bidirectional and not owning. E.g. clone Report, belongsTo Organisation which hasMany
                    // manyToOne. Just add to the owning objects collection.
                    else {
                        if (prop.manyToOne) {
                            newDomainInstance."${prop.publicationContent}" = publicationInstance."${prop.publicationContent}"
                            def owningInstance = publicationInstance."${prop.publicationContent}"
                            // Need to find the collection.
                            String otherSide = StringUtils.capitalize(prop.otherSide.publicationContent)
                            owningInstance."addTo${otherSide}"(newDomainInstance)
                        }
                    }
                }
            }
            else {
                //If the property isn't an association then simply copy the value
                newDomainInstance."${prop.publicationContent}" = publicationInstance."${prop.publicationContent}"
            }
        }
        return newDomainInstance
    }*/
