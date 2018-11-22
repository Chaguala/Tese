
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Distrito" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'distrito.label', default: 'Distrito')}"/>
    <title><g:message code="Distrito" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript',code: 'Distrito', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="Distrito"/>
    </div>

    <div id="list-distrito" class="content scaffold-list" role="main">

        <h3 id="titulo"><g:message code="Listagem de Distritos" args="[entityName]"/></h3>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="Distrito"
                               titleKey="fp.tag.filterPane.titleText"/>

        <table>
            <thead>
            <tr>
                
                <g:sortableColumn property="codigo"
                                  title="${message(encodeAs: 'JavaScript',code: 'distrito.codigo.label', default: 'Codigo')}"/>
                
                <g:sortableColumn property="designacao"
                                  title="${message(encodeAs: 'JavaScript',code: 'distrito.designacao.label', default: 'Designacao')}"/>
                
                <th><g:message code="distrito.provincia.label" default="Provincia"/></th>
                
            </tr>
            </thead>
            <tbody>
            <g:each in="${distritoInstanceList}" status="i" var="distritoInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                    <td><g:link action="show"
                                id="${distritoInstance.id}">${fieldValue(bean: distritoInstance, field: "codigo")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${distritoInstance.id}">${fieldValue(bean: distritoInstance, field: "designacao")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${distritoInstance.id}">${fieldValue(bean: distritoInstance, field: "provincia")}</g:link></td>
                    
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${distritoInstanceTotal}"/>
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
