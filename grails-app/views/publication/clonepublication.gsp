<%--
  Created by IntelliJ IDEA.
  User: ineilsen
  Date: 11/22/12
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.content.Pubproduct" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
</head>
<body>


<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'publicationName', 'error')} required">
    <label for="publicationName">
        <g:message code="publication.publicationName.label" default="Publication Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="publicationName" maxlength="100" required="" value="${publicationInstance?.publicationName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'published', 'error')} required">
    <label for="published">
        <g:message code="publication.published.label" default="Ready for publishing" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="published" from="${publicationInstance.constraints.published.inList}" required="" value="${publicationInstance?.published}" valueMessagePrefix="publication.published"/>
</div>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'publishedemail', 'error')} required">
    <label for="published">
        <g:message code="publication.publishedemail.label" default="Publication emailed" />
    </label>
    <g:select name="publishedemail" from="${publicationInstance.constraints.publishedemail.inList}" required="" value="${publicationInstance?.publishedemail}" valueMessagePrefix="publication.publishedemail"/>
</div>

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'publisheddate', 'error')} required">
    <label for="publisheddate">
        <g:message code="publication.publisheddate.label" default="Publish on date" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="publisheddate" precision="day"  value="${publicationInstance?.publisheddate}"  />
</div>

<!---------------------Product--------------------------------------------------------------------------------->
<div class="fieldcontain ${hasErrors(bean: pubproductInstance, field: 'pubproduct', 'error')} required">
    <label for="pubproduct">
        <g:message code="publication.pubproduct.label" default="Product Association" />
    </label>
    <g:select  name="pubproduct.id" from="${spotlight.content.Pubproduct.list()}" optionKey="id" required="" value="${publicationInstance?.pubproduct?.id}" class="many-to-one"/>
</div>

<!---------------------editor----------------------------------------------------------------------------------->

<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'publicationContent', 'error')} ">
    <label for="publicationContent">
        <g:message code="publication.publicationContent.label" default="Publication Content" />

    </label>
    <g:textArea name="publicationContent" value="${publicationInstance?.publicationContent}" cols="200" rows="40" escapeHtml="false"></g:textArea>
</div>



<!--  portfolio item -->
<div class="fieldcontain ${hasErrors(bean: publicationInstance, field: 'portfolio', 'error')} required">
    <label for="portfolio">
        <g:message code="publication.portfolio.label" default="Portfolio" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="portfolio" name="portfolio.id" from="${spotlight.content.Portfolio.list()}" optionKey="id" required="" value="${publicationInstance?.portfolio?.id}" class="many-to-one"/>
</div>



</body>
</html>