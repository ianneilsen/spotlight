
<%@ page import="spotlight.content.Portfolio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'portfolio.label', default: 'Portfolio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        	</head>
	<body>
		<a href="#list-portfolio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/portfolio/List')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
		</div>
		<div id="list-portfolio" class="content scaffold-list" role="main">
			<span class="label label-info"><g:message code="default.list.label" args="[entityName]" /> | Total number of sites: ${rsNumb}</span> </div>
            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="portfolioName" title="${message(code: 'portfolio.portfolioName.label', default: 'Portfolio Name')}" />
					
						<g:sortableColumn property="portdescrip" title="${message(code: 'portfolio.portdescrip.label', default: 'Portfolio Info')}" />
					
						<g:sortableColumn property="portpublished" title="${message(code: 'portfolio.portpublished.label', default: 'Portfolio Protected')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'portfolio.dateCreated.label', default: 'Portfolio Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'portfolio.lastUpdated.label', default: 'Portfolio Last Updated')}" />
					
						<th><g:message code="portfolio.profile.label" default="Profile" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${portfolioInstanceList}" status="i" var="portfolioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${portfolioInstance.id}">${fieldValue(bean: portfolioInstance, field: "portfolioName")}</g:link></td>
					
						<td>${fieldValue(bean: portfolioInstance, field: "portdescrip")}</td>
					
						<td>${fieldValue(bean: portfolioInstance, field: "portpublished")}</td>
					
						<td><g:formatDate date="${portfolioInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${portfolioInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: portfolioInstance, field: "profile")}</td>

                        <td><g:link controller="profile" action="show" id="${rsi?.profile?.id}">${rsi?.profile?.encodeAsHTML()}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${portfolioInstanceTotal}" />
			</div>
		</div>
    <g:include controller="portfolio" action="_webList" />
	</body>
</html>
