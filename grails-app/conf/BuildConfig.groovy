grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
grails.project.war.file = "spotlight.war"
//grails.project.war.file = "hss-service-catalog.war"
//xwiki buildconfig
grails.xwiki.rendering.macros = "comment, box, toc, footnotes, html, id, message"
grails.xwiki.rendering.syntaxes = "plain, docbook, markdown, html, xhtml"
//grails.xwiki.rendering.syntaxes = "xhtml/1.0, html/4.01, plain/1.0, docbook/4.4, markdown/1.0"
//syntaxes INPUTS: XHTML 1.0 xhtml/1.0 - HTML 4.01	html/4.01 - Plain Text	plain/1.0 - DocBook 4.4	docbook/4.4 - Markdown	markdown/1.0
//syntaxes OUTPUTS: XHTML 1.0	xhtml/1.0 - HTML 4.01	html/4.01 - Plain Text	plain/1.0 - DocBook 4.4	docbook/4.4 -
//------------------------------------------
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        mavenRepo "https://repository.engineering.redhat.com/nexus/content/groups/eng-ops-public/" //todo - deployment - add in internal repo.
        mavenRepo "https://repository.engineering.redhat.com/nexus/content/"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        runtime 'mysql:mysql-connector-java:5.1.22'
        //compile ':spring-security-core:1.2.7.3'

    }


    plugins {
        runtime ":hibernate:$grailsVersion"
        runtime ":jquery:1.7.2"
        runtime ":resources:1.1.6"
        // Uncomment these (or add new ones) to enable additional resources capabilities
        //runtime ":zipped-resources:1.0"
        //runtime ":cached-resources:1.0"
        //runtime ":yui-minify-resources:0.1.4"

        build ":tomcat:$grailsVersion"
        //build ":eap:$grailsVersion"

        runtime ":database-migration:1.1"

        compile ':cache:1.0.0'
    }
}
