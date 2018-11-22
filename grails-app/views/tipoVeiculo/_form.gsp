<%@ page import="org.chaguala.sigem.tipoveiculo.TipoVeiculo" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: tipoVeiculoInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="tipoVeiculo.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: tipoVeiculoInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao" maxlength="200" value="${fieldValue(bean: tipoVeiculoInstance, field: 'designacao')}" />

            </div>
        </td>
        

    </tbody>
</table>