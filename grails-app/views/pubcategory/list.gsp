
<%@ page import="spotlight.content.Pubcategory" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pubcategory.label', default: 'Pubcategory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pubcategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pubcategory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="pubcategory" title="${message(code: 'pubcategory.pubcategory.label', default: 'Pubcategory')}" />
					
						<th><g:message code="pubcategory.publication.label" default="Publication" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pubcategoryInstanceList}" status="i" var="pubcategoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pubcategoryInstance.id}">${fieldValue(bean: pubcategoryInstance, field: "pubcategory")}</g:link></td>
					
						<td>${fieldValue(bean: pubcategoryInstance, field: "publication")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pubcategoryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
