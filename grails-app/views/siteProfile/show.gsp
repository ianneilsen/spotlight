
<%@ page import="spotlight.content.SiteProfile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteProfile.label', default: 'SiteProfile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-siteProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-siteProfile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list siteProfile">
			
				<g:if test="${siteProfileInstance?.siteadmin}">
				<li class="fieldcontain">
					<span id="siteadmin-label" class="property-label"><g:message code="siteProfile.siteadmin.label" default="Siteadmin" /></span>
					
						<span class="property-value" aria-labelledby="siteadmin-label"><g:fieldValue bean="${siteProfileInstance}" field="siteadmin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteProfileInstance?.siteemail}">
				<li class="fieldcontain">
					<span id="siteemail-label" class="property-label"><g:message code="siteProfile.siteemail.label" default="Siteemail" /></span>
					
						<span class="property-value" aria-labelledby="siteemail-label"><g:fieldValue bean="${siteProfileInstance}" field="siteemail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteProfileInstance?.sitecc}">
				<li class="fieldcontain">
					<span id="sitecc-label" class="property-label"><g:message code="siteProfile.sitecc.label" default="Sitecc" /></span>
					
						<span class="property-value" aria-labelledby="sitecc-label"><g:fieldValue bean="${siteProfileInstance}" field="sitecc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteProfileInstance?.sitefilestore}">
				<li class="fieldcontain">
					<span id="sitefilestore-label" class="property-label"><g:message code="siteProfile.sitefilestore.label" default="Sitefilestore" /></span>
					
						<span class="property-value" aria-labelledby="sitefilestore-label"><g:fieldValue bean="${siteProfileInstance}" field="sitefilestore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteProfileInstance?.siteupload}">
				<li class="fieldcontain">
					<span id="siteupload-label" class="property-label"><g:message code="siteProfile.siteupload.label" default="Siteupload" /></span>
					
						<span class="property-value" aria-labelledby="siteupload-label"><g:fieldValue bean="${siteProfileInstance}" field="siteupload"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteProfileInstance?.sitecolor}">
				<li class="fieldcontain">
					<span id="sitecolor-label" class="property-label"><g:message code="siteProfile.sitecolor.label" default="Sitecolor" /></span>
					
						<span class="property-value" aria-labelledby="sitecolor-label"><g:fieldValue bean="${siteProfileInstance}" field="sitecolor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteProfileInstance?.sitehtml}">
				<li class="fieldcontain">
					<span id="sitehtml-label" class="property-label"><g:message code="siteProfile.sitehtml.label" default="Sitehtml" /></span>
					
						<span class="property-value" aria-labelledby="sitehtml-label"><g:fieldValue bean="${siteProfileInstance}" field="sitehtml"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteProfileInstance?.bugzillaproduct}">
				<li class="fieldcontain">
					<span id="bugzillaproduct-label" class="property-label"><g:message code="siteProfile.bugzillaproduct.label" default="Bugzillaproduct" /></span>
					
						<span class="property-value" aria-labelledby="bugzillaproduct-label"><g:fieldValue bean="${siteProfileInstance}" field="bugzillaproduct"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteProfileInstance?.bugzillacomponent}">
				<li class="fieldcontain">
					<span id="bugzillacomponent-label" class="property-label"><g:message code="siteProfile.bugzillacomponent.label" default="Bugzillacomponent" /></span>
					
						<span class="property-value" aria-labelledby="bugzillacomponent-label"><g:fieldValue bean="${siteProfileInstance}" field="bugzillacomponent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteProfileInstance?.rtqueue}">
				<li class="fieldcontain">
					<span id="rtqueue-label" class="property-label"><g:message code="siteProfile.rtqueue.label" default="Rtqueue" /></span>
					
						<span class="property-value" aria-labelledby="rtqueue-label"><g:fieldValue bean="${siteProfileInstance}" field="rtqueue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteProfileInstance?.teamqueueemail}">
				<li class="fieldcontain">
					<span id="teamqueueemail-label" class="property-label"><g:message code="siteProfile.teamqueueemail.label" default="Teamqueueemail" /></span>
					
						<span class="property-value" aria-labelledby="teamqueueemail-label"><g:fieldValue bean="${siteProfileInstance}" field="teamqueueemail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteProfileInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="siteProfile.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${siteProfileInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteProfileInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="siteProfile.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${siteProfileInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${siteProfileInstance?.id}" />
					<g:link class="edit" action="edit" id="${siteProfileInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
