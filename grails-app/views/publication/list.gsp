
<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.content.Portfolio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <r:require modules="bootstrap"/>
	</head>
	<body>
    <div class="navbar1">
        <ul class="nav1">

				<li><a class="home" href="${createLink(uri: '/portfolio/list')}"><g:message code="default.home.label"/></a></li>

			</ul>
		</div>
		<div id="list-publication" class="content scaffold-list" role="main">
			<h4><g:message code="default.list.label" args="[entityName]" /> |<h6>Number of publications: ${spotlight.content.Publication.list().size()}</h6></h4>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="publicationName" title="${message(code: 'publication.publicationName.label', default: 'Publication Name')}" />
					
						<g:sortableColumn property="publicationContent" title="${message(code: 'publication.publicationContent.label', default: 'Publication Content')}" />
					
						<g:sortableColumn property="published" title="${message(code: 'publication.published.label', default: 'Published')}" />
					
						<g:sortableColumn property="publisheddate" title="${message(code: 'publication.publisheddate.label', default: 'Published Date')}" />

                        <g:sortableColumn property="publishedemail" title="${message(code: 'publication.publishedemail.label', default: 'Published Email')}" />

						<g:sortableColumn property="dateCreated" title="${message(code: 'publication.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'publication.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${publicationInstanceList}" status="i" var="publicationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${publicationInstance.id}">${fieldValue(bean: publicationInstance, field: "publicationName")}</g:link></td>
					
						<td>${fieldValue(bean: publicationInstance, field: "publicationContent")}</td>

                        <td> <g:if test="${publicationInstance.published=="Yes"}"><p class="label label-success">${fieldValue(bean: publicationInstance, field: "published")}</p></g:if>
                            <g:else><p class="label label-important">${fieldValue(bean: publicationInstance, field: "published")}</p></g:else>
                        </td>
					
						<td><g:formatDate date="${publicationInstance.publisheddate}" /></td>

                        <td>${fieldValue(bean: publicationInstance, field: "publishedemail")}</td>
					
						<td><g:formatDate date="${publicationInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${publicationInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
                 <g:paginate total="${publicationInstanceTotal}" />

			</div>
		</div>
	</body>
</html>
