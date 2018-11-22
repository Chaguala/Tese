
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.PostoAdministrativo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="postoAdministrativo.list" default="PostoAdministrativo List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="postoAdministrativo.new" default="Criar Novo" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <h4><g:message code="postoAdministrativo.list" default="Lista de postos administrativos" /></h4>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="id" title="Id" titleKey="postoAdministrativo.id" />
                        
                   	    <g:sortableColumn property="codigo" title="Codigo" titleKey="postoAdministrativo.codigo" />
                        
                   	    <g:sortableColumn property="designacao" title="Designacao" titleKey="postoAdministrativo.designacao" />
                        
                   	    <th><g:message code="postoAdministrativo.distrito" default="Distrito" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${postoAdministrativoInstanceList}" status="i" var="postoAdministrativoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${postoAdministrativoInstance.id}">${fieldValue(bean: postoAdministrativoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: postoAdministrativoInstance, field: "codigo")}</td>
                        
                            <td>${fieldValue(bean: postoAdministrativoInstance, field: "designacao")}</td>
                        
                            <td>${fieldValue(bean: postoAdministrativoInstance, field: "distrito")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <div class="paginateButtons">
                <g:paginate total="${postoAdministrativoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
