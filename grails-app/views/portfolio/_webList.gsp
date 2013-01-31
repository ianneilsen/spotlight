<%@ page import="spotlight.content.Publication" %>
<!-- weblist partial showing list of reporting sites and last 5 reports ordered by published date in asc order-->


%{--<script src="${resource(dir: 'js', file: 'lastfiver.js')}" type="text/javascript"></script>--}%


<div class="alert alert-info" >Permissions apply to <strong>editing</strong> publications. | Click portfolio name or choose from the last five published reports under the portfolio heading.</div>


<div class="property-list portfolio">


<g:each in="${portfolios}" status="i" var="portfolioInstance">
    <div class="site-listing">
    <g:hiddenField name="id" value="${portfolioInstance?.id}"/>
    <div><span class="label"><i class="icon-briefcase"></i> Site Name:</span> <g:link action="show" id="${portfolioInstance.id}">${portfolioInstance?.portfolioName?.encodeAsHTML()}</g:link></div>
    <div><span class="label"><i class="icon-info-sign"></i> Site Description:</span>  ${portfolioInstance?.portdescrip?.encodeAsHTML() }</div>
    <div><span class="label"><i class="icon-user"></i> Site Administrator:</span>  ${portfolioInstance?.profile?.portfolioAdmin?.encodeAsHTML() }</div>
    <div><span class="label"><i class="icon-list-alt"></i> Total publications:</span><span class="badge badge-success"> ${portfolioInstance?.publications?.size()}</span> </div>

    <g:if test="${portfolioInstance.publications}" >
        %{--<g:set var="portfolioInstance" value="portfolioInstance?.id"/>--}%
        <g:each in="${portfolioInstance.publications}" var="t">
            <ul class="more">
            <li><span class="property-value" aria-labelledby="publications-label"><g:link controller="publication" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link> </span> </li>
            </ul>
        </g:each>

    </g:if>
    </div>
</g:each>



</div>





<!-- todo - add in mobile css for report lists -->
<!-- todo - fix column widths and padding in whole page -->
<!-- todo - display last 5 publications per portfolio where published flag is set to 'Yes' and portfolio flag as 'Active' -->
