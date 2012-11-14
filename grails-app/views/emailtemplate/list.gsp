
<%@ page import="spotlight.pubtemplates.Emailtemplate" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'emailtemplate.label', default: 'Emailtemplate')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-emailtemplate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-emailtemplate" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nameemailtemplate" title="${message(code: 'emailtemplate.nameemailtemplate.label', default: 'Nameemailtemplate')}" />
					
						<g:sortableColumn property="toemailtemplate" title="${message(code: 'emailtemplate.toemailtemplate.label', default: 'Toemailtemplate')}" />
					
						<g:sortableColumn property="ccemailtemplate" title="${message(code: 'emailtemplate.ccemailtemplate.label', default: 'Ccemailtemplate')}" />
					
						<g:sortableColumn property="contentemailtemplate" title="${message(code: 'emailtemplate.contentemailtemplate.label', default: 'Contentemailtemplate')}" />
					
						<g:sortableColumn property="footeremailtemplate" title="${message(code: 'emailtemplate.footeremailtemplate.label', default: 'Footeremailtemplate')}" />
					
						<th><g:message code="emailtemplate.portfolio.label" default="Portfolio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${emailtemplateInstanceList}" status="i" var="emailtemplateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${emailtemplateInstance.id}">${fieldValue(bean: emailtemplateInstance, field: "nameemailtemplate")}</g:link></td>
					
						<td>${fieldValue(bean: emailtemplateInstance, field: "toemailtemplate")}</td>
					
						<td>${fieldValue(bean: emailtemplateInstance, field: "ccemailtemplate")}</td>
					
						<td>${fieldValue(bean: emailtemplateInstance, field: "contentemailtemplate")}</td>
					
						<td>${fieldValue(bean: emailtemplateInstance, field: "footeremailtemplate")}</td>
					
						<td>${fieldValue(bean: emailtemplateInstance, field: "portfolio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${emailtemplateInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
