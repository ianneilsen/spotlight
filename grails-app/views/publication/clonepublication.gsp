<%--
  Created by IntelliJ IDEA.
  User: ineilsen
  Date: 11/22/12
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.content.Pubproduct" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

<!--- error reporting ------------->
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

<g:fieldValue bean="${publicationInstance}" field="publicationName" />
</body>
</html>