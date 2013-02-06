<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.content.Portfolio" %>
<!---- pubs ---->
<ul class="one-to-many">

    <div class="btn-group">
        <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
            Publications
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li class="add">
                <g:link controller="publication" action="create" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'publication.label', default: 'new Publication')])}</g:link>
            </li>
            <li>
                <g:link controller="publication" action="list" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.list.label', args: [message(code: 'publication.label', default: 'Publications')])}</g:link>
            </li>
        </ul>
    </div>

    <div><span class="label"> Total Publications:</span><span class="badge badge-success"> ${portfolioInstance?.publications?.size()}</span> </div>
</ul>
<!---- email ---->
<ul class="one-to-many">

    <div class="btn-group">
        <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
            Email Templates
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li class="add">
                <g:link controller="emailtemplate" action="create" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'emailtemplate.label', default: 'Email template')])}</g:link>
            </li>
            <li>
                <g:link controller="emailtemplate" action="list" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.list.label', args: [message(code: 'emailtemplate.label', default: 'Email template')])}</g:link>
            </li>
        </ul>
    </div>

    <div><span class="label"> Total Templates:</span><span class="badge badge-success"> ${portfolioInstance?.emailtemplates?.size()}</span> </div>

</ul>
<!---- pubs ---->
<ul class="one-to-many">
    <div class="btn-group">
        <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
            Publication Templates
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li class="add">
                <g:link controller="templatepublication" action="create" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'templatepublication.label', default: 'Portfolio template')])}</g:link>
            </li>
            <li>
                <g:link controller="templatepublication" action="list" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.list.label', args: [message(code: 'templatepublication.label', default: 'Portfolio template')])}</g:link>
            </li>
        </ul>
    </div>
    <div><span class="label"> Total Templates:</span><span class="badge badge-success"> ${portfolioInstance?.publicationtemplates?.size()}</span> </div>
</ul>
<!---- unpublished ---->
<ul class="one-to-many">
    <li class="add">
        <g:link  controller="portfolio" action="unpublishedDocs" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.list.label', args: [message(code: 'publication.label', default: 'Unpublished documents')])}</g:link>
        <div><span class="label"> Total Unpublished:</span><span class="badge badge-success"><g:hiddenField name="portfolio.id" id="${portfolioInstance?.id}"/>${spotlight.content.Publication.countByPublished('No')}</span> </div>
    </li>
</ul>
<!----------------------------------table list ---------------------------------------->

<g:render template="/share/list" action="list" />

