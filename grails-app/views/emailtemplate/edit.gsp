<%@ page import="spotlight.pubtemplates.Emailtemplate" %>
<%@ page import="spotlight.content.Portfolio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'emailtemplate.label', default: 'Email template')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
         <div class="navbar1">
             <ul class="nav1">
	    		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                 <li><g:link  action="show" controller="portfolio" id="${emailtemplateInstance?.portfolio?.id}"><g:message code="Cancel" /></g:link></li>
			</ul>
		</div>

        <div id="edit-emailtemplate" class="content scaffold-edit" role="main">
			<h1 style="font-size: 20px;"><g:message default="Editing: ${emailtemplateInstance?.nameemailtemplate}" code="default.edit.emailtemplate.label" args="[entityName]" /></h1>

            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${emailtemplateInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${emailtemplateInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

            <g:form method="post" >
				<g:hiddenField name="id" value="${emailtemplateInstance?.id}" />
				<g:hiddenField name="version" value="${emailtemplateInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
