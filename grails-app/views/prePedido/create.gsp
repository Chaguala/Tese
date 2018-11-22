
<%@ page import="org.chaguala.sigem.pedido.PrePedido" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="prePedido.create" default="Create PrePedido" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="prePedido.list" default="Listar" /></g:link></span>
        </div>

        <fieldset>
            <legend title=""/>
        </fieldset>

        <div class="body">
            <h4><g:message code="prePedido.create" default="Crir novo pedido" /></h4>
            <fieldset>
                <legend title="">Detalhes do pre-pedido</legend>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${prePedidoInstance}">
            <div class="errors">
                <g:renderErrors bean="${prePedidoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <fieldset>
                        <legend title="Detalhes do pre-pedido do requerente"/>
                        <table>
                            <tbody>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.id" default="Id" />:</td>

                                <td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "id")}</td>

                            </tr>

                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name"><g:message code="requerente.sexo" default="Sexo" />:</td>--}%

                                %{--<td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "sexo")}</td>--}%

                            %{--</tr>--}%

                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name"><g:message code="requerente.tipoidentificacao" default="Tipoidentificacao" />:</td>--}%

                                %{--<td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "tipoidentificacao")}</td>--}%

                            %{--</tr>--}%

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.nome" default="Nome" />:</td>

                                <td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "nome")}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.bairro" default="Bairro" />:</td>

                                <td valign="top" class="value"><g:link controller="bairro" action="show" id="${requerenteInstance?.bairro?.id}">${requerenteInstance?.bairro?.encodeAsHTML()}</g:link></td>

                            </tr>

                            <tr class="prop">
                            <td valign="top" class="name"><g:message code="requerente.endereco" default="Endereco" />:</td>

                            <td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "endereco")}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.contacto" default="Contacto" />:</td>

                                <td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "contacto")}</td>

                            </tr>

                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name"><g:message code="requerente.datanasc" default="Datanasc" />:</td>--}%

                                %{--<td valign="top" class="value"><g:formatDate date="${requerenteInstance?.datanasc}" /></td>--}%

                            %{--</tr>--}%

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.email" default="Email" />:</td>

                                <td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "email")}</td>

                            </tr>

                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name"><g:message code="requerente.identificacao" default="Identificacao" />:</td>--}%

                                %{--<td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "identificacao")}</td>--}%

                            %{--</tr>--}%

                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name"><g:message code="requerente.pais" default="Pais" />:</td>--}%

                                %{--<td valign="top" class="value"><g:link controller="pais" action="show" id="${requerenteInstance?.pais?.id}">${requerenteInstance?.pais?.encodeAsHTML()}</g:link></td>--}%

                            %{--</tr>--}%

                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name"><g:message code="requerente.provincia" default="Provincia" />:</td>--}%

                                %{--<td valign="top" class="value"><g:link controller="provincia" action="show" id="${requerenteInstance?.provincia?.id}">${requerenteInstance?.provincia?.encodeAsHTML()}</g:link></td>--}%

                            %{--</tr>--}%

                            </tbody>
                        </table>
                    </fieldset>

                    <table>
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name" align="">
                                <label for="tipopedido"><g:message code="prePedido.tipopedido" default="Tipo de Pedido" />:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: prePedidoInstance, field: 'tipopedido', 'errors')}">
                                <g:select name="tipopedido.id" from="${org.chaguala.sigem.tipopedido.TipoPedido.list()}" optionKey="id" value="${prePedidoInstance?.tipopedido?.id}"  />

                            </td>
                        </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipoproprietario"><g:message code="prePedido.tipoproprietario" default="Tipo de Proprietario" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: prePedidoInstance, field: 'tipoproprietario', 'errors')}">
                                    <g:select name="tipoproprietario" from="${prePedidoInstance.constraints.tipoproprietario.inList}" value="${prePedidoInstance.tipoproprietario}" valueMessagePrefix="prePedido.tipoproprietario"  />

                                </td>
                            </tr>


                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="tipodocumento"><g:message code="prePedido.tipodocumento" default="Tipo de Documento" />:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: prePedidoInstance, field: 'tipodocumento', 'errors')}">
                                <g:select name="tipodocumento.id" from="${org.chaguala.sigem.tipodocumento.TipoDocumento.list()}" optionKey="id" value="${prePedidoInstance?.tipodocumento?.id}"  />

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
                                    <label for="datapedido"><g:message code="prePedido.datapedido" default="Datapedido" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: prePedidoInstance, field: 'datapedido', 'errors')}">
                                    <g:datePicker name="datapedido" value="${prePedidoInstance?.datapedido}"  />

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
                        
                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name">--}%
                                    %{--<label for="requerente"><g:message code="prePedido.requerente" default="Requerente" />:</label>--}%
                                %{--</td>--}%
                                %{--<td valign="top" class="value ${hasErrors(bean: prePedidoInstance, field: 'requerente', 'errors')}">--}%
                                    %{--<g:select name="requerente.id" from="${org.chaguala.sigem.requerente.Requerente.list()}" optionKey="id" value="${prePedidoInstance?.requerente?.id}"  />--}%

                                %{--</td>--}%
                            %{--</tr>--}%

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'Criar', 'default': 'Criar')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
