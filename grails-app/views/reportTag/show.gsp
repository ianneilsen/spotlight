
<%@ page import="spotlight.content.ReportTag" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reportTag.label', default: 'ReportTag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reportTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/reportSite/List')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reportTag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reportTag">
			
				<g:if test="${reportTagInstance?.tagname}">
				<li class="fieldcontain">
					<span id="tagname-label" class="property-label"><g:message code="reportTag.tagname.label" default="Tagname" /></span>
					
						<span class="property-value" aria-labelledby="tagname-label"><g:fieldValue bean="${reportTagInstance}" field="tagname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportTagInstance?.reports}">
				<li class="fieldcontain">
					<span id="reports-label" class="property-label"><g:message code="reportTag.reports.label" default="Reports" /></span>
					
						<span class="property-value" aria-labelledby="reports-label"><g:link controller="report" action="show" id="${reportTagInstance?.reports?.id}">${reportTagInstance?.reports?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reportTagInstance?.id}" />
					<g:link class="edit" action="edit" id="${reportTagInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
