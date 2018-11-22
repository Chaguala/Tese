
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Cidade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="cidade.list" default="Cidade List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="cidade.new" default="Criar" /></g:link></span>
        </div>
        <div class="body">
            <h4><g:message code="cidade.list" default="Lista de cidades" /></h4>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="id" title="Id" titleKey="cidade.id" />
                        
                   	    <g:sortableColumn property="designacao" title="Designacao" titleKey="cidade.designacao" />
                        
                   	    <g:sortableColumn property="descricao" title="Descricao" titleKey="cidade.descricao" />
                        
                   	    <th><g:message code="cidade.distrito" default="Distrito" /></th>
                   	    
                   	    <th><g:message code="cidade.provincia" default="Provincia" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cidadeInstanceList}" status="i" var="cidadeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${cidadeInstance.id}">${fieldValue(bean: cidadeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: cidadeInstance, field: "designacao")}</td>
                        
                            <td>${fieldValue(bean: cidadeInstance, field: "descricao")}</td>
                        
                            <td>${fieldValue(bean: cidadeInstance, field: "distrito")}</td>
                        
                            <td>${fieldValue(bean: cidadeInstance, field: "provincia")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${cidadeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
