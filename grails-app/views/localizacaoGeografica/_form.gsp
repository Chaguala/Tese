<%@ page import="org.chaguala.sigem.localizacaogeografica.LocalizacaoGeografica" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: localizacaoGeograficaInstance, field: 'obs', 'error')} ">
                <label for="obs">
                    <g:message code="localizacaoGeografica.obs.label" default="Obs"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: localizacaoGeograficaInstance, field: 'pedido', 'error')} required">
                <label for="pedido">
                    <g:message code="localizacaoGeografica.pedido.label" default="Pedido"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: localizacaoGeograficaInstance, field: 'obs', 'error')} ">
                <g:textField name="obs" value="${fieldValue(bean: localizacaoGeograficaInstance, field: 'obs')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: localizacaoGeograficaInstance, field: 'pedido', 'error')} required">
                <g:select name="pedido.id" from="${org.chaguala.sigem.pedido.Pedido.list()}" optionKey="id" value="${localizacaoGeograficaInstance?.pedido?.id}"  />

            </div>
        </td>
    </tr>
    

    </tbody>
</table>