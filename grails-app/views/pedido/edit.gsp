
<%@ page import="org.chaguala.sigem.pedido.Pedido" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="pedido.edit" default="Edit Pedido" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="pedido.list" default="Pedido List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="pedido.new" default="New Pedido" /></g:link></span>
        </div>

    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <h4><g:message code="pedido.edit" default="Actualizar dados" /></h4>

            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${pedidoInstance}">
            <div class="errors">
                <g:renderErrors bean="${pedidoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${pedidoInstance?.id}" />
                <g:hiddenField name="version" value="${pedidoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="numero"><g:message code="pedido.numero" default="Numero" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'numero', 'errors')}">
                                    <g:textField name="numero" value="${fieldValue(bean: pedidoInstance, field: 'numero')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="numparcela"><g:message code="pedido.numparcela" default="Numparcela" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'numparcela', 'errors')}">
                                    <g:textField name="numparcela" maxlength="200" value="${fieldValue(bean: pedidoInstance, field: 'numparcela')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dimessoes"><g:message code="pedido.dimessoes" default="Dimessoes" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'dimessoes', 'errors')}">
                                    <g:textField name="dimessoes" value="${fieldValue(bean: pedidoInstance, field: 'dimessoes')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="latitude"><g:message code="pedido.latitude" default="Latitude" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'latitude', 'errors')}">
                                    <g:textField name="latitude" value="${fieldValue(bean: pedidoInstance, field: 'latitude')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="localidade"><g:message code="pedido.localidade" default="Localidade" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'localidade', 'errors')}">
                                    <g:select name="localidade.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Localidade.list()}" optionKey="id" value="${pedidoInstance?.localidade?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="longitude"><g:message code="pedido.longitude" default="Longitude" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'longitude', 'errors')}">
                                    <g:textField name="longitude" value="${fieldValue(bean: pedidoInstance, field: 'longitude')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="obs"><g:message code="pedido.obs" default="Obs" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'obs', 'errors')}">
                                    <g:textField name="obs" value="${fieldValue(bean: pedidoInstance, field: 'obs')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="posto"><g:message code="pedido.posto" default="Posto" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'posto', 'errors')}">
                                    <g:select name="posto.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.PostoAdministrativo.list()}" optionKey="id" value="${pedidoInstance?.posto?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="prepedido"><g:message code="pedido.prepedido" default="Prepedido" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'prepedido', 'errors')}">
                                    <g:select name="prepedido.id" from="${org.chaguala.sigem.pedido.PrePedido.list()}" optionKey="id" value="${pedidoInstance?.prepedido?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="u"><g:message code="pedido.u" default="U" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'u', 'errors')}">
                                    <g:textField name="u" value="${fieldValue(bean: pedidoInstance, field: 'u')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="w"><g:message code="pedido.w" default="W" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'w', 'errors')}">
                                    <g:textField name="w" value="${fieldValue(bean: pedidoInstance, field: 'w')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="z"><g:message code="pedido.z" default="Z" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'z', 'errors')}">
                                    <g:textField name="z" value="${fieldValue(bean: pedidoInstance, field: 'z')}" />

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
