
<%@ page import="spotlight.SiteSummary" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteSummary.label', default: 'SiteSummary')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-siteSummary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-siteSummary" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="adminaddr" title="${message(code: 'siteSummary.adminaddr.label', default: 'Adminaddr')}" />
					
						<g:sortableColumn property="ccaddr" title="${message(code: 'siteSummary.ccaddr.label', default: 'Ccaddr')}" />
					
						<g:sortableColumn property="htmlflag" title="${message(code: 'siteSummary.htmlflag.label', default: 'Htmlflag')}" />
					
						<g:sortableColumn property="siteadmin" title="${message(code: 'siteSummary.siteadmin.label', default: 'Siteadmin')}" />
					
						<g:sortableColumn property="sitepad" title="${message(code: 'siteSummary.sitepad.label', default: 'Sitepad')}" />
					
						<th><g:message code="siteSummary.sitedetail.label" default="Sitedetail" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${siteSummaryInstanceList}" status="i" var="siteSummaryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${siteSummaryInstance.id}">${fieldValue(bean: siteSummaryInstance, field: "adminaddr")}</g:link></td>
					
						<td>${fieldValue(bean: siteSummaryInstance, field: "ccaddr")}</td>
					
						<td>${fieldValue(bean: siteSummaryInstance, field: "htmlflag")}</td>
					
						<td>${fieldValue(bean: siteSummaryInstance, field: "siteadmin")}</td>
					
						<td>${fieldValue(bean: siteSummaryInstance, field: "sitepad")}</td>
					
						<td>${fieldValue(bean: siteSummaryInstance, field: "sitedetail")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${siteSummaryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
