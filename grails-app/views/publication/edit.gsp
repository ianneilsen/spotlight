<%@ page import="spotlight.content.Publication" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
 	</head>
	<body>
<!-- top  main navigation --------------------------->
		<a href="#edit-publication" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/portfolio/list')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>                                      <!-- todo- top update button not saving changes??  -->
		</div>
<!-- top menu path for edit and delete of docs TODO move into partial inner menu.-->
<div id="pub-nav">
    <div class="btn-group">
        <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
            Actions
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <!-- dropdown menu links -->
            <g:form method="post" >
                <g:hiddenField name="id" value="${publicationInstance?.id}" />
                <g:hiddenField name="version" value="${publicationInstance?.version}" />
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

                </fieldset>
            </g:form>
        </ul>
        <div class="btn-group">
            <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                 To Bottom of page
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <!-- dropdown menu links -->
                <a href="#bottom">To Bottom page</a>
            </ul>
        </div>
<!--markuphelp  partial page in inner navigation to use twitter javascript to produce a pop-up to show mark help through partial view gsp -->
        <div class="btn-group">
            <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                Markdown Help
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
     <!-- dropdown menu links -->
                <a href="/publication/markdownHelp"  data-toggle="modal">Markdown Help</a>
            </ul>
        </div>
    </div>
 </div>
<!-- error spring stuff -------------------->
		<div id="edit-publication" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${publicationInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${publicationInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
<!----------- footer form buttons ------>
			<g:form method="post" >
				<g:hiddenField name="id" value="${publicationInstance?.id}" />
				<g:hiddenField name="version" value="${publicationInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    <a href="#top">Back To Top</a>
                </fieldset>
			</g:form>
		</div>

	</body>
</html>
