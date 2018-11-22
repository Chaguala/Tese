
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Bairro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="bairro.list" default="Bairro List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="bairro.new" default="Criar" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <h4><g:message code="bairro.list" default="Listar bairros" /></h4>
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
                        
                   	    <g:sortableColumn property="id" title="Id" titleKey="bairro.id" />
                        
                   	    <g:sortableColumn property="designacao" title="Designacao" titleKey="bairro.designacao" />
                        
                   	    <th><g:message code="bairro.localidade" default="Localidade" /></th>
                   	    
                   	    <th><g:message code="bairro.postoAdministrativo" default="Posto Administrativo" /></th>
                   	    
                   	    <th><g:message code="bairro.distrito" default="Distrito" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bairroInstanceList}" status="i" var="bairroInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bairroInstance.id}">${fieldValue(bean: bairroInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: bairroInstance, field: "designacao")}</td>
                        
                            <td>${fieldValue(bean: bairroInstance, field: "localidade")}</td>
                        
                            <td>${fieldValue(bean: bairroInstance, field: "postoAdministrativo")}</td>
                        
                            <td>${fieldValue(bean: bairroInstance, field: "distrito")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <div class="paginateButtons">
                <g:paginate total="${bairroInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
