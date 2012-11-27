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

    <h6><g:field type="text" name="emailto" value="${publicationInstance?.portfolio?.emailtemplates?.toemailtemplate}" />  </h6>

    <h6><g:field type="text" name="publicationName" value="${publicationInstance?.publicationName}" />  </h6>

    <h6><g:field type="text" name="emailbodyheader" value="${publicationInstance?.portfolio?.emailtemplates?.contentemailtemplate}" />  </h6>

    <h6><g:textArea type="text" name="publicationContent" value="${publicationInstance?.publicationContent}" cols="20" rows="20"/>  </h6>

    <h6><g:field type="text" name="footeremailtemplate" value="${publicationInstance?.portfolio?.emailtemplates?.footeremailtemplate}" />  </h6>

   %{-- <h6><g:field type="number" name="publicationid" value="${publicationInstance?.id}"/> </h6>--}%

    <g:hiddenField name="id" value="${publicationInstance?.id}" />

   <input type="submit" value="Send Email"/>
</g:form>
</div>

<div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
</div>

</div>
</div>