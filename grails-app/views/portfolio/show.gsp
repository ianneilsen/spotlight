
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
				<li><a class="home" href="${createLink(uri: '/portfolio/list')}"><g:message code="default.home.label"/></a></li>
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

			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${portfolioInstance?.id}" />
					<g:link class="edit" action="edit" id="${portfolioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
                </g:if>


    <table>
        <thead>
        <tr>

            <g:sortableColumn property="publicationName" title="${message(code: 'publication.publicationName.label', default: 'Publication Name')}" />

            <g:sortableColumn property="publicationContent" title="${message(code: 'publication.publicationContent.label', default: 'Publication Content')}" />

            <g:sortableColumn property="published" title="${message(code: 'publication.published.label', default: 'Published')}" />

            <g:sortableColumn property="publisheddate" title="${message(code: 'publication.publisheddate.label', default: 'Publisheddate')}" />

            <g:sortableColumn property="dateCreated" title="${message(code: 'publication.dateCreated.label', default: 'Date Created')}" />

            <g:sortableColumn property="lastUpdated" title="${message(code: 'publication.lastUpdated.label', default: 'Last Updated')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${portfolioInstance?.publications}" status="i" var="publicationInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link controller="publication" action="show" id="${publicationInstance.id}">${fieldValue(bean: publicationInstance, field: "publicationName")}</g:link></td>

                <td style="text-overflow: ellipsis; width: 30em; height: 2em; display:block; overflow: hidden; white-space: nowrap;">${fieldValue(bean: publicationInstance, field: "publicationContent")}</td>

                <td> <g:if test="${publicationInstance.published=="Yes"}"><p class="label label-success">${fieldValue(bean: publicationInstance, field: "published")}</p></g:if>
                     <g:else><p class="label label-important">${fieldValue(bean: publicationInstance, field: "published")}</p></g:else>
                    </td>

                <td><g:formatDate date="${publicationInstance.publisheddate}" /></td>

                <td><g:formatDate date="${publicationInstance.dateCreated}" /></td>

                <td><g:formatDate date="${publicationInstance.lastUpdated}" /></td>

            </tr>
        </g:each>
        </tbody>
    </table>
	</body>
</html>

<!-- todo - tidy up css for table and show vie win general -->