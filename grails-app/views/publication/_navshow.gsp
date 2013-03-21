<!-----show menus ----------------------------->
<%@ page import="spotlight.content.Publication"%>
<%@ page import="spotlight.pubtemplates.Emailtemplate"%>
<%@ page import="org.xwiki.*" %>
<r:require modules="jquery,jquery-ui,export"/>

<div id="pub-nav" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">

<!-- MARKUP MODAL -->

<div class="markdown-help">
    <a href="#markupModal" role="button" class="btn btn-small" data-toggle="modal"><i class="icon-book"></i> Markdown Guide</a>

    <div id="markupModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="markupModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="markupModalLabel">Markdown Help</h3>
        </div>
    <div class="modal-body">
        <a href="https://pride.engineering.redhat.com/docs/en-US/Reports_and_Publication/6.rap/html/Markdown_cheat_sheet/index.html" target="_blank">Markdown cheat sheet on document server.</a>
    </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        </div>
    </div>

<!----actions --->

<!---publication tools -->
<div class="btn-group">
    <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="icon-wrench"></i> Publication Tools
            <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
    <!-- dropdown menu links -->
         <g:hiddenField name="publicationid" value="${publicationInstance?.id}"/>
        <g:link controller="publication" action="exportToDocbook" name="exporttodocbook.id" id="${publicationInstance?.id}" title="exporttodocbook">Export to Docbook</g:link>
       %{-- <a href="SpotLight-Grails/publication/converttoDocbook"  data-toggle="modal">Export to Docbook</a>--}%
       %{-- <export:formats action="show" controller="publication" formats="['pdf','xml']" params="${params}"/>--}%
       %{-- <export:formats controller="publication" action="show" formats="['pdf']"/>--}%
%{--       <export:formats action="show" controller="publication" formats="['pdf']" params="${params}"/>--}%
        <a href="../show/${publicationInstance?.id}?format=pdf&extension=pdf" data-toggle="modal">Export to PDF</a>
        <a href="../show?format=html&extension=html"data-toggle="modal">Export to HTML</a>
        <a href="../show/${publicationInstance?.id}?format=xml&extension=xml"  data-toggle="modal">Export to XML</a>
        <a href="../show?format=ods&extension=ods"  data-toggle="modal">Export to ODT</a>
        <a href="../show?format=csv&extension=csv"  data-toggle="modal">Export to CVS</a>
        <a href="../show?format=txt&extension=txt"  data-toggle="modal">Export to Text</a>

        <a href="SpotLight-Grails/publication/teamMessage"  data-toggle="modal">Send team message</a>
        <a href="../commentonPublication"  data-toggle="modal">Leave a comment</a>


    </ul>
</div>
<!---- email stuff ---------------------->
<div class="btn-group">
    <div class="email-publication">
        <a href="#emailModal" role="button" class="btn btn-small" data-toggle="modal"><i class="icon-envelope"></i> Email Publication</a>

        <div id="emailModal" class="modal hide fade" style="width: 700px;" tabindex="-1" role="dialog" aria-labelledby="emailModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="emailModalLabel">Email publication</h3>
            </div>
        <div class="modal-body" style="width: 650px;">
            <g:form action="emailpublication">

                <h6><div class="control-group"><div class="controls"><p class="help-block">To email</p><g:textField class="input-xlarge"  style="width: 400px;" type="text" name="whogetsemail" value="${publicationInstance?.portfolio?.emailtemplates?.toemailtemplate}" /></h6>

                <h6><div class="control-group"><div class="controls"><p class="help-block">Publication name</p><g:textField class="input-xlarge" style="width: 400px;" type="text" name="publicationName" value="${publicationInstance?.publicationName}" />  </h6>

                <h6><div class="control-group"><div class="controls"><p class="help-block">Publication URL</p><g:textField class="input-xlarge" style="width: 400px;" type="text" name="publicationUrl" value="${"https://"+request.serverName+request.forwardURI}" />  </h6>

                <h6><div class="control-group"><div class="controls"><p class="help-block">Email template head</p><g:textField class="input-xlarge" style="width: 400px;" type="text" name="emailbodyheader" value="${publicationInstance?.portfolio?.emailtemplates?.contentemailtemplate}" />  </h6>

<h6><div class="control-group"><div class="controls"><p class="help-block">Publication content</p><g:textArea name="publicationContent" rows="20" cols="20" style="width: 600px;"><xwiki:render inputSyntax="xwiki/2.1" outputSyntax="plain/1.0">${publicationInstance?.publicationContent}</xwiki:render></g:textArea></h6>
%{--<g:textArea class="input-xxlarge" type="text" name="publicationContent" value="${publicationInstance?.publicationContent}" cols="20" rows="20"/>--}%

                <h6><div class="control-group"><div class="controls"><p class="help-block">Email template footer</p><g:textField class="input-xlarge" style="width: 400px;" type="text" name="footeremailtemplate" value="${publicationInstance?.portfolio?.emailtemplates?.footeremailtemplate}" />  </h6>

                 <h6><div class="control-group"><div class="controls"><p class="help-block">Publication Id</p><g:textField class="input-xlarge disabled" disabled="" type="number" name="publicationid" value="${publicationInstance?.id}"/></div></div></h6>

                 <g:hiddenField name="publication_id" value="${publicationInstance?.id}" />

           <button class="btn btn-success"><input type="submit" value="Send Email"/></button>
            </g:form>
        </div>

        <div class="modal-footer">
           <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        </div>
</div>

<!---HISTORY-DIFF --------------->
        <div class="btn-group">
            <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="icon-camera"></i>History-Diff
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <!-- dropdown menu links -->

                <a href="SpotLight-Grails/publication/viewedithistory"  data-toggle="modal">View edit history</a>
                <a href="SpotLight-Grails/publication/viewdiffofpublication"  data-toggle="modal">View edit diff</a>


            </ul>
        </div>

<!--- CLONE --------------------------->
<div class="btn-group">
    <div class="clone-publication">
        <a href="#cloneModal" role="button" class="btn btn-small" data-toggle="modal">Clone Publication</a>

    <div id="cloneModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="cloneModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="cloneModalLabel">Clone this publication</h3>
        </div>
    <div class="modal-body">
        <g:form action="show">

            <h6><div class="control-group"><div class="controls"><p class="help-block">Title</p><g:field type="string" name="publicationName" value="${publicationInstance?.publicationName}" /></h6>

            <h6><div class="control-group"><div class="controls"><p class="help-block">Publication content to clone</p><g:textArea type="text" name="publicationContent" value="${publicationInstance?.publicationContent}" cols="20" rows="20"/>  </h6>

            <h6><div class="control-group"><div class="controls"><p class="help-block">Published flag set to</p><g:select style="width: 200px;" name="published" from="${publicationInstance.constraints.published.inList}" required="" value="${publicationInstance?.published}" valueMessagePrefix="publication.published"/></h6>

            <h6><div class="control-group"><div class="controls"><p class="help-block">Published email flag set to</p><g:select name="publishedemail" from="${publicationInstance.constraints.publishedemail.inList}" required="" value="${publicationInstance?.publishedemail}" valueMessagePrefix="publication.publishedemail"/></h6>

            <h6><div class="control-group"><div class="controls"><p class="help-block">Published email flag set to</p><g:select  name="pubproduct.id" from="${spotlight.content.Pubproduct.list()}" optionKey="id" required="" value="${publicationInstance?.pubproduct?.id}" class="many-to-one"/></h6>

            <h6><div class="control-group"><div class="controls"><p class="help-block">Published date</p><g:datePicker name="publisheddate" precision="day"  value="${publicationInstance?.publisheddate}" ></g:datePicker></h6>

            <g:hiddenField name="id" value="${publicationInstance?.id}" />

            <button class="btn btn-success"><g:actionSubmit value="Clone this publication" action="publicationClone" onclick="return confirm('Are you sure?')"/></button>
        </g:form>
    </div>

        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        </div>
</div>
</div>
</div>