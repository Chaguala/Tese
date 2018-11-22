
<%@ page import="org.chaguala.sigem.municipe.Municipe" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'municipe.label', default: 'Municipe')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels>
    <richui:tabLabel selected="${tabContent1}" title="${message(encodeAs: 'JavaScript',code: 'default.show.label', args: [entityName])}"/>
</richui:tabLabels>

    <richui:tabContents>
        <richui:tabContent>
            <div class="nav">
                <nav:render group="Municipe"/>
            </div>

            <div id="show-municipe" class="content scaffold-show" role="main">

                <h3 id="titulo"><g:message code="default.show.label" args="[entityName]"/></h3>

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <fieldset>
                    <legend><g:message code="default.show.label" args="[entityName]"/></legend>

                    <table class="tabela">
                        <tbody>



                        <g:if test="${municipeInstance?.id}">
                            <tr>
                                <td>
                                    <span id="id-label" class="property-label"><g:message
                                            code="municipe.id.label"
                                            default="ID"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="id-label"><g:fieldValue
                                            bean="${municipeInstance}"
                                            field="id"/></span>
                                </td>

                            </tr>
                        </g:if>


                        <g:if test="${municipeInstance?.numero}">
                            <tr>
                                <td>
                                    <span id="numero-label" class="property-label"><g:message
                                            code="municipe.numero.label"
                                            default="Numero"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="numero-label"><g:fieldValue
                                            bean="${municipeInstance}"
                                            field="numero"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${municipeInstance?.nome}">
                            <tr>
                                <td>
                                    <span id="nome-label" class="property-label"><g:message
                                            code="municipe.nome.label"
                                            default="Nome do Municipe"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="nome-label"><g:fieldValue
                                            bean="${municipeInstance}"
                                            field="nome"/></span>
                                </td>

                            </tr>
                        </g:if>


                        <g:if test="${municipeInstance?.datanasc}">
                            <tr>
                                <td>
                                    <span id="datanasc-label" class="property-label"><g:message
                                            code="municipe.datanasc.label"
                                            default="Data Nasc."/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="datanasc-label"><g:fieldValue
                                            bean="${municipeInstance}"
                                            field="datanasc"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${municipeInstance?.sexo}">
                            <tr>
                                <td>
                                    <span id="sexo-label" class="property-label"><g:message
                                            code="municipe.sexo.label"
                                            default="Sexo"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="sexo-label"><g:fieldValue
                                            bean="${municipeInstance}"
                                            field="sexo"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${municipeInstance?.tipoidentificacao}">
                            <tr>
                                <td>
                                    <span id="tipoidentificacao-label" class="property-label"><g:message
                                            code="municipe.tipoidentificacao.label"
                                            default="Tipo Identificacao"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="tipoidentificacao-label"><g:fieldValue
                                            bean="${municipeInstance}"
                                            field="tipoidentificacao"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${municipeInstance?.endereco}">
                            <tr>
                                <td>
                                    <span id="endereco-label" class="property-label"><g:message
                                            code="municipe.endereco.label"
                                            default="Endereco"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="endereco-label"><g:fieldValue
                                            bean="${municipeInstance}"
                                            field="endereco"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${municipeInstance?.contacto}">
                            <tr>
                                <td>
                                    <span id="contacto-label" class="property-label"><g:message
                                            code="municipe.contacto.label"
                                            default="Contacto"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="contacto-label"><g:fieldValue
                                            bean="${municipeInstance}"
                                            field="contacto"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${municipeInstance?.email}">
                            <tr>
                                <td>
                                    <span id="email-label" class="property-label"><g:message
                                            code="municipe.email.label"
                                            default="Email"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="email-label"><g:fieldValue
                                            bean="${municipeInstance}"
                                            field="email"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${municipeInstance?.bairro}">
                            <tr>
                                <td>
                                    <span id="bairro-label" class="property-label"><g:message
                                            code="municipe.bairro.label"
                                            default="Bairro"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="email-label"><g:fieldValue
                                            bean="${municipeInstance}"
                                            field="bairro"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${municipeInstance?.bairro}">
                            <tr>
                                <td>
                                    <span id="provincia-label" class="property-label"><g:message
                                            code="municipe.provincia.label"
                                            default="Provincia"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="provincia-label"><g:fieldValue
                                            bean="${municipeInstance}"
                                            field="provincia"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${municipeInstance?.bairro}">
                            <tr>
                                <td>
                                    <span id="pais-label" class="property-label"><g:message
                                            code="municipe.pais.label"
                                            default="Pais"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="pais-label"><g:fieldValue
                                            bean="${municipeInstance}"
                                            field="pais"/></span>
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
                                            <g:hiddenField name="id" value="${municipeInstance?.id}"/>
                                            <span class="button"><g:actionSubmit class="bt-order" action="edit"
                                                                                 value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
                                        </g:form>
                                    </td>
                                    <td>
                                        <g:form action="delete">
                                            <g:hiddenField name="id" value="${municipeInstance?.id}"/>
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
