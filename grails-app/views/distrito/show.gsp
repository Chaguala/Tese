<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Distrito" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript', code: 'distrito.label', default: 'Distrito')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels>
    <richui:tabLabel selected="${tabContent1}"
                     title="${message(encodeAs: 'JavaScript', code: 'default.show.label', args: [entityName])}"/>
</richui:tabLabels>

    <richui:tabContents>
        <richui:tabContent>
            <div class="nav">
                <nav:render group="Distrito"/>
            </div>

            <div id="show-distrito" class="content scaffold-show" role="main">

                %{--<h3 id="titulo"><g:message code="default.show.label" args="[entityName]"/></h3>--}%

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <fieldset>
                    <legend><g:message code="Detalhes" args="[entityName]"/></legend>

                    <table class="tabela">
                        <tbody>

                        <g:if test="${distritoInstance?.codigo}">
                            <tr>
                                <td>
                                    <span id="codigo-label" class="property-label"><g:message
                                            code="distrito.codigo.label"
                                            default="Codigo"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="codigo-label"><g:fieldValue
                                            bean="${distritoInstance}"
                                            field="codigo"/></span>
                                </td>

                            </tr>
                        </g:if>


                        <g:if test="${distritoInstance?.designacao}">
                            <tr>
                                <td>
                                    <span id="designacao-label" class="property-label"><g:message
                                            code="distrito.designacao.label"
                                            default="Designacao"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="designacao-label"><g:fieldValue
                                            bean="${distritoInstance}"
                                            field="designacao"/></span>
                                </td>

                            </tr>
                        </g:if>


                        <g:if test="${distritoInstance?.bairros}">
                            <tr>
                                <td>
                                    <span id="bairros-label" class="property-label"><g:message
                                            code="distrito.bairros.label"
                                            default="Bairros"/></span>
                                </td>

                                <td>
                                    <g:each in="${distritoInstance.bairros}" var="b">
                                        <span class="property-value" aria-labelledby="bairros-label"><g:link
                                                controller="bairro" action="show"
                                                id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
                                    </g:each>
                                </td>

                            </tr>
                        </g:if>


                        <g:if test="${distritoInstance?.cidades}">
                            <tr>
                                <td>
                                    <span id="cidades-label" class="property-label"><g:message
                                            code="distrito.cidades.label"
                                            default="Cidades"/></span>
                                </td>

                                <td>
                                    <g:each in="${distritoInstance.cidades}" var="c">
                                        <span class="property-value" aria-labelledby="cidades-label"><g:link
                                                controller="cidade" action="show"
                                                id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                                    </g:each>
                                </td>

                            </tr>
                        </g:if>


                        <g:if test="${distritoInstance?.localidades}">
                            <tr>
                                <td>
                                    <span id="localidades-label" class="property-label"><g:message
                                            code="distrito.localidades.label"
                                            default="Localidades"/></span>
                                </td>

                                <td>
                                    <g:each in="${distritoInstance.localidades}" var="l">
                                        <span class="property-value" aria-labelledby="localidades-label"><g:link
                                                controller="localidade" action="show"
                                                id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
                                    </g:each>
                                </td>

                            </tr>
                        </g:if>


                        <g:if test="${distritoInstance?.postos}">
                            <tr>
                                <td>
                                    <span id="postos-label" class="property-label"><g:message
                                            code="distrito.postos.label"
                                            default="Postos"/></span>
                                </td>

                                <td>
                                    <g:each in="${distritoInstance.postos}" var="p">
                                        <span class="property-value" aria-labelledby="postos-label"><g:link
                                                controller="postoAdministrativo" action="show"
                                                id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                                    </g:each>
                                </td>

                            </tr>
                        </g:if>


                        <g:if test="${distritoInstance?.provincia}">
                            <tr>
                                <td>
                                    <span id="provincia-label" class="property-label"><g:message
                                            code="distrito.provincia.label"
                                            default="Provincia"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="provincia-label"><g:link
                                            controller="provincia" action="show"
                                            id="${distritoInstance?.provincia?.id}">${distritoInstance?.provincia?.encodeAsHTML()}</g:link></span>
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
                                            <g:hiddenField name="id" value="${distritoInstance?.id}"/>
                                            <span class="button"><g:actionSubmit class="bt-order" action="edit"
                                                                                 value="${message(code: 'Editar', default: 'Editar')}"/></span>
                                        </g:form>
                                    </td>
                                    <td>
                                        <g:form action="delete">
                                            <g:hiddenField name="id" value="${distritoInstance?.id}"/>
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
