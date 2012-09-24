
<%@ page import="spotlight.grails.SiteDetail" %>
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
					
						<g:sortableColumn property="sdescription" title="${message(code: 'siteDetail.sdescription.label', default: 'Sdescription')}" />
					
						<g:sortableColumn property="spublished" title="${message(code: 'siteDetail.spublished.label', default: 'Spublished')}" />
						<g:sortableColumn property="sitehtml" title="${message(code: 'siteAdmin.sitehtml.label', default: 'sitehtml')}" />
						<g:sortableColumn property="siteemail" title="${message(code: 'siteAdmin.siteemail.lable', default: 'siteemail')}"/>

					</tr>
				</thead>
				<tbody>
				<g:each in="${siteDetailInstanceList}" status="i" var="siteDetailInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${siteDetailInstance.id}">${fieldValue(bean: siteDetailInstance, field: "sitename")}</g:link></td>
					
						<td>${fieldValue(bean: siteDetailInstance, field: "sdescription")}</td>
					
						<td>${fieldValue(bean: siteDetailInstance, field: "spublished")}</td>
						
						<td>${fieldValue(bean: siteAdminInstance, field: "sitehtml")}</tr>
						
						<td>${fieldValue(bean: siteAdminInstance, field: "siteemail")}</tr>
					
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
