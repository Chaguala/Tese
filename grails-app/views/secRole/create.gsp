<%@ page import="org.chaguala.sigem.seguranca.SecRole" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'secRole.label', default: 'SecRole')}"/>
    <title><g:message code="Previlegio" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript', code: 'Criar Novos Previlegios', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="SecRole"/>
    </div>
%{--<a href="#create-secRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label"--}%
%{--default="Skip to content&hellip;"/></a>--}%

%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%

    <div id="create-secRole" class="content scaffold-create" role="main">
        %{--<h1 align="center"><g:message code="default.create.label" args="[entityName]"/></h1>--}%
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${secRoleInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${secRoleInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <g:form action="save" >
        <fieldset>
            <legend><g:message args="[entityName]"/></legend>
            <g:render template="form"/>
        </fieldset>

        <fieldset>
            <legend align="left">Opções do Registo</legend>

            <div align="left">
                <g:submitButton name="create" class="bt-order"
                                value="${message(encodeAs: 'JavaScript', code: 'Criar', default: 'Criar')}"/>
                &nbsp;&nbsp;
                <g:actionSubmit name="cancel" class="bt-order" action="list"
                                value="${message(encodeAs: 'JavaScript', code: 'Cancelar', default: 'Cancelar')}"/>
            </div>
        </fieldset>

        <div class="clear"></div>

        </g:form>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
