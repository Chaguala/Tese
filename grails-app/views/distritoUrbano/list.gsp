
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.DistritoUrbano" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'distritoUrbano.label', default: 'DistritoUrbano')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript',code: 'default.list.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="DistritoUrbano"/>
    </div>

    <div id="list-distritoUrbano" class="content scaffold-list" role="main">

        <h3 id="titulo"><g:message code="default.list.label" args="[entityName]"/></h3>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="DistritoUrbano"
                               titleKey="fp.tag.filterPane.titleText"/>

        <table>
            <thead>
            <tr>
                
                <g:sortableColumn property="nomeDistrito"
                                  title="${message(encodeAs: 'JavaScript',code: 'distritoUrbano.nomeDistrito.label', default: 'Nome Distrito')}"/>
                
                <g:sortableColumn property="sigla"
                                  title="${message(encodeAs: 'JavaScript',code: 'distritoUrbano.sigla.label', default: 'Sigla')}"/>
                
                <th><g:message code="distritoUrbano.cidade.label" default="Cidade"/></th>
                
            </tr>
            </thead>
            <tbody>
            <g:each in="${distritoUrbanoInstanceList}" status="i" var="distritoUrbanoInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                    <td><g:link action="show"
                                id="${distritoUrbanoInstance.id}">${fieldValue(bean: distritoUrbanoInstance, field: "nomeDistrito")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${distritoUrbanoInstance.id}">${fieldValue(bean: distritoUrbanoInstance, field: "sigla")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${distritoUrbanoInstance.id}">${fieldValue(bean: distritoUrbanoInstance, field: "cidade")}</g:link></td>
                    
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${distritoUrbanoInstanceTotal}"/>
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
