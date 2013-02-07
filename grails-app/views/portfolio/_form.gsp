<%@ page import="spotlight.content.Portfolio" %>
<%@ page import="spotlight.content.Profile" %>

<div class="group">

    <div class="column">
        <div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'portfolioName', 'error')} required">

            <label for="portfolioName" style="width: 40%;"><g:message code="portfolio.portfolioName.label" default="Portfolio Name" /><span class="required-indicator">*</span></label>

            <g:textField name="portfolioName" style="width: 400px;" maxlength="170" required="" value="${portfolioInstance?.portfolioName}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'portdescrip', 'error')} required">

	<label for="portdescrip" style="width: 40%;"><g:message code="portfolio.portdescrip.label" default="Portfolio site description" /><span class="required-indicator">*</span></label>

	<g:textArea name="portdescrip" style="width: 400px;" rows="5" maxlength="200" required="" value="${portfolioInstance?.portdescrip}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'portpublished', 'error')} required">

    <label for="portpublished" style="width: 60%;"><g:message code="portfolio.portpublished.label" default="Portfolio is protected by login globally" /><span class="required-indicator">*</span></label>

    <g:select name="portpublished" from="${portfolioInstance.constraints.portpublished.inList}" required="" value="${fieldValue(bean: portfolioInstance, field: 'portpublished')}" valueMessagePrefix="portfolio.portpublished"/>

</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'status', 'error')} required">

    <label for="status" style="width: 40%;"><g:message code="portfolio.status.label" default="Portfolio status " /><span class="required-indicator">*</span></label>

    <g:select name="status" from="${portfolioInstance.constraints.status.inList}" required="" value="${fieldValue(bean: portfolioInstance, field: 'status')}" valueMessagePrefix="portfolio.status"/>

</div>

 <!---- profile fields ---->

<div class="fieldcontain ${hasErrors(bean: portfolioInstance.profile, field: 'portfolioAdmin', 'error')} required">

    <label for="profile.portfolioAdmin" style="width: 40%;"><g:message code="profile.portfolioAdmin.label" default="Portfolio Admin" /><span class="required-indicator">*</span><div class="help-block" style="font-size: 10px;">The main contact person for the site</div></label>

    <g:textField name="profile.portfolioAdmin" style="width: 300px;" maxlength="80" required="" value="${portfolioInstance?.profile?.portfolioAdmin}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance.profile, field: 'portfolioEmail', 'error')} required">

    <label for="profile.portfolioEmail" style="width: 50%;"><g:message code="profile.portfolioEmail.label" default="Portfolio Administrator Email" /><span class="required-indicator">*</span></label>

    <div class="input-prepend"><span class="add-on">@</span> <g:field style="width: 270px;" type="email" name="profile.portfolioEmail" required="" value="${portfolioInstance?.profile?.portfolioEmail}"/></div>

</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance.profile, field: 'portfoliocc', 'error')} ">

     <label for="profile.portfoliocc" style="width: 40%;"><g:message code="profile.portfoliocc.label" default="Portfolio CC Email" /></label>

     <div class="input-prepend"><span class="add-on">@</span><g:field style="width: 400px;" type="email" name="profile.portfoliocc" value="${portfolioInstance?.profile?.portfoliocc}"/></div>
</div>

</div>

<div class="column">

    <div class="fieldcontain ${hasErrors(bean: portfolioInstance.profile, field: 'teamqueueemail', 'error')} ">

        <label for="profile.teamqueueemail" style="width: 40%;"><g:message code="profile.teamqueueemail.label" default="RT queue email" /></label>

        <div class="input-prepend"><span class="add-on">@</span><g:field style="width: 400px;" type="email" name="profile.teamqueueemail" value="${portfolioInstance?.profile?.teamqueueemail}"/>

        </div>

    </div>

    <div class="fieldcontain ${hasErrors(bean: portfolioInstance.profile, field: 'rtqueue', 'error')} ">

        <label for="profile.rtqueue" style="width: 40%;"><g:message code="profile.rtqueue.label" default="RT Queue name" /></label>

        <g:textField name="profile.rtqueue" value="${portfolioInstance?.profile?.rtqueue}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: portfolioInstance.profile, field: 'etherpadurl', 'error')} ">

        <label for="profile.etherpadurl" style="width: 40%;"><g:message code="profile.etherpadurl.label" default="Etherpad URL" /></label>

        <div class="input-prepend"><span class="add-on">URL</span><g:field style="width: 400px;" type="url" name="profile.etherpadurl" value="${portfolioInstance?.profile?.etherpadurl}"/>

        </div>

    </div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance.profile, field: 'portfolioColor', 'error')} ">

    <label for="profile.portfolioColor" style="width: 40%;""><g:message code="profile.portfolioColor.label" default="Portfolio Color" /></label>

    <g:textField name="profile.portfolioColor" value="${portfolioInstance?.profile?.portfolioColor}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance.profile, field: 'portfolioFilestore', 'error')} ">

    <label for="profile.portfolioFilestore" style="width: 60%;""><g:message code="profile.portfolioFilestore.label" default="Portfolio Uploads to following dir" /></label>

    <g:textField name="profile.portfolioFilestore" value="${portfolioInstance?.profile?.portfolioFilestore}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance.profile, field: 'bugzillaproduct', 'error')} ">

    <label for="profile.bugzillaproduct" style="width: 40%;"><g:message code="profile.bugzillaproduct.label" default="Bugzilla Product Id" /></label>

    <g:textField name="profile.bugzillaproduct" value="${portfolioInstance?.profile?.bugzillaproduct}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance.profile, field: 'bugzillacomponent', 'error')} ">

    <label for="profile.bugzillacomponent" style="width: 40%;"><g:message code="profile.bugzillacomponent.label" default="Bugzilla Component Id" /></label>

    <g:textField name="profile.bugzillacomponent" value="${portfolioInstance?.profile?.bugzillacomponent}"/>

</div>



</div>
</div>
%{--<div class="fieldcontain ${hasErrors(bean: portfolioInstance.profileInstance, field: 'portfolio', 'error')} required">
	<label for="portfolio">
		<g:message code="profile.portfolio.label" default="Portfolio" />
	</label>
	<g:select id="portfolio" name="portfolio.id" from="${spotlight.content.Portfolio}" optionKey="id" required="" value="${profileInstance?.portfolio?.id}" class="many-to-one"/>
</div>--}%

<!----------html allowed in publication ------->
%{--<div class="fieldcontain ${hasErrors(bean: portfolioInstance.profile, field: 'profile.htmlpuballowed', 'error')} ">
    <label for="profile.htmlpuballowed">
        <g:message code="profile.htmlpuballowed.label" default="htmlpuballowed" />

    </label>
    <g:select name="profile.htmlpuballowed" from="${profile.constraints.siteupload.inList}" value="${portfolioInstance?.profile?.htmlpuballowed}" valueMessagePrefix="profile.htmlpuballowed" noSelection="['': '']"/>
</div>--}%


<!---file uploads allowed------>
%{--
<div class="fieldcontain ${hasErrors(bean: portfolioInstance.profile, field: 'siteupload', 'error')} required">
    <label for="profile.siteupload">
        <g:message code="profile.siteupload.label" default="Allow site uploads" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="profile.siteupload" from="${profile.constraints.siteupload.inList}" required="" value="${fieldValue(bean: profileInstance, field: 'siteupload')}" valueMessagePrefix="profile.siteupload"/>
</div>
--}%
<!---------------------constraints------------>