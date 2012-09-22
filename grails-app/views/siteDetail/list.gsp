
<%@ page import="spotlight.SiteDetail" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteDetail.label', default: 'SiteDetail')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-siteDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-siteDetail" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="sitename" title="${message(code: 'siteDetail.sitename.label', default: 'Sitename')}" />
					
						<g:sortableColumn property="sitedescrip" title="${message(code: 'siteDetail.sitedescrip.label', default: 'Sitedescrip')}" />
					
						<g:sortableColumn property="sitepublished" title="${message(code: 'siteDetail.sitepublished.label', default: 'Sitepublished')}" />
					
						<th><g:message code="siteDetail.sitesummary.label" default="Sitesummary" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${siteDetailInstanceList}" status="i" var="siteDetailInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${siteDetailInstance.id}">${fieldValue(bean: siteDetailInstance, field: "sitename")}</g:link></td>
					
						<td>${fieldValue(bean: siteDetailInstance, field: "sitedescrip")}</td>
					
						<td>${fieldValue(bean: siteDetailInstance, field: "sitepublished")}</td>
					
						<td>${fieldValue(bean: siteDetailInstance, field: "sitesummary")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${siteDetailInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
