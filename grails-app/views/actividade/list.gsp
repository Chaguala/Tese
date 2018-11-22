
<%@ page import="org.chaguala.sigem.actividade.Actividade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="actividade.list" default="Actividade List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="actividade.new" default="Criar Nova" /></g:link></span>
        </div>
        <div class="body">
            <h4><g:message code="actividade.list" default="Lista de actividade" /></h4>

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
                        
                   	    <g:sortableColumn property="id" title="Id" titleKey="actividade.id" />
                        
                   	    <g:sortableColumn property="estado" title="Estado" titleKey="actividade.estado" />
                        
                   	    <g:sortableColumn property="designacao" title="Designacao" titleKey="actividade.designacao" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${actividadeInstanceList}" status="i" var="actividadeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${actividadeInstance.id}">${fieldValue(bean: actividadeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: actividadeInstance, field: "estado")}</td>
                        
                            <td>${fieldValue(bean: actividadeInstance, field: "designacao")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <div class="paginateButtons">
                <g:paginate total="${actividadeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
