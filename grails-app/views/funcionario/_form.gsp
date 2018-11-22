<%@ page import="org.chaguala.sigem.funcionaro.Funcionario" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'sexo', 'error')} ">
                <label for="sexo">
                    <g:message code="funcionario.sexo.label" default="Sexo"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'tipoidentificacao', 'error')} ">
                <label for="tipoidentificacao">
                    <g:message code="funcionario.tipoidentificacao.label" default="Tipoidentificacao"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'sexo', 'error')} ">
                <g:select name="sexo" from="${funcionarioInstance.constraints.sexo.inList}" value="${funcionarioInstance.sexo}" valueMessagePrefix="funcionario.sexo"  />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'tipoidentificacao', 'error')} ">
                <g:select name="tipoidentificacao" from="${funcionarioInstance.constraints.tipoidentificacao.inList}" value="${funcionarioInstance.tipoidentificacao}" valueMessagePrefix="funcionario.tipoidentificacao"  />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'nome', 'error')} required">
                <label for="nome">
                    <g:message code="funcionario.nome.label" default="Nome"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'contacto', 'error')} required">
                <label for="contacto">
                    <g:message code="funcionario.contacto.label" default="Contacto"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'nome', 'error')} required">
                <g:textField name="nome" maxlength="200" value="${fieldValue(bean: funcionarioInstance, field: 'nome')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'contacto', 'error')} required">
                <g:textField name="contacto" value="${fieldValue(bean: funcionarioInstance, field: 'contacto')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'datanasc', 'error')} required">
                <label for="datanasc">
                    <g:message code="funcionario.datanasc.label" default="Datanasc"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'email', 'error')} ">
                <label for="email">
                    <g:message code="funcionario.email.label" default="Email"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'datanasc', 'error')} required">
                %{--<g:datePicker name="datanasc" value="${funcionarioInstance?.datanasc}"  />--}%
                <richui:dateChooser format="dd/MM/yyyy" name="datanasc" precision="day" value="${funcionarioInstance?.datanasc}"  />
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'email', 'error')} ">
                <g:textField name="email" value="${fieldValue(bean: funcionarioInstance, field: 'email')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'endereco', 'error')} ">
                <label for="endereco">
                    <g:message code="funcionario.endereco.label" default="Endereco"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'identificacao', 'error')} ">
                <label for="identificacao">
                    <g:message code="funcionario.identificacao.label" default="Identificacao"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'endereco', 'error')} ">
                <g:textField name="endereco" value="${fieldValue(bean: funcionarioInstance, field: 'endereco')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'identificacao', 'error')} ">
                <g:textField name="identificacao" value="${fieldValue(bean: funcionarioInstance, field: 'identificacao')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'numero', 'error')} ">
                <label for="numero">
                    <g:message code="funcionario.numero.label" default="Numero"/>
                    
                </label>
            </div>
        </td>
        
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'numero', 'error')} ">
                <g:textField name="numero" value="${fieldValue(bean: funcionarioInstance, field: 'numero')}" />

            </div>
        </td>
        

    </tbody>
</table>