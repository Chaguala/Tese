<%@ page import="org.chaguala.sigem.tiposeguro.TipoSeguro" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: tipoSeguroInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="tipoSeguro.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: tipoSeguroInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao" maxlength="200" value="${fieldValue(bean: tipoSeguroInstance, field: 'designacao')}" />

            </div>
        </td>
        

    </tbody>
</table>