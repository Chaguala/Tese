
<%@ page import="org.chaguala.sigem.seguradora.Seguradora" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="seguradora.list" default="Seguradora List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="seguradora.new" default="New Seguradora" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="seguradora.list" default="Seguradora List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="id" title="Id" titleKey="seguradora.id" />
                        
                   	    <g:sortableColumn property="nomeseguradora" title="Nomeseguradora" titleKey="seguradora.nomeseguradora" />
                        
                   	    <g:sortableColumn property="contacto" title="Contacto" titleKey="seguradora.contacto" />
                        
                   	    <g:sortableColumn property="datacriacao" title="Datacriacao" titleKey="seguradora.datacriacao" />
                        
                   	    <g:sortableColumn property="email" title="Email" titleKey="seguradora.email" />
                        
                   	    <g:sortableColumn property="endereco" title="Endereco" titleKey="seguradora.endereco" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${seguradoraInstanceList}" status="i" var="seguradoraInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${seguradoraInstance.id}">${fieldValue(bean: seguradoraInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: seguradoraInstance, field: "nomeseguradora")}</td>
                        
                            <td>${fieldValue(bean: seguradoraInstance, field: "contacto")}</td>
                        
                            <td><g:formatDate date="${seguradoraInstance.datacriacao}" /></td>
                        
                            <td>${fieldValue(bean: seguradoraInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: seguradoraInstance, field: "endereco")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${seguradoraInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
