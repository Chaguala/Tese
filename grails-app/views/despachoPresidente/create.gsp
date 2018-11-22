
<%@ page import="org.chaguala.sigem.despachopresidente.DespachoPresidente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="despachoPresidente.create" default="Create DespachoPresidente" /></title>

        <resource:autoComplete skin="default" />

        <g:javascript library="application" />
        <modalbox:modalIncludes />

        <modalbox:createLink url="akopopup.gsp" title="Hello Grails!" width="600" linkname="This is the Link" />

    </head>
    <body>

    %{--<g:form>--}%
        %{--<richui:autoComplete name="person" action="${createLinkTo('dir': 'person/searchAJAX')}" />--}%
        %{--<richui:autoComplete name="searchperson" action="${createLinkTo('dir': 'person/searchAJAX')}"--}%
                             %{--onItemSelect="document.location.href = '${createLinkTo(dir: 'person/show')}/' + id;" />--}%
        %{--<richui:autoComplete name="persons" delimChar="," action="${createLinkTo('dir': 'person/searchAJAX')}" />--}%
    %{--</g:form>--}%

        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="despachoPresidente.list" default="Listar despachos" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <h4><g:message code="despachoPresidente.create" default="Criar novo despacho do presidente" /></h4>

    <fieldset>
        <legend title=""/>
    </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${despachoPresidenteInstance}">
            <div class="errors">
                <g:renderErrors bean="${despachoPresidenteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <fieldset>
                    <legend title="Detalhes do pedido do requerente">Detalhes do pedido do requerente</legend>
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
                        <td valign="top" class="name"><g:message code="pedido.longitude" default="Longitude" />:</td>

                        <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "longitude")}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="pedido.localidade" default="Localidade" />:</td>

                        <td valign="top" class="value"><g:link controller="localidade" action="show" id="${pedidoInstance?.localidade?.id}">${pedidoInstance?.localidade?.encodeAsHTML()}</g:link></td>

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

                    %{--<tr class="prop">--}%
                        %{--<td valign="top" class="name"><g:message code="pedido.u" default="U" />:</td>--}%

                        %{--<td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "u")}</td>--}%

                    %{--</tr>--}%

                    %{--<tr class="prop">--}%
                        %{--<td valign="top" class="name"><g:message code="pedido.w" default="W" />:</td>--}%

                        %{--<td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "w")}</td>--}%

                    %{--</tr>--}%

                    %{--<tr class="prop">--}%
                        %{--<td valign="top" class="name"><g:message code="pedido.z" default="Z" />:</td>--}%

                        %{--<td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "z")}</td>--}%


                    %{--</tr>--}%

                    </tbody>
                </table>

                </fieldset>

                <fieldset>
                    <legend title=""/>
                </fieldset>

                <fieldset>
                    <legend title="Detalhes do pedido do requerente">Detalhes do parecer do pedido</legend>
                    <div class="dialog">
                        <table>
                            <tbody>
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="parecer.id" default="Id" />:</td>

                            <td valign="top" class="value">${fieldValue(bean: parecerInstance, field: "id")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="parecer.nivel" default="Nivel" />:</td>

                            <td valign="top" class="value"><g:link controller="nivel" action="show" id="${parecerInstance?.nivel?.id}">${parecerInstance?.nivel?.encodeAsHTML()}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="parecer.numero" default="Numero" />:</td>

                            <td valign="top" class="value">${fieldValue(bean: parecerInstance, field: "numero")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="parecer.obs" default="Obs" />:</td>

                            <td valign="top" class="value">${fieldValue(bean: parecerInstance, field: "obs")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="parecer.parecer" default="Parecer" />:</td>

                            <td valign="top" class="value">${fieldValue(bean: parecerInstance, field: "parecer")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="parecer.pedido" default="Pedido" />:</td>

                            <td valign="top" class="value"><g:link controller="pedido" action="show" id="${parecerInstance?.pedido?.id}">${parecerInstance?.pedido?.encodeAsHTML()}</g:link></td>

                        </tr>
                        </tbody>
                    </table>
                </fieldset>

                <fieldset>
                    <legend title=""/>
                </fieldset>
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="despacho"><g:message code="despachoPresidente.despacho" default="Despacho" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: despachoPresidenteInstance, field: 'despacho', 'errors')}">
                                    <g:select name="despacho.id" from="${org.chaguala.sigem.despacho.Despacho.list()}" optionKey="id" value="${despachoPresidenteInstance?.despacho?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="numero"><g:message code="despachoPresidente.numero" default="Numero" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: despachoPresidenteInstance, field: 'numero', 'errors')}">
                                    <g:textField name="numero" value="${fieldValue(bean: despachoPresidenteInstance, field: 'numero')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="obs"><g:message code="despachoPresidente.obs" default="Obs" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: despachoPresidenteInstance, field: 'obs', 'errors')}">
                                    <g:textField name="obs" value="${fieldValue(bean: despachoPresidenteInstance, field: 'obs')}" />

                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <fieldset>
                    <legend title=""/>
                </fieldset>

                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'Criar', 'default': 'Criar')}" /></span>
                </div>

                <div class="paginateButtons">
                    %{--<g:paginate total="${pedidoInstanceTotal}" />--}%
                </div>
                </div>
            </g:form>
        </div>
    </body>
</html>
