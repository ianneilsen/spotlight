
<%@ page import="spotlight.pubtemplates.Templateemail" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'templateemail.label', default: 'Email Templates')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-templateemail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-templateemail" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list templateemail">
			
				<g:if test="${templateemailInstance?.tplnameemail}">
				<li class="fieldcontain">
					<span id="tplnameemail-label" class="property-label"><g:message code="templateemail.tplnameemail.label" default="Template Name" /></span>
					
						<span class="property-value" aria-labelledby="tplnameemail-label"><g:fieldValue bean="${templateemailInstance}" field="tplnameemail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${templateemailInstance?.tplcontentemail}">
				<li class="fieldcontain">
					<span id="tplcontentemail-label" class="property-label"><g:message code="templateemail.tplcontentemail.label" default="Template Layout" /></span>
					
						<span class="property-value" aria-labelledby="tplcontentemail-label"><g:fieldValue bean="${templateemailInstance}" field="tplcontentemail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${templateemailInstance?.portfolio}">
				<li class="fieldcontain">
					<span id="portfolio-label" class="property-label"><g:message code="templateemail.portfolio.label" default="Portfolio" /></span>
					
						<span class="property-value" aria-labelledby="portfolio-label"><g:link controller="portfolio" action="show" id="${templateemailInstance?.portfolio?.id}">${templateemailInstance?.portfolio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${templateemailInstance?.id}" />
					<g:link class="edit" action="edit" id="${templateemailInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
