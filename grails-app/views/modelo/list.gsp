
<%@ page import="org.chaguala.sigem.modelo.Modelo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="modelo.list" default="Modelo List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="modelo.new" default="New Modelo" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="modelo.list" default="Modelo List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="id" title="Id" titleKey="modelo.id" />
                        
                   	    <g:sortableColumn property="designacao" title="Designacao" titleKey="modelo.designacao" />
                        
                   	    <th><g:message code="modelo.marca" default="Marca" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${modeloInstanceList}" status="i" var="modeloInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${modeloInstance.id}">${fieldValue(bean: modeloInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: modeloInstance, field: "designacao")}</td>
                        
                            <td>${fieldValue(bean: modeloInstance, field: "marca")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${modeloInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
