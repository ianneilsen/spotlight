<!-- top menu path for edit and delete of docs TODO move into partial inner menu.-->
<!-----show menus ----------------------------->
<%@ page import="spotlight.content.Publication"%>
<%@ page import="spotlight.pubtemplates.Emailtemplate"%>

<div id="pub-nav" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">

    <!-----------markuphelp  partial page in inner navigation to use twitter javascript to produce a pop-up to show mark help through partial view gsp -->

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

    <!----actions --->

        <!----------------------------------------  publication tools ---------------------------------->

        <div class="btn-group">
            <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                Publication Tools
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <!-- dropdown menu links -->

                <a href="SpotLight-Grails/publication/converttodocbook"  data-toggle="modal">Convert to docbook</a>
                <a href="SpotLight-Grails/publication/teammessage"  data-toggle="modal">Send team message</a>

            </ul>
        </div>

        <!---- email stuff ---------------------->
