
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Pais" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'pais.label', default: 'Pais')}"/>
    <title><g:message code="Pais" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript',code: 'Pais', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="Pais"/>
    </div>

    <div id="list-pais" class="content scaffold-list" role="main">

        <h4 id="titulo"><g:message code="Listagem de paises" args="[entityName]"/></h4>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="Pais"
                               titleKey="fp.tag.filterPane.titleText"/>

        <table>
            <thead>
            <tr>
                
                <g:sortableColumn property="codigo"
                                  title="${message(encodeAs: 'JavaScript',code: 'pais.codigo.label', default: 'Codigo')}"/>
                
                <g:sortableColumn property="designacao"
                                  title="${message(encodeAs: 'JavaScript',code: 'pais.designacao.label', default: 'Designacao')}"/>
                
            </tr>
            </thead>
            <tbody>
            <g:each in="${paisInstanceList}" status="i" var="paisInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                    <td><g:link action="show"
                                id="${paisInstance.id}">${fieldValue(bean: paisInstance, field: "codigo")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${paisInstance.id}">${fieldValue(bean: paisInstance, field: "designacao")}</g:link></td>
                    
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${paisInstanceTotal}"/>
                        <filterpane:filterButton textKey="fp.tag.filterButton.text"
                                                 appliedTextKey="fp.tag.filterButton.appliedText"
                                                 text="Filtro de Pesquisa" appliedText="Alterar Resultados de Pesquisa"/>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
