<%@ page import="spotlight.pubtemplates.Emailtemplate" %>
<%@ page import="spotlight.content.Portfolio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'emailtemplate.label', default: 'Email template')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
<body><!-- main NAV -->
    <div class="navbar1">
        <ul class="nav1">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link  action="show" controller="portfolio" id="${emailtemplateInstance?.portfolio?.id}"><g:message code="Cancel" /></g:link></li>

			</ul>
		</div>
<!-- page title -->
<div id="list-emailtemplate" class="content scaffold-list" role="main">
			<h6 style="font-size: 20px;"><g:message default="Email template list" code="default.list.emailtemplate.label" args="[entityName]" /></h6>
<!--error msgs -->
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
<!--list TABLE -->
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nameemailtemplate" title="${message(code: 'emailtemplate.nameemailtemplate.label', default: 'Template Name')}" />
					
						<g:sortableColumn property="toemailtemplate" title="${message(code: 'emailtemplate.toemailtemplate.label', default: 'TO Address')}" />
					
						<g:sortableColumn property="ccemailtemplate" title="${message(code: 'emailtemplate.ccemailtemplate.label', default: 'CC Address')}" />
					
						<g:sortableColumn property="contentemailtemplate" title="${message(code: 'emailtemplate.contentemailtemplate.label', default: 'Header')}" />
					
						<g:sortableColumn property="footeremailtemplate" title="${message(code: 'emailtemplate.footeremailtemplate.label', default: 'Footer')}" />
					
						<th><g:message code="emailtemplate.portfolio.label" default="Portfolio" /></th>

                        <g:sortableColumn title="Action" property="edit" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${emailtemplateInstanceList}" status="i" var="emailtemplateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${emailtemplateInstance.id}">${fieldValue(bean: emailtemplateInstance, field: "nameemailtemplate")}</g:link></td>
					
						<td>${fieldValue(bean: emailtemplateInstance, field: "toemailtemplate")}</td>
					
						<td>${fieldValue(bean: emailtemplateInstance, field: "ccemailtemplate")}</td>
					
						<td>${fieldValue(bean: emailtemplateInstance, field: "contentemailtemplate")}</td>
					
						<td>${fieldValue(bean: emailtemplateInstance, field: "footeremailtemplate")}</td>
					
						<td>${fieldValue(bean: emailtemplateInstance, field: "portfolio")}</td>

                        <td><g:link controller="emailtemplate" action="edit" name="edit" id="${emailtemplateInstance?.id?.encodeAsHTML()}">+Edit</g:link> </td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
<!-- pagination-->
			<div class="pagination">
				<g:paginate total="${emailtemplateInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
