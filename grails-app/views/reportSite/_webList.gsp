<!-- weblist partial showing list of reporting sites and last 5 reports ordered by lastupdated in asc order-->
<%@ page import="spotlight.content.ReportSite" %>
<%@ page import="spotlight.content.Report" %>

<div class="well well-small">
		<h3>Available sites for external consumption:</h3>
		</div>

			<div class="alert alert-info">Permissions apply to <strong>editing</strong> reports or documents.<br>
			<p>Click site name to read or edit reports.</p>
                <p><h5> Total number of sites: ${rsNumb}</h5></p>
			</div>
	<br>
<!--<div id="show-reportSite" class="content scaffold-show" role="main">         -->
     <div class="property-list reportSite">

		   <g:each in="${webLists}" status="i" var="rsl">

            <div class="site-listing">
			<div>Site Name: <g:link action="show" id="${rsl.id }">${rsl?.siteName.encodeAsHTML()}</g:link></div>
			<div>Site Description: ${rsl.sdescription }</div>
			<div>Site Administrator: ${rsl.reportprofile.siteadmin }</div>

                   <h6>Number of reports: ${reportscount}</h6>

                   <p>Report count is: ${webreports?.size()}</p>


			<g:if test="${rsl?.reports}">
                <ul class="site-report">
                <li class="fieldcontain">
					<span id="reports-label" class="property-label"><g:message code="reportSite.reports.label" default="Last 5 Reports:" /></span>
					<g:each in="${rsl.reports}" var="r">
                      	<span class="property-value" aria-labelledby="reports-label"><g:link controller="report" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
			        </g:each>
			    </li>
                </ul>
                </g:if>
               </div>

			</g:each>


       </div>



