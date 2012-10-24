
<%@ page import="spotlight.content.Profile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/portfolio/list')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-profile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="portfolioAdmin" title="${message(code: 'profile.portfolioAdmin.label', default: 'Portfolio Admin')}" />
					
						<g:sortableColumn property="portfolioEmail" title="${message(code: 'profile.portfolioEmail.label', default: 'Portfolio Email')}" />
					
						<g:sortableColumn property="portfoliocc" title="${message(code: 'profile.portfoliocc.label', default: 'Portfoliocc')}" />
					
						<g:sortableColumn property="portfolioColor" title="${message(code: 'profile.portfolioColor.label', default: 'Portfolio Color')}" />
					
						<g:sortableColumn property="portfoliohtml" title="${message(code: 'profile.portfoliohtml.label', default: 'Portfoliohtml')}" />
					
						<g:sortableColumn property="siteupload" title="${message(code: 'profile.siteupload.label', default: 'Siteupload')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${profileInstanceList}" status="i" var="profileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${profileInstance.id}">${fieldValue(bean: profileInstance, field: "portfolioAdmin")}</g:link></td>
					
						<td>${fieldValue(bean: profileInstance, field: "portfolioEmail")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "portfoliocc")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "portfolioColor")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "portfoliohtml")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "siteupload")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${profileInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
