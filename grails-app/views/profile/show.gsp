
<%@ page import="spotlight.content.Profile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		%{--<div class="nav" role="navigation">
			<ul>--}%
    <div class="navbar1">
        <ul class="nav1">
				<li><a class="home" href="${createLink(uri: '/portfolio/list')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-profile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list profile">
			
				<g:if test="${profileInstance?.portfolioAdmin}">
				<li class="fieldcontain">
					<span id="portfolioAdmin-label" class="property-label"><g:message code="profile.portfolioAdmin.label" default="Portfolio Admin" /></span>
					
						<span class="property-value" aria-labelledby="portfolioAdmin-label"><g:fieldValue bean="${profileInstance}" field="portfolioAdmin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.portfolioEmail}">
				<li class="fieldcontain">
					<span id="portfolioEmail-label" class="property-label"><g:message code="profile.portfolioEmail.label" default="Portfolio Email" /></span>
					
						<span class="property-value" aria-labelledby="portfolioEmail-label"><g:fieldValue bean="${profileInstance}" field="portfolioEmail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.portfoliocc}">
				<li class="fieldcontain">
					<span id="portfoliocc-label" class="property-label"><g:message code="profile.portfoliocc.label" default="Portfoliocc" /></span>
					
						<span class="property-value" aria-labelledby="portfoliocc-label"><g:fieldValue bean="${profileInstance}" field="portfoliocc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.portfolioColor}">
				<li class="fieldcontain">
					<span id="portfolioColor-label" class="property-label"><g:message code="profile.portfolioColor.label" default="Portfolio Color" /></span>
					
						<span class="property-value" aria-labelledby="portfolioColor-label"><g:fieldValue bean="${profileInstance}" field="portfolioColor"/></span>
					
				</li>
				</g:if>
			
%{--				<g:if test="${profileInstance?.htmlpuballowed}">
				<li class="fieldcontain">
					<span id="htmlpuballowed-label" class="property-label"><g:message code="profile.htmlpuballowed.label" default="htmlpuballowed" /></span>
					
						<span class="property-value" aria-labelledby="htmlpuballowed-label"><g:fieldValue bean="${profileInstance}" field="htmlpuballowed"/></span>
					
				</li>
				</g:if>--}%
			
%{--				<g:if test="${profileInstance?.siteupload}">
				<li class="fieldcontain">
					<span id="siteupload-label" class="property-label"><g:message code="profile.siteupload.label" default="Siteupload" /></span>
					
						<span class="property-value" aria-labelledby="siteupload-label"><g:fieldValue bean="${profileInstance}" field="siteupload"/></span>
					
				</li>
				</g:if>--}%
			
				<g:if test="${profileInstance?.portfolioFilestore}">
				<li class="fieldcontain">
					<span id="portfolioFilestore-label" class="property-label"><g:message code="profile.portfolioFilestore.label" default="Portfolio Filestore" /></span>
					
						<span class="property-value" aria-labelledby="portfolioFilestore-label"><g:fieldValue bean="${profileInstance}" field="portfolioFilestore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.bugzillaproduct}">
				<li class="fieldcontain">
					<span id="bugzillaproduct-label" class="property-label"><g:message code="profile.bugzillaproduct.label" default="Bugzillaproduct" /></span>
					
						<span class="property-value" aria-labelledby="bugzillaproduct-label"><g:fieldValue bean="${profileInstance}" field="bugzillaproduct"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.bugzillacomponent}">
				<li class="fieldcontain">
					<span id="bugzillacomponent-label" class="property-label"><g:message code="profile.bugzillacomponent.label" default="Bugzillacomponent" /></span>
					
						<span class="property-value" aria-labelledby="bugzillacomponent-label"><g:fieldValue bean="${profileInstance}" field="bugzillacomponent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.rtqueue}">
				<li class="fieldcontain">
					<span id="rtqueue-label" class="property-label"><g:message code="profile.rtqueue.label" default="Rtqueue" /></span>
					
						<span class="property-value" aria-labelledby="rtqueue-label"><g:fieldValue bean="${profileInstance}" field="rtqueue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.teamqueueemail}">
				<li class="fieldcontain">
					<span id="teamqueueemail-label" class="property-label"><g:message code="profile.teamqueueemail.label" default="Teamqueueemail" /></span>
					
						<span class="property-value" aria-labelledby="teamqueueemail-label"><g:fieldValue bean="${profileInstance}" field="teamqueueemail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.etherpadurl}">
				<li class="fieldcontain">
					<span id="etherpadurl-label" class="property-label"><g:message code="profile.etherpadurl.label" default="Etherpadurl" /></span>
					
						<span class="property-value" aria-labelledby="etherpadurl-label"><g:fieldValue bean="${profileInstance}" field="etherpadurl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="profile.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${profileInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="profile.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${profileInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.portfolio}">
				<li class="fieldcontain">
					<span id="portfolio-label" class="property-label"><g:message code="profile.portfolio.label" default="Portfolio" /></span>
					
						<span class="property-value" aria-labelledby="portfolio-label"><g:link controller="portfolio" action="show" id="${profileInstance?.portfolio?.id}">${profileInstance?.portfolio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${profileInstance?.id}" />
					<g:link class="edit" action="edit" id="${profileInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
