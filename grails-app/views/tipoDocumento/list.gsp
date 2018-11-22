
<%@ page import="org.chaguala.sigem.tipodocumento.TipoDocumento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="tipoDocumento.list" default="TipoDocumento List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="tipoDocumento.new" default="Criar" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <h4><g:message code="tipoDocumento.list" default="Lista de tipo de documentos" /></h4>
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
                        
                   	    <g:sortableColumn property="id" title="Id" titleKey="tipoDocumento.id" />
                        
                   	    <g:sortableColumn property="designacao" title="Designacao" titleKey="tipoDocumento.designacao" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tipoDocumentoInstanceList}" status="i" var="tipoDocumentoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tipoDocumentoInstance.id}">${fieldValue(bean: tipoDocumentoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: tipoDocumentoInstance, field: "designacao")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${tipoDocumentoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
