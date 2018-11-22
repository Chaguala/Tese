
<%@ page import="org.chaguala.sigem.tiposeguro.TipoSeguro" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'tiposeguro.label', default: 'TipoSeguro')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(code: 'default.edit.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="TipoSeguro"/>
    </div>

    <div id="edit-tiposeguro" class="content scaffold-edit" role="main">
        <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${tiposeguroInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${tiposeguroInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form method="post" >
            <g:hiddenField name="id" value="${actividadeInstance?.id}"/>
            <g:hiddenField name="version" value="${actividadeInstance?.version}"/>
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
