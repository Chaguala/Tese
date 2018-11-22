<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Pais" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'pais.label', default: 'Pais')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(code: 'default.edit.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="Pais"/>
    </div>

    <div id="edit-pais" class="content scaffold-edit" role="main">
        %{--<h1><g:message code="default.edit.label" args="[entityName]"/></h1>--}%
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${paisInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${paisInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form method="post" >
        <g:hiddenField name="id" value="${paisInstance?.id}"/>
        <g:hiddenField name="version" value="${paisInstance?.version}"/>
        <fieldset>
            <legend><g:message code="Actualizar dados" args="[entityName]"/></legend>
                <g:render template="form"/>
        </fieldset>
        <fieldset>
            <legend align="center">Opções da Actualização</legend>

            <div align="left">
                <g:actionSubmit class="bt-order" action="update"
                                value="${message(code: 'Actualizar', default: 'Actualizar')}"/>
                &nbsp;&nbsp;
                <g:actionSubmit name="cancel" class="bt-order" action="show"
                                value="${message(code: 'Cancelar', default: 'Cancelar')}"/>
            </div>
        </fieldset>
        </g:form>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
