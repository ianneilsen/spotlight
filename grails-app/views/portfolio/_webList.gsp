<!-- weblist partial showing list of reporting sites and last 5 reports ordered by published date in asc order-->


%{--<script src="${resource(dir: 'js', file: 'lastfiver.js')}" type="text/javascript"></script>--}%


<div class="alert alert-info" >Permissions apply to <strong>editing</strong> publications. | Click portfolio name or choose from the last five published reports under the portfolio heading.</div>


<div class="property-list portfolio">
<g:each in="${portfolios}" status="i" var="rsl">
    <div class="site-listing">
        <div><span class="label"><i class="icon-briefcase"></i> Site Name:</span> <g:link action="show" id="${rsl.id }">${rsl?.portfolioName.encodeAsHTML()}</g:link></div>
        <div><span class="label"><i class="icon-info-sign"></i> Site Description:</span>  ${rsl.portdescrip }</div>   <br>
        <div><span class="label"><i class="icon-user"></i> Site Administrator:</span>  ${rsl.profile.portfolioAdmin }</div>   <br>
        <div><span class="label"><i class="icon-list-alt"></i> Total publications:</span><span class="badge badge-success"> ${rsl.publications.size()}</span> </div>
        <g:hiddenField name="id" value="${portfolioInstance?.id}"/>
    %{--last five ${results}--}%

        <g:if test="${rsl?.publications}">
        <g:set var="rsl" value="portfolios"/>
            <ul class="more">
                <li>
                    %{--<span id="publications-label" class="property-label"><g:message code="portfolio.publications.label" default="Last 5 published publications:" /></span>--}%
                        <g:each in="${results}" var="r">
                            %{--<span class="property-value" aria-labelledby="publications-label">--}%<g:link controller="publication" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link>%{--</span>--}%
                        </g:each>
                </li>
            </ul>

        </g:if>
    </div>

</g:each>
</div>

<ul class="more">
    <li><a href="SpotLight-Grails/publication/show/1"> one</a></li>
    <li>two</li>
    <li>three</li>
    <li>four</li>
    <li>five</li>
    <li>six</li>
    <li>seven</li>
    <li>eight</li>
    <li>nine</li>
    <li>ten</li>
</ul>



<!-- todo - add in mobile css for report lists -->
<!-- todo - fix column widths and padding in whole page -->
<!-- todo - display last 5 publications per portfolio where published flag is set to 'Yes' and portfolio flag as 'Active' -->
