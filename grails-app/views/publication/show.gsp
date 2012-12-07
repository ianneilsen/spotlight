<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.content.Pubproduct" %>
<%@ page import="spotlight.pubtemplates.Templatepublication" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/html">
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
         <r:require modules="jquery,jquery-ui"/>
        %{--<script type="text/javascript" src="http://www.google.com/jsapi"></script>--}%
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'visualize.css.css')}" type="text/css">
        <g:javascript src="visualize.jQuery.js" />
%{--        <jqplot:resources/>
<zing:include />--}%
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

     <g:javascript>$('#table').visualize();</g:javascript>

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
<!---- action and site name ---->
	<div id="show-publication" class="content scaffold-show" role="main">
	    <h1><g:message code="default.show.label" args="[entityName]" /> for
            <g:if test="${publicationInstance?.portfolio}">
                <span class="property-value" aria-labelledby="portfolio-label">
                    <g:link controller="portfolio" action="show" id="${publicationInstance?.portfolio?.id}">${publicationInstance?.portfolio?.encodeAsHTML()}</g:link>
                </span>
            </g:if>
        </h1>
<!---- error reporting ---->
            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
<!---- sliding publication nav ---->
    <div id="slidenav">
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${publicationInstance?.id}" />
                <g:link class="edit" action="edit" id="${publicationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure you want to delete this publication?')}');" />
                <g:link class="edit" action="publicationClone" id="${publicationInstance?.id}"><g:message code="default.button.edit.label" default="publicationClone" /></g:link>
                <g:render template="navshow"/>
            </fieldset>
    </div>
<!---- publication content---->
<!-- row 1 -->
      <div class="row">
            <ol class="property-list publication">
				<g:if test="${publicationInstance?.publicationName}">
                    <div class="span2"><span id="Name-label" class="label"><i class="icon-asterisk"></i><g:message code="publication.publicationName.label" default="Publication name" /></span></div>
                    <div class="span3"><span class="property-value" aria-labelledby="publicationName-label"><g:fieldValue bean="${publicationInstance}" field="publicationName"/></span></div>
				</g:if>

                <g:if test="${publicationInstance?.published}">
                    <div class="span1"><span id="Name-label" class="label"><i class="icon-globe"></i><g:message code="publication.published.label" default="Is Published" /></span></div>
                    <div class="span1"><span class="property-value" aria-labelledby="published-label"><g:fieldValue bean="${publicationInstance}" field="published"/></span></div>
                </g:if>
                <g:if test="${publicationInstance?.publishedemail}">
                    <div class="span2"><span id="Name-label" class="label"><i class="icon-envelope"></i><g:message code="publication.publishedemail.label" default="Publication emailed" /></span></div>
                    <div class="span1"><span class="property-value" aria-labelledby="publishedemail-label"><g:fieldValue bean="${publicationInstance}" field="publishedemail"/></span></div>
                </g:if>
                <g:if test="${publicationInstance?.pubproduct}">
                    <div class="span1"><span id="label" class="label"><i class="icon-info-sign"></i><g:message code="pubproduct.pubproduct.label" default="Product" /></span></div>
                        <g:each in="${publicationInstance.pubproduct}" var="p">
                            <div class="span2"><span class="property-value" aria-labelledby="pubtags-label"><g:link controller="pubproduct" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span></div>
                        </g:each>
                </g:if>
      </div>

<!-- row 3 content -->
      <div class="row">
            <g:if test="${publicationInstance?.publicationContent}">
                <div class="span1"></div>
                <div class="span10"><span class="property-value" aria-labelledby="publicationContent-label"><markdown:renderHtml><%=publicationInstance?.publicationContent%></markdown:renderHtml></span></div>
                <div class="span1"></div>
            </g:if>
        1
      </div>

    <!--------------------------------------------tetsing chartings ------------------------>

    <table>
        <caption>2009 Employee Sales by Department</caption>
        <thead>
        <tr>
            <td></td>
            <th scope="col">food</th>
            <th scope="col">auto</th>
            <th scope="col">household</th>
            <th scope="col">furniture</th>
            <th scope="col">kitchen</th>
            <th scope="col">bath</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row">Mary</th>
            <td>190</td>
            <td>160</td>
            <td>40</td>
            <td>120</td>
            <td>30</td>
            <td>70</td>
        </tr>
        <tr>
            <th scope="row">Tom</th>
            <td>3</td>
            <td>40</td>
            <td>30</td>
            <td>45</td>
            <td>35</td>
            <td>49</td>
        </tr>

        </tbody>
    </table>

    <!----------------------------------------------------------------------------------------------------------
<!-- pubtags -->
           <g:if test="${publicationInstance?.pubtags}">
				<li class="fieldcontain">
					<span id="pubtags-label" class="property-label"><g:message code="publication.pubtags.label" default="Publication tags" /></span>
					    <g:each in="${publicationInstance.pubtags}" var="p">
						<span class="property-value" aria-labelledby="pubtags-label"><g:link controller="publicationTag" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
			</g:if>
   </ol>
   <div class="well well-small">
      <div class="row">
          <g:if test="${publicationInstance?.publisheddate}">
              <div class="span2"><span id="publisheddate-label" class="property-label"><i class="icon-globe"></i><g:message code="publication.publisheddate.label" default="Date published" /></span></div>
              <div class="span2"><span class="property-value" aria-labelledby="publisheddate-label"><g:formatDate date="${publicationInstance?.publisheddate}" /></span></div>
          </g:if>
          <g:if test="${publicationInstance?.dateCreated}">
             <div class="span2"><span id="dateCreated-label" class="property-label"><g:message code="publication.dateCreated.label" default="Date created" /></span></div>
             <div class="span2"><span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${publicationInstance?.dateCreated}" /></span></div>
          </g:if>
          <g:if test="${publicationInstance?.lastUpdated}">
              <div class="span2"><span id="lastUpdated-label" class="property-label"><g:message code="publication.lastUpdated.label" default="Last updated" /></span></div>
              <div class="span2"><span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${publicationInstance?.lastUpdated}" /></span></div>
          </g:if>
      </div>
   </div>

   <g:form>
    	<fieldset class="buttons">
	    	<a href="#top"> Back To Top</a>
        </fieldset>
    </g:form>
</div>

</body>
</html>
<!-- todo - insert document version to show page -maybe allow a link through to history page -->
<!-- todo - http://aehlke.github.com/tag-it/ for jquery tag form field-->
<!-- todo - fix redirect on delete action to redirect to portfolio/show/$id  not list-->
<!-- todo - add in url shortener and published url when user is not logged in based on published flag set to yes. -->