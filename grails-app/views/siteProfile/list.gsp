
<%@ page import="spotlight.content.SiteProfile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteProfile.label', default: 'SiteProfile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-siteProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-siteProfile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="siteadmin" title="${message(code: 'siteProfile.siteadmin.label', default: 'Siteadmin')}" />
					
						<g:sortableColumn property="siteemail" title="${message(code: 'siteProfile.siteemail.label', default: 'Siteemail')}" />
					
						<g:sortableColumn property="sitecc" title="${message(code: 'siteProfile.sitecc.label', default: 'Sitecc')}" />
					
						<g:sortableColumn property="sitefilestore" title="${message(code: 'siteProfile.sitefilestore.label', default: 'Sitefilestore')}" />
					
						<g:sortableColumn property="siteupload" title="${message(code: 'siteProfile.siteupload.label', default: 'Siteupload')}" />
					
						<g:sortableColumn property="sitecolor" title="${message(code: 'siteProfile.sitecolor.label', default: 'Sitecolor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${siteProfileInstanceList}" status="i" var="siteProfileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${siteProfileInstance.id}">${fieldValue(bean: siteProfileInstance, field: "siteadmin")}</g:link></td>
					
						<td>${fieldValue(bean: siteProfileInstance, field: "siteemail")}</td>
					
						<td>${fieldValue(bean: siteProfileInstance, field: "sitecc")}</td>
					
						<td>${fieldValue(bean: siteProfileInstance, field: "sitefilestore")}</td>
					
						<td>${fieldValue(bean: siteProfileInstance, field: "siteupload")}</td>
					
						<td>${fieldValue(bean: siteProfileInstance, field: "sitecolor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${siteProfileInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
