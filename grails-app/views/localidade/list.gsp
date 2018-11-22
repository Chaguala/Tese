
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Localidade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="localidade.list" default="Localidade List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="localidade.new" default="Criar" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <h4><g:message code="localidade.list" default="Lista de localidades" /></h4>
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
                        
                   	    <g:sortableColumn property="id" title="Id" titleKey="localidade.id" />
                        
                   	    <g:sortableColumn property="codigo" title="Codigo" titleKey="localidade.codigo" />
                        
                   	    <g:sortableColumn property="designacao" title="Designacao" titleKey="localidade.designacao" />
                        
                   	    <th><g:message code="localidade.postoAdministrativo" default="Posto Administrativo" /></th>
                   	    
                   	    <th><g:message code="localidade.distrito" default="Distrito" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${localidadeInstanceList}" status="i" var="localidadeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${localidadeInstance.id}">${fieldValue(bean: localidadeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: localidadeInstance, field: "codigo")}</td>
                        
                            <td>${fieldValue(bean: localidadeInstance, field: "designacao")}</td>
                        
                            <td>${fieldValue(bean: localidadeInstance, field: "postoAdministrativo")}</td>
                        
                            <td>${fieldValue(bean: localidadeInstance, field: "distrito")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <div class="paginateButtons">
                <g:paginate total="${localidadeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
