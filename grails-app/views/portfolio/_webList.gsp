<!-- weblist partial showing list of reporting sites and last 5 reports ordered by published date in asc order-->
<%@ page import="spotlight.content.Portfolio" %>
<%@ page import="spotlight.content.Publication" %>
%{-- <g:layoutBody/>--}%
<div class="alert alert-info" xmlns="http://www.w3.org/1999/html">Permissions apply to <strong>editing</strong> publications.<br>
<div style="display: inline;"><p>Click portfolio name to read or edit publications. Total number of sites: <strong>${rsNumb}</strong> | Total number of publications: <strong>${reportscount}</strong> </p>
</div>
</div>

<div class="property-list portfolio">
<g:each in="${portfolios}" var="portfolioInstance">
    <div class="site-listing">
        <div><span class="label">Site Name:</span><g:link action="show" id="${portfolioInstance?.id }">${portfolioInstance?.portfolioName?.encodeAsHTML()}</g:link></div>
        <div><span class="label">Site Description:</span>${portfolioInstance?.portdescrip?.encodeAsHTML() }</div>   <br>
        <div><span class="label">Site Administrator:</span>${portfolioInstance?.profile?.portfolioAdmin?.encodeAsHTML() }</div>   <br>
        <div><span class="label"> Total publications:</span><span class="badge badge-success"> ${portfolioInstance?.publications?.size()}</span> </div>
    <!-- whatever else you need here -->
    <!-- now iterate through the pubs -->
        <g:if test="${portfolioInstance?.publications}">
            <g:set var="publicationInstance" />
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

</div>

%{--<g:each in="${portfolios}" status="i" var="rsl">
       <div class="site-listing">
           <div><span class="label">Site Name:</span> <g:link action="show" id="${rsl.id }">${rsl?.portfolioName.encodeAsHTML()}</g:link></div>
           <div><span class="label">Site Description:</span>  ${rsl.portdescrip }</div>   <br>
		   <div><span class="label">Site Administrator:</span>  ${rsl.profile.portfolioAdmin }</div>   <br>
           <div><span class="label"> Total publications:</span><span class="badge badge-success"> ${rsl.publications.size()}</span> </div>

	 <g:if test="${rsl?.publications}">
         <g:set var="publications" />
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
</g:each>--}%

</div>
%{-- </g:layoutBody>--}%

<!-- todo - add in mobile css for report lists -->
<!-- todo - fix column widths and padding in whole page -->
<!-- todo - only show last 5 reports by publishedate sort by date desc -->

<!--  original code --------------->
%{--<g:each in="${portfolios}" var="portfolioInstance" status="i">
    ${portfolioInstance?.portfolioName?.encodeAsHTML()}
    <!-- whatever else you need here -->
    <!-- now iterate through the pubs -->
    <g:each in="${portfolioInstance.publications}" var="publicationInstance" status="j">
        ${publicationInstance.id}
        <!-- and again whatever else you need here -->
    </g:each>
</g:each>--}%
<!-- eol -------------------------->