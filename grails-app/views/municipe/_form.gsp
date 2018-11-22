<%@ page import="org.chaguala.sigem.municipe.Municipe" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'sexo', 'error')} ">
                <label for="sexo">
                    <g:message code="municipe.sexo.label" default="Sexo"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'tipoidentificacao', 'error')} ">
                <label for="tipoidentificacao">
                    <g:message code="municipe.tipoidentificacao.label" default="Tipoidentificacao"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'sexo', 'error')} ">
                <g:select name="sexo" from="${municipeInstance.constraints.sexo.inList}" value="${municipeInstance.sexo}" valueMessagePrefix="municipe.sexo"  />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'tipoidentificacao', 'error')} ">
                <g:select name="tipoidentificacao" from="${municipeInstance.constraints.tipoidentificacao.inList}" value="${municipeInstance.tipoidentificacao}" valueMessagePrefix="municipe.tipoidentificacao"  />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'nome', 'error')} required">
                <label for="nome">
                    <g:message code="municipe.nome.label" default="Nome"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'bairro', 'error')} required">
                <label for="bairro">
                    <g:message code="municipe.bairro.label" default="Bairro"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'nome', 'error')} required">
                <g:textField name="nome" maxlength="200" value="${fieldValue(bean: municipeInstance, field: 'nome')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'bairro', 'error')} required">
                <g:select name="bairro.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Bairro.list()}" optionKey="id" value="${municipeInstance?.bairro?.id}"  />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'contacto', 'error')} required">
                <label for="contacto">
                    <g:message code="municipe.contacto.label" default="Contacto"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'datanasc', 'error')} required">
                <label for="datanasc">
                    <g:message code="municipe.datanasc.label" default="Datanasc"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'contacto', 'error')} required">
                <g:textField name="contacto" value="${fieldValue(bean: municipeInstance, field: 'contacto')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'datanasc', 'error')} required">
                <richui:dateChooser format="dd/MM/yyyy" name="datanasc" precision="day" value="${requerenteInstance?.datanasc}"  />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'email', 'error')} ">
                <label for="email">
                    <g:message code="municipe.email.label" default="Email"/>
                    
                </label>
            </div>
        </td>

        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'endereco', 'error')} ">
                <label for="endereco">
                    <g:message code="municipe.endereco.label" default="Endereco"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'email', 'error')} ">
                <g:textField name="email" value="${fieldValue(bean: municipeInstance, field: 'email')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'endereco', 'error')} ">
                <g:textField name="endereco" value="${fieldValue(bean: municipeInstance, field: 'endereco')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'identificacao', 'error')} ">
                <label for="identificacao">
                    <g:message code="municipe.identificacao.label" default="Identificacao"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'numero', 'error')} ">
                <label for="numero">
                    <g:message code="municipe.numero.label" default="Numero"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'identificacao', 'error')} ">
                <g:textField name="identificacao" value="${fieldValue(bean: municipeInstance, field: 'identificacao')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'numero', 'error')} ">
                <g:textField name="numero" value="${fieldValue(bean: municipeInstance, field: 'numero')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'pais', 'error')} required">
                <label for="pais">
                    <g:message code="municipe.pais.label" default="Pais"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'provincia', 'error')} required">
                <label for="provincia">
                    <g:message code="municipe.provincia.label" default="Provincia"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'pais', 'error')} required">
                <g:select name="pais.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Pais.list()}" optionKey="id" value="${municipeInstance?.pais?.id}"  />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: municipeInstance, field: 'provincia', 'error')} required">
                <g:select name="provincia.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Provincia.list()}" optionKey="id" value="${municipeInstance?.provincia?.id}"  />

            </div>
        </td>
    </tr>
    

    </tbody>
</table>