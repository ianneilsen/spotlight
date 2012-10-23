<%@ page import="spotlight.content.PublicationTag" %>



<div class="fieldcontain ${hasErrors(bean: publicationTagInstance, field: 'pubtagname', 'error')} ">
	<label for="pubtagname">
		<g:message code="publicationTag.pubtagname.label" default="Pubtagname" />
		
	</label>
	<g:textField name="pubtagname" maxlength="100" value="${publicationTagInstance?.pubtagname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: publicationTagInstance, field: 'publications', 'error')} required">
	<label for="publications">
		<g:message code="publicationTag.publications.label" default="Publications" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="publications" name="publications.id" from="${spotlight.content.Publication.list()}" optionKey="id" required="" value="${publicationTagInstance?.publications?.id}" class="many-to-one"/>
</div>

