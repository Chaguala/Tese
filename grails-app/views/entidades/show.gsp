
<%@ page import="org.chaguala.sigem.seguranca.Entidades" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'entidades.label', default: 'Entidades')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript', code: 'default.show.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <fieldset>
        <legend title=""/>
    </fieldset>

    <div class="nav">
        <nav:render group="Entidades"/>
    </div>

    <div id="show-entidades" class="content scaffold-show" role="main">
        <h4 align="left"><g:message code="Detalhes" args="[entityName]"/></h4>
        <fieldset>
            <legend title=""/>
        </fieldset>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>


        <fieldset>
            %{--<legend><g:message code="default.show.label" args="[entityName]"/></legend>--}%

            <ol class="property-list entidades">
                
                <g:if test="${entidadesInstance?.designacao}">
                    <li class="fieldcontain">
                        <span id="designacao-label" class="property-label"><g:message
                                code="entidades.designacao.label" default="Designacao"/></span>
                        
                        <span class="property-value" aria-labelledby="designacao-label"><g:fieldValue
                                bean="${entidadesInstance}"
                                field="designacao"/></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${entidadesInstance?.nomeClasse}">
                    <li class="fieldcontain">
                        <span id="nomeClasse-label" class="property-label"><g:message
                                code="entidades.nomeClasse.label" default="Nome Classe"/></span>
                        
                        <span class="property-value" aria-labelledby="nomeClasse-label"><g:fieldValue
                                bean="${entidadesInstance}"
                                field="nomeClasse"/></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${entidadesInstance?.classificacaoEntidade}">
                    <li class="fieldcontain">
                        <span id="classificacaoEntidade-label" class="property-label"><g:message
                                code="entidades.classificacaoEntidade.label" default="Classificacao Entidade"/></span>
                        
                        <span class="property-value" aria-labelledby="classificacaoEntidade-label"><g:link
                                controller="classificacaoEntidade" action="show"
                                id="${entidadesInstance?.classificacaoEntidade?.id}">${entidadesInstance?.classificacaoEntidade?.encodeAsHTML()}</g:link></span>
                        
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
                                    <g:hiddenField name="id" value="${entidadesInstance?.id}"/>
                                    <span class="button"><g:actionSubmit class="bt-order" action="edit"
                                                                         value="${message(encodeAs: 'JavaScript', code: 'Editar', default: 'Editar')}"/></span>
                                </g:form>
                            </td>
                            <td>
                                <g:form action="delete">
                                    <g:hiddenField name="id" value="${entidadesInstance?.id}"/>
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
