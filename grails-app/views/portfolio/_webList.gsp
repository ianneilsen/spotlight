<!-- weblist partial showing list of reporting sites and last 5 reports ordered by lastupdated in asc order-->
<%@ page import="spotlight.content.Portfolio" %>
<%@ page import="spotlight.content.Publication" %>

<div class="well well-small">
		<h3>Available sites for external consumption:</h3>
		</div>

			<div class="alert alert-info">Permissions apply to <strong>editing</strong> reports or documents.<br>
			<p>Click portfolio name to read or edit publications.</p>
                <p><h5> Total number of sites: ${rsNumb}</h5></p>
			</div>
	<br>
<!--<div id="show-Portfolio" class="content scaffold-show" role="main">         -->
     <div class="property-list portfolio">

		   <g:each in="${webLists}" status="i" var="rsl">

            <div class="site-listing">
			<div>Site Name: <g:link action="show" id="${rsl.id }">${rsl?.portfolioName.encodeAsHTML()}</g:link></div>
			<div>Site Description: ${rsl.portdescrip }</div>
			<div>Site Administrator: ${rsl.profile.portfolioAdmin }</div>

                   <h6>Number of publications: ${reportscount}</h6>

                   <p>Publication count is: ${Publication.count()}</p>
                <h6>Number of publications: ${numofreports}</h6>


			<g:if test="${rsl?.publications}">
                <ul class="site-publication">
                <li class="fieldcontain">
					<span id="publications-label" class="property-label"><g:message code="portfolio.publications.label" default="Last 5 Publications:" /></span>
					<g:each in="${rsl.publications}" var="r">

                      	<span class="property-value" aria-labelledby="publications-label"><g:link controller="publication" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>

			        </g:each>
                    <h6>Number of publications: ${numofreports}</h6>
                     </li>
                </ul>
                </g:if>
               </div>

			</g:each>
<g:each in="${portfolioInstance?.publications?}" var="r">
<li><g:link controller="publication" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>


       </div>



