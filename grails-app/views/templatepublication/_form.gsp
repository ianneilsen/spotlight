<%@ page import="spotlight.pubtemplates.Templatepublication" %>



<div class="fieldcontain ${hasErrors(bean: templatepublicationInstance, field: 'tplnamepub', 'error')} required">
	<label for="tplnamepub">
		<g:message code="templatepublication.tplnamepub.label" default="Template name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tplnamepub" maxlength="100" required="" value="${templatepublicationInstance?.tplnamepub}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: templatepublicationInstance, field: 'tplshare', 'error')} required">
    <label for="tplshare">
        <g:message code="templatepublication.tplshare.label" default="Share Template" />

    </label>
    <g:select id="templatepublication" from="${templatepublicationInstance?.tplshare}" name="tplshare" value="${templatepublicationInstance?.tplshare}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: templatepublicationInstance, field: 'tplcontentpub', 'error')} ">
	<label for="tplcontentpub">
		<g:message code="templatepublication.tplcontentpub.label" default="Publication template" />
		
	</label>
	<g:textArea name="tplcontentpub" cols="40" rows="5" maxlength="1000" value="${templatepublicationInstance?.tplcontentpub}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: templatepublicationInstance, field: 'portfolio', 'error')} required">
	<label for="portfolio">
		<g:message code="templatepublication.portfolio.label" default="Portfolio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="portfolio" name="portfolio.id" from="${spotlight.content.Portfolio.list()}" optionKey="id" required="" value="${templatepublicationInstance?.portfolio?.id}" class="many-to-one"/>
</div>

