
<%@ page import="spotlight.SiteSummary" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteSummary.label', default: 'SiteSummary')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-siteSummary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-siteSummary" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list siteSummary">
			
				<g:if test="${siteSummaryInstance?.adminaddr}">
				<li class="fieldcontain">
					<span id="adminaddr-label" class="property-label"><g:message code="siteSummary.adminaddr.label" default="Adminaddr" /></span>
					
						<span class="property-value" aria-labelledby="adminaddr-label"><g:fieldValue bean="${siteSummaryInstance}" field="adminaddr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteSummaryInstance?.ccaddr}">
				<li class="fieldcontain">
					<span id="ccaddr-label" class="property-label"><g:message code="siteSummary.ccaddr.label" default="Ccaddr" /></span>
					
						<span class="property-value" aria-labelledby="ccaddr-label"><g:fieldValue bean="${siteSummaryInstance}" field="ccaddr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteSummaryInstance?.htmlflag}">
				<li class="fieldcontain">
					<span id="htmlflag-label" class="property-label"><g:message code="siteSummary.htmlflag.label" default="Htmlflag" /></span>
					
						<span class="property-value" aria-labelledby="htmlflag-label"><g:fieldValue bean="${siteSummaryInstance}" field="htmlflag"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteSummaryInstance?.siteadmin}">
				<li class="fieldcontain">
					<span id="siteadmin-label" class="property-label"><g:message code="siteSummary.siteadmin.label" default="Siteadmin" /></span>
					
						<span class="property-value" aria-labelledby="siteadmin-label"><g:fieldValue bean="${siteSummaryInstance}" field="siteadmin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteSummaryInstance?.sitepad}">
				<li class="fieldcontain">
					<span id="sitepad-label" class="property-label"><g:message code="siteSummary.sitepad.label" default="Sitepad" /></span>
					
						<span class="property-value" aria-labelledby="sitepad-label"><g:fieldValue bean="${siteSummaryInstance}" field="sitepad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteSummaryInstance?.sitedetail}">
				<li class="fieldcontain">
					<span id="sitedetail-label" class="property-label"><g:message code="siteSummary.sitedetail.label" default="Sitedetail" /></span>
					
						<span class="property-value" aria-labelledby="sitedetail-label"><g:link controller="siteDetail" action="show" id="${siteSummaryInstance?.sitedetail?.id}">${siteSummaryInstance?.sitedetail?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${siteSummaryInstance?.id}" />
					<g:link class="edit" action="edit" id="${siteSummaryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
