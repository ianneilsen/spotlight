<!-- weblist partial showing list of reporting sites and last 5 reports ordered by published date in asc order-->
<%@ page import="spotlight.content.Portfolio" %>
<%@ page import="spotlight.content.Publication" %>

<div class="alert alert-info" xmlns="http://www.w3.org/1999/html">Permissions apply to <strong>editing</strong> publications.<br>
<div style="display: inline;"><p>Click portfolio name to read or edit publications. Total number of sites: <strong>${rsNumb}</strong> | Total number of publications: <strong>${reportscount}</strong> </p>
</div>
</div>

<div class="property-list portfolio">

    <g:each in="${portfolios}" status="i" var="rsl">
       <div class="site-listing">
              <div><span class="label">Site Name:</span> <g:link action="show" id="${rsl.id }">${rsl?.portfolioName.encodeAsHTML()}</g:link></div>
              <div><span class="label">Site Description:</span>  ${rsl.portdescrip }</div>   <br>
			  <div><span class="label">Site Administrator:</span>  ${rsl.profile.portfolioAdmin }</div>   <br>
       <div><span class="label"> Total publications:</span><span class="badge badge-success"> ${rsl.publications.size()}</span> </div>


	 <g:if test="${rsl?.publications}">
         <g:set var="publications" />
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
</div>

<!-- todo - add in mobile css for report lists -->
<!-- todo - fix column widths and padding in whole page -->
<!-- todo - only show last 5 reports by publishedate sort by date desc -->
