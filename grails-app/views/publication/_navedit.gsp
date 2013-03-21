<!-- edit menus ------------------------------------------------------------->
<%@ page import="spotlight.content.Publication"%>
<%@ page import="spotlight.pubtemplates.Emailtemplate"%>
<%@ page import="spotlight.pubtemplates.Templatepublication"%>

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

    <a href="javascript:void(null);" data-menu-id="edit" class="edit active"><li>Edit Markdown</li></a>
    <a href="javascript:void(null);" class="preview" data-menu-id="preview"><li>HTML Preview</li></a>

    </ul>
</div>
<!--  templates ---------->
<!---template modal ---->
<div class="btn-group">
        <div class="template-publication">
            <a href="#templateModal" role="button" class="btn btn-small" data-toggle="modal">Insert a template</a>

            <div id="templateModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="templateModalLabel" aria-hidden="true">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="templateModalLabel">Choose your template</h3>
                </div>

                    <div class="modal-body">

<g:select name="templatepublication.id" from="${spotlight.pubtemplates.Templatepublication.list()}" value="${publicationInstance.portfolio.publicationtemplates.id}">${publicationInstance?.portfolio?.publicationtemplates?.id}</g:select>
                    </div>

                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>

            </div>
        </div>
</div>


        <div class="btn-group">

                <input class="btn btn-small" type="button" value="Clear text" onclick="this.form.elements['publicationcontent'].value=''">

        </div>

 </div>