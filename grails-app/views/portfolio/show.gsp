
<%@ page import="spotlight.content.Portfolio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'portfolio.label', default: 'Portfolio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-portfolio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-portfolio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list portfolio">
			
				<g:if test="${portfolioInstance?.portfolioName}">
				<li class="fieldcontain">
					<span id="portfolioName-label" class="property-label"><g:message code="portfolio.portfolioName.label" default="Portfolio Name" /></span>
					
						<span class="property-value" aria-labelledby="portfolioName-label"><g:fieldValue bean="${portfolioInstance}" field="portfolioName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${portfolioInstance?.portdescrip}">
				<li class="fieldcontain">
					<span id="portdescrip-label" class="property-label"><g:message code="portfolio.portdescrip.label" default="Portdescrip" /></span>
					
						<span class="property-value" aria-labelledby="portdescrip-label"><g:fieldValue bean="${portfolioInstance}" field="portdescrip"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${portfolioInstance?.portpublished}">
				<li class="fieldcontain">
					<span id="portpublished-label" class="property-label"><g:message code="portfolio.portpublished.label" default="Portpublished" /></span>
					
						<span class="property-value" aria-labelledby="portpublished-label"><g:fieldValue bean="${portfolioInstance}" field="portpublished"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${portfolioInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="portfolio.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${portfolioInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${portfolioInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="portfolio.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${portfolioInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${portfolioInstance?.profile}">
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="portfolio.profile.label" default="Profile" /></span>
					
						<span class="property-value" aria-labelledby="profile-label"><g:link controller="profile" action="show" id="${portfolioInstance?.profile?.id}">${portfolioInstance?.profile?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${portfolioInstance?.publications}">
				<li class="fieldcontain">
					<span id="publications-label" class="property-label"><g:message code="portfolio.publications.label" default="Publications" /></span>
					
						<g:each in="${portfolioInstance.publications}" var="p">
						<span class="property-value" aria-labelledby="publications-label"><g:link controller="publication" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${portfolioInstance?.id}" />
					<g:link class="edit" action="edit" id="${portfolioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
