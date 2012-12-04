<!-- weblist partial showing list of reporting sites and last 5 reports ordered by published date in asc order-->
<div class="alert alert-info" xmlns="http://www.w3.org/1999/html">Permissions apply to <strong>editing</strong> publications.<br>
<div style="display: inline;"><p>Click portfolio name to read or edit publications. Total number of sites: <strong>${portfolioInstanceTotal}</strong> | Total number of publications: <strong>${reportscount}</strong> </p>
</div>
</div>

<div class="property-list portfolio">
%{--<g:each in="${portfolios}" var="portfolioInstance" status="i">
    <div class="site-listing">
        <div><span class="label">Site Name:</span><g:link action="show" id="${portfolioInstance?.id }">${portfolioInstance?.portfolioName?.encodeAsHTML()}</g:link></div>
        <div><span class="label">Site Description:</span>${portfolioInstance?.portdescrip?.encodeAsHTML() }</div>   <br>
        <div><span class="label">Site Administrator:</span>${portfolioInstance?.profile?.portfolioAdmin?.encodeAsHTML() }</div>   <br>
        <div><span class="label"> Total publications:</span><span class="badge badge-success"> ${portfolioInstance?.publications?.size()}</span> </div>
    <!-- whatever else you need here -->
    <!-- now iterate through the pubs -->
        <g:if test="${portfolioInstance?.publications}">
            <g:set var="publicationInstance" status='j' />
                <ul class="site-publication">
                     <li class="fieldcontain">
                         <span id="publications-label" class="property-label"><g:message code="portfolio.publications.label" default="Last 5 published publications:" /></span>
                             <g:each in="${portfolioInstance.publications}" var="publicationInstance">
                                 ${publicationInstance?.id}
                                    <span class="property-value" aria-labelledby="publications-label"><g:link controller="publication" action="show" id="${publicationInstance.id}">${publicationInstance?.encodeAsHTML()}</g:link></span>
    <!-- and again whatever else you need here -->
                             </g:each>
            </g:if>
</g:each>
</div>--}%

<g:each in="${portfolios}" status="i" var="rsl">
    <div class="site-listing">
        <div><span class="label"><i class="icon-briefcase"></i> Site Name:</span> <g:link action="show" id="${rsl.id }">${rsl?.portfolioName.encodeAsHTML()}</g:link></div>
        <div><span class="label"><i class="icon-info-sign"></i> Site Description:</span>  ${rsl.portdescrip }</div>   <br>
        <div><span class="label"><i class="icon-user"></i> Site Administrator:</span>  ${rsl.profile.portfolioAdmin }</div>   <br>
        <div><span class="label"><i class="icon-list-alt"></i> Total publications:</span><span class="badge badge-success"> ${rsl.publications.size()}</span> </div>

    %{--last five ${results}--}%

        <g:if test="${rsl?.publications}">
        <g:set var="rsl" value="portfolioInstance?.id"/>
            <g:hiddenField name="id" value="${portfolioInstance?.id}"/>
            <ul class="site-publication">
                <li class="fieldcontain">
                    <span id="publications-label" class="property-label"><g:message code="portfolio.publications.label" default="Last 5 published publications:" /></span>
                    <g:each in="${results}" var="r">
                        <span class="property-value" aria-labelledby="publications-label"><g:link controller="publication" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
                    </g:each>
                </li>
            </ul>
        </g:if>
    </div>

</g:each>
</div


<!-- todo - add in mobile css for report lists -->
<!-- todo - fix column widths and padding in whole page -->
<!-- todo - display last 5 publications per portfolio where published flag is set to 'Yes' and portfolio flag as 'Active' -->
