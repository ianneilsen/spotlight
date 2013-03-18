<!-- edit menus ------------------------------------------------------------->
<%@ page import="spotlight.content.Publication"%>
<%@ page import="spotlight.pubtemplates.Emailtemplate"%>

<g:javascript>function addtext() {
    var newtext = document.myform.inputtext.value;
    if (document.myform.placement[1].checked) {
        document.myform.outputtext.value = "";
    }
    document.myform.outputtext.value += newtext;
}</g:javascript>

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
        <a href="javascript:void(null);" id="clearButton"><li>Clear text</li></a>
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



                <a href="javascript:void(null);" data-menu-id="edit" class="edit active"><li>Edit Markdown</li></a>
                <a href="javascript:void(null);" class="preview" data-menu-id="preview"><li>HTML Preview</li></a>


    </ul>
</div>
<!--  templates ---------->
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

                       <!-- todo place radio select list here for submission to textarea "publicationcontent"    -->

                    </div>

            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
            </div>

        </div>
</div>
