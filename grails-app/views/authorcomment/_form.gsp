<%@ page import="spotlight.comments.Authorcomment" %>



<div class="fieldcontain ${hasErrors(bean: authorcommentInstance, field: 'authorcomments', 'error')} ">
	<label for="authorcomments">
		<g:message code="authorcomment.authorcomments.label" default="Authorcomments" />
		
	</label>
	<g:textField name="authorcomments" value="${authorcommentInstance?.authorcomments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: authorcommentInstance, field: 'authors', 'error')} ">
	<label for="authors">
		<g:message code="authorcomment.authors.label" default="Authors" />
		
	</label>
	<g:select name="authors" from="${spotlight.User.list()}" multiple="multiple" optionKey="id" size="5" value="${authorcommentInstance?.authors*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: authorcommentInstance, field: 'publications', 'error')} required">
	<label for="publications">
		<g:message code="authorcomment.publications.label" default="Publications" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="publications" name="publications.id" from="${spotlight.content.Publication.list()}" optionKey="id" required="" value="${authorcommentInstance?.publications?.id}" class="many-to-one"/>
</div>

