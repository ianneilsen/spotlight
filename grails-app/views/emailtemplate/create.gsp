<%@ page import="spotlight.pubtemplates.Emailtemplate" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'emailtemplate.label', default: 'Email template')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>

    <div class="navbar1">
        <ul class="nav1">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>

        </ul>
		</div>

    <div id="create-emailtemplate" class="content scaffold-create" role="main">
			<h1 style="font-size: 20px;"><g:message default="Create new email template" code="default.create.emailtemplate.label" args="[entityName]" /></h1>
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

       %{-- <section>--}%
        <div class="formArea">
            <div class="form-horizontal">
        <g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
                </div>
            </div>
		</div>
	</body>
</html>
