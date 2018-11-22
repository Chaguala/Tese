
<%@ page import="org.chaguala.sigem.despacho.Despacho" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'despacho.label', default: 'Despacho')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels>
    <richui:tabLabel selected="${tabContent1}" title="${message(encodeAs: 'JavaScript',code: 'default.show.label', args: [entityName])}"/>
</richui:tabLabels>

    <richui:tabContents>
        <richui:tabContent>
            <div class="nav">
                <nav:render group="Despacho"/>
            </div>

            <div id="show-despacho" class="content scaffold-show" role="main">

                %{--<h3 id="titulo"><g:message code="default.show.label" args="[entityName]"/></h3>--}%

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <fieldset>
                    <legend><g:message code="Detalhes" args="[entityName]"/></legend>

                    <table class="tabela">
                        <tbody>



                        <g:if test="${despachoInstance?.estado}">
                            <tr>
                                <td>
                                    <span id="codigo-label" class="property-label"><g:message
                                            code="despacho.estado.label"
                                            default="estado"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="id-label"><g:fieldValue
                                            bean="${despachoInstance}"
                                            field="estado"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${despachoInstance?.designacao}">
                            <tr>
                                <td>
                                    <span id="designacao-label" class="property-label"><g:message
                                            code="despacho.designacao.label"
                                            default="Designacao"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="designacao-label"><g:fieldValue
                                            bean="${despachoInstance}"
                                            field="designacao"/></span>
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
                                            <g:hiddenField name="id" value="${despachoInstance?.id}"/>
                                            <span class="button"><g:actionSubmit class="bt-order" action="edit"
                                                                                 value="${message(code: 'Editar', default: 'Editar')}"/></span>
                                        </g:form>
                                    </td>
                                    <td>
                                        <g:form action="delete">
                                            <g:hiddenField name="id" value="${despachoInstance?.id}"/>
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
