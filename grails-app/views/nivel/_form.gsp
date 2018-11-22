<%@ page import="org.chaguala.sigem.nivel.Nivel" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: nivelInstance, field: 'nivel', 'error')} required">
                <label for="nivel">
                    <g:message code="nivel.nivel.label" default="Nivel"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: nivelInstance, field: 'nivel', 'error')} required">
                <g:textField name="nivel"
                             size="50"
                             placeholder="Designacao do nivel"
                             maxlength="200" value="${fieldValue(bean: nivelInstance, field: 'nivel')}" />

            </div>
        </td>
    </tr>

    </tbody>
</table>