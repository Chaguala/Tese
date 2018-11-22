<%@ page import="org.chaguala.sigem.seguranca.SecUser" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'secUser.label', default: 'SecUser')}"/>
    <title><g:message code="Utilizador" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript', code: 'Utilizador', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="SecUser"/>
    </div>


%{--<a href="#list-secUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label"--}%
%{--default="Skip to content&hellip;"/></a>--}%

%{--<div id="nav" class="nav" role="navigation">--}%
%{--<nav:render group="SecUser"/>--}%
%{--</div>--}%

    <div id="titulo">
        <h4><g:message code="Listagem de Utilizadores" args="[entityName]"/></h4>
    </div>

    <div id="list-secUser" class="content scaffold-list" role="main">
    %{--<h1><g:message code="default.list.label" args="[entityName]"/></h1>--}%
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div>
            %{--<b>${message(encodeAs: 'JavaScript', code: 'listagem.label', default: 'Listagem')}</b>--}%
            <hr class="thin"/>
        </div>

        <filterpane:filterPane domain="SecUser"
                               titleKey="fp.tag.filterPane.titleText"/>

        <table>
            <thead>
            <tr>

                <g:sortableColumn property="username"
                                  title="${message(encodeAs: 'JavaScript', code: 'secUser.username.label', default: 'Nome')}"/>

                <g:sortableColumn property="password"
                                  title="${message(encodeAs: 'JavaScript', code: 'secUser.password.label', default: 'Senha')}"/>

                <g:sortableColumn property="accountExpired"
                                  title="${message(encodeAs: 'JavaScript', code: 'secUser.accountExpired.label', default: 'Conta expira')}"/>

                <g:sortableColumn property="accountLocked"
                                  title="${message(encodeAs: 'JavaScript', code: 'secUser.accountLocked.label', default: 'Bloqueio de conta')}"/>

                <g:sortableColumn property="enabled"
                                  title="${message(encodeAs: 'JavaScript', code: 'secUser.enabled.label', default: 'Activada')}"/>

                <g:sortableColumn property="passwordExpired"
                                  title="${message(encodeAs: 'JavaScript', code: 'secUser.passwordExpired.label', default: 'Expiracao da senha')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${secUserInstanceList}" status="i" var="secUserInstance">
                <tr class="${(i % 2) == 0 ? 'dbodd' : 'dbeven'}" onMouseOver="this.className = 'dbhover';" onMouseOut="this.className = '${(i % 2) == 0 ? 'dbodd' : 'dbeven'}';">
                    <td><g:link action="show"
                                id="${secUserInstance.id}">${fieldValue(bean: secUserInstance, field: "username")}</g:link></td>

                    <td><g:link action="show"
                                id="${secUserInstance.id}">*************************************</g:link></td>

                    <td><g:link action="show"
                                id="${secUserInstance.id}"><g:formatBoolean
                                boolean="${secUserInstance.accountExpired}"/></g:link></td>

                    <td><g:link action="show"
                                id="${secUserInstance.id}"><g:formatBoolean
                                boolean="${secUserInstance.accountLocked}"/></g:link></td>

                    <td><g:link action="show"
                                id="${secUserInstance.id}"><g:formatBoolean
                                boolean="${secUserInstance.enabled}"/></g:link></td>

                    <td><g:link action="show"
                                id="${secUserInstance.id}"><g:formatBoolean
                                boolean="${secUserInstance.passwordExpired}"/></g:link></td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${secUserInstanceTotal}"/>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
