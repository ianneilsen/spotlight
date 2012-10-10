
<%@ page import="spotlight.content.ReportProfile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reportProfile.label', default: 'ReportProfile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reportProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reportProfile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reportProfile">
			
				<g:if test="${reportProfileInstance?.siteadmin}">
				<li class="fieldcontain">
					<span id="siteadmin-label" class="property-label"><g:message code="reportProfile.siteadmin.label" default="Site Admin" /></span>
					
						<span class="property-value" aria-labelledby="siteadmin-label"><g:fieldValue bean="${reportProfileInstance}" field="siteadmin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportProfileInstance?.siteemail}">
				<li class="fieldcontain">
					<span id="siteemail-label" class="property-label"><g:message code="reportProfile.siteemail.label" default="Site Email" /></span>
					
						<span class="property-value" aria-labelledby="siteemail-label"><g:fieldValue bean="${reportProfileInstance}" field="siteemail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportProfileInstance?.sitecc}">
				<li class="fieldcontain">
					<span id="sitecc-label" class="property-label"><g:message code="reportProfile.sitecc.label" default="Site CC Email" /></span>
					
						<span class="property-value" aria-labelledby="sitecc-label"><g:fieldValue bean="${reportProfileInstance}" field="sitecc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportProfileInstance?.sitefilestore}">
				<li class="fieldcontain">
					<span id="sitefilestore-label" class="property-label"><g:message code="reportProfile.sitefilestore.label" default="Site filestore dir" /></span>
					
						<span class="property-value" aria-labelledby="sitefilestore-label"><g:fieldValue bean="${reportProfileInstance}" field="sitefilestore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportProfileInstance?.siteupload}">
				<li class="fieldcontain">
					<span id="siteupload-label" class="property-label"><g:message code="reportProfile.siteupload.label" default="Allow Site Uploads" /></span>
					
						<span class="property-value" aria-labelledby="siteupload-label"><g:fieldValue bean="${reportProfileInstance}" field="siteupload"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportProfileInstance?.sitecolor}">
				<li class="fieldcontain">
					<span id="sitecolor-label" class="property-label"><g:message code="reportProfile.sitecolor.label" default="Site reports css" /></span>
					
						<span class="property-value" aria-labelledby="sitecolor-label"><g:fieldValue bean="${reportProfileInstance}" field="sitecolor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportProfileInstance?.sitehtml}">
				<li class="fieldcontain">
					<span id="sitehtml-label" class="property-label"><g:message code="reportProfile.sitehtml.label" default="Allow HTML in site" /></span>
					
						<span class="property-value" aria-labelledby="sitehtml-label"><g:fieldValue bean="${reportProfileInstance}" field="sitehtml"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportProfileInstance?.bugzillaproduct}">
				<li class="fieldcontain">
					<span id="bugzillaproduct-label" class="property-label"><g:message code="reportProfile.bugzillaproduct.label" default="Bugzilla Product ID" /></span>
					
						<span class="property-value" aria-labelledby="bugzillaproduct-label"><g:fieldValue bean="${reportProfileInstance}" field="bugzillaproduct"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportProfileInstance?.bugzillacomponent}">
				<li class="fieldcontain">
					<span id="bugzillacomponent-label" class="property-label"><g:message code="reportProfile.bugzillacomponent.label" default="Bugzilla Component ID" /></span>
					
						<span class="property-value" aria-labelledby="bugzillacomponent-label"><g:fieldValue bean="${reportProfileInstance}" field="bugzillacomponent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportProfileInstance?.rtqueue}">
				<li class="fieldcontain">
					<span id="rtqueue-label" class="property-label"><g:message code="reportProfile.rtqueue.label" default="RT queue name" /></span>
					
						<span class="property-value" aria-labelledby="rtqueue-label"><g:fieldValue bean="${reportProfileInstance}" field="rtqueue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportProfileInstance?.teamqueueemail}">
				<li class="fieldcontain">
					<span id="teamqueueemail-label" class="property-label"><g:message code="reportProfile.teamqueueemail.label" default="RT queue email" /></span>
					
						<span class="property-value" aria-labelledby="teamqueueemail-label"><g:fieldValue bean="${reportProfileInstance}" field="teamqueueemail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportProfileInstance?.etherpadurl}">
				<li class="fieldcontain">
					<span id="etherpadurl-label" class="property-label"><g:message code="reportProfile.etherpadurl.label" default="Etherpad URL for reports" /></span>
					
						<span class="property-value" aria-labelledby="etherpadurl-label"><g:fieldValue bean="${reportProfileInstance}" field="etherpadurl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportProfileInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="reportProfile.dateCreated.label" default="Date Site Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${reportProfileInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportProfileInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="reportProfile.lastUpdated.label" default="Last Update to site" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${reportProfileInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reportProfileInstance?.id}" />
					<g:link class="edit" action="edit" id="${reportProfileInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
