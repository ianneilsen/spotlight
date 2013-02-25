<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.content.Portfolio" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'publication.label', default: 'Un-published')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <r:require modules="bootstrap"/>
</head>
<body>
<div class="navbar1">
    <ul class="nav1">
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link  action="show" controller="portfolio" id="${portfolioInstance?.id}"><g:message code="Back" /></g:link></li>

    </ul>
</div>
<div id="list-publication" class="content scaffold-list" role="main">

    <h3><g:message code="default.list.label" args="[entityName]" /></h3>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>


        <table>
            <thead>
            <tr>
                <th>Publication Name</th>
                <th>Content</th>
                <th>Product Name</th>
                <th>Published</th>
                <th>Publish date</th>
                <th>Publication emailed</th>
                <th>Date created</th>
                <th>Last Updated</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${unpublisheddocs}" status="i" var="publicationInstance">

                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><i class="icon-edit"></i><g:link controller="publication" action="show" id="${publicationInstance.id}">${fieldValue(bean: publicationInstance, field: "publicationName")}</g:link></td>

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

</div>
</body>
</html>