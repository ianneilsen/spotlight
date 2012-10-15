
<%@ page import="spotlight.content.Report; spotlight.content.ReportSite" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reportSite.label', default: 'ReportSite')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reportSite" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reportSite" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="siteName" title="${message(code: 'reportSite.siteName.label', default: 'Site Name')}" />
					
						<g:sortableColumn property="sdescription" title="${message(code: 'reportSite.sdescription.label', default: 'Site Info')}" />
					
						<g:sortableColumn property="spublished" title="${message(code: 'reportSite.spublished.label', default: 'Globally Published')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'reportSite.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'reportSite.lastUpdated.label', default: 'Last Updated')}" />
						
					    <g:sortableColumn property="siteadmin" title="${message(code: 'reportProfile.siteadmin.label', default: 'Site Admin')}" />

					                  // TODO: remove sorting on siteadmin column or fix. sorting not needed on column.
                                      // TODO: place table into side column. weblist will take precendence.
					</tr>
				</thead>
				<tbody>
				<g:each in="${reportSiteInstanceList}" status="i" var="rsi"> <!-- var=reportSiteInstance -->
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${rsi.id}">${fieldValue(bean: rsi, field: "siteName")}</g:link></td>
					
						<td>${fieldValue(bean: rsi, field: "sdescription")}</td>
					
						<td>${fieldValue(bean: rsi, field: "spublished")}</td>
					
						<td><g:formatDate date="${rsi.dateCreated}" /></td>
					
						<td><g:formatDate date="${rsi.lastUpdated}" /></td>
						
								
						<td><g:link controller="reportProfile" action="show" id="${rsi?.reportprofile?.id}">${rsi?.reportprofile?.encodeAsHTML()}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reportSiteInstanceTotal}" />
			</div>
		</div>

        <g:include controller="reportSite" action="_webList" />
	</body>
</html>
