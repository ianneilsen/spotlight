<%@ page import="spotlight.content.Portfolio" %>
<%@ page import="spotlight.content.Pubproduct" %>
<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.pubtemplates.Emailtemplate" %>
<%@  page import="spotlight.pubtemplates.Templatepublication" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/html">
	<head>
		<meta name="layout" content="main">
        <style type="text/css" title="currentStyle">
        @import "/eso-theme/datatable/datatable.css";
             </style>
		<g:set var="entityName" value="${message(code: 'portfolio.label', default: 'Portfolio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
        <r:require modules="bootstrap"/>
	</head>
<body>
<div class="navbar1">
    <ul class="nav1">
                <li><a class="home" href="${createLink(uri: '/portfolio/list')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        <g:hiddenField name="id" value="${portfolioInstance?.id}" />
        <li><g:link class="edit" action="edit" id="${portfolioInstance?.id}"><g:message code="default.button.edit.portfolio.label" default="Edit Portfolio" /></g:link></li>
       %{-- <li><g:actionSubmit class="delete" action="delete" id="${portfolioInstance?.id}" value="${message(code: 'default.button.delete.portfolio.label', default: 'Delete Portfolio')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure you want to delete the entire portfolio?')}');" /></li>--}%
    </ul>
	</div>
<!---- breadcrumb below nav bar ---->

    <h4><g:message code="Portfolio details" args="[entityName]" /></h4>

<!--- flash messages ---->
		<div id="show-portfolio" class="content scaffold-show" role="main">
		    <g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>

<!-- row1 ---->

    <div class="row show-grid">
        <g:if test="${portfolioInstance?.portfolioName}">
            <div class="span2" style="background-color: rgb(238, 238, 238);border-radius: 3px 3px 3px 3px;min-height: 20px; text-align: left; line-height: 20px;"><i class="icon-briefcase"></i><span id="portfolioName-label" class="property-label"><g:message code="portfolio.portfolioName.label" default="Portfolio Name" /></span></div>
            <div class="span2"><span class="property-value" aria-labelledby="portfolioName-label"><g:fieldValue bean="${portfolioInstance}" field="portfolioName"/></span></div>
        </g:if>
        <g:if test="${portfolioInstance?.status}">
            <div class="span2" style="background-color: rgb(238, 238, 238);border-radius: 3px 3px 3px 3px;min-height: 20px; text-align: center; line-height: 20px;"><i class="icon-thumbs-up"></i><span id="status-label" class="property-label"><g:message code="portfolio.status.label" default="Portfolio status" /></span></div>
            <div class="span2"><span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${portfolioInstance}" field="status"/></span></div>
        </g:if>
    </div>
<!-- row 2 ---->
    <div class="row">
        <g:if test="${portfolioInstance?.portdescrip}">
            <div class="span2" style="background-color: rgb(238, 238, 238);border-radius: 3px 3px 3px 3px;min-height: 20px; text-align: left; line-height: 20px;"><i class="icon-info-sign"></i><span id="portdescrip-label" class="property-label"><g:message code="portfolio.portdescrip.label" default="Portfolio Description" /></span></div>
            <div class="span2"><span class="property-value" aria-labelledby="portdescrip-label"><g:fieldValue bean="${portfolioInstance}" field="portdescrip"/></span></div>
        </g:if>
        <g:if test="${portfolioInstance?.dateCreated}">
            <div class="span2" style="background-color: rgb(238, 238, 238);border-radius: 3px 3px 3px 3px;min-height: 20px; text-align: center; line-height: 20px;"><i class="icon-time"></i><span id="dateCreated-label" class="property-label"><g:message code="portfolio.dateCreated.label" default="Portfolio created" /></span></div>
            <div class="span2"><span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${portfolioInstance?.dateCreated}" /></span></div>
        </g:if>
    </div>
<!--- row 3 --->
    <div class="row">
        <g:if test="${portfolioInstance?.profile}">
            <div class="span2" style="background-color: rgb(238, 238, 238);border-radius: 3px 3px 3px 3px;min-height: 20px; text-align: left; line-height: 20px;"><i class="icon-user"></i><span id="profile-label" class="property-label"><g:message code="portfolio.profile.label" default="Portfolio Administrator" /></span></div>
            <div class="span2"><span class="property-value" aria-labelledby="profile-label"><g:link controller="profile" action="show" id="${portfolioInstance?.profile?.id}">${portfolioInstance?.profile?.encodeAsHTML()}</g:link></span></div>
        </g:if>
            <g:if test="${portfolioInstance?.profile?.portfolioEmail}">
                <div class="span2" style="background-color: rgb(238, 238, 238);border-radius: 3px 3px 3px 3px;min-height: 20px; text-align: center; line-height: 20px;"><i class="icon-envelope"></i><span id="profile-label" class="property-label"><g:message code="portfolio.profile.label" default="Portfolio Email" /></span></div>
                <div class="span2"><span class="property-value" aria-labelledby="profile-label"><g:link controller="profile" action="show" id="${portfolioInstance?.profile?.id}">${portfolioInstance?.profile?.portfolioEmail?.encodeAsHTML()}</g:link></span></div>
            </g:if>
    </div>
<!---- buttons ---->
	<g:form>
	    <fieldset class="buttons">
		    %{--<--}%%{--g:hiddenField name="id" value="${portfolioInstance?.id}" />
				<g:link class="edit" action="edit" id="${portfolioInstance?.id}"><g:message code="default.button.edit.label" default="Edit Portfolio" /></g:link>--}%
%{--
			    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete Portfolio')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure you want to delete the entire portfolio?')}');" />
--}%
		</fieldset>
	</g:form>
</div>
<!---- jquery pub list ---->
%{--<tmpl:publicationshow action="list" publications="${portfolioInstance?.publications}"/>--}%
<!---- pubs ---->
<ul class="one-to-many">

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

    <div><span class="label"> Total Publications:</span><span class="badge badge-success"> ${portfolioInstance?.publications?.size()}</span> </div>
</ul>
<!---- email ---->
<ul class="one-to-many">

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

    <div><span class="label"> Total Templates:</span><span class="badge badge-success"> ${portfolioInstance?.emailtemplates?.size()}</span> </div>

</ul>
<!---- pubs ---->
<ul class="one-to-many">
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
    <div><span class="label"> Total Templates:</span><span class="badge badge-success"> ${portfolioInstance?.publicationtemplates?.size()}</span> </div>
</ul>
<!---- unpublished ---->
<ul class="one-to-many">
    <li class="add">
        <g:link  controller="portfolio" action="unpublishedDocs" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.list.label', args: [message(code: 'publication.label', default: 'Unpublished documents')])}</g:link>
        <div><span class="label"> Total Unpublished:</span><span class="badge badge-success"><%def count = Publication.countByPublishedAndPortfolio("No", portfolioInstance)%>${count}</span> </div>
    </li>
</ul>
<!----------------------------------table list ---------------------------------------->

<g:render template="/share/list" action="list" />
	</body>
</html>