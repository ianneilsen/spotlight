<%@ page import="spotlight.content.Portfolio" %>
<%@ page import="spotlight.content.Pubproduct" %>
<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.pubtemplates.Emailtemplate" %>
<%@  page import="spotlight.pubtemplates.Templatepublication" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/html">
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
					<span id="portdescrip-label" class="property-label"><g:message code="portfolio.portdescrip.label" default="Portfolio Description" /></span>
					
						<span class="property-value" aria-labelledby="portdescrip-label"><g:fieldValue bean="${portfolioInstance}" field="portdescrip"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${portfolioInstance?.portpublished}">
				<li class="fieldcontain">
					<span id="portpublished-label" class="property-label"><g:message code="portfolio.portpublished.label" default="Portfolio Protected" /></span>

						<span class="property-value" aria-labelledby="portpublished-label"><g:fieldValue bean="${portfolioInstance}" field="portpublished"/></span>

				</li>
				</g:if>

       %{--      <ol class="property-list portfolio">--}%
				<g:if test="${portfolioInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="portfolio.dateCreated.label" default="Portfolio created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${portfolioInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${portfolioInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="portfolio.lastUpdated.label" default="Portfolio last updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${portfolioInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>

				<g:if test="${portfolioInstance?.profile}">
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="portfolio.profile.label" default="Portfolio Profile" /></span>
					
						<span class="property-value" aria-labelledby="profile-label"><g:link controller="profile" action="show" id="${portfolioInstance?.profile?.id}">${portfolioInstance?.profile?.encodeAsHTML()}</g:link></span>
					
				</li>


<!---------------buttons ----------------------------------------->
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${portfolioInstance?.id}" />
					<g:link class="edit" action="edit" id="${portfolioInstance?.id}"><g:message code="default.button.edit.label" default="Edit Portfolio" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete Portfolio')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure you want to delete the entire portfolio?')}');" />
				</fieldset>
			</g:form>
		</div>
                </g:if>
    <!-----------------------pubs ---------------------------------------------->
    <ul class="one-to-many">
        %{--            <g:each in="${portfolioInstance?.publications?}" var="p">
            <li><g:link controller="publication" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
        </g:each>--}%
        <div class="btn-group">
            <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                Publications
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li class="add">
                   <g:link controller="publication" action="create" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'publication.label', default: 'new Publication')])}</g:link>
                </li>
                <li>
                    <g:link controller="publication" action="list" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.list.label', args: [message(code: 'publication.label', default: 'Publications')])}</g:link>
                </li>
            </ul>
        </div>

    <div><span class="label"> Total Publications:</span><span class="badge badge-success"> ${portfolioInstance?.publications.size()}</span> </div>
    </ul>
    <!-------------------------email ------------------------------------------->
    <ul class="one-to-many">
        %{--            <g:each in="${portfolioInstance?.publications?}" var="p">
            <li><g:link controller="publication" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
        </g:each>--}%
        <div class="btn-group">
            <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                Email Templates
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li class="add">
                    <g:link controller="emailtemplate" action="create" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'emailtemplate.label', default: 'Email template')])}</g:link>
                </li>
                <li>
                    <g:link controller="emailtemplate" action="list" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.list.label', args: [message(code: 'emailtemplate.label', default: 'Email template')])}</g:link>
                </li>
            </ul>
        </div>

        <div><span class="label"> Total Templates:</span><span class="badge badge-success"> ${portfolioInstance?.emailtemplates.size()}</span> </div>

    </ul>
    <!--------------------------pubs ---------------------------------------------->

    <ul class="one-to-many">
        %{--            <g:each in="${portfolioInstance?.publications?}" var="p">
            <li><g:link controller="publication" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
        </g:each>--}%
        <div class="btn-group">
            <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                Publication Templates
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li class="add">
                    <g:link controller="templatepublication" action="create" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'templatepublication.label', default: 'Portfolio template')])}</g:link>
                </li>
                <li>
                    <g:link controller="templatepublication" action="list" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.list.label', args: [message(code: 'templatepublication.label', default: 'Portfolio template')])}</g:link>
                </li>
            </ul>
        </div>

        <div><span class="label"> Total Templates:</span><span class="badge badge-success"> ${portfolioInstance?.publicationtemplates.size()}</span> </div>

    </ul>
    <!----------------------unpublished ------------------------------------------------->
    <ul class="one-to-many">
        %{--            <g:each in="${portfolioInstance?.publications?}" var="p">
            <li><g:link controller="publication" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
        </g:each>--}%
        <li class="add">
            <g:link  controller="publication" action="list" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'templatepublication.label', default: 'Unpublished documents')])}</g:link>
            <g:include id="[portfolioInstance.id]" action="publicationcounts"/>
        <div><span class="label"> Total Unpublished:</span><span class="badge badge-success">${params.portfolioresults}</span> </div>
        </li>
    </ul>                                                                                              %{--Message.executeQuery('select count(m) from Publication m where SIZE(m.published) = No')--}%
    <!----------------------------------table list ---------------------------------------->
    <div id="list-publication" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="publicationName" title="${message(code: 'publication.publicationName.label', default: 'Publication Name')}" />

            <g:sortableColumn property="publicationContent" title="${message(code: 'publication.publicationContent.label', default: 'Publication Content')}" />

            <g:sortableColumn property="pubproduct" title="${message(code: 'spubproduct.pubproduct', default: 'Product Name')}" />

            <g:sortableColumn property="published" title="${message(code: 'publication.published.label', default: 'Published')}" />

            <g:sortableColumn property="publisheddate" title="${message(code: 'publication.publisheddate.label', default: 'Publish Date')}" />

            <g:sortableColumn property="publishedemail" title="${message(code: 'publication.published.label', default: 'Publication Emailed')}" />

            <g:sortableColumn property="dateCreated" title="${message(code: 'publication.dateCreated.label', default: 'Date Created')}" />

            <g:sortableColumn property="lastUpdated" title="${message(code: 'publication.lastUpdated.label', defaultOrder="desc", default: 'Last Updated')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${portfolioInstance?.publications}" status="i" var="publicationInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link controller="publication" action="show" id="${publicationInstance.id}">${fieldValue(bean: publicationInstance, field: "publicationName")}</g:link></td>

                <td style="text-overflow: ellipsis; width: 30em; height: 2em; display:block; overflow: hidden; white-space: nowrap;">${fieldValue(bean: publicationInstance, field: "publicationContent")}</td>

                <td>${publicationInstance.pubproduct}</td>

                <td> <g:if test="${publicationInstance.published=="Yes"}"><p class="label label-success">${fieldValue(bean: publicationInstance, field: "published")}</p></g:if>
                     <g:else><p class="label label-important">${fieldValue(bean: publicationInstance, field: "published")}</p></g:else>
                    </td>

                <td><g:formatDate date="${publicationInstance.publisheddate}" /></td>

                <td> <g:if test="${publicationInstance.publishedemail=="Yes"}"><p class="label label-success">${fieldValue(bean: publicationInstance, field: "publishedemail")}</p></g:if>
                    <g:else><p class="label label-important">${fieldValue(bean: publicationInstance, field: "publishedemail")}</p></g:else>
                </td>

                <td><g:formatDate date="${publicationInstance.dateCreated}" /></td>

                <td><g:formatDate date="${publicationInstance.lastUpdated}" /></td>

            </tr>
        </g:each>
        </tbody>
    </table>

	</body>
</html>