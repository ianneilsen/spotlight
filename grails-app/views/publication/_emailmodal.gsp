<!-------- email modal---------------------------------------------------->
<%@ page contentType="text/html"%>
<div class="email-publication">
<a href="#emailModal" role="button" class="btn btn-small" data-toggle="modal">Email Publication</a>

<div id="emailModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="emailModalLabel" aria-hidden="true">
<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
   <h3 id="emailModalLabel">Email doc</h3>
</div>
<div class="modal-body">

<g:form action="emailpublication">

    <h6><g:field type="string" name="emailto" value="${publicationInstance?.portfolio?.emailtemplates?.toemailtemplate}" />  </h6>

    <h6><g:field type="string" name="publicationName" value="${publicationInstance?.publicationName}" />  </h6>

    <h6><g:field type="string" name="emailbodyheader" value="${publicationInstance?.portfolio?.emailtemplates?.contentemailtemplate}" />  </h6>

    <h6><g:textArea type="string" name="publicationContent" value="${publicationInstance?.publicationContent}" cols="20" rows="20"/>  </h6>

    <h6><g:field type="string" name="footeremailtemplate" value="${publicationInstance?.portfolio?.emailtemplates?.footeremailtemplate}" />  </h6>

    <!-- todo ad in  markitup html to markdown or add in html to text option here for emailing plain text -->

    <g:hiddenField name="publication" value="publicationInstance.id"/>
%{--    <g:hiddenField name="portfolio" value="portfolioInstance.id"/>--}%
    <input type="submit"/>
</g:form>
</div>
<div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
</div>
</div>