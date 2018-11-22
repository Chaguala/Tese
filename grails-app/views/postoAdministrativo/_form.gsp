<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.PostoAdministrativo" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: postoAdministrativoInstance, field: 'codigo', 'error')} ">
                <label for="codigo">
                    <g:message code="postoAdministrativo.codigo.label" default="Codigo"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: postoAdministrativoInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="postoAdministrativo.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: postoAdministrativoInstance, field: 'codigo', 'error')} ">
                <g:textField name="codigo"
                             placeholder="Codigo"
                             maxlength="20" value="${fieldValue(bean: postoAdministrativoInstance, field: 'codigo')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: postoAdministrativoInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao" placeholder="Designacao do posto"
                             size="50" maxlength="200" value="${fieldValue(bean: postoAdministrativoInstance, field: 'designacao')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: postoAdministrativoInstance, field: 'bairros', 'error')} ">
                <label for="bairros">
                    <g:message code="postoAdministrativo.bairros.label" default="Bairros"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: postoAdministrativoInstance, field: 'distrito', 'error')} required">
                <label for="distrito">
                    <g:message code="postoAdministrativo.distrito.label" default="Distrito"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: postoAdministrativoInstance, field: 'bairros', 'error')} ">
                
<ul>
<g:each in="${postoAdministrativoInstance?.bairros}" var="bairroInstance">
    <li><g:link controller="bairro" action="show" id="${bairroInstance.id}">${bairroInstance?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="bairro" params="['postoAdministrativo.id': postoAdministrativoInstance?.id]" action="create"><g:message code="bairro.new" default="New Bairro" /></g:link>


            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: postoAdministrativoInstance, field: 'distrito', 'error')} required">
                <g:select name="distrito.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Distrito.list()}" optionKey="id" value="${postoAdministrativoInstance?.distrito?.id}"  />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: postoAdministrativoInstance, field: 'localidades', 'error')} ">
                <label for="localidades">
                    <g:message code="postoAdministrativo.localidades.label" default="Localidades"/>
                    
                </label>
            </div>
        </td>
        
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: postoAdministrativoInstance, field: 'localidades', 'error')} ">
                
<ul>
<g:each in="${postoAdministrativoInstance?.localidades}" var="localidadeInstance">
    <li><g:link controller="localidade" action="show" id="${localidadeInstance.id}">${localidadeInstance?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="localidade" params="['postoAdministrativo.id': postoAdministrativoInstance?.id]" action="create"><g:message code="localidade.new" default="New Localidade" /></g:link>


            </div>
        </td>
        

    </tbody>
</table>