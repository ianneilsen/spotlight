
<%@ page import="spotlight.content.Report" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-report" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/reportSite/List')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-report" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /> for <g:link controller="reportSite" action="show" id="${reportInstance?.reportsite?.id}">${reportInstance?.reportsite?.encodeAsHTML()}</g:link> </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list report">
			
				<g:if test="${reportInstance?.reportName}">
				<li class="fieldcontain">
					<span id="reportName-label" class="property-label"><g:message code="report.reportName.label" default="Report Name" /></span>
					
						<span class="property-value" aria-labelledby="reportName-label"><g:fieldValue bean="${reportInstance}" field="reportName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportInstance?.reportcontent}">
				<li class="fieldcontain">
					<span id="reportcontent-label" class="property-label"><g:message code="report.reportcontent.label" default="Report Content" /></span>
					
						<span class="property-value" aria-labelledby="reportcontent-label"><g:fieldValue bean="${reportInstance}" field="reportcontent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportInstance?.published}">
				<li class="fieldcontain">
					<span id="published-label" class="property-label"><g:message code="report.published.label" default="Is Published" /></span>
					
						<span class="property-value" aria-labelledby="published-label"><g:fieldValue bean="${reportInstance}" field="published"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportInstance?.publisheddate}">
				<li class="fieldcontain">
					<span id="publisheddate-label" class="property-label"><g:message code="report.publisheddate.label" default="Published Date" /></span>
					
						<span class="property-value" aria-labelledby="publisheddate-label"><g:formatDate date="${reportInstance?.publisheddate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="report.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${reportInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="report.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${reportInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportInstance?.reportsite}">
				<li class="fieldcontain">
					<span id="reportsite-label" class="property-label"><g:message code="report.reportsite.label" default="Back to list for Site" /></span>
					
						<span class="property-value" aria-labelledby="reportsite-label"><g:link controller="reportSite" action="show" id="${reportInstance?.reportsite?.id}">${reportInstance?.reportsite?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportInstance?.tags}">
				<li class="fieldcontain">
					<span id="tags-label" class="property-label"><g:message code="report.tags.label" default="Tags" /></span>
					
						<g:each in="${reportInstance.tags}" var="t">
						<span class="property-value" aria-labelledby="tags-label"><g:link controller="publicationTag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reportInstance?.id}" />
					<g:link class="edit" action="edit" id="${reportInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
