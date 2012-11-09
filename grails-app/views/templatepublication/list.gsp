
<%@ page import="spotlight.pubtemplates.Templatepublication" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'templatepublication.label', default: 'Publication templates')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-templatepublication" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-templatepublication" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tplnamepub" title="${message(code: 'templatepublication.tplnamepub.label', default: 'Template Name')}" />
					
						<g:sortableColumn property="tplcontentpub" title="${message(code: 'templatepublication.tplcontentpub.label', default: 'Template layout')}" />
					
						<th><g:message code="templatepublication.portfolio.label" default="Portfolio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${templatepublicationInstanceList}" status="i" var="templatepublicationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${templatepublicationInstance.id}">${fieldValue(bean: templatepublicationInstance, field: "tplnamepub")}</g:link></td>
					
						<td>${fieldValue(bean: templatepublicationInstance, field: "tplcontentpub")}</td>
					
						<td>${fieldValue(bean: templatepublicationInstance, field: "portfolio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${templatepublicationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
