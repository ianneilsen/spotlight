import grails.plugins.springsecurity.*
import spotlight.User
// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }
grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml'],
    pdf:           'application/pdf',   //used in export function
    ods:           'application/vnd.oasis.opendocument.spreadsheet', //used in export function

]
// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']
//grails.plugin.twitterbootstrap.fixtaglib = true
//grails.plugin.twitterbootstrap.defaultBundle = 'bundle_bootstrap'

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
grails.converters.default.pretty.print=true
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false
// mail system for sending email from documents send mail function
grails.mail.host="localhost"
grails.mail.default.from="hss-rap-list@redhat.com"

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

//wiki configuration and use of macros -see also BuildConfig.gsp for boolean options.
grails.xwiki.rendering.macros.enabled = true
//grails.xwiki.rendering.syntaxes = "plain, docbook, markdown" // XWiki Syntax Configuration
//grails.xwiki.rendering.macros = "comment, box, toc, footnotes, html, id, message" //set in BuildConfig file for some reason - need to check why it needs to sit there

//Markdownplugin config settings
markdown.tables = true           // Configuration
markdown.fencedCodeBlocks = true
markdown.autoLinks = true
markdown.hardwraps = true
markdown.fencedCodeBlocks = true
markdown.smart = true
markdown.definitionLists = true
markdown.abbreviations = true
//markdown.autoLinks = true
markdown.removeHtml = false       // Configuration  set true or false based on portfolio site profile-htmlflag call the map
//[removeHtml: false]               // Custom Map

/////////////////////////////////////
environments {
    development {
        grails.logging.jul.usebridge = true
        rootPath="/siteimages/"
    }
    production {
        grails.logging.jul.usebridge = false
        //grails.serverURL = "10.64.40.189"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'spotlight.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'spotlight.UserRole'
grails.plugins.springsecurity.authority.className = 'spotlight.Role'
