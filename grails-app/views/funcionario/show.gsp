
<%@ page import="org.chaguala.sigem.funcionaro.Funcionario" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'funcionaro.label', default: 'Funcionario')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels>
    <richui:tabLabel selected="${tabContent1}" title="${message(encodeAs: 'JavaScript',code: 'default.show.label', args: [entityName])}"/>
</richui:tabLabels>

    <richui:tabContents>
        <richui:tabContent>
            <div class="nav">
                <nav:render group="Funcionario"/>
            </div>

            <div id="show-funcionaro" class="content scaffold-show" role="main">

                <h3 id="titulo"><g:message code="default.show.label" args="[entityName]"/></h3>

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <fieldset>
                    <legend><g:message code="default.show.label" args="[entityName]"/></legend>

                    <table class="tabela">
                        <tbody>



                        <g:if test="${funcionaroInstance?.id}">
                            <tr>
                                <td>
                                    <span id="id-label" class="property-label"><g:message
                                            code="funcionaro.id.label"
                                            default="ID"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="id-label"><g:fieldValue
                                            bean="${funcionaroInstance}"
                                            field="id"/></span>
                                </td>

                            </tr>
                        </g:if>


                        <g:if test="${funcionaroInstance?.numero}">
                            <tr>
                                <td>
                                    <span id="numero-label" class="property-label"><g:message
                                            code="funcionaro.numero.label"
                                            default="Numero"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="numero-label"><g:fieldValue
                                            bean="${funcionaroInstance}"
                                            field="numero"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${funcionaroInstance?.nome}">
                            <tr>
                                <td>
                                    <span id="nome-label" class="property-label"><g:message
                                            code="funcionaro.nome.label"
                                            default="Nome do Funcionario"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="nome-label"><g:fieldValue
                                            bean="${funcionaroInstance}"
                                            field="nome"/></span>
                                </td>

                            </tr>
                        </g:if>


                        <g:if test="${funcionaroInstance?.datanasc}">
                            <tr>
                                <td>
                                    <span id="datanasc-label" class="property-label"><g:message
                                            code="funcionaro.datanasc.label"
                                            default="Data Nasc."/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="datanasc-label"><g:fieldValue
                                            bean="${funcionaroInstance}"
                                            field="datanasc"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${funcionaroInstance?.sexo}">
                            <tr>
                                <td>
                                    <span id="sexo-label" class="property-label"><g:message
                                            code="funcionaro.sexo.label"
                                            default="Sexo"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="sexo-label"><g:fieldValue
                                            bean="${funcionaroInstance}"
                                            field="sexo"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${funcionaroInstance?.tipoidentificacao}">
                            <tr>
                                <td>
                                    <span id="tipoidentificacao-label" class="property-label"><g:message
                                            code="funcionaro.tipoidentificacao.label"
                                            default="Tipo Identificacao"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="tipoidentificacao-label"><g:fieldValue
                                            bean="${funcionaroInstance}"
                                            field="tipoidentificacao"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${funcionaroInstance?.endereco}">
                            <tr>
                                <td>
                                    <span id="endereco-label" class="property-label"><g:message
                                            code="funcionaro.endereco.label"
                                            default="Endereco"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="endereco-label"><g:fieldValue
                                            bean="${funcionaroInstance}"
                                            field="endereco"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${funcionaroInstance?.contacto}">
                            <tr>
                                <td>
                                    <span id="contacto-label" class="property-label"><g:message
                                            code="funcionaro.contacto.label"
                                            default="Contacto"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="contacto-label"><g:fieldValue
                                            bean="${funcionaroInstance}"
                                            field="contacto"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${funcionaroInstance?.email}">
                            <tr>
                                <td>
                                    <span id="email-label" class="property-label"><g:message
                                            code="funcionaro.email.label"
                                            default="Email"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="email-label"><g:fieldValue
                                            bean="${funcionaroInstance}"
                                            field="email"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${funcionaroInstance?.bairro}">
                            <tr>
                                <td>
                                    <span id="bairro-label" class="property-label"><g:message
                                            code="funcionaro.bairro.label"
                                            default="Bairro"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="email-label"><g:fieldValue
                                            bean="${funcionaroInstance}"
                                            field="bairro"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${funcionaroInstance?.bairro}">
                            <tr>
                                <td>
                                    <span id="provincia-label" class="property-label"><g:message
                                            code="funcionaro.provincia.label"
                                            default="Provincia"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="provincia-label"><g:fieldValue
                                            bean="${funcionaroInstance}"
                                            field="provincia"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${funcionaroInstance?.bairro}">
                            <tr>
                                <td>
                                    <span id="pais-label" class="property-label"><g:message
                                            code="funcionaro.pais.label"
                                            default="Pais"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="pais-label"><g:fieldValue
                                            bean="${funcionaroInstance}"
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
                                            <g:hiddenField name="id" value="${funcionaroInstance?.id}"/>
                                            <span class="button"><g:actionSubmit class="bt-order" action="edit"
                                                                                 value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
                                        </g:form>
                                    </td>
                                    <td>
                                        <g:form action="delete">
                                            <g:hiddenField name="id" value="${funcionaroInstance?.id}"/>
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
