<%@ page import="org.chaguala.sigem.seguradora.Seguradora" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: seguradoraInstance, field: 'nomeseguradora', 'error')} required">
                <label for="nomeseguradora">
                    <g:message code="seguradora.nomeseguradora.label" default="Nomeseguradora"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: seguradoraInstance, field: 'contacto', 'error')} required">
                <label for="contacto">
                    <g:message code="seguradora.contacto.label" default="Contacto"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: seguradoraInstance, field: 'nomeseguradora', 'error')} required">
                <g:textField name="nomeseguradora" maxlength="200" value="${fieldValue(bean: seguradoraInstance, field: 'nomeseguradora')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: seguradoraInstance, field: 'contacto', 'error')} required">
                <g:textField name="contacto" value="${fieldValue(bean: seguradoraInstance, field: 'contacto')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: seguradoraInstance, field: 'datacriacao', 'error')} required">
                <label for="datacriacao">
                    <g:message code="seguradora.datacriacao.label" default="Datacriacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: seguradoraInstance, field: 'email', 'error')} ">
                <label for="email">
                    <g:message code="seguradora.email.label" default="Email"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: seguradoraInstance, field: 'datacriacao', 'error')} required">
                <g:datePicker name="datacriacao" value="${seguradoraInstance?.datacriacao}"  />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: seguradoraInstance, field: 'email', 'error')} ">
                <g:textField name="email" value="${fieldValue(bean: seguradoraInstance, field: 'email')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: seguradoraInstance, field: 'endereco', 'error')} ">
                <label for="endereco">
                    <g:message code="seguradora.endereco.label" default="Endereco"/>
                    
                </label>
            </div>
        </td>
        
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: seguradoraInstance, field: 'endereco', 'error')} ">
                <g:textField name="endereco" value="${fieldValue(bean: seguradoraInstance, field: 'endereco')}" />

            </div>
        </td>
        

    </tbody>
</table>