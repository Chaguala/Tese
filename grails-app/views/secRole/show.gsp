
<%@ page import="org.chaguala.sigem.seguranca.SecRole" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'secRole.label', default: 'SecRole')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript', code: 'default.show.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="SecRole"/>
    </div>

    <div id="show-secRole" class="content scaffold-show" role="main">
        %{--<h1 align="center"><g:message code="default.show.label" args="[entityName]"/></h1>--}%
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>


        <fieldset>
            <legend><g:message code="Detalhes" args="[entityName]"/></legend>

            <ol class="property-list secRole">
                
                <g:if test="${secRoleInstance?.authority}">
                    <li class="fieldcontain">
                        <span id="authority-label" class="property-label"><g:message
                                code="secRole.authority.label" default="Autoridade"/></span>
                        
                        <span class="property-value" aria-labelledby="authority-label"><g:fieldValue
                                bean="${secRoleInstance}"
                                field="authority"/></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${secRoleInstance?.description}">
                    <li class="fieldcontain">
                        <span id="description-label" class="property-label"><g:message
                                code="secRole.description.label" default="Designacao"/></span>
                        
                        <span class="property-value" aria-labelledby="description-label"><g:fieldValue
                                bean="${secRoleInstance}"
                                field="description"/></span>
                        
                    </li>
                </g:if>
                
            </ol>
        </fieldset>
        <g:form>
            <fieldset>
                <legend align="center">Opções do Detalhe</legend>

                <div align="left">
                    <table width="800px" class="tabela2">
                        <tr>
                            <td>
                                <g:form action="edit">
                                    <g:hiddenField name="id" value="${secRoleInstance?.id}"/>
                                    <span class="button"><g:actionSubmit class="bt-order" action="edit"
                                                                         value="${message(encodeAs: 'JavaScript', code: 'Editar', default: 'Editar')}"/></span>
                                </g:form>
                            </td>
                            <td>
                                <g:form action="delete">
                                    <g:hiddenField name="id" value="${secRoleInstance?.id}"/>
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
