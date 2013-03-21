<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.content.Pubproduct" %>
<%@ page import="spotlight.pubtemplates.Templatepublication" %>
<%@ page import="spotlight.User"%>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'publicationName', 'error')} required">
    <label for='publicationName'>
        <g:message code="publication.publicationName.label" default="Publication Name(Required)" />
    </label>
    <g:textField style="width: 400px;" name="publicationName" maxlength="100" required="" value="${publicationInstance?.publicationName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'published', 'error')} required">
    <label for="published">
        <g:message code="publication.published.label" default="Ready for publishing" />
            <span class="required-indicator">*</span>
    </label>
    <g:if test="${publicationInstance}">
    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_PORTFOLIOADMIN,ROLE_PUBLISHER">
        <g:select style="width: 200px;" name="published" from="${publicationInstance.constraints.published.inList}" required="" value="${publicationInstance?.published}" valueMessagePrefix="publication.published"/>
    </sec:ifAnyGranted>
    </g:if>
    <g:else>
    <sec:ifNotGranted roles="ROLE_USER">
        <g:field type="text" name="published" readonly="" value="${publicationInstance?.published}"/>
    </sec:ifNotGranted>
    </g:else>
</div>

<!-- editor -->
<div id="container">
    <div id="content" class="section">
        <div class="publicationtextarea">
            <div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'publicationContent', 'error')} ">
                <label for='publicationContent'>
                    <g:message code="publication.publicationContent.label" default="Publication Content" />
                </label>
 %{--   <div id="edit" class="mode">
        <a href="javascript:void(null);" id="clearButton"><li>clear</li></a></ul>--}%
        <div class="content">
        <g:textArea id="publicationcontent" style="width: 700px;" name="publicationContent" value="${publicationInstance?.publicationContent}" cols="200" rows="40"/>
        </div>
    </div>
    <div id="preview" class="mode">
        <div id="output" class="content markdown-body"></div>
    </div>
    %{--</div>--}%
</div>

    </div>
</div>

<!---- upload me  ---->

<uploadr:add name="pcitureupload" path="web-app/images/tmp" allowedExtensions="jpeg,png,jpg,svg" viewable="false" downloadable="false" maxVisible="2" maxSize="1048576" noSound="true" />
<!--todo - path needs to be set relataive to application and portoflio name - see weceem cms for decent solution and for sec reasons. need to set based on serverURL path once in deployment out of dev enviro -->

<!---- bottom content ---->

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'publisheddate', 'error')} required">
    <label for="publisheddate">
        <g:message code="publication.publisheddate.label" default="Publish on date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="publisheddate" precision="day"  value="${publicationInstance?.publisheddate}" ></g:datePicker>
</div>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'publishedemail', 'error')} required">
    <label for="published">
        <g:message code="publication.publishedemail.label" default="Publication emailed" />
    </label>
    <g:select name="publishedemail" from="${publicationInstance.constraints.publishedemail.inList}" required="" value="${publicationInstance?.publishedemail}" valueMessagePrefix="publication.publishedemail"/>
</div>
<!---product category   ------------>
<div class="fieldcontain ${hasErrors(bean: pubproductInstance, field: 'pubproduct', 'error')} required">
    <label for="pubproduct">
        <g:message code="publication.pubproduct.label" default="Product Association" />
    </label>
    <g:select  name="pubproduct.id" from="${spotlight.content.Pubproduct.list()}" optionKey="id" required="" value="${publicationInstance?.pubproduct?.id}" class="many-to-one"/>
</div>
<!---- portfolio item ---->
<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'portfolio', 'error')} required">
	<label for="portfolio">
		<g:message code="publication.portfolio.label" default="Portfolio" />
		<span class="required-indicator">*</span>
	</label>
<g:textField id="portfolio" readonly="" name="portfolio.id" value="${publicationInstance?.portfolio?.id}" class="many-to-one" />
</div>

<!--authors-->
<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'authors', 'error')} required">
    <label for="authors">
        <g:message code="publication.authors.label" default="Authors" />

    </label>
       <g:select  multiple="true" name="authors" from="${spotlight.User.list()}" optionKey="id" required="" value="${authors?.documents}" class="many-to-many"/>
</div>

<!---- tag ---->
<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'pubtags', 'error')} ">
	<label for="pubtags">
		<g:message code="publication.pubtags.label" default="Pubtags" />
	</label>
</div>

<div>
<ul class="one-to-many">
<g:each in="${publicationInstance?.pubtags?}" var="p">
    <li><g:link controller="publicationTag" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="publicationTag" action="create" params="['publication.id': publicationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'publicationTag.label', default: 'PublicationTag')])}</g:link>
</li>
</ul>
</div>
