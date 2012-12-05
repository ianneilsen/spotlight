
<%@ page import="spotlight.content.Pubproduct" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pubproduct.label', default: 'Pubproduct')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pubproduct" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		%{--<div class="nav" role="navigation">
			<ul>--}%
    <div class="navbar1">
        <ul class="nav1">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pubproduct" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="pubproduct" title="${message(code: 'pubproduct.pubproduct.label', default: 'Pubproduct')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pubproductInstanceList}" status="i" var="pubproductInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pubproductInstance.id}">${fieldValue(bean: pubproductInstance, field: "pubproduct")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pubproductInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
