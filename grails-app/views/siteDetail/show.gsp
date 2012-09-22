
<%@ page import="spotlight.SiteDetail" %>
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
			
				<g:if test="${siteDetailInstance?.sitedescrip}">
				<li class="fieldcontain">
					<span id="sitedescrip-label" class="property-label"><g:message code="siteDetail.sitedescrip.label" default="Sitedescrip" /></span>
					
						<span class="property-value" aria-labelledby="sitedescrip-label"><g:fieldValue bean="${siteDetailInstance}" field="sitedescrip"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteDetailInstance?.sitepublished}">
				<li class="fieldcontain">
					<span id="sitepublished-label" class="property-label"><g:message code="siteDetail.sitepublished.label" default="Sitepublished" /></span>
					
						<span class="property-value" aria-labelledby="sitepublished-label"><g:fieldValue bean="${siteDetailInstance}" field="sitepublished"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteDetailInstance?.sitesummary}">
				<li class="fieldcontain">
					<span id="sitesummary-label" class="property-label"><g:message code="siteDetail.sitesummary.label" default="Sitesummary" /></span>
					
						<span class="property-value" aria-labelledby="sitesummary-label"><g:link controller="siteSummary" action="show" id="${siteDetailInstance?.sitesummary?.id}">${siteDetailInstance?.sitesummary?.encodeAsHTML()}</g:link></span>
					
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
