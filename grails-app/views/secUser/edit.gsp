<%@ page import="org.chaguala.sigem.seguranca.SecUser" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'secUser.label', default: 'SecUser')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript', code: 'default.edit.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="SecUser"/>
    </div>
    <div id="edit-secUser" class="content scaffold-edit" role="main">
        %{--<h1 align="center"><g:message code="default.edit.label" args="[entityName]"/></h1>--}%
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${secUserInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${secUserInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form method="post" >
        <g:hiddenField name="id" value="${secUserInstance?.id}"/>
        <g:hiddenField name="version" value="${secUserInstance?.version}"/>
        <fieldset>
            <legend><g:message code="Actualizar dados do utilizador" args="[entityName]"/></legend>
            <g:render template="form"/>
        </fieldset>
        <fieldset>
            <legend align="center">Opções da Actualização</legend>

            <div align="left">
                <g:actionSubmit class="bt-order" action="update"
                                value="${message(encodeAs: 'JavaScript', code: 'Actualizar', default: 'Actualizar')}"/>
                &nbsp;&nbsp;
                <g:actionSubmit name="cancel" class="bt-order" action="show"
                                value="${message(encodeAs: 'JavaScript', code: 'Cancelar', default: 'Cancelar')}"/>
            </div>
        </fieldset>
        </g:form>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
