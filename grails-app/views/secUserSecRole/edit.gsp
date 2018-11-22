<%@ page import="org.chaguala.sigem.seguranca.SecUserSecRole" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'secUserSecRole.label', default: 'SecUserSecRole')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript', code: 'default.edit.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="SecUserSecRole"/>
    </div>

%{--<a href="#edit-secUserSecRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label"--}%
%{--default="Skip to content&hellip;"/></a>--}%

%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>--}%
%{--<li><g:link class="create" action="create"><g:message code="default.new.label"--}%
%{--args="[entityName]"/></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%

    <div id="edit-secUserSecRole" class="content scaffold-edit" role="main">
        <h1 align="center"><g:message code="default.edit.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${secUserSecRoleInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${secUserSecRoleInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form method="post" >
        <g:hiddenField name="id" value="${secUserSecRoleInstance?.id}"/>
        <g:hiddenField name="version" value="${secUserSecRoleInstance?.version}"/>
        <fieldset>
            <legend><g:message code="default.edit.label" args="[entityName]"/></legend>
            <g:render template="form"/>
        </fieldset>
        <fieldset>
            <legend align="center">Opções da Actualização</legend>

            <div align="center">
                <g:actionSubmit class="bt-order" action="update"
                                value="${message(encodeAs: 'JavaScript', code: 'default.button.update.label', default: 'Update')}"/>
                &nbsp;&nbsp;
                <g:actionSubmit name="cancel" class="bt-order" action="show"
                                value="${message(encodeAs: 'JavaScript', code: 'default.button.cancel.label', default: 'Cancel')}"/>
            </div>
        </fieldset>
        </g:form>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
