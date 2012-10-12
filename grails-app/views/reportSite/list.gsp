
<%@ page import="spotlight.content.ReportSite" %>
<%@ page import="spotlight.content.ReportProfile" %>
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
					    
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reportSiteInstanceList}" status="i" var="reportSiteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reportSiteInstance.id}">${fieldValue(bean: reportSiteInstance, field: "siteName")}</g:link></td>
					
						<td>${fieldValue(bean: reportSiteInstance, field: "sdescription")}</td>
					
						<td>${fieldValue(bean: reportSiteInstance, field: "spublished")}</td>
					
						<td><g:formatDate date="${reportSiteInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${reportSiteInstance.lastUpdated}" /></td>
						
								
						<td><g:link controller="reportProfile" action="show" id="${reportSiteInstance?.reportprofile?.id}">${reportSiteInstance?.reportprofile?.encodeAsHTML()}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reportSiteInstanceTotal}" />
			</div>
		</div>
		
		 <g:render template="/reportSite/weblist" />
		
		 
		  
		
	</body>
</html>
