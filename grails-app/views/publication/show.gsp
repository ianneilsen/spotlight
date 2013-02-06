<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.content.Pubproduct" %>
<%@ page import="spotlight.pubtemplates.Templatepublication" %>
<%@ page import="org.xwiki.rendering.renderer.*" %>
<%@  page import="org.xwiki.rendering.macro.*" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

         <r:require modules="jquery,jquery-ui"/>
         <zing:include />
        %{--<script type="text/javascript" src="http://www.google.com/jsapi"></script>--}%
     %{--   <link rel="stylesheet" href="${resource(dir: 'css', file: 'visualize.css')}" type="text/css">
        <g:javascript src="visualize.jQuery.js" />--}%

<g:javascript>/****************************************
 * Floating Navigation jQuery feature
 ****************************************/
$(function() {

    // get initial top offset of navigation
    var floating_navigation_offset_top = $('#slidenav').offset().top;

    // define the floating navigation function
    var floating_navigation = function(){
        // current vertical position from the top
        var scroll_top = $(window).scrollTop();

        // if scrolled more than the navigation, change its
        // position to fixed to float to top, otherwise change
        // it back to relative
        if (scroll_top > floating_navigation_offset_top) {
            $('#slidenav').css({ 'position': 'fixed', 'top':0});
        } else {
            $('#slidenav').css({ 'position': 'relative' });
        }
    };
    // run function on load
    floating_navigation();
    // run function every time you scroll
    $(window).scroll(function() {
        floating_navigation();
    });

});</g:javascript>
</head>
  <body>

    <a href="#show-publication" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="navbar1">
            <ul class="nav1">
				<li><a class="home" href="${createLink(uri: '/portfolio/list')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
                <div id="show-publication" class="content scaffold-show" role="main">
            </ul>
		</div>

<!---- action report name and site name ---->
	<div id="show-publication" class="content scaffold-show" role="main">
	    <h1 style="font-size: 20px;"> ${publicationInstance?.publicationName} from
            <g:if test="${publicationInstance?.portfolio}">
                <span class="property-value" aria-labelledby="portfolio-label">
                    <g:link controller="portfolio" action="show" id="${publicationInstance?.portfolio?.id}">${publicationInstance?.portfolio?.encodeAsHTML()}</g:link>
                </span>
            </g:if>
            portfolio
        </h1>
    </div>
<!---- error messages ---->
            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
<!---- sliding publication nav ---->
    <div id="slidenav">
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${publicationInstance?.id}" />
                <g:link class="edit" action="edit" id="${publicationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit id="${publicationInstance?.id}" class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure you want to delete this publication?')}');" />
                <g:render template="navshow"/>
            </fieldset>
    </div>
<!---- publication content---->
<!-- row META -->
  <div class="row-fluid">
        <div class="span4">
            <div class="control-group">
                <g:if test="${publicationInstance?.id}">
                    <span id="id-label" class="label"><i class="icon-asterisk"></i><g:message code="publication.id.label" default="Publication Id" /></span>
                    <span class="property-value" aria-labelledby="id-label"><g:fieldValue bean="${publicationInstance}" field="id"/></span>
                </g:if>
            </div>

            <div class="control-group">
                 <g:if test="${publicationInstance?.publicationName}">
                    <span id="Name-label" class="label"><i class="icon-asterisk"></i><g:message code="publication.publicationName.label" default="Publication name" /></span>
                    <span class="property-value" aria-labelledby="publicationName-label"><g:fieldValue bean="${publicationInstance}" field="publicationName"/></span>
				</g:if>
            </div>

            <div class="control-group">
                <g:if test="${publicationInstance?.published}">
                    <span id="Name-label" class="label"><i class="icon-globe"></i><g:message code="publication.published.label" default="Is Published" /></span>
                    <span class="property-value" aria-labelledby="published-label"><g:fieldValue bean="${publicationInstance}" field="published"/></span>
                </g:if>
            </div>

            <div class="control-group">
                <g:if test="${publicationInstance?.publishedemail}">
                    <span id="Name-label" class="label"><i class="icon-envelope"></i><g:message code="publication.publishedemail.label" default="Publication emailed" /></span>
                    <span class="property-value" aria-labelledby="publishedemail-label"><g:fieldValue bean="${publicationInstance}" field="publishedemail"/></span>
                </g:if>
            </div>

            <div class="control-group">
                <g:if test="${publicationInstance?.pubproduct}">
                    <span id="label" class="label"><i class="icon-info-sign"></i><g:message code="pubproduct.pubproduct.label" default="Product" /></span>
                        <g:each in="${publicationInstance.pubproduct}" var="p">
                            <span class="property-value" aria-labelledby="pubtags-label"><g:link controller="pubproduct" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                        </g:each>
                </g:if>
            </div>
<!-- TAGS -->
            <div class="control-group">
                <g:if test="${publicationInstance?.pubtags}">
                    <li class="fieldcontain">
                        <span id="pubtags-label" class="property-label"><g:message code="publication.pubtags.label" default="Publication tags" /></span>
                        <g:each in="${publicationInstance.pubtags}" var="p">
                            <span class="property-value" aria-labelledby="pubtags-label"><g:link controller="publicationTag" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                        </g:each>
                    </li>
                </g:if>
             </div>
<!-- DATES ---->
            <div class="control-group">
                    <g:if test="${publicationInstance?.publisheddate}">
                        <span id="publisheddate-label" class="property-label"><g:message code="publication.publisheddate.label" default="Date published" /></span>
                        <span class="property-value" aria-labelledby="publisheddate-label"><g:formatDate date="${publicationInstance?.publisheddate}" /></span>
                    </g:if>
            </div>
            <div class="control-group">
                    <g:if test="${publicationInstance?.dateCreated}">
                        <span id="dateCreated-label" class="property-label"><g:message code="publication.dateCreated.label" default="Date created" /></span>
                        <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${publicationInstance?.dateCreated}" /></span>
                    </g:if>
            </div>
            <div class="control-group">
                    <g:if test="${publicationInstance?.lastUpdated}">
                        <span id="lastUpdated-label" class="property-label"><g:message code="publication.lastUpdated.label" default="Last updated" /></span>
                        <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${publicationInstance?.lastUpdated}" /></span>
                    </g:if>
            </div>
            <div class="control-group">
                <g:if test="${publicationInstance?.version}">
                    <span id="version-label" class="property-label"><g:message code="publication.version.label" default="Document edit version" /></span>
                    <span class="property-value" aria-labelledby="version-label"><g:fieldValue field="version" bean="${publicationInstance}" /></span>
                </g:if>
            </div>
     </div>
<!-- CONTENT -->
    <div class="span8">
          %{--<div class="well">--}%
      <div id="pubcontent">
        <g:if test="${publicationInstance?.publicationContent}">

            <span class="property-value" aria-labelledby="publicationContent-label"><markdown:renderHtml><xwiki:render><%=publicationInstance?.publicationContent%></xwiki:render></markdown:renderHtml></span>

          </g:if>
      </div>
              <xwiki:render>
                  = Message Macro Warning Message =
                  {{message}}
                  comment here...(not be rendered)
                  {{/message}}
              </xwiki:render>

              <div class="box warningmessage"><xwiki:render> {{info}}This is an informational message{{/info}}</xwiki:render></div>

              <xwiki:render>{{warning}}This is a warning message{{/warning}}</xwiki:render>

              <xwiki:render>{{error}}This is an error message{{/error}}</xwiki:render>

              <xwiki:render>{{box title="==Quick breakfast== " image="http://farm4.static.flickr.com/3260/2894738978_ca0d3afd07_t_d.jpg"}}
              * cheese
              * omelet
              * milk
              {{/box}}</xwiki:render>

              <xwiki:render>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
Vivamus lacus est, euismod at, lobortis eu, rhoncus et,
leo{{footnote}}This is some text from www.lipsum.com{{/footnote}}.</xwiki:render>

              <xwiki:render>{{html wiki="true"}}
                  <table>
                      <tr>
                          <td>
                              * listitem
                          </td>
                      </tr>
                  </table>
                  {{/html}}</xwiki:render>

              <xwiki:render>{{toc start=2 depth=6 numbered=false scope=page /}}
              {{toc /}}

= Level 1

Hello

== Level 2</xwiki:render>

              <xwiki:render>{{box cssClass="floatinginfobox" title="**Contents**"}}{{toc/}}{{/box}}

= Level 1

Hello

== Level 2</xwiki:render>
              <xwiki:render>{{toc numbered="true"/}}

= Level 1
== Level 2
== Level 3
= Level 4
== Level 5</xwiki:render>
          <!--------------------------------------------------------->

          <zing:chart type="area" width="700" height="350"
                      container="acceptToConvertChart" data="${data}" xLabels="${labels}" effect="4" />

          <!--------------------------------------------------------->
      </div>
    </div>


</div>

<!--------------------------------------------tetsing chartings ------------------------>
<!-- BACK --->
    <g:form>
        <fieldset class="buttons">
            <a href="#top"> Back To Top</a>
        </fieldset>
    </g:form>

  </body>
</html>
<!-- todo - insert document version to show page -maybe allow a link through to history page -->
<!-- todo - http://aehlke.github.com/tag-it/ for jquery tag form field-->
<!-- todo - fix redirect on delete action to redirect to portfolio/show/$id  not list-->
<!-- todo - add in url shortener and published url when user is not logged in based on published flag set to yes. -->