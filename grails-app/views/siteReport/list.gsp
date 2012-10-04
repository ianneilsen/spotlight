
<%@ page import="spotlight.content.SiteReport" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteReport.label', default: 'SiteReport')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-siteReport" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-siteReport" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="reportName" title="${message(code: 'siteReport.reportName.label', default: 'reportName')}" />
					
						<g:sortableColumn property="reportcontent" title="${message(code: 'siteReport.reportcontent.label', default: 'Reportcontent')}" />
					
						<g:sortableColumn property="publisheddate" title="${message(code: 'siteReport.publisheddate.label', default: 'Publisheddate')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'siteReport.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'siteReport.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="siteReport.sitedetail.label" default="Sitedetail" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${siteReportInstanceList}" status="i" var="siteReportInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${siteReportInstance.id}">${fieldValue(bean: siteReportInstance, field: "reportName")}</g:link></td>
					
						<td>${fieldValue(bean: siteReportInstance, field: "reportcontent")}</td>
					
						<td><g:formatDate date="${siteReportInstance.publisheddate}" /></td>
					
						<td><g:formatDate date="${siteReportInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${siteReportInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: siteReportInstance, field: "sitedetail")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${siteReportInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
