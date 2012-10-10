
<%@ page import="spotlight.content.ReportProfile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reportProfile.label', default: 'ReportProfile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reportProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reportProfile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="siteadmin" title="${message(code: 'reportProfile.siteadmin.label', default: 'Siteadmin')}" />
					
						<g:sortableColumn property="siteemail" title="${message(code: 'reportProfile.siteemail.label', default: 'Siteemail')}" />
					
						<g:sortableColumn property="sitecc" title="${message(code: 'reportProfile.sitecc.label', default: 'Sitecc')}" />
					
						<g:sortableColumn property="sitefilestore" title="${message(code: 'reportProfile.sitefilestore.label', default: 'Sitefilestore')}" />
					
						<g:sortableColumn property="siteupload" title="${message(code: 'reportProfile.siteupload.label', default: 'Siteupload')}" />
					
						<g:sortableColumn property="sitecolor" title="${message(code: 'reportProfile.sitecolor.label', default: 'Sitecolor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reportProfileInstanceList}" status="i" var="reportProfileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reportProfileInstance.id}">${fieldValue(bean: reportProfileInstance, field: "siteadmin")}</g:link></td>
					
						<td>${fieldValue(bean: reportProfileInstance, field: "siteemail")}</td>
					
						<td>${fieldValue(bean: reportProfileInstance, field: "sitecc")}</td>
					
						<td>${fieldValue(bean: reportProfileInstance, field: "sitefilestore")}</td>
					
						<td>${fieldValue(bean: reportProfileInstance, field: "siteupload")}</td>
					
						<td>${fieldValue(bean: reportProfileInstance, field: "sitecolor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reportProfileInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
