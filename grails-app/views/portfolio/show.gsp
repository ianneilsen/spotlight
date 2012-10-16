
<%@ page import="spotlight.content.Portfolio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reportSite.label', default: 'ReportSite')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reportSite" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/reportSite/List')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reportSite" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reportSite">
			
				<g:if test="${reportSiteInstance?.siteName}">
				<li class="fieldcontain">
					<span id="siteName-label" class="property-label"><g:message code="reportSite.siteName.label" default="Site Name" /></span>
					
						<span class="property-value" aria-labelledby="siteName-label"><g:fieldValue bean="${reportSiteInstance}" field="siteName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportSiteInstance?.sdescription}">
				<li class="fieldcontain">
					<span id="sdescription-label" class="property-label"><g:message code="reportSite.sdescription.label" default="Site Description" /></span>
					
						<span class="property-value" aria-labelledby="sdescription-label"><g:fieldValue bean="${reportSiteInstance}" field="sdescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportSiteInstance?.spublished}">
				<li class="fieldcontain">
					<span id="spublished-label" class="property-label"><g:message code="reportSite.spublished.label" default="Site wide publishing" /></span>
					
						<span class="property-value" aria-labelledby="spublished-label"><g:fieldValue bean="${reportSiteInstance}" field="spublished"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportSiteInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="reportSite.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${reportSiteInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportSiteInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="reportSite.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${reportSiteInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportSiteInstance?.reportprofile}">
				<li class="fieldcontain">
					<span id="reportprofile-label" class="property-label"><g:message code="reportSite.reportprofile.label" default="Site Admin" /></span>
					
						<span class="property-value" aria-labelledby="reportprofile-label"><g:link controller="reportProfile" action="show" id="${reportSiteInstance?.reportprofile?.id}">${reportSiteInstance?.reportprofile?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportSiteInstance?.reports}">
				<li class="fieldcontain">
					<span id="reports-label" class="property-label"><g:message code="reportSite.reports.label" default="Reports" /></span>
					
						<g:each in="${reportSiteInstance.reports}" var="r">
						<span class="property-value" aria-labelledby="reports-label"><g:link controller="report" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reportSiteInstance?.id}" />
					<g:link class="edit" action="edit" id="${reportSiteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<a href="#" rel="tooltip" title="Watch it this deletes the entire site">
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</a>
				</fieldset>
			</g:form>
		</div>
		
	</body>
</html>
