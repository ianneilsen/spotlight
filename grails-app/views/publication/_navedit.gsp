<!-- top menu path for edit and delete of docs TODO move into partial inner menu.-->
<!-- edit menus ------------------------------------------------------------->
<%@ page import="spotlight.content.Publication"%>
<%@ page import="spotlight.pubtemplates.Emailtemplate"%>

<div id="pub-nav" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">

<!---- MARKUP ---->
<div class="markdown-help">
    <a href="#markupModal" role="button" class="btn btn-small" data-toggle="modal">Markdown Guide</a>

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
<!--  publication tools --->
<div class="btn-group">
    <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
        Publication Tools
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">

        <a href="SpotLight-Grails/publication/userchart"  data-toggle="modal">Insert Chart</a>
        <a href="SpotLight-Grails/publication/uploadpicture"  data-toggle="modal">Upload Image</a>
        <a href="SpotLight-Grails/publication/uploadattachment"  data-toggle="modal">Upload attachment</a>
        <a href="SpotLight-Grails/publication/teammessage"  data-toggle="modal">Send team message</a>
    </ul>
</div>
<!---- preview  --------->
<div class="btn-group">
    <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
    <i class="icon-eye-open"></i>Preview
            <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
            <!--  links -->
    <a href="SpotLight-Grails/publication/previewpub"  data-toggle="modal">Preview before save.</a>
    <a href="SpotLight-Grails/publication/turnonlivepreview"  data-toggle="modal">Turn on live preview.</a>
    </ul>
</div>
<!--  templates ---------->
%{--<div class="btn-group">
    <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
        Templates
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
        <!-- links -->
    <g:link action="show" id="${publicationInstance.id}">Clone-${publicationInstance?.publicationName}</g:link>
    <li class="divider"></li>
        <li class="dropdown-submenu">
            <a tabindex="-1" href="#">Insert Template</a>
                <ul class="dropdown-menu">
                    <g:hiddenField name="portfolioInstance" value="id"/>
        <g:select  name="publicationInstance.portfolio.publicationtemplates.id" from="${spotlight.pubtemplates.Templatepublication.list()}" value="${publicationInstance?.portfolio?.publicationtemplates?.id}"  optionKey="id" class="many-to-one"/>
</div>--}%
<!---template modal ---->
<div class="btn-group">
        <div class="email-publication">
            <a href="#emailModal" role="button" class="btn btn-small" data-toggle="modal">Insert template</a>

            <div id="emailModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="emailModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="emailModalLabel">Insert Template</h3>
                </div>
                    <div class="modal-body">
                    <g:form action="insertpublicationtemplate">
                        <g:hiddenField name="portfolioInstance" value="id"/>
                        <g:select  id="myValue" name="publicationInstance.portfolio.publicationtemplates.id" from="${spotlight.pubtemplates.Templatepublication.list()}" value="${publicationInstance?.portfolio?.publicationtemplates?.id}"  optionKey="id" class="many-to-one"/>
                       %{--<g:hiddenField name="id" value="${publicationInstance?.id}" />--}%
                        <g:submitToRemote src="jQuery.fn.extend({
            insertAtCaret: function(myValue){
                return this.each(function(i) {
                    if (document.selection) {
                        //For browsers like Internet Explorer
                        this.focus();
                        sel = document.selection.createRange();
                        sel.text = myValue;
                        this.focus();
                    }
                    else if (this.selectionStart || this.selectionStart == '0') {
                        //For browsers like Firefox and Webkit based
                        var startPos = this.selectionStart;
                        var endPos = this.selectionEnd;
                        var scrollTop = this.scrollTop;
                        this.value = this.value.substring(0, startPos)+myValue+this.value.substring(endPos,this.value.length);
                        this.focus();
                        this.selectionStart = startPos + myValue.length;
                        this.selectionEnd = startPos + myValue.length;
                        this.scrollTop = scrollTop;
                    } else {
                        this.value += myValue;
                        this.focus();
                    }
                })
            }
        })"
                        update="publicationtextarea"/>
                      %{--  <input type="submit" value="Insert template to current doc"/>--}%
                    </g:form>
                    </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
            </div>
        </div>
</div>

