
<%@ page import="spotlight.pubtemplates.Emailtemplate" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'emailtemplate.label', default: 'Emailtemplate')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-emailtemplate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-emailtemplate" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list emailtemplate">
			
				<g:if test="${emailtemplateInstance?.nameemailtemplate}">
				<li class="fieldcontain">
					<span id="nameemailtemplate-label" class="property-label"><g:message code="emailtemplate.nameemailtemplate.label" default="Template Name" /></span>
					
						<span class="property-value" aria-labelledby="nameemailtemplate-label"><g:fieldValue bean="${emailtemplateInstance}" field="nameemailtemplate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${emailtemplateInstance?.toemailtemplate}">
				<li class="fieldcontain">
					<span id="toemailtemplate-label" class="property-label"><g:message code="emailtemplate.toemailtemplate.label" default="Email To:" /></span>
					
						<span class="property-value" aria-labelledby="toemailtemplate-label"><g:fieldValue bean="${emailtemplateInstance}" field="toemailtemplate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${emailtemplateInstance?.ccemailtemplate}">
				<li class="fieldcontain">
					<span id="ccemailtemplate-label" class="property-label"><g:message code="emailtemplate.ccemailtemplate.label" default="Email CC:" /></span>
					
						<span class="property-value" aria-labelledby="ccemailtemplate-label"><g:fieldValue bean="${emailtemplateInstance}" field="ccemailtemplate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${emailtemplateInstance?.contentemailtemplate}">
				<li class="fieldcontain">
					<span id="contentemailtemplate-label" class="property-label"><g:message code="emailtemplate.contentemailtemplate.label" default="Header Content" /></span>
					
						<span class="property-value" aria-labelledby="contentemailtemplate-label"><g:fieldValue bean="${emailtemplateInstance}" field="contentemailtemplate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${emailtemplateInstance?.footeremailtemplate}">
				<li class="fieldcontain">
					<span id="footeremailtemplate-label" class="property-label"><g:message code="emailtemplate.footeremailtemplate.label" default="Footer Content" /></span>
					
						<span class="property-value" aria-labelledby="footeremailtemplate-label"><g:fieldValue bean="${emailtemplateInstance}" field="footeremailtemplate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${emailtemplateInstance?.portfolio}">
				<li class="fieldcontain">
					<span id="portfolio-label" class="property-label"><g:message code="emailtemplate.portfolio.label" default="Portfolio" /></span>
					
						<span class="property-value" aria-labelledby="portfolio-label"><g:link controller="portfolio" action="show" id="${emailtemplateInstance?.portfolio?.id}">${emailtemplateInstance?.portfolio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${emailtemplateInstance?.id}" />
					<g:link class="edit" action="edit" id="${emailtemplateInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
