<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.content.Portfolio" %>
<!doctype html>
<html>

	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'portfolio.label', default: 'Portfolio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>

    </head>

<body>
		%{--<a href="#list-portfolio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
            <div class="navbar1">
                <ul class="nav1">
				    <li id="navHome" class="active"><a class="home" href="${createLink(uri: '/portfolio/List')}"><g:message code="Home"/></a></li>
				    <li id="navNew" class=""><g:link class="create" action="create"><g:message code="New portfolio" args="[entityName]" /></g:link></li>
                    <li id="navNew" class=""><g:link uri="/user/search"><g:message code="Site Administration" args="[entityName]" /></g:link></li>
                    <li id="navNew" class=""><g:link action="archivedportfolios"><g:message code="Archived portfolios" args="[entityName]" /></g:link></li>
                </ul>
		</div>
<section>
<div class="breadcrumb">
            <div id="list-portfolio" class="content scaffold-list" role="main">
			<span class="label label-info"><g:message code="default.list.label" args="[entityName]" />
                                    | Total number of sites: ${portfolioInstanceTotal}
                                    | Total number of publications: <strong>${spotlight.content.Publication.count()}
                                    | Total number of archived portfolios: <% notarchivedportfolios = Portfolio.findAllByStatus("Closed",[sort: "lastUpdated", order: "desc", offset: 0])%> ${notarchivedportfolios.size()}</strong></span> </div>
                     </div>
            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
<section>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="portfolioName" title="${message(code: 'portfolio.portfolioName.label', default: 'Portfolio Name')}" />
					
						<g:sortableColumn property="portdescrip" title="${message(code: 'portfolio.portdescrip.label', default: 'Portfolio Info')}" />
					
						<g:sortableColumn property="portpublished" title="${message(code: 'portfolio.portpublished.label', default: 'Portfolio Private')}" />
					
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

<g:include action="_webList" />

	</body>
</html>
