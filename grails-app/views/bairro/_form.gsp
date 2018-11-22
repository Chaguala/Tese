<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Bairro" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: bairroInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="bairro.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: bairroInstance, field: 'localidade', 'error')} ">
                <label for="localidade">
                    <g:message code="bairro.localidade.label" default="Localidade"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: bairroInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao" maxlength="200" value="${fieldValue(bean: bairroInstance, field: 'designacao')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: bairroInstance, field: 'localidade', 'error')} ">
                <g:select name="localidade.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Localidade.list()}" optionKey="id" value="${bairroInstance?.localidade?.id}" noSelection="['null': '']" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: bairroInstance, field: 'postoAdministrativo', 'error')} ">
                <label for="postoAdministrativo">
                    <g:message code="bairro.postoAdministrativo.label" default="Posto Administrativo"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: bairroInstance, field: 'distrito', 'error')} required">
                <label for="distrito">
                    <g:message code="bairro.distrito.label" default="Distrito"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: bairroInstance, field: 'postoAdministrativo', 'error')} ">
                <g:select name="postoAdministrativo.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.PostoAdministrativo.list()}" optionKey="id" value="${bairroInstance?.postoAdministrativo?.id}" noSelection="['null': '']" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: bairroInstance, field: 'distrito', 'error')} required">
                <g:select name="distrito.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Distrito.list()}" optionKey="id" value="${bairroInstance?.distrito?.id}"  />

            </div>
        </td>
    </tr>
    

    </tbody>
</table>