<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Pais" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript', code: 'pais.label', default: 'Pais')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels>
    <richui:tabLabel selected="${tabContent1}"
                     title="${message(encodeAs: 'JavaScript', code: 'default.show.label', args: [entityName])}"/>
    <g:if test="${paisInstance.codigo.equalsIgnoreCase("MOZ")}">
        <richui:tabLabel selected="${tabContent2}" title="${message(encodeAs: 'JavaScript', code: 'provincia.label')}"/>
    </g:if>
</richui:tabLabels>

    <richui:tabContents>
        <richui:tabContent>
            <div class="nav">
                <nav:render group="Pais"/>
            </div>

            <div id="show-pais" class="content scaffold-show" role="main">

                %{--<h3 id="titulo"><g:message code="default.show.label" args="[entityName]"/></h3>--}%

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <fieldset>
                    <legend><g:message code="Detalhes" args="[entityName]"/></legend>

                    <table class="tabela">
                        <tbody>

                        <g:if test="${paisInstance?.codigo}">
                            <tr>
                                <td>
                                    <span id="codigo-label" class="property-label"><g:message
                                            code="pais.codigo.label"
                                            default="Codigo"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="codigo-label"><g:fieldValue
                                            bean="${paisInstance}"
                                            field="codigo"/></span>
                                </td>

                            </tr>
                        </g:if>


                        <g:if test="${paisInstance?.designacao}">
                            <tr>
                                <td>
                                    <span id="designacao-label" class="property-label"><g:message
                                            code="pais.designacao.label"
                                            default="Designacao"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="designacao-label"><g:fieldValue
                                            bean="${paisInstance}"
                                            field="designacao"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${paisInstance?.nacionalidade}">
                            <tr>
                                <td>
                                    <span id="nacionalidade-label" class="property-label"><g:message
                                            code="pais.nacionalidade.label"
                                            default="Nacionalidade"/></span>
                                </td>

                                <td>
                                    <span class="property-value" aria-labelledby="nacionalidade-label"><g:fieldValue
                                            bean="${paisInstance}"
                                            field="nacionalidade"/></span>
                                </td>

                            </tr>
                        </g:if>

                        <g:if test="${paisInstance?.provincia}">
                            <tr>
                                <td>
                                    <span id="provincia-label" class="property-label"><g:message
                                            code="pais.provincia.label"
                                            default="Provincia"/></span>
                                </td>

                                <td>
                                    <g:each in="${paisInstance.provincia}" var="p">
                                        <span class="property-value" aria-labelledby="provincia-label"><g:link
                                                controller="provincia" action="show"
                                                id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                                    </g:each>
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
                                            <g:hiddenField name="id" value="${paisInstance?.id}"/>
                                            <span class="button"><g:actionSubmit class="bt-order" action="edit"
                                                                                 value="${message(code: 'Editar', default: 'Editar')}"/></span>
                                        </g:form>
                                    </td>
                                    <td>
                                        <g:form action="delete">
                                            <g:hiddenField name="id" value="${paisInstance?.id}"/>
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

        <g:if test="${paisInstance.codigo.equalsIgnoreCase("MOZ")}">
            <richui:tabContent>

                <div class="nav">
                    <nav:render group="Provincia"/>
                </div>

                <div id="list-pais" class="content scaffold-list" role="main">

                    <h3 id="titulo"><g:message code="default.list.label" args="[entityName]"/></h3>

                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>

                    <filterpane:filterPane domain="Provincia"
                                           titleKey="fp.tag.filterPane.titleText"/>

                    <table>
                        <thead>
                        <tr>
                            <g:sortableColumn property="codigo"
                                              title="${message(encodeAs: 'JavaScript', code: 'provincia.codigo.label', default: 'Codigo')}"/>

                            <g:sortableColumn property="designacao"
                                              title="${message(encodeAs: 'JavaScript', code: 'provincia.designacao.label', default: 'Designacao')}"/>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${paisInstance?.provincia?.toList()}" status="i" var="provinciaInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td><g:link controller="provincia" action="show"
                                            id="${provinciaInstance.id}">${fieldValue(bean: provinciaInstance, field: "codigo")}</g:link></td>

                                <td><g:link controller="provincia" action="show"
                                            id="${provinciaInstance.id}">${fieldValue(bean: provinciaInstance, field: "designacao")}</g:link></td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>

                    <div class="paginateButtons">
                        <br>
                        <table>
                            <tr>
                                <td class="cell">
                                    <filterpane:paginate params="${params}"
                                                         total="${paisInstance?.provincia?.toList()?.size()}"/>
                                    <filterpane:filterButton textKey="fp.tag.filterButton.text"
                                                             appliedTextKey="fp.tag.filterButton.appliedText"
                                                             text="Filtro de Pesquisa"
                                                             appliedText="Alterar Resultados de Pesquisa"/>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>

            </richui:tabContent>
        </g:if>
    </richui:tabContents></richui:tabView></body>
</html>
