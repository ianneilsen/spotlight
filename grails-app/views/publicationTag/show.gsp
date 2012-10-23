
<%@ page import="spotlight.content.PublicationTag" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publicationTag.label', default: 'PublicationTag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-publicationTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-publicationTag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list publicationTag">
			
				<g:if test="${publicationTagInstance?.pubtagname}">
				<li class="fieldcontain">
					<span id="pubtagname-label" class="property-label"><g:message code="publicationTag.pubtagname.label" default="Pubtagname" /></span>
					
						<span class="property-value" aria-labelledby="pubtagname-label"><g:fieldValue bean="${publicationTagInstance}" field="pubtagname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicationTagInstance?.publications}">
				<li class="fieldcontain">
					<span id="publications-label" class="property-label"><g:message code="publicationTag.publications.label" default="Publications" /></span>
					
						<span class="property-value" aria-labelledby="publications-label"><g:link controller="publication" action="show" id="${publicationTagInstance?.publications?.id}">${publicationTagInstance?.publications?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${publicationTagInstance?.id}" />
					<g:link class="edit" action="edit" id="${publicationTagInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
