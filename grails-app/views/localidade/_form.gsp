<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Localidade" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: localidadeInstance, field: 'codigo', 'error')} ">
                <label for="codigo">
                    <g:message code="localidade.codigo.label" default="Codigo"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: localidadeInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="localidade.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: localidadeInstance, field: 'codigo', 'error')} ">
                <g:textField name="codigo" placeholder="Codigo" maxlength="20" value="${fieldValue(bean: localidadeInstance, field: 'codigo')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: localidadeInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao" size="40"
                             placeholder="Designacao da Localidade"
                             maxlength="200" value="${fieldValue(bean: localidadeInstance, field: 'designacao')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: localidadeInstance, field: 'postoAdministrativo', 'error')} ">
                <label for="postoAdministrativo">
                    <g:message code="localidade.postoAdministrativo.label" default="Posto Administrativo"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: localidadeInstance, field: 'bairros', 'error')} ">
                <label for="bairros">
                    <g:message code="localidade.bairros.label" default="Bairros"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: localidadeInstance, field: 'postoAdministrativo', 'error')} ">
                <g:select name="postoAdministrativo.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.PostoAdministrativo.list()}" optionKey="id" value="${localidadeInstance?.postoAdministrativo?.id}" noSelection="['null': '']" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: localidadeInstance, field: 'bairros', 'error')} ">
                
<ul>
<g:each in="${localidadeInstance?.bairros}" var="bairroInstance">
    <li><g:link controller="bairro" action="show" id="${bairroInstance.id}">${bairroInstance?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="bairro" params="['localidade.id': localidadeInstance?.id]" action="create"><g:message code="bairro.new" default="New Bairro" /></g:link>


            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: localidadeInstance, field: 'distrito', 'error')} required">
                <label for="distrito">
                    <g:message code="localidade.distrito.label" default="Distrito"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: localidadeInstance, field: 'distrito', 'error')} required">
                <g:select name="distrito.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Distrito.list()}" optionKey="id" value="${localidadeInstance?.distrito?.id}"  />

            </div>
        </td>
        

    </tbody>
</table>