<%@ page import="spotlight.content.Publication" %>



<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'publicationName', 'error')} required">
	<label for="publicationName">
		<g:message code="publication.publicationName.label" default="Publication Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="publicationName" maxlength="100" required="" value="${publicationInstance?.publicationName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'publicationContent', 'error')} ">
	<label for="publicationContent">
		<g:message code="publication.publicationContent.label" default="Publication Content" />
		
	</label>
	<g:textField name="publicationContent" value="${publicationInstance?.publicationContent}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'published', 'error')} required">
	<label for="published">
		<g:message code="publication.published.label" default="Published" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="published" from="${publicationInstance.constraints.published.inList}" required="" value="${publicationInstance?.published}" valueMessagePrefix="publication.published"/>
</div>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'publisheddate', 'error')} required">
	<label for="publisheddate">
		<g:message code="publication.publisheddate.label" default="Publisheddate" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="publisheddate" precision="day"  value="${publicationInstance?.publisheddate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'portfolio', 'error')} required">
	<label for="portfolio">
		<g:message code="publication.portfolio.label" default="Portfolio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="portfolio" name="portfolio.id" from="${spotlight.content.Portfolio.list()}" optionKey="id" required="" value="${publicationInstance?.portfolio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'pubtags', 'error')} ">
	<label for="pubtags">
		<g:message code="publication.pubtags.label" default="Pubtags" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${publicationInstance?.pubtags?}" var="p">
    <li><g:link controller="publicationTag" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="publicationTag" action="create" params="['publication.id': publicationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'publicationTag.label', default: 'PublicationTag')])}</g:link>
</li>
</ul>

</div>

