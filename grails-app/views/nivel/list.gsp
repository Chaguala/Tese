
<%@ page import="org.chaguala.sigem.nivel.Nivel" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="nivel.list" default="Nivel List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="nivel.new" default="Criar Novo" /></g:link></span>
        </div>
        <div class="body">
            <h4><g:message code="nivel.list" default="Lista de Nives" /></h4>
            <fieldset>
                <legend title=""></legend>
            </fieldset>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="id" title="Id" titleKey="nivel.id" />
                        
                   	    <g:sortableColumn property="nivel" title="Descricao do Nivel" titleKey="nivel.nivel" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${nivelInstanceList}" status="i" var="nivelInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${nivelInstance.id}">${fieldValue(bean: nivelInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: nivelInstance, field: "nivel")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${nivelInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
