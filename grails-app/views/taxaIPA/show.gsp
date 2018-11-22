
<%@ page import="org.chaguala.sigem.taxaipa.TaxaIPA" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'actividade.label', default: 'Actividade')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels>
    <richui:tabLabel selected="${tabContent1}" title="${message(encodeAs: 'JavaScript',code: 'default.show.label', args: [entityName])}"/>
</richui:tabLabels>

    <richui:tabContents>
        <richui:tabContent>
            <div class="nav">
                <nav:render group="Actividade"/>
            </div>

            <div id="show-actividade" class="content scaffold-show" role="main">

                <h3 id="titulo"><g:message code="default.show.label" args="[entityName]"/></h3>

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <fieldset>
                    <legend><g:message code="default.show.label" args="[entityName]"/></legend>

                    <table class="tabela">
                        <tbody>



                        <g:if test="${actividadeInstance?.estado}">
                            <tr>
                                <td>
                                    <span id="codigo-label" class="property-label"><g:message
                                            code="actividade.estado.label"
                                            default="estado"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="id-label"><g:fieldValue
                                            bean="${actividadeInstance}"
                                            field="estado"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${actividadeInstance?.designacao}">
                            <tr>
                                <td>
                                    <span id="designacao-label" class="property-label"><g:message
                                            code="actividade.designacao.label"
                                            default="Designacao"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="designacao-label"><g:fieldValue
                                            bean="${actividadeInstance}"
                                            field="designacao"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${actividadeInstance?.designacao}">
                            <tr>
                                <td>
                                    <span id="-label" class="property-label"><g:message
                                            code="actividade.designacao.label"
                                            default="Designacao"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="designacao-label"><g:fieldValue
                                            bean="${actividadeInstance}"
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

                        <div align="center">
                            <table class="tabela2">
                                <tr>
                                    <td>
                                        <g:form action="edit">
                                            <g:hiddenField name="id" value="${actividadeInstance?.id}"/>
                                            <span class="button"><g:actionSubmit class="bt-order" action="edit"
                                                                                 value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
                                        </g:form>
                                    </td>
                                    <td>
                                        <g:form action="delete">
                                            <g:hiddenField name="id" value="${actividadeInstance?.id}"/>
                                            <span class="button"><g:actionSubmit class="bt-order" action="delete"
                                                                                 value="${message(code: 'default.button.delete.label', default: 'Delete')}"
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
