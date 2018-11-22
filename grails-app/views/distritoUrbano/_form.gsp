<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.DistritoUrbano" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: distritoUrbanoInstance, field: 'nomeDistrito', 'error')} required">
                <label for="nomeDistrito">
                    <g:message code="distritoUrbano.nomeDistrito.label" default="Nome Distrito"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: distritoUrbanoInstance, field: 'sigla', 'error')} ">
                <label for="sigla">
                    <g:message code="distritoUrbano.sigla.label" default="Sigla"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: distritoUrbanoInstance, field: 'nomeDistrito', 'error')} required">
                <g:textArea name="nomeDistrito" cols="40" rows="5" maxlength="500" required="" value="${distritoUrbanoInstance?.nomeDistrito}"/>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: distritoUrbanoInstance, field: 'sigla', 'error')} ">
                <g:textField name="sigla" maxlength="200" value="${distritoUrbanoInstance?.sigla}"/>
            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: distritoUrbanoInstance, field: 'bairros', 'error')} ">
                <label for="bairros">
                    <g:message code="distritoUrbano.bairros.label" default="Bairros"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: distritoUrbanoInstance, field: 'cidade', 'error')} required">
                <label for="cidade">
                    <g:message code="distritoUrbano.cidade.label" default="Cidade"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: distritoUrbanoInstance, field: 'bairros', 'error')} ">
                <g:select name="bairros" from="${org.chaguala.sigem.distibuicaoAdministrativa.Bairro.list()}" multiple="multiple" optionKey="id" size="5" value="${distritoUrbanoInstance?.bairros*.id}" class="many-to-many"/>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: distritoUrbanoInstance, field: 'cidade', 'error')} required">
                <g:select id="cidade" name="cidade.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Cidade.list()}" optionKey="id" required="" value="${distritoUrbanoInstance?.cidade?.id}" class="many-to-one"/>
            </div>
        </td>
    </tr>
    

    </tbody>
</table>