
<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.content.Portfolio" %>

<div id="list-publication" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:javascript>$(document).ready( function () {
        $('#table_id').dataTable();
    } )</g:javascript>
    <table id="table_id" class="display">
    %{--<table>--}%
        <thead>
        <tr>

          %{--  <g:sortableColumn  property="publicationName" title="${message(code: 'portfolioInstance.publication.publicationName.label', default: 'Publication Name')}" />

            <g:sortableColumn  property="publicationContent" title="${message(code: 'portfolioInstance.publication.publicationContent.label', default: 'Publication Content')}" />

            <g:sortableColumn  property="pubproduct" title="${message(code: 'portfolioInstance.spubproduct.pubproduct', default: 'Product Name')}"  />

            <g:sortableColumn  property="published" title="${message(code: 'portfolioInstance.publication.published.label', default: 'Published')}" />

            <g:sortableColumn  property="publisheddate" title="${message(code: 'portfolioInstance.publication.publisheddate.label', default: 'Publish Date')}"  />

            <g:sortableColumn  property="publishedemail" title="${message(code: 'portfolioInstance.publication.published.label', default: 'Publication Emailed')}" />

            <g:sortableColumn  property="dateCreated" title="${message(code: 'portfolioInstance.publication.dateCreated.label', default: 'Date Created')}" />

            <g:sortableColumn  property="lastUpdated" title="${message(code: 'portfolioInstance.publication.lastUpdated.label', default: 'Last Updated')}"  />--}%
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
        <g:each in="${portfolioInstance?.publications }" status="i" var="publicationInstance">
            %{--.sort{a,b-> a.id.compareTo(b.id)}--}%
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
  %{--  <div class="pagination">

        <g:paginate total="${portfolioInstance?.publications}" />
        <h6>Number of publications: ${portfolioInstance?.publications?.list().size()}</h6>
    </div>--}%
    <!-- todo killpagination for a moment while i fix partial render within a render -->
</div>
<g:javascript src="DataTables/media/js/jquery.dataTables.js" />