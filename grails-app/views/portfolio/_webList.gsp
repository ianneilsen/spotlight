<!-- weblist partial showing list of reporting sites and last 5 reports ordered by published date in asc order-->
<%@ page import="spotlight.content.Portfolio" %>
<%@ page import="spotlight.content.Publication" %>

<div class="alert alert-info">Permissions apply to <strong>editing</strong> publications.<br>
	<p>Click portfolio name to read or edit publications.</p>
    <p><h5> Total number of sites: ${rsNumb}</h5></p>
    <h6>Total number of publications: ${reportscount}</h6>
</div>

<div class="property-list portfolio">
    <g:each in="${webLists}" status="i" var="rsl">
       <div class="site-listing">
              <div><span class="label">Site Name:</span> <g:link action="show" id="${rsl.id }">${rsl?.portfolioName.encodeAsHTML()}</g:link></div>
			  <div><span class="label">Site Description:</span>  ${rsl.portdescrip }</div>   <br>
			  <div><span class="label">Site Administrator:</span>  ${rsl.profile.portfolioAdmin }</div>
              <h6>Total ${rsl.publications.size()} publications</h6>

	 <g:if test="${rsl?.publications}">
         <ul class="site-publication">
           <li class="fieldcontain">
		   <span id="publications-label" class="property-label"><g:message code="portfolio.publications.label" default="Last 5 Publications:" /></span>
			        <g:each in="${rsl.publications}" var="r">
           <span class="property-value" aria-labelledby="publications-label"><g:link controller="publication" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
             </g:each>
           </li>
         </ul>
     </g:if>
</div>

</g:each>
</div>

<!-- todo - add in mobile css for report lists -->
<!-- todo - fix column widths and padding in whole page -->
<!-- todo - only show last 5 reports by publishedate sort by date desc -->
