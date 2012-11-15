<!-- top menu path for edit and delete of docs TODO move into partial inner menu.-->

<div id="pub-nav">

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

<!------------------------------ dropdown menu links ----------------------------------------------->

      <div class="btn-group">
        <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
            Actions
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">

            <g:form method="post" >
                <g:hiddenField name="id" value="${publicationInstance?.id}" />
                <g:hiddenField name="version" value="${publicationInstance?.version}" />
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

                </fieldset>
            </g:form>
        </ul>
<!----------------------------------------  publication tools ---------------------------------->

      <div class="btn-group">
            <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                Publication Tools
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <!-- dropdown menu links -->

                <a href="SpotLight-Grails/publication/converttodocbook"  data-toggle="modal">Convert to docbook</a>
                <a href="SpotLight-Grails/publication/userchart"  data-toggle="modal">Insert Chart</a>
                <a href="SpotLight-Grails/publication/uploadpicture"  data-toggle="modal">Upload Image</a>
                <a href="SpotLight-Grails/publication/uploadattachment"  data-toggle="modal">Upload attachment</a>
                <a href="SpotLight-Grails/publication/teammessage"  data-toggle="modal">Send team message</a>

            </ul>
      </div>
<!----------------------------------------  templates ---------------------------------->
      <div class="btn-group">
          <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
             Templates
            <span class="caret"></span>
          </a>
        <ul class="dropdown-menu">
        <!-- dropdown menu links -->
        <a href="SpotLight-Grails/publication/clonepub"  data-toggle="modal">Clone publication</a>
        <a href="SpotLight-Grails/publication/emailtemplate"  data-toggle="modal">Use email template</a>
        <li class="divider"></li>
        <li class="dropdown-submenu">
            <a tabindex="-1" href="#">Insert Template</a>
              <ul class="dropdown-menu">
                 <g:hiddenField name="portfolioInstance" value="id"/>
                   <g:select  name="publicationInstance.portfolio.publicationtemplates.id" from="${spotlight.pubtemplates.Templatepublication.list()}" value="${publicationInstance?.portfolio?.publicationtemplates?.id}"  optionKey="id" class="many-to-one"/>
      </div>

<!-------- email modal---------------------------------------------------->
        <div class="email-publication">
            <a href="#emailModal" role="button" class="btn btn-small" data-toggle="modal">Email Publication</a>

            <div id="emailModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="emailModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="emailModalLabel">Email doc</h3>
                </div>
                <div class="modal-body">
                      <g:form action="emailpublication">
                        email address: <input name="email"/><br/>
                        name: <input name="name"/><br/>

                        <p><g:fieldValue bean="${publicationInstance}" field="publicationName"/></p>

                        <a><%=publicationInstance?.publicationContent%></a>
                           <!-- todo ad in  makritup html to markdown or add in html to text option here for emailing plain text -->

                   <input type="submit"/>
               </g:form>
            </div>
          <div class="modal-footer">
         <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        </div>
       </div>


  </div>   <!--div for btn-group-->
</div>     <!--pubnav-->
