<%@ page import="org.chaguala.sigem.tipopedido.TipoPedido" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: tipoPedidoInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="tipoPedido.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: tipoPedidoInstance, field: 'estado', 'error')} ">
                <label for="estado">
                    <g:message code="tipoPedido.estado.label" default="Estado"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: tipoPedidoInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao" maxlength="200" value="${fieldValue(bean: tipoPedidoInstance, field: 'designacao')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: tipoPedidoInstance, field: 'estado', 'error')} ">
                <g:select name="estado" from="${tipoPedidoInstance.constraints.estado.inList}" value="${tipoPedidoInstance.estado}" valueMessagePrefix="tipoPedido.estado"  />

            </div>
        </td>
    </tr>
    

    </tbody>
</table>