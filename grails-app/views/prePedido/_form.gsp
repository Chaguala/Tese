<%@ page import="org.chaguala.sigem.pedido.PrePedido" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'tipoproprietario', 'error')} ">
                <label for="tipoproprietario">
                    <g:message code="prePedido.tipoproprietario.label" default="Tipoproprietario"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'actidade', 'error')} required">
                <label for="actidade">
                    <g:message code="prePedido.actidade.label" default="Actidade"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'tipoproprietario', 'error')} ">
                <g:select name="tipoproprietario" from="${prePedidoInstance.constraints.tipoproprietario.inList}" value="${prePedidoInstance.tipoproprietario}" valueMessagePrefix="prePedido.tipoproprietario"  />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'actidade', 'error')} required">
                <g:select name="actidade.id" from="${org.chaguala.sigem.actividade.Actividade.list()}" optionKey="id" value="${prePedidoInstance?.actidade?.id}"  />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'bairro', 'error')} required">
                <label for="bairro">
                    <g:message code="prePedido.bairro.label" default="Bairro"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'datapedido', 'error')} required">
                <label for="datapedido">
                    <g:message code="prePedido.datapedido.label" default="Datapedido"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'bairro', 'error')} required">
                <g:select name="bairro.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Bairro.list()}" optionKey="id" value="${prePedidoInstance?.bairro?.id}"  />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'datapedido', 'error')} required">
                <g:datePicker name="datapedido" value="${prePedidoInstance?.datapedido}"  />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'distrito', 'error')} required">
                <label for="distrito">
                    <g:message code="prePedido.distrito.label" default="Distrito"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'provincia', 'error')} required">
                <label for="provincia">
                    <g:message code="prePedido.provincia.label" default="Provincia"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'distrito', 'error')} required">
                <g:select name="distrito.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Distrito.list()}" optionKey="id" value="${prePedidoInstance?.distrito?.id}"  />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'provincia', 'error')} required">
                <g:select name="provincia.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Provincia.list()}" optionKey="id" value="${prePedidoInstance?.provincia?.id}"  />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'requerente', 'error')} required">
                <label for="requerente">
                    <g:message code="prePedido.requerente.label" default="Requerente"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'tipodocumento', 'error')} required">
                <label for="tipodocumento">
                    <g:message code="prePedido.tipodocumento.label" default="Tipodocumento"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        %{--<td>--}%
            %{--<div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'requerente', 'error')} required">--}%
                %{--<g:select name="requerente.id" from="${org.chaguala.sigem.requerente.Requerente.list()}" optionKey="id" value="${prePedidoInstance?.requerente?.id}"  />--}%

            %{--</div>--}%
        %{--</td>--}%
        %{----}%
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'tipodocumento', 'error')} required">
                <g:select name="tipodocumento.id" from="${org.chaguala.sigem.tipodocumento.TipoDocumento.list()}" optionKey="id" value="${prePedidoInstance?.tipodocumento?.id}"  />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'tipopedido', 'error')} required">
                <label for="tipopedido">
                    <g:message code="prePedido.tipopedido.label" default="Tipopedido"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: prePedidoInstance, field: 'tipopedido', 'error')} required">
                <g:select name="tipopedido.id" from="${org.chaguala.sigem.tipopedido.TipoPedido.list()}" optionKey="id" value="${prePedidoInstance?.tipopedido?.id}"  />

            </div>
        </td>
        

    </tbody>
</table>