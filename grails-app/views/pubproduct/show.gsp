
<%@ page import="spotlight.content.Pubproduct" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pubproduct.label', default: 'Pubproduct')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pubproduct" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pubproduct" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pubproduct">
			
				<g:if test="${pubproductInstance?.pubproduct}">
				<li class="fieldcontain">
					<span id="pubproduct-label" class="property-label"><g:message code="pubproduct.pubproduct.label" default="Pubproduct" /></span>
					
						<span class="property-value" aria-labelledby="pubproduct-label"><g:fieldValue bean="${pubproductInstance}" field="pubproduct"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pubproductInstance?.publication}">
				<li class="fieldcontain">
					<span id="publication-label" class="property-label"><g:message code="pubproduct.publication.label" default="Publication" /></span>
					
						<span class="property-value" aria-labelledby="publication-label"><g:link controller="publication" action="show" id="${pubproductInstance?.publication?.id}">${pubproductInstance?.publication?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pubproductInstance?.id}" />
					<g:link class="edit" action="edit" id="${pubproductInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
