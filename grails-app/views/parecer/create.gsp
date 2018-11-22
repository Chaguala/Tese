
<%@ page import="org.chaguala.sigem.parecer.Parecer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="parecer.create" default="Criar Parecer" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="parecer.list" default="Listar" /></g:link></span>
        </div>

    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <h4><g:message code="parecer.create" default="Criar novo parecer" /></h4>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${parecerInstance}">
            <div class="errors">
                <g:renderErrors bean="${parecerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >

                <fieldset>
                    <legend title="">Detalhes do pedido</legend>
                </fieldset>
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="pedido.id" default="Id" />:</td>

                        <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "id")}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="pedido.numero" default="Numero" />:</td>

                        <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "numero")}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="pedido.numparcela" default="Numparcela" />:</td>

                        <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "numparcela")}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="pedido.dimessoes" default="Dimessoes" />:</td>

                        <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "dimessoes")}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="pedido.latitude" default="Latitude" />:</td>

                        <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "latitude")}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="pedido.localidade" default="Localidade" />:</td>

                        <td valign="top" class="value"><g:link controller="localidade" action="show" id="${pedidoInstance?.localidade?.id}">${pedidoInstance?.localidade?.encodeAsHTML()}</g:link></td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="pedido.longitude" default="Longitude" />:</td>

                        <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "longitude")}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="pedido.obs" default="Obs" />:</td>

                        <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "obs")}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="pedido.posto" default="Posto" />:</td>

                        <td valign="top" class="value"><g:link controller="postoAdministrativo" action="show" id="${pedidoInstance?.posto?.id}">${pedidoInstance?.posto?.encodeAsHTML()}</g:link></td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="pedido.prepedido" default="Prepedido" />:</td>

                        <td valign="top" class="value"><g:link controller="prePedido" action="show" id="${pedidoInstance?.prepedido?.id}">${pedidoInstance?.prepedido?.encodeAsHTML()}</g:link></td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="pedido.u" default="U" />:</td>

                        <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "u")}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="pedido.w" default="W" />:</td>

                        <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "w")}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="pedido.z" default="Z" />:</td>

                        <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "z")}</td>

                    </tr>

                    </tbody>
                </table>

                <fieldset>
                    <legend title=""/>
                </fieldset>

                <fieldset>
                    <legend title="">Dar parecer sobre o pedido</legend>
                </fieldset>

                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nivel"><g:message code="parecer.nivel" default="Nivel" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parecerInstance, field: 'nivel', 'errors')}">
                                    <g:select name="nivel.id" from="${org.chaguala.sigem.nivel.Nivel.list()}" optionKey="id" value="${parecerInstance?.nivel?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="numero"><g:message code="parecer.numero" default="Numero" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parecerInstance, field: 'numero', 'errors')}">
                                    <g:textField name="numero" value="${fieldValue(bean: parecerInstance, field: 'numero')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="obs"><g:message code="parecer.obs" default="Obs" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parecerInstance, field: 'obs', 'errors')}">
                                    <g:textField name="obs" value="${fieldValue(bean: parecerInstance, field: 'obs')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="parecer"><g:message code="parecer.parecer" default="Parecer" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parecerInstance, field: 'parecer', 'errors')}">
                                    <g:textField name="parecer" value="${fieldValue(bean: parecerInstance, field: 'parecer')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="aprovado"><g:message code="parecer.aprovado" default="Aprovado" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parecerInstance, field: 'pedido', 'errors')}">
                                    <g:select name="aprovado" from="${['','SIM','NAO']}" value="${parecerInstance?.aprovado}"  />

                                </td>
                        
                        </tbody>
                    </table>
                </div>
                <fieldset>
                    <legend title=""/>
                </fieldset>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'Criar', 'Criar': 'Criar')}" /></span>
                </div>


                <fieldset>
                    <legend title=""/>
                </fieldset>

            </g:form>
        </div>
    </body>
</html>
