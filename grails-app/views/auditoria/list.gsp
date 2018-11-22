
<%@ page import="org.chaguala.sigem.auditoria.Auditoria" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'auditoria.label', default: 'Auditoria')}"/>
    <title><g:message code="Auditoria" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript',code: 'Auditoria', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="Auditoria"/>
    </div>

    <div id="list-auditoria" class="content scaffold-list" role="main">

        <h3 id="titulo"><g:message code="Listagem de auditoria" args="[entityName]"/></h3>
<fieldset>
    <legend title=""/>
</fieldset>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="Auditoria"
                               titleKey="fp.tag.filterPane.titleText"/>

        <table>
            <thead>
            <tr>
                
                <g:sortableColumn property="actor"
                                  title="${message(encodeAs: 'JavaScript',code: 'auditoria.actor.label', default: 'Actor')}"/>
                
                <g:sortableColumn property="uri"
                                  title="${message(encodeAs: 'JavaScript',code: 'auditoria.uri.label', default: 'Uri')}"/>
                
                <g:sortableColumn property="className"
                                  title="${message(encodeAs: 'JavaScript',code: 'auditoria.className.label', default: 'Class Name')}"/>
                
                <g:sortableColumn property="persistedObjectId"
                                  title="${message(encodeAs: 'JavaScript',code: 'auditoria.persistedObjectId.label', default: 'Persisted Object Id')}"/>
                
                <g:sortableColumn property="persistedObjectVersion"
                                  title="${message(encodeAs: 'JavaScript',code: 'auditoria.persistedObjectVersion.label', default: 'Persisted Object Version')}"/>
                
                <g:sortableColumn property="eventName"
                                  title="${message(encodeAs: 'JavaScript',code: 'auditoria.eventName.label', default: 'Event Name')}"/>
                
            </tr>
            </thead>
            <tbody>
            <g:each in="${auditoriaInstanceList}" status="i" var="auditoriaInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                    <td><g:link action="show"
                                id="${auditoriaInstance.id}">${fieldValue(bean: auditoriaInstance, field: "actor")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${auditoriaInstance.id}">${fieldValue(bean: auditoriaInstance, field: "uri")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${auditoriaInstance.id}">${fieldValue(bean: auditoriaInstance, field: "className")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${auditoriaInstance.id}">${fieldValue(bean: auditoriaInstance, field: "persistedObjectId")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${auditoriaInstance.id}">${fieldValue(bean: auditoriaInstance, field: "persistedObjectVersion")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${auditoriaInstance.id}">${fieldValue(bean: auditoriaInstance, field: "eventName")}</g:link></td>
                    
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${auditoriaInstanceTotal}"/>
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
