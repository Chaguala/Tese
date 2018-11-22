<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.DistritoUrbano" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'distritoUrbano.label', default: 'DistritoUrbano')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(code: 'default.edit.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="DistritoUrbano"/>
    </div>

    <div id="edit-distritoUrbano" class="content scaffold-edit" role="main">
        <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${distritoUrbanoInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${distritoUrbanoInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form method="post" >
        <g:hiddenField name="id" value="${distritoUrbanoInstance?.id}"/>
        <g:hiddenField name="version" value="${distritoUrbanoInstance?.version}"/>
        <fieldset>
            <legend><g:message code="default.edit.label" args="[entityName]"/></legend>
                <g:render template="form"/>
        </fieldset>
        <fieldset>
            <legend align="center">Opções da Actualização</legend>

            <div align="center">
                <g:actionSubmit class="bt-order" action="update"
                                value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                &nbsp;&nbsp;
                <g:actionSubmit name="cancel" class="bt-order" action="show"
                                value="${message(code: 'default.button.cancel.label', default: 'Cancel')}"/>
            </div>
        </fieldset>
        </g:form>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
