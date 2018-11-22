<%@ page import="org.chaguala.sigem.seguranca.ClassificacaoEntidade" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript', code: 'classificacaoEntidade.label', default: 'ClassificacaoEntidade')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="${tabContent1}"
                                                                title="${message(encodeAs: 'JavaScript', code: 'default.show.label', args: [entityName])}"/>
    <richui:tabLabel selected="${tabContent2}" title="Alocar Entidades"/>
</richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="ClassificacaoEntidade"/>
    </div>

    <div id="show-classificacaoEntidade" class="content scaffold-show" role="main">
        %{--<h1 align="center"><g:message code="default.show.label" args="[entityName]"/></h1>--}%
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>


        <fieldset>
            <legend><g:message code="Detalhes da entidade" args="[entityName]"/></legend>

            <ol class="property-list classificacaoEntidade">

                <g:if test="${classificacaoEntidadeInstance?.designacao}">
                    <li class="fieldcontain">
                        <span id="designacao-label" class="property-label"><g:message
                                code="classificacaoEntidade.designacao.label" default="Designacao"/></span>

                        <span class="property-value" aria-labelledby="designacao-label"><g:fieldValue
                                bean="${classificacaoEntidadeInstance}"
                                field="designacao"/></span>

                    </li>
                </g:if>

                <g:if test="${classificacaoEntidadeInstance?.descricao}">
                    <li class="fieldcontain">
                        <span id="descricao-label" class="property-label"><g:message
                                code="classificacaoEntidade.descricao.label" default="Descricao"/></span>

                        <span class="property-value" aria-labelledby="descricao-label"><g:fieldValue
                                bean="${classificacaoEntidadeInstance}"
                                field="descricao"/></span>

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
                                    <g:hiddenField name="id" value="${classificacaoEntidadeInstance?.id}"/>
                                    <span class="button"><g:actionSubmit class="bt-order" action="edit"
                                                                         value="${message(encodeAs: 'JavaScript', code: 'Editar', default: 'Editar')}"/></span>
                                </g:form>
                            </td>
                            <td>
                                <g:form action="delete">
                                    <g:hiddenField name="id" value="${classificacaoEntidadeInstance?.id}"/>
                                    <span class="button"><g:actionSubmit class="bt-order" action="delete"
                                                                         value="${message(encodeAs: 'JavaScript', code: 'Apagar', default: 'Apagar')}"
                                                                         onclick="return confirm('${message(encodeAs: 'JavaScript', code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
                                </g:form>
                            </td>
                        </tr>
                    </table>
                </div>
            </fieldset>
            <fieldset>
                <legend title=""/>
            </fieldset>
        </g:form>
    </div>
</richui:tabContent>

    <richui:tabContent>
        <div class="nav">
            <nav:render group="Entidades"/>
        </div>

        %{--<div id="titulo2">--}%
            %{--<h1>${entityName}</h1>--}%
        %{--</div>--}%

        <fieldset>
            <legend title=""/>
        </fieldset>

        <div id="titulo">
            <h4><g:message code="Lista de entidades associadas" args="['Entidades']"/></h4>
        </div>

        <div id="list-entidades" class="content scaffold-list" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <filterpane:filterPane domain="Entidades"
                                   titleKey="fp.tag.filterPane.titleText"/>
            <table>
                <thead>
                <tr>
                    <g:sortableColumn property="designacao"
                                      title="${message(encodeAs: 'JavaScript', code: 'entidades.designacao.label', default: 'Designacao')}"/>

                    <g:sortableColumn property="nomeClasse"
                                      title="${message(encodeAs: 'JavaScript', code: 'entidades.nomeClasse.label', default: 'Nome Classe')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${entidadesInstanceList}" status="i" var="entidadesInstance">
                    <tr class="${(i % 2) == 0 ? 'dbodd' : 'dbeven'}" onMouseOver="this.className = 'dbhover';" onMouseOut="this.className = '${(i % 2) == 0 ? 'dbodd' : 'dbeven'}';">
                        <td><g:link controller='entidades' action="show"
                                    id="${entidadesInstance.id}">${fieldValue(bean: entidadesInstance, field: "designacao")}</g:link></td>

                        <td><g:link controller='entidades' action="show"
                                    id="${entidadesInstance.id}">${fieldValue(bean: entidadesInstance, field: "nomeClasse")}</g:link></td>

                    </tr>
                </g:each>
                </tbody>
            </table>

            <div class="paginateButtons">
                <br>
                <table>
                    <tr>
                        <td class="cell">
                            <filterpane:paginate params="${params}" total="${entidadesInstanceTotal}"/>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </richui:tabContent>

</richui:tabContents></richui:tabView></body>
</html>
