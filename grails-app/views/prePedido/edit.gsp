
<%@ page import="org.chaguala.sigem.pedido.PrePedido" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="prePedido.edit" default="Edit PrePedido" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="prePedido.list" default="Listar" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="prePedido.new" default="Criar Novo" /></g:link></span>
        </div>
        <div class="body">

            <fieldset>
                <legend title="Actualizar dados"/>
            </fieldset>

            <h4><g:message code="prePedido.edit" default="Actualizar dados" /></h4>

            <fieldset>
                <legend title="Actualizar dados"/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${prePedidoInstance}">
            <div class="errors">
                <g:renderErrors bean="${prePedidoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${prePedidoInstance?.id}" />
                <g:hiddenField name="version" value="${prePedidoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipoproprietario"><g:message code="prePedido.tipoproprietario" default="Tipoproprietario" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: prePedidoInstance, field: 'tipoproprietario', 'errors')}">
                                    <g:select name="tipoproprietario" from="${prePedidoInstance.constraints.tipoproprietario.inList}" value="${prePedidoInstance.tipoproprietario}" valueMessagePrefix="prePedido.tipoproprietario"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="actidade"><g:message code="prePedido.actidade" default="Actidade" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: prePedidoInstance, field: 'actidade', 'errors')}">
                                    <g:select name="actidade.id" from="${org.chaguala.sigem.actividade.Actividade.list()}" optionKey="id" value="${prePedidoInstance?.actidade?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bairro"><g:message code="prePedido.bairro" default="Bairro" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: prePedidoInstance, field: 'bairro', 'errors')}">
                                    <g:select name="bairro.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Bairro.list()}" optionKey="id" value="${prePedidoInstance?.bairro?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="datapedido"><g:message code="prePedido.datapedido" default="Datapedido" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: prePedidoInstance, field: 'datapedido', 'errors')}">
                                    <g:datePicker name="datapedido" value="${prePedidoInstance?.datapedido}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="distrito"><g:message code="prePedido.distrito" default="Distrito" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: prePedidoInstance, field: 'distrito', 'errors')}">
                                    <g:select name="distrito.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Distrito.list()}" optionKey="id" value="${prePedidoInstance?.distrito?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="provincia"><g:message code="prePedido.provincia" default="Provincia" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: prePedidoInstance, field: 'provincia', 'errors')}">
                                    <g:select name="provincia.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Provincia.list()}" optionKey="id" value="${prePedidoInstance?.provincia?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="requerente"><g:message code="prePedido.requerente" default="Requerente" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: prePedidoInstance, field: 'requerente', 'errors')}">
                                    <g:select name="requerente.id" from="${org.chaguala.sigem.requerente.Requerente.list()}" optionKey="id" value="${prePedidoInstance?.requerente?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipodocumento"><g:message code="prePedido.tipodocumento" default="Tipodocumento" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: prePedidoInstance, field: 'tipodocumento', 'errors')}">
                                    <g:select name="tipodocumento.id" from="${org.chaguala.sigem.tipodocumento.TipoDocumento.list()}" optionKey="id" value="${prePedidoInstance?.tipodocumento?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipopedido"><g:message code="prePedido.tipopedido" default="Tipopedido" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: prePedidoInstance, field: 'tipopedido', 'errors')}">
                                    <g:select name="tipopedido.id" from="${org.chaguala.sigem.tipopedido.TipoPedido.list()}" optionKey="id" value="${prePedidoInstance?.tipopedido?.id}"  />

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <fieldset>
                    <legend title="Opcoes com registos"/>
                </fieldset>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'Actualizar', 'default': 'Actualizar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Apagar', 'default': 'Apagar')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
