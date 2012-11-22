
<%@ page import="spotlight.pubtemplates.Templatepublication" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'templatepublication.label', default: 'publication template')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-templatepublication" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-templatepublication" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list templatepublication">
			
				<g:if test="${templatepublicationInstance?.tplnamepub}">
				<li class="fieldcontain">
					<span id="tplnamepub-label" class="property-label"><g:message code="templatepublication.tplnamepub.label" default="Template Name" /></span>
					
						<span class="property-value" aria-labelledby="tplnamepub-label"><g:fieldValue bean="${templatepublicationInstance}" field="tplnamepub"/></span>
					
				</li>
				</g:if>

                <g:if test="${templatepublicationInstance?.tplshare}">
                    <li class="fieldcontain">
                        <span id="tplshare-label" class="property-label"><g:message code="templatepublication.tplshare.label" default="Template shared" /></span>

                        <span class="property-value" aria-labelledby="tplshare-label"><g:fieldValue bean="${templatepublicationInstance}" field="tplshare"/></span>

                    </li>
                </g:if>

				<g:if test="${templatepublicationInstance?.tplcontentpub}">
				<li class="fieldcontain">
					<span id="tplcontentpub-label" class="property-label"><g:message code="templatepublication.tplcontentpub.label" default="Template layout" /></span>
					
						<span class="property-value" aria-labelledby="tplcontentpub-label"><g:fieldValue bean="${templatepublicationInstance}" field="tplcontentpub"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${templatepublicationInstance?.portfolio}">
				<li class="fieldcontain">
					<span id="portfolio-label" class="property-label"><g:message code="templatepublication.portfolio.label" default="Portfolio" /></span>
					
						<span class="property-value" aria-labelledby="portfolio-label"><g:link controller="portfolio" action="show" id="${templatepublicationInstance?.portfolio?.id}">${templatepublicationInstance?.portfolio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${templatepublicationInstance?.id}" />
					<g:link class="edit" action="edit" id="${templatepublicationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
