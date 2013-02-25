
<%@ page import="spotlight.comments.Authorcomment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'authorcomment.label', default: 'Authorcomment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-authorcomment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-authorcomment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list authorcomment">
			
				<g:if test="${authorcommentInstance?.authorcomments}">
				<li class="fieldcontain">
					<span id="authorcomments-label" class="property-label"><g:message code="authorcomment.authorcomments.label" default="Authorcomments" /></span>
					
						<span class="property-value" aria-labelledby="authorcomments-label"><g:fieldValue bean="${authorcommentInstance}" field="authorcomments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${authorcommentInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="authorcomment.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${authorcommentInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${authorcommentInstance?.authors}">
				<li class="fieldcontain">
					<span id="authors-label" class="property-label"><g:message code="authorcomment.authors.label" default="Authors" /></span>
					
						<g:each in="${authorcommentInstance.authors}" var="a">
						<span class="property-value" aria-labelledby="authors-label"><g:link controller="user" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${authorcommentInstance?.publications}">
				<li class="fieldcontain">
					<span id="publications-label" class="property-label"><g:message code="authorcomment.publications.label" default="Publications" /></span>
					
						<span class="property-value" aria-labelledby="publications-label"><g:link controller="publication" action="show" id="${authorcommentInstance?.publications?.id}">${authorcommentInstance?.publications?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${authorcommentInstance?.id}" />
					<g:link class="edit" action="edit" id="${authorcommentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
