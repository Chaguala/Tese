
<%@ page import="org.chaguala.sigem.modelo.Modelo" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'modelo.label', default: 'Modelo')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(code: 'default.create.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="Modelo"/>
    </div>

    <div id="create-marmodeloca" class="content scaffold-create" role="main">
        <h1 align="center"><g:message code="default.create.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${modeloInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${modeloInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <g:form action="save" >
            <fieldset>
                <legend><g:message code="default.create.label" args="[entityName]"/></legend>
                <g:render template="form"/>
            </fieldset>

            <fieldset>
                <legend align="center">Opções do Registo</legend>

                <div align="center">
                    <g:submitButton name="create" class="bt-order"
                                    value="${message(code: 'Criar', default: 'Criar')}"/>
                    &nbsp;&nbsp;
                    <g:actionSubmit name="cancel" class="bt-order" action="list"
                                    value="${message(code: 'Cancelar', default: 'Cancelar')}"/>
                </div>
            </fieldset>

            <div class="clear"></div>

        </g:form>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>