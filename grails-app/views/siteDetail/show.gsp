
<%@ page import="spotlight.grails.SiteDetail" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteDetail.label', default: 'SiteDetail')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-siteDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-siteDetail" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list siteDetail">
			
				<g:if test="${siteDetailInstance?.sitename}">
				<li class="fieldcontain">
					<span id="sitename-label" class="property-label"><g:message code="siteDetail.sitename.label" default="Sitename" /></span>
					
						<span class="property-value" aria-labelledby="sitename-label"><g:fieldValue bean="${siteDetailInstance}" field="sitename"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteDetailInstance?.sdescription}">
				<li class="fieldcontain">
					<span id="sdescription-label" class="property-label"><g:message code="siteDetail.sdescription.label" default="Sdescription" /></span>
					
						<span class="property-value" aria-labelledby="sdescription-label"><g:fieldValue bean="${siteDetailInstance}" field="sdescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteDetailInstance?.spublished}">
				<li class="fieldcontain">
					<span id="spublished-label" class="property-label"><g:message code="siteDetail.spublished.label" default="Spublished" /></span>
					
						<span class="property-value" aria-labelledby="spublished-label"><g:fieldValue bean="${siteDetailInstance}" field="spublished"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${siteDetailInstance?.id}" />
					<g:link class="edit" action="edit" id="${siteDetailInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
