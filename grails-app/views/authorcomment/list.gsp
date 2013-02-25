
<%@ page import="spotlight.comments.Authorcomment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'authorcomment.label', default: 'Authorcomment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-authorcomment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-authorcomment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="authorcomments" title="${message(code: 'authorcomment.authorcomments.label', default: 'Authorcomments')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'authorcomment.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="authorcomment.publications.label" default="Publications" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${authorcommentInstanceList}" status="i" var="authorcommentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${authorcommentInstance.id}">${fieldValue(bean: authorcommentInstance, field: "authorcomments")}</g:link></td>
					
						<td><g:formatDate date="${authorcommentInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: authorcommentInstance, field: "publications")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${authorcommentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
