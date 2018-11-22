<%@ page import="org.chaguala.sigem.modelo.Modelo" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="modelo.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'marca', 'error')} required">
                <label for="marca">
                    <g:message code="modelo.marca.label" default="Marca"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao" maxlength="200" value="${fieldValue(bean: modeloInstance, field: 'designacao')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'marca', 'error')} required">
                <g:select name="marca.id" from="${org.chaguala.sigem.marca.Marca.list()}" optionKey="id" value="${modeloInstance?.marca?.id}"  />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'marcas', 'error')} ">
                <label for="marcas">
                    <g:message code="modelo.marcas.label" default="Marcas"/>
                    
                </label>
            </div>
        </td>
        
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'marcas', 'error')} ">
                <g:select name="marcas"
from="${org.chaguala.sigem.marca.Marca.list()}"
size="5" multiple="yes" optionKey="id"
value="${modeloInstance?.marcas}" />


            </div>
        </td>
        

    </tbody>
</table>