<%@ page import="org.chaguala.sigem.actividade.Actividade" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: actividadeInstance, field: 'estado', 'error')} ">
                <label for="estado">
                    <g:message code="actividade.estado.label" default="Estado"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: actividadeInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="actividade.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: actividadeInstance, field: 'estado', 'error')} ">
                <g:select name="estado" from="${actividadeInstance.constraints.estado.inList}" value="${actividadeInstance.estado}" valueMessagePrefix="actividade.estado"  />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: actividadeInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao" maxlength="200" value="${fieldValue(bean: actividadeInstance, field: 'designacao')}" />

            </div>
        </td>
    </tr>
    

    </tbody>
</table>