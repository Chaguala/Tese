<%@ page import="org.chaguala.sigem.tipodocumento.TipoDocumento" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: tipoDocumentoInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="tipoDocumento.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: tipoDocumentoInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao" maxlength="200" value="${fieldValue(bean: tipoDocumentoInstance, field: 'designacao')}" />

            </div>
        </td>
        

    </tbody>
</table>