
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Provincia" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'provincia.label', default: 'Provincia')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels>
    <richui:tabLabel selected="${tabContent1}" title="${message(encodeAs: 'JavaScript',code: 'default.show.label', args: [entityName])}"/>
    
    %{--<richui:tabLabel selected="${tabContent2}" title="${message(encodeAs: 'JavaScript',code: 'distritos.label')}"/>--}%
    
</richui:tabLabels>

    <richui:tabContents>
        <richui:tabContent>
            <div class="nav">
                <nav:render group="Provincia"/>
            </div>

            <div id="show-provincia" class="content scaffold-show" role="main">

                %{--<h3 id="titulo"><g:message code="default.show.label" args="[entityName]"/></h3>--}%

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <fieldset>
                    <legend><g:message code="Detalhes" args="[entityName]"/></legend>

                    <table class="tabela">
                        <tbody>

                        

                        <g:if test="${provinciaInstance?.codigo}">
                            <tr>
                                <td>
                                    <span id="codigo-label" class="property-label"><g:message
                                            code="provincia.codigo.label"
                                            default="Codigo"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="codigo-label"><g:fieldValue
                                            bean="${provinciaInstance}"
                                            field="codigo"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${provinciaInstance?.designacao}">
                            <tr>
                                <td>
                                    <span id="designacao-label" class="property-label"><g:message
                                            code="provincia.designacao.label"
                                            default="Designacao"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="designacao-label"><g:fieldValue
                                            bean="${provinciaInstance}"
                                            field="designacao"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${provinciaInstance?.distritos}">
                            <tr>
                                <td>
                                    <span id="distritos-label" class="property-label"><g:message
                                            code="provincia.distritos.label"
                                            default="Distritos"/></span>
                                </td>
                                
                                <td>
                                    <g:each in="${provinciaInstance.distritos}" var="d">
                                        <span class="property-value" aria-labelledby="distritos-label"><g:link
                                                controller="distrito" action="show"
                                                id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
                                    </g:each>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${provinciaInstance?.pais}">
                            <tr>
                                <td>
                                    <span id="pais-label" class="property-label"><g:message
                                            code="provincia.pais.label"
                                            default="Pais"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="pais-label"><g:link
                                            controller="pais" action="show"
                                            id="${provinciaInstance?.pais?.id}">${provinciaInstance?.pais?.encodeAsHTML()}</g:link></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        
                        </tbody>
                    </table>
                </fieldset>
                <g:form>
                    <fieldset>
                        <legend align="center">Opções do Detalhe</legend>

                        <div align="left">
                            <table class="tabela2">
                                <tr>
                                    <td>
                                        <g:form action="edit">
                                            <g:hiddenField name="id" value="${provinciaInstance?.id}"/>
                                            <span class="button"><g:actionSubmit class="bt-order" action="edit"
                                                                                 value="${message(code: 'Editar', default: 'Editar')}"/></span>
                                        </g:form>
                                    </td>
                                    <td>
                                        <g:form action="delete">
                                            <g:hiddenField name="id" value="${provinciaInstance?.id}"/>
                                            <span class="button"><g:actionSubmit class="bt-order" action="delete"
                                                                                 value="${message(code: 'Apagar', default: 'Apagar')}"
                                                                                 onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
                                        </g:form>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </fieldset>
                </g:form>
            </div>
        </richui:tabContent>

    </richui:tabContents></richui:tabView></body>
</html>
