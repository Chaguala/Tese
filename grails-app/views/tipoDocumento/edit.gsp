
<%@ page import="org.chaguala.sigem.tipodocumento.TipoDocumento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="tipoDocumento.edit" default="Edit TipoDocumento" /></title>
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
            <h4><g:message code="tipoDocumento.edit" default="Actualizar dados" /></h4>
        <fieldset>
            <legend title=""/>
        </fieldset>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${tipoDocumentoInstance}">
            <div class="errors">
                <g:renderErrors bean="${tipoDocumentoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${tipoDocumentoInstance?.id}" />
                <g:hiddenField name="version" value="${tipoDocumentoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="designacao"><g:message code="tipoDocumento.designacao" default="Designacao" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tipoDocumentoInstance, field: 'designacao', 'errors')}">
                                    <g:textField name="designacao" maxlength="200" value="${fieldValue(bean: tipoDocumentoInstance, field: 'designacao')}" />

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <fieldset>
                    <legend title=""/>
                </fieldset>


                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'Actualizar', 'default': 'Actualizar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Apagar', 'default': 'Apagar')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
