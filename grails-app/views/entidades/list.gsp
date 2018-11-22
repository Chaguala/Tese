<%@ page import="org.chaguala.sigem.seguranca.Entidades" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'entidades.label', default: 'Entidades')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView">
    <richui:tabLabels>
        <richui:tabLabel selected="true"
                         title="${message(encodeAs: 'JavaScript', code: 'default.list.label', args: [entityName])}"/>
    </richui:tabLabels>
    <richui:tabContents>

        <richui:tabContent>
            <div class="nav">
                <nav:render group="Entidades"/>
            </div>

            <div id="titulo">
                <h3><g:message code="default.list.label" args="[entityName]"/></h3>
            </div>

            <div id="list-entidades" class="content scaffold-list" role="main">
            %{--<h1><g:message code="default.list.label" args="[entityName]"/></h1>--}%
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <div>
                    <b>${message(encodeAs: 'JavaScript', code: 'listagem.label', default: 'Listagem')}</b>
                    <hr class="thin"/>
                </div>

                <filterpane:filterPane domain="Entidades"
                                       titleKey="fp.tag.filterPane.titleText"/>

                <table>
                    <thead>
                    <tr>

                        <g:sortableColumn property="designacao"
                                          title="${message(encodeAs: 'JavaScript', code: 'entidades.designacao.label', default: 'Designacao')}"/>

                        <g:sortableColumn property="nomeClasse"
                                          title="${message(encodeAs: 'JavaScript', code: 'entidades.nomeClasse.label', default: 'Nome Classe')}"/>

                        <th><g:message code="entidades.classificacaoEntidade.label"
                                       default="Classificacao Entidade"/></th>

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${entidadesInstanceList}" status="i" var="entidadesInstance">
                        <tr class="${(i % 2) == 0 ? 'dbodd' : 'dbeven'}" onMouseOver="this.className = 'dbhover';" onMouseOut="this.className = '${(i % 2) == 0 ? 'dbodd' : 'dbeven'}';">
                            <td><g:link action="show"
                                        id="${entidadesInstance.id}">${fieldValue(bean: entidadesInstance, field: "designacao")}</g:link></td>

                            <td>${fieldValue(bean: entidadesInstance, field: "nomeClasse")}</td>

                            <td>${fieldValue(bean: entidadesInstance, field: "classificacaoEntidade")}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>

                <div class="paginateButtons">
                    <br>
                    <table>
                        <tr>
                            <td class="cell">
                                %{--<g:if test="${combatenteInstanceTotal>10}">--}%
                                <filterpane:filterButton text="Pesquisa" />
                                %{--</g:if>--}%
                                <filterpane:paginate params="${params}" total="${entidadesInstanceTotal}"/>
                            </td>
                        </tr>
                    </table>

                </div>
            </div>
        </richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
