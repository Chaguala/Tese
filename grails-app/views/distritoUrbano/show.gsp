
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.DistritoUrbano" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'distritoUrbano.label', default: 'DistritoUrbano')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels>
    <richui:tabLabel selected="${tabContent1}" title="${message(encodeAs: 'JavaScript',code: 'default.show.label', args: [entityName])}"/>
    
    %{--<richui:tabLabel selected="${tabContent2}" title="${message(encodeAs: 'JavaScript',code: 'bairros.label')}"/>--}%
    
</richui:tabLabels>

    <richui:tabContents>
        <richui:tabContent>
            <div class="nav">
                <nav:render group="DistritoUrbano"/>
            </div>

            <div id="show-distritoUrbano" class="content scaffold-show" role="main">

                <h3 id="titulo"><g:message code="default.show.label" args="[entityName]"/></h3>

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <fieldset>
                    <legend><g:message code="default.show.label" args="[entityName]"/></legend>

                    <table class="tabela">
                        <tbody>

                        

                        <g:if test="${distritoUrbanoInstance?.nomeDistrito}">
                            <tr>
                                <td>
                                    <span id="nomeDistrito-label" class="property-label"><g:message
                                            code="distritoUrbano.nomeDistrito.label"
                                            default="Nome Distrito"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="nomeDistrito-label"><g:fieldValue
                                            bean="${distritoUrbanoInstance}"
                                            field="nomeDistrito"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${distritoUrbanoInstance?.sigla}">
                            <tr>
                                <td>
                                    <span id="sigla-label" class="property-label"><g:message
                                            code="distritoUrbano.sigla.label"
                                            default="Sigla"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="sigla-label"><g:fieldValue
                                            bean="${distritoUrbanoInstance}"
                                            field="sigla"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${distritoUrbanoInstance?.bairros}">
                            <tr>
                                <td>
                                    <span id="bairros-label" class="property-label"><g:message
                                            code="distritoUrbano.bairros.label"
                                            default="Bairros"/></span>
                                </td>
                                
                                <td>
                                    <g:each in="${distritoUrbanoInstance.bairros}" var="b">
                                        <span class="property-value" aria-labelledby="bairros-label"><g:link
                                                controller="bairro" action="show"
                                                id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
                                    </g:each>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${distritoUrbanoInstance?.cidade}">
                            <tr>
                                <td>
                                    <span id="cidade-label" class="property-label"><g:message
                                            code="distritoUrbano.cidade.label"
                                            default="Cidade"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="cidade-label"><g:link
                                            controller="cidade" action="show"
                                            id="${distritoUrbanoInstance?.cidade?.id}">${distritoUrbanoInstance?.cidade?.encodeAsHTML()}</g:link></span>
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
                                            <g:hiddenField name="id" value="${distritoUrbanoInstance?.id}"/>
                                            <span class="button"><g:actionSubmit class="bt-order" action="edit"
                                                                                 value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
                                        </g:form>
                                    </td>
                                    <td>
                                        <g:form action="delete">
                                            <g:hiddenField name="id" value="${distritoUrbanoInstance?.id}"/>
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

        
        %{--<richui:tabContent>--}%

            %{--<div class="nav">--}%
                %{--<nav:render group="bairros"/>--}%
            %{--</div>--}%

            %{--<div id="list-distritoUrbano" class="content scaffold-list" role="main">--}%

                %{--<h3 id="titulo"><g:message code="default.list.label" args="[entityName]"/></h3>--}%

                %{--<g:if test="${flash.message}">--}%
                    %{--<div class="message" role="status">${flash.message}</div>--}%
                %{--</g:if>--}%

                %{--<filterpane:filterPane domain="bairros"--}%
                                       %{--titleKey="fp.tag.filterPane.titleText"/>--}%

                %{--<table>--}%
                    %{--<thead>--}%
                    %{--<tr>--}%

                    %{--</tr>--}%
                    %{--</thead>--}%
                    %{--<tbody>--}%
                    %{--<g:each in="${distritoUrbanoInstance?.bairros?.toList()}" status="i" var="distritoUrbanoInstance">--}%
                        %{--<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--}%
                        %{--</tr>--}%
                    %{--</g:each>--}%
                    %{--</tbody>--}%
                %{--</table>--}%

                %{--<div class="paginateButtons">--}%
                    %{--<br>--}%
                    %{--<table>--}%
                        %{--<tr>--}%
                            %{--<td class="cell">--}%
                                %{--<filterpane:paginate params="${params}" total="${distritoUrbanoInstanceTotal}"/>--}%
                                %{--<filterpane:filterButton textKey="fp.tag.filterButton.text"--}%
                                                         %{--appliedTextKey="fp.tag.filterButton.appliedText"--}%
                                                         %{--text="Filtro de Pesquisa" appliedText="Alterar Resultados de Pesquisa"/>--}%
                            %{--</td>--}%
                        %{--</tr>--}%
                    %{--</table>--}%

                %{--</div>--}%
            %{--</div>--}%

        %{--</richui:tabContent>--}%
        

    </richui:tabContents></richui:tabView></body>
</html>
