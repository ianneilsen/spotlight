<%@ page import="spotlight.content.Portfolio" %>



<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'portfolioName', 'error')} required">
	<label for="portfolioName">
		<g:message code="portfolio.portfolioName.label" default="Portfolio Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="portfolioName" maxlength="170" required="" value="${portfolioInstance?.portfolioName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'portdescrip', 'error')} required">
	<label for="portdescrip">
		<g:message code="portfolio.portdescrip.label" default="Portfolio site description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="portdescrip" maxlength="200" required="" value="${portfolioInstance?.portdescrip}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'portpublished', 'error')} required">
	<label for="portpublished">
		<g:message code="portfolio.portpublished.label" default="Portfolio is Protected" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="portpublished" from="${portfolioInstance.constraints.portpublished.inList}" required="" value="${fieldValue(bean: portfolioInstance, field: 'portpublished')}" valueMessagePrefix="portfolio.portpublished"/>
</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'profile', 'error')} required">
	<label for="profile">
		<g:message code="portfolio.profile.label" default="Site Admin" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profile" name="profile.id" from="${spotlight.content.Profile.list()}" optionKey="id" required="" value="${portfolioInstance?.profile?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'publications', 'error')} ">
	<label for="publications">
		<g:message code="portfolio.publications.label" default="Publications" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${portfolioInstance?.publications?}" var="p">
    <li><g:link controller="publication" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="publication" action="create" params="['portfolio.id': portfolioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'publication.label', default: 'Publication')])}</g:link>
</li>
</ul>

</div>

