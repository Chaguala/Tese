<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Cidade" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: cidadeInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="cidade.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: cidadeInstance, field: 'descricao', 'error')} ">
                <label for="descricao">
                    <g:message code="cidade.descricao.label" default="Descricao"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: cidadeInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao"
                             placeholder="Nome da cidade"
                             size="50" maxlength="200" value="${fieldValue(bean: cidadeInstance, field: 'designacao')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: cidadeInstance, field: 'descricao', 'error')} ">
                <g:textArea name="descricao"
                            placeholder="Descricao sobre a cidade"
                            rows="5" cols="50" value="${fieldValue(bean: cidadeInstance, field: 'descricao')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: cidadeInstance, field: 'distrito', 'error')} ">
                <label for="distrito">
                    <g:message code="cidade.distrito.label" default="Distrito"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: cidadeInstance, field: 'provincia', 'error')} required">
                <label for="provincia">
                    <g:message code="cidade.provincia.label" default="Provincia"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: cidadeInstance, field: 'distrito', 'error')} ">
                <g:select name="distrito.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Distrito.list()}" optionKey="id" value="${cidadeInstance?.distrito?.id}" noSelection="['null': '']" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: cidadeInstance, field: 'provincia', 'error')} required">
                <g:select name="provincia.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Provincia.list()}" optionKey="id" value="${cidadeInstance?.provincia?.id}"  />

            </div>
        </td>
    </tr>
    

    </tbody>
</table>