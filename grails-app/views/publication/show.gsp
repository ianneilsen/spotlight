<%@ page import="spotlight.content.Publication" %>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
        <script type="text/javascript" src="http://www.google.com/jsapi"></script>
	</head>
	<body>
		<a href="#show-publication" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/portfolio/list')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-publication" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /> for
                <g:if test="${publicationInstance?.portfolio}">
                            <span class="property-value" aria-labelledby="portfolio-label"><g:link controller="portfolio" action="show" id="${publicationInstance?.portfolio?.id}">${publicationInstance?.portfolio?.encodeAsHTML()}</g:link></span>

                </g:if></h1>

            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list publication">
			
				<g:if test="${publicationInstance?.publicationName}">
				<li class="fieldcontain">
					<span id="publicationName-label" class="property-label"><g:message code="publication.publicationName.label" default="Publication Name" /></span>
					
						<span class="property-value" aria-labelledby="publicationName-label"><g:fieldValue bean="${publicationInstance}" field="publicationName"/></span>
					
				</li>
				</g:if>

				<g:if test="${publicationInstance?.published}">
				<li class="fieldcontain">
					<span id="published-label" class="property-label"><g:message code="publication.published.label" default="Is Published" /></span>
					
						<span class="property-value" aria-labelledby="published-label"><g:fieldValue bean="${publicationInstance}" field="published"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicationInstance?.publisheddate}">
				<li class="fieldcontain">
					<span id="publisheddate-label" class="property-label"><g:message code="publication.publisheddate.label" default="Publisheddate" /></span>
					
						<span class="property-value" aria-labelledby="publisheddate-label"><g:formatDate date="${publicationInstance?.publisheddate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicationInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="publication.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${publicationInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicationInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="publication.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${publicationInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>

                <g:if test="${publicationInstance?.publicationContent}">
                    <li class="fieldcontain">
                        <span id="publicationContent-label" class="property-label"><g:message code="publication.publicationContent.label" default="Publication Content" /></span>

                        <span class="property-value" aria-labelledby="publicationContent-label"><markdown:renderHtml><g:fieldValue bean="${publicationInstance}" field="publicationContent"/></markdown:renderHtml></span>

                    </li>
                </g:if>


				<g:if test="${publicationInstance?.pubtags}">
				<li class="fieldcontain">
					<span id="pubtags-label" class="property-label"><g:message code="publication.pubtags.label" default="Pubtags" /></span>
					
						<g:each in="${publicationInstance.pubtags}" var="p">
						<span class="property-value" aria-labelledby="pubtags-label"><g:link controller="publicationTag" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${publicationInstance?.id}" />
					<g:link class="edit" action="edit" id="${publicationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure you want to delete this publication?')}');" />
                    <a href="#top">Back To Top</a>
                </fieldset>
			</g:form>
		</div>
                              <!-- todo - fix redirect on delete action to redirect to portfolio/show/$id  not list-->
	</body>
</html>
