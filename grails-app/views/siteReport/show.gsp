
<%@ page import="spotlight.content.SiteReport" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteReport.label', default: 'SiteReport')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-siteReport" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-siteReport" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list siteReport">
			
				<g:if test="${siteReportInstance?.reportName}">
				<li class="fieldcontain">
					<span id="reportName-label" class="property-label"><g:message code="siteReport.reportName.label" default="reportName" /></span>
					
						<span class="property-value" aria-labelledby="reportName-label"><g:fieldValue bean="${siteReportInstance}" field="reportName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteReportInstance?.reportcontent}">
				<li class="fieldcontain">
					<span id="reportcontent-label" class="property-label"><g:message code="siteReport.reportcontent.label" default="Reportcontent" /></span>
					
						<span class="property-value" aria-labelledby="reportcontent-label"><g:fieldValue bean="${siteReportInstance}" field="reportcontent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteReportInstance?.publisheddate}">
				<li class="fieldcontain">
					<span id="publisheddate-label" class="property-label"><g:message code="siteReport.publisheddate.label" default="Publisheddate" /></span>
					
						<span class="property-value" aria-labelledby="publisheddate-label"><g:formatDate date="${siteReportInstance?.publisheddate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteReportInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="siteReport.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${siteReportInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteReportInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="siteReport.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${siteReportInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteReportInstance?.sitedetail}">
				<li class="fieldcontain">
					<span id="sitedetail-label" class="property-label"><g:message code="siteReport.sitedetail.label" default="Sitedetail" /></span>
					
						<span class="property-value" aria-labelledby="sitedetail-label"><g:link controller="siteDetail" action="show" id="${siteReportInstance?.sitedetail?.id}">${siteReportInstance?.sitedetail?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${siteReportInstance?.id}" />
					<g:link class="edit" action="edit" id="${siteReportInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
