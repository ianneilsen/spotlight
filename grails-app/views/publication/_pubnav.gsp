<!-- top menu path for edit and delete of docs TODO move into partial inner menu.-->
<%@ page import="spotlight.content.Portfolio" %>
<%@ page import="spotlight.pubtemplates.Templatepublication" %>

<div id="pub-nav">
   <div class="markdown-help">
       <a href="#myModal" role="button" class="btn btn-small" data-toggle="modal">Markdown Guide</a>

    <!-- Modal -->
    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h3 id="myModalLabel">Markdown Help</h3>
      </div>
    <div class="modal-body">
      <a href="https://pride.engineering.redhat.com/docs/en-US/Reports_and_Publication/6.rap/html/Markdown_cheat_sheet/index.html" target="_blank">Markdown cheat sheet on document server.</a>
    </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
      </div>
    </div>

    <div class="btn-group">
        <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
            Actions
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
        <!-- dropdown menu links -->
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
        <div class="btn-group">
            <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                Templates
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <!-- dropdown menu links -->
                <a href="SpotLight-Grails/publication/clonepub"  data-toggle="modal">Clone publication</a>
                <a href="SpotLight-Grails/publication/emailtempla"  data-toggle="modal">Use email template</a>
                <li class="divider"></li>
                <li class="dropdown-submenu">
                    <a tabindex="-1" href="#">Insert Template</a>
                    <ul class="dropdown-menu">
                        <g:hiddenField name="id" value="${portfolioInstance?.id}" />
                    
                     <g:select name="portfolio.templatepublication.id" from="${spotlight.pubtemplates.Templatepublication.list()}" optionKey="id"/>

                    
                    %{--        <g:each in="${portfolioInstance?.pubtempl?.tplnamepub}" var="p">
                    <li><g:link controller="templatepublication" action="templatelist" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                </g:each>--}%
        </div>
        <!--markuphelp  partial page in inner navigation to use twitter javascript to produce a pop-up to show mark help through partial view gsp -->
        <div class="btn-group">
            <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                Publication Tools
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <!-- dropdown menu links -->

                <a href="SpotLight-Grails/publication/markdownHelp"  data-toggle="modal">Email Publication</a>
                <a href="SpotLight-Grails/publication/converttodocbook"  data-toggle="modal">Convert to docbook</a>
                <a href="SpotLight-Grails/publication/userchart"  data-toggle="modal">Insert Chart</a>
                <a href="SpotLight-Grails/publication/uploadpicture"  data-toggle="modal">Upload Image</a>
                <a href="SpotLight-Grails/publication/uploadattachment"  data-toggle="modal">Upload attachment</a>
                <a href="SpotLight-Grails/publication/teammessage"  data-toggle="modal">Send team message</a>

            </ul>
        </div>

  </div>
</div>