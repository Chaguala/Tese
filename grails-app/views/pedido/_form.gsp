<%@ page import="org.chaguala.sigem.pedido.Pedido" %>

<fieldset>
    <legend> <g:message code="prepedido.show.label" default="Detalhes do Pre-Pedido"/></legend>
<table>
    <tbody>

    <tr class="prop">
        <td valign="top" class="name"><g:message code="prePedido.id" default="Id" />:</td>

        <td valign="top" class="value">${fieldValue(bean: prePedidoInstance, field: "id")}</td>

    </tr>

    <tr class="prop">
        <td valign="top" class="name"><g:message code="prePedido.tipoproprietario" default="Tipoproprietario" />:</td>

        <td valign="top" class="value">${fieldValue(bean: prePedidoInstance, field: "tipoproprietario")}</td>

    </tr>

    <tr class="prop">
        <td valign="top" class="name"><g:message code="prePedido.actidade" default="Actidade" />:</td>

        <td valign="top" class="value"><g:link controller="actividade" action="show" id="${prePedidoInstance?.actidade?.id}">${prePedidoInstance?.actidade?.encodeAsHTML()}</g:link></td>

    </tr>

    <tr class="prop">
        <td valign="top" class="name"><g:message code="prePedido.bairro" default="Bairro" />:</td>

        <td valign="top" class="value"><g:link controller="bairro" action="show" id="${prePedidoInstance?.bairro?.id}">${prePedidoInstance?.bairro?.encodeAsHTML()}</g:link></td>

    </tr>

    <tr class="prop">
        <td valign="top" class="name"><g:message code="prePedido.datapedido" default="Datapedido" />:</td>

        <td valign="top" class="value"><g:formatDate date="${prePedidoInstance?.datapedido}" /></td>

    </tr>

    <tr class="prop">
        <td valign="top" class="name"><g:message code="prePedido.distrito" default="Distrito" />:</td>

        <td valign="top" class="value"><g:link controller="distrito" action="show" id="${prePedidoInstance?.distrito?.id}">${prePedidoInstance?.distrito?.encodeAsHTML()}</g:link></td>

    </tr>

    <tr class="prop">
        <td valign="top" class="name"><g:message code="prePedido.provincia" default="Provincia" />:</td>

        <td valign="top" class="value"><g:link controller="provincia" action="show" id="${prePedidoInstance?.provincia?.id}">${prePedidoInstance?.provincia?.encodeAsHTML()}</g:link></td>

    </tr>

    <tr class="prop">
        <td valign="top" class="name"><g:message code="prePedido.requerente" default="Requerente" />:</td>

        <td valign="top" class="value"><g:link controller="requerente" action="show" id="${prePedidoInstance?.requerente?.id}">${prePedidoInstance?.requerente?.encodeAsHTML()}</g:link></td>

    </tr>

    <tr class="prop">
        <td valign="top" class="name"><g:message code="prePedido.tipodocumento" default="Tipodocumento" />:</td>

        <td valign="top" class="value"><g:link controller="tipoDocumento" action="show" id="${prePedidoInstance?.tipodocumento?.id}">${prePedidoInstance?.tipodocumento?.encodeAsHTML()}</g:link></td>

    </tr>

    <tr class="prop">
        <td valign="top" class="name"><g:message code="prePedido.tipopedido" default="Tipopedido" />:</td>

        <td valign="top" class="value"><g:link controller="tipoPedido" action="show" id="${prePedidoInstance?.tipopedido?.id}">${prePedidoInstance?.tipopedido?.encodeAsHTML()}</g:link></td>

    </tr>

    </tbody>
</table>
</fieldset>
<fieldset>
    <legend title=""/>
</fieldset>

<fieldset>
    <legend title="">Confirmar dados sobre a localizacao do espaco</legend>
</fieldset>

<table class="tabela">

    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'numero', 'error')} required">
                <label for="numero">
                    <g:message code="pedido.numero.label" default="Numero"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'numparcela', 'error')} required">
                <label for="numparcela">
                    <g:message code="pedido.numparcela.label" default="Numparcela"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'numero', 'error')} required">
                <g:textField name="numero" value="${fieldValue(bean: pedidoInstance, field: 'numero')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'numparcela', 'error')} required">
                <g:textField name="numparcela" maxlength="200" value="${fieldValue(bean: pedidoInstance, field: 'numparcela')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'dimessoes', 'error')} ">
                <label for="dimessoes">
                    <g:message code="pedido.dimessoes.label" default="Dimessoes"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'latitude', 'error')} ">
                <label for="latitude">
                    <g:message code="pedido.latitude.label" default="Latitude"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'dimessoes', 'error')} ">
                <g:textField name="dimessoes" value="${fieldValue(bean: pedidoInstance, field: 'dimessoes')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'latitude', 'error')} ">
                <g:textField name="latitude" value="${fieldValue(bean: pedidoInstance, field: 'latitude')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'localidade', 'error')} required">
                <label for="localidade">
                    <g:message code="pedido.localidade.label" default="Localidade"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'longitude', 'error')} ">
                <label for="longitude">
                    <g:message code="pedido.longitude.label" default="Longitude"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'localidade', 'error')} required">
                <g:select name="localidade.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Localidade.list()}" optionKey="id" value="${pedidoInstance?.localidade?.id}"  />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'longitude', 'error')} ">
                <g:textField name="longitude" value="${fieldValue(bean: pedidoInstance, field: 'longitude')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'obs', 'error')} ">
                <label for="obs">
                    <g:message code="pedido.obs.label" default="Obs"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'posto', 'error')} required">
                <label for="posto">
                    <g:message code="pedido.posto.label" default="Posto"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'obs', 'error')} ">
                <g:textArea name="obs" size="20" value="${fieldValue(bean: pedidoInstance, field: 'obs')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'posto', 'error')} required">
                <g:select name="posto.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.PostoAdministrativo.list()}" optionKey="id" value="${pedidoInstance?.posto?.id}"  />

            </div>
        </td>
    </tr>
    
    <tr>
        %{--<td>--}%
            %{--<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'prepedido', 'error')} required">--}%
                %{--<label for="prepedido">--}%
                    %{--<g:message code="pedido.prepedido.label" default="Prepedido"/>--}%
                    %{--<span class="required-indicator">*</span>--}%
                %{--</label>--}%
            %{--</div>--}%
        %{--</td>--}%
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'u', 'error')} ">
                <label for="u">
                    <g:message code="pedido.u.label" default="U"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        %{--<td>--}%
            %{--<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'prepedido', 'error')} required">--}%
                %{--<g:select name="prepedido.id" from="${org.chaguala.sigem.pedido.PrePedido.list()}" optionKey="id" value="${pedidoInstance?.prepedido?.id}"  />--}%

            %{--</div>--}%
        %{--</td>--}%
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'u', 'error')} ">
                <g:textField name="u" value="${fieldValue(bean: pedidoInstance, field: 'u')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'w', 'error')} ">
                <label for="w">
                    <g:message code="pedido.w.label" default="W"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'z', 'error')} ">
                <label for="z">
                    <g:message code="pedido.z.label" default="Z"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'w', 'error')} ">
                <g:textField name="w" value="${fieldValue(bean: pedidoInstance, field: 'w')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'z', 'error')} ">
                <g:textField name="z" value="${fieldValue(bean: pedidoInstance, field: 'z')}" />

            </div>
        </td>
    </tr>
    

    </tbody>
</table>