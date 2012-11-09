
<%@ page import="spotlight.pubtemplates.Templateemail" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'templateemail.label', default: 'Email template')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-templateemail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-templateemail" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tplnameemail" title="${message(code: 'templateemail.tplnameemail.label', default: 'Template Name')}" />
					
						<g:sortableColumn property="tplcontentemail" title="${message(code: 'templateemail.tplcontentemail.label', default: 'Template Layout')}" />
					
						<th><g:message code="templateemail.portfolio.label" default="Portfolio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${templateemailInstanceList}" status="i" var="templateemailInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${templateemailInstance.id}">${fieldValue(bean: templateemailInstance, field: "tplnameemail")}</g:link></td>
					
						<td>${fieldValue(bean: templateemailInstance, field: "tplcontentemail")}</td>
					
						<td>${fieldValue(bean: templateemailInstance, field: "portfolio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${templateemailInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
