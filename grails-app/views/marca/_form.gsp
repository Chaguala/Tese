<%@ page import="org.chaguala.sigem.marca.Marca" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="marca.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao" maxlength="200" value="${fieldValue(bean: marcaInstance, field: 'designacao')}" />

            </div>
        </td>
        

    </tbody>
</table>