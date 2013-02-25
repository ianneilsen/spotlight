<%--
  Created by IntelliJ IDEA.
  User: ineilsen
  Date: 1/8/13
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.xwiki.rendering.parser.Parser" %>
<%@ page import="org.xwiki.rendering.syntax.Syntax" %>
<%@ page import="org.xwiki.rendering.syntax.SyntaxType" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="spotlight.content.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
  <title>Export to docbook</title>
</head>
<body>

<div class="navbar1">
    <ul class="nav1">
        <li><a class="home" href="${createLink(uri: '/portfolio/list')}"><g:message code="default.home.label"/></a></li>
        <li><g:link  action="show" controller="portfolio" id="${publicationInstance?.portfolio?.id}"><g:message code="Back to ${publicationInstance?.portfolio?.encodeAsHTML()}" args="[entityName]" /></g:link></li>
        <div id="show-publication" class="content scaffold-show" role="main">
    </ul>
</div>

<!---- action report name and site name ---->
<div id="show-publication" class="content scaffold-show" role="main">
    <h1 style="font-size: 20px;">Export to docbook 4.4 - ${publicationInstance?.publicationName} from portfolio
        <g:if test="${publicationInstance?.portfolio}">
            <span class="property-value" aria-labelledby="portfolio-label">
                <g:link controller="portfolio" action="show" id="${publicationInstance?.portfolio?.id}">${publicationInstance?.portfolio?.encodeAsHTML()}</g:link>
            </span>
        </g:if>
    </h1>
</div>
<!---- error messages ---->
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<section>
Docbook conversion
</br>
<g:if test="${publicationInstance?.publicationContent}">
<g:textArea name="publicationexport" rows="10" cols="20" style="width: 400px;">
<xwiki:render inputSyntax="xwiki/2.1" outputSyntax="docbook/4.4">${publicationInstance?.publicationContent}</xwiki:render>
</g:textArea>
</g:if>
         </br>

Plain text conversion
</br>
<g:if test="${publicationInstance?.publicationContent}">
<g:textArea name="plaintextexport" rows="5" cols="5" style="width: 400px;">
<xwiki:render inputSyntax="xwiki/2.1" outputSyntax="plain/1.0"> ${publicationInstance?.publicationContent}</xwiki:render>
</g:textArea>
</g:if>

</body>
</html>