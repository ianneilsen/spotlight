<!-- top menu path for edit and delete of docs TODO move into partial inner menu.-->
<!-----show menus ----------------------------->
<%@ page import="spotlight.content.Publication"%>
<%@ page import="spotlight.pubtemplates.Emailtemplate"%>

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
        <g:link action="exportToDocbook" name="exporttodocbook" id="${publicationInstance?.id}" title="exporttodocbook">Export to Docbook</g:link>
       %{-- <a href="SpotLight-Grails/publication/converttoDocbook"  data-toggle="modal">Export to Docbook</a>--}%
        <a href="SpotLight-Grails/publication/exporttoPdf"  data-toggle="modal">Export to PDF</a>
        <a href="SpotLight-Grails/publication/exporttoHtml"  data-toggle="modal">Export to HTML</a>
        <a href="SpotLight-Grails/publication/exportToOdt"  data-toggle="modal">Export to ODT</a>
        <a href="SpotLight-Grails/publication/exporttoText"  data-toggle="modal">Export to Text</a>
        <a href="SpotLight-Grails/publication/teamMessage"  data-toggle="modal">Send team message</a>
        <a href="SpotLight-Grails/publication/CommentonPublication"  data-toggle="modal">Leave a comment</a>

    </ul>
</div>
<!---- email stuff ---------------------->
<div class="btn-group">
    <div class="email-publication">
        <a href="#emailModal" role="button" class="btn btn-small" data-toggle="modal"><i class="icon-envelope"></i> Email Publication</a>

        <div id="emailModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="emailModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="emailModalLabel">Email publication</h3>
            </div>
        <div class="modal-body">
            <g:form action="emailpublication">
                <h6><g:field type="text" name="whogetsemail" value="${publicationInstance?.portfolio?.emailtemplates?.toemailtemplate}" />  </h6>

                <h6><g:field type="text" name="publicationName" value="${publicationInstance?.publicationName}" />  </h6>

                <h6><g:field type="string" name="emailbodyheader" value="${publicationInstance?.portfolio?.emailtemplates?.contentemailtemplate}" />  </h6>

                <h6><g:textArea type="text" name="publicationContent" value="${publicationInstance?.publicationContent}" cols="20" rows="20"/>  </h6>

                <h6><g:field type="string" name="footeremailtemplate" value="${publicationInstance?.portfolio?.emailtemplates?.footeremailtemplate}" />  </h6>

                 <h6><g:field type="number" name="publicationid" value="${publicationInstance?.id}"/> </h6>

                 <g:hiddenField name="id" value="${publicationInstance?.id}" />

            <input type="submit" value="Send Email"/>
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
                <h3 id="cloneModalLabel">Clonepublication</h3>
        </div>
    <div class="modal-body">
        <g:form action="show">
            <h6><g:textArea type="text" name="publicationContent" value="${publicationInstance?.publicationContent}" cols="20" rows="20"/>  </h6>

            <h6><g:field type="string" name="published" value="${publicationInstance?.published}" />  </h6>

            <g:hiddenField name="id" value="${publicationInstance?.id}" />

        <input type="submit" value="Clone publication"/>
        </g:form>
    </div>

    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    </div>
</div>
</div>
</div>