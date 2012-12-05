
<%@ page import="spotlight.content.PublicationTag" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publicationTag.label', default: 'PublicationTag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-publicationTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		%{--<div class="nav" role="navigation">
			<ul>--}%
    <div class="navbar1">
        <ul class="nav1">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-publicationTag" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="pubtagname" title="${message(code: 'publicationTag.pubtagname.label', default: 'Pubtagname')}" />
					
						<th><g:message code="publicationTag.publications.label" default="Publications" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${publicationTagInstanceList}" status="i" var="publicationTagInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${publicationTagInstance.id}">${fieldValue(bean: publicationTagInstance, field: "pubtagname")}</g:link></td>
					
						<td>${fieldValue(bean: publicationTagInstance, field: "publications")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${publicationTagInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
