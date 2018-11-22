
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Provincia" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'provincia.label', default: 'Provincia')}"/>
    <title><g:message code="Provincia" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript',code: 'Provincia', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="Provincia"/>
    </div>

    <div id="list-provincia" class="content scaffold-list" role="main">

        <h4 id="titulo"><g:message code="Listagem de provincias" args="[entityName]"/></h4>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="Provincia"
                               titleKey="fp.tag.filterPane.titleText"/>

        <table>
            <thead>
            <tr>
                
                <g:sortableColumn property="codigo"
                                  title="${message(encodeAs: 'JavaScript',code: 'provincia.codigo.label', default: 'Codigo')}"/>
                
                <g:sortableColumn property="designacao"
                                  title="${message(encodeAs: 'JavaScript',code: 'provincia.designacao.label', default: 'Designacao')}"/>
                
                <th><g:message code="provincia.pais.label" default="Pais"/></th>
                
            </tr>
            </thead>
            <tbody>
            <g:each in="${provinciaInstanceList}" status="i" var="provinciaInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                    <td><g:link action="show"
                                id="${provinciaInstance.id}">${fieldValue(bean: provinciaInstance, field: "codigo")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${provinciaInstance.id}">${fieldValue(bean: provinciaInstance, field: "designacao")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${provinciaInstance.id}">${fieldValue(bean: provinciaInstance, field: "pais")}</g:link></td>
                    
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${provinciaInstanceTotal}"/>
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
