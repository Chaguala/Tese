<%@ page import="org.chaguala.sigem.proprietario.Proprietario" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'sexo', 'error')} ">
                <label for="sexo">
                    <g:message code="proprietario.sexo.label" default="Sexo"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'tipoidentificacao', 'error')} ">
                <label for="tipoidentificacao">
                    <g:message code="proprietario.tipoidentificacao.label" default="Tipoidentificacao"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'sexo', 'error')} ">
                <g:select name="sexo" from="${proprietarioInstance.constraints.sexo.inList}" value="${proprietarioInstance.sexo}" valueMessagePrefix="proprietario.sexo"  />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'tipoidentificacao', 'error')} ">
                <g:select name="tipoidentificacao" from="${proprietarioInstance.constraints.tipoidentificacao.inList}" value="${proprietarioInstance.tipoidentificacao}" valueMessagePrefix="proprietario.tipoidentificacao"  />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'tipoproprietario', 'error')} ">
                <label for="tipoproprietario">
                    <g:message code="proprietario.tipoproprietario.label" default="Tipoproprietario"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'nome', 'error')} required">
                <label for="nome">
                    <g:message code="proprietario.nome.label" default="Nome"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'tipoproprietario', 'error')} ">
                <g:select name="tipoproprietario" from="${proprietarioInstance.constraints.tipoproprietario.inList}" value="${proprietarioInstance.tipoproprietario}" valueMessagePrefix="proprietario.tipoproprietario"  />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'nome', 'error')} required">
                <g:textField name="nome" maxlength="200" value="${fieldValue(bean: proprietarioInstance, field: 'nome')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'contacto', 'error')} required">
                <label for="contacto">
                    <g:message code="proprietario.contacto.label" default="Contacto"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'datanasc', 'error')} required">
                <label for="datanasc">
                    <g:message code="proprietario.datanasc.label" default="Datanasc"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'contacto', 'error')} required">
                <g:textField name="contacto" value="${fieldValue(bean: proprietarioInstance, field: 'contacto')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'datanasc', 'error')} required">
                %{--<g:datePicker name="datanasc" value="${proprietarioInstance?.datanasc}"  />--}%
                <richui:dateChooser format="dd/MM/yyyy" name="datanasc" precision="day" value="${proprietarioInstance?.datanasc}"  />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'email', 'error')} ">
                <label for="email">
                    <g:message code="proprietario.email.label" default="Email"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'endereco', 'error')} ">
                <label for="endereco">
                    <g:message code="proprietario.endereco.label" default="Endereco"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'email', 'error')} ">
                <g:textField name="email" value="${fieldValue(bean: proprietarioInstance, field: 'email')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'endereco', 'error')} ">
                <g:textField name="endereco" value="${fieldValue(bean: proprietarioInstance, field: 'endereco')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'identificacao', 'error')} ">
                <label for="identificacao">
                    <g:message code="proprietario.identificacao.label" default="Identificacao"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'numero', 'error')} ">
                <label for="numero">
                    <g:message code="proprietario.numero.label" default="Numero"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'identificacao', 'error')} ">
                <g:textField name="identificacao" value="${fieldValue(bean: proprietarioInstance, field: 'identificacao')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'numero', 'error')} ">
                <g:textField name="numero" value="${fieldValue(bean: proprietarioInstance, field: 'numero')}" />

            </div>
        </td>
    </tr>
    

    </tbody>
</table>