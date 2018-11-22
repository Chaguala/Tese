
<%@ page import="org.chaguala.sigem.tipodocumento.TipoDocumento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="tipoDocumento.show" default="Show TipoDocumento" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="tipoDocumento.list" default="Listar" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="tipoDocumento.new" default="Criar" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <h4><g:message code="tipoDocumento.show" default="Detalhes" /></h4>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${tipoDocumentoInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="tipoDocumento.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: tipoDocumentoInstance, field: "id")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="tipoDocumento.designacao" default="Designacao" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: tipoDocumentoInstance, field: "designacao")}</td>
                                
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
                <fieldset>
                    <legend title=""/>
                </fieldset>

                <div class="buttons">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'Editar', 'default': 'Editar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Apagar', 'default': 'Apagar')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Tem certeza de que pretende apagar esse registo?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
