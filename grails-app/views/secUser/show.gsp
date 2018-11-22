
<%@ page import="org.chaguala.sigem.seguranca.SecUser" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'secUser.label', default: 'SecUser')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript', code: 'default.show.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="SecUser"/>
    </div>
    <div id="show-secUser" class="content scaffold-show" role="main">
        %{--<h1 align="center"><g:message code="default.show.label" args="[entityName]"/></h1>--}%
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>


        <fieldset>
            <legend><g:message code="Detalhes do utlizador" args="[entityName]"/></legend>

            <ol class="property-list secUser">
                
                <g:if test="${secUserInstance?.username}">
                    <li class="fieldcontain">
                        <span id="username-label" class="property-label"><g:message
                                code="secUser.username.label" default="Utilizador"/></span>
                        
                        <span class="property-value" aria-labelledby="username-label"><g:fieldValue
                                bean="${secUserInstance}"
                                field="username"/></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${secUserInstance?.password}">
                    <li class="fieldcontain">
                        <span id="password-label" class="property-label"><g:message
                                code="secUser.password.label" default="Senha"/></span>
                        
                        <span class="property-value" aria-labelledby="password-label">**********************</span>
                        
                    </li>
                </g:if>
                
                <g:if test="${secUserInstance?.accountExpired}">
                    <li class="fieldcontain">
                        <span id="accountExpired-label" class="property-label"><g:message
                                code="secUser.accountExpired.label" default="Conta Expira"/></span>
                        
                        <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean
                                boolean="${secUserInstance?.accountExpired}"/></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${secUserInstance?.accountLocked}">
                    <li class="fieldcontain">
                        <span id="accountLocked-label" class="property-label"><g:message
                                code="secUser.accountLocked.label" default="Bloqueio da conta"/></span>
                        
                        <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean
                                boolean="${secUserInstance?.accountLocked}"/></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${secUserInstance?.enabled}">
                    <li class="fieldcontain">
                        <span id="enabled-label" class="property-label"><g:message
                                code="secUser.enabled.label" default="Activada"/></span>
                        
                        <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean
                                boolean="${secUserInstance?.enabled}"/></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${secUserInstance?.passwordExpired}">
                    <li class="fieldcontain">
                        <span id="passwordExpired-label" class="property-label"><g:message
                                code="secUser.passwordExpired.label" default="Expiracao da senha"/></span>
                        
                        <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean
                                boolean="${secUserInstance?.passwordExpired}"/></span>
                        
                    </li>
                </g:if>
                
            </ol>
        </fieldset>
        <g:form>
            <fieldset>
                <legend align="center">Opções do Detalhe</legend>

                <div align="center">
                    <table width="800px" class="tabela2">
                        <tr>
                            <td>
                                <g:form action="edit">
                                    <g:hiddenField name="id" value="${secUserInstance?.id}"/>
                                    <span class="button"><g:actionSubmit class="bt-order" action="edit"
                                                                         value="${message(encodeAs: 'JavaScript', code: 'Editar', default: 'Editar')}"/></span>
                                </g:form>
                            </td>
                            <td>
                                <g:form action="delete">
                                    <g:hiddenField name="id" value="${secUserInstance?.id}"/>
                                    <span class="button"><g:actionSubmit class="bt-order" action="delete"
                                                                         value="${message(encodeAs: 'JavaScript', code: 'Apagar', default: 'Apagar')}"
                                                                         onclick="return confirm('${message(encodeAs: 'JavaScript', code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
                                </g:form>
                            </td>
                        </tr>
                    </table>
                </div>
            </fieldset>
        </g:form>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
