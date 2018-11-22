<%@ page import="org.chaguala.sigem.tipocombustivel.TipoCombustivel" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: tipoCombustivelInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="tipoCombustivel.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: tipoCombustivelInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao" maxlength="200" value="${fieldValue(bean: tipoCombustivelInstance, field: 'designacao')}" />

            </div>
        </td>
        

    </tbody>
</table>