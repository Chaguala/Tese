<%@ page import="org.chaguala.sigem.parecer.Parecer" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: parecerInstance, field: 'nivel', 'error')} required">
                <label for="nivel">
                    <g:message code="parecer.nivel.label" default="Nivel"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: parecerInstance, field: 'numero', 'error')} required">
                <label for="numero">
                    <g:message code="parecer.numero.label" default="Numero"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: parecerInstance, field: 'nivel', 'error')} required">
                <g:select name="nivel.id" from="${org.chaguala.sigem.nivel.Nivel.list()}" optionKey="id" value="${parecerInstance?.nivel?.id}"  />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: parecerInstance, field: 'numero', 'error')} required">
                <g:textField name="numero" value="${fieldValue(bean: parecerInstance, field: 'numero')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: parecerInstance, field: 'obs', 'error')} ">
                <label for="obs">
                    <g:message code="parecer.obs.label" default="Obs"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: parecerInstance, field: 'parecer', 'error')} ">
                <label for="parecer">
                    <g:message code="parecer.parecer.label" default="Parecer"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: parecerInstance, field: 'obs', 'error')} ">
                <g:textField name="obs" size="80" value="${fieldValue(bean: parecerInstance, field: 'obs')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: parecerInstance, field: 'parecer', 'error')} ">
                <g:textField name="parecer" value="${fieldValue(bean: parecerInstance, field: 'parecer')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: parecerInstance, field: 'pedido', 'error')} required">
                <label for="pedido">
                    <g:message code="parecer.pedido.label" default="Pedido"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: parecerInstance, field: 'pedido', 'error')} required">
                <g:select name="pedido.id" from="${org.chaguala.sigem.pedido.Pedido.list()}" optionKey="id" value="${parecerInstance?.pedido?.id}"  />

            </div>
        </td>
        

    </tbody>
</table>