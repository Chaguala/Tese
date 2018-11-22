<%@ page import="org.chaguala.sigem.despachopresidente.DespachoPresidente" %>


<table class="tabela">
    <tbody>
    <div class="fieldcontain ${hasErrors(bean: despachopresidenteInstance, field: 'numero', 'error')} ">
        <label for="numero">
            <g:message code="despachoPresidente.numero.label" default="DespachoPresidente" />

        </label>
        <richui:autoComplete name="numero" action="${createLinkTo('dir': 'DespachoPresidente/searchAJAX')}" value="${despachoPresidente?.numero}" />
    </div>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: despachoPresidenteInstance, field: 'numero', 'error')} required">
                <label for="numero">
                    <g:message code="despachoPresidente.numero.label" default="Numero"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: despachoPresidenteInstance, field: 'numero', 'error')} required">
                <g:textField name="numero" value="${fieldValue(bean: despachoPresidenteInstance, field: 'numero')}" />

            </div>
        </td>
    </tr>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: despachoPresidenteInstance, field: 'despacho', 'error')} required">
                <label for="despacho">
                    <g:message code="despachoPresidente.despacho.label" default="Despacho"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>


    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: despachoPresidenteInstance, field: 'despacho', 'error')} required">
                <g:select name="despacho.id" from="${org.chaguala.sigem.despacho.Despacho.list()}" optionKey="id" value="${despachoPresidenteInstance?.despacho?.id}"  />

            </div>
        </td>
    </tr>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: despachoPresidenteInstance, field: 'obs', 'error')} ">
                <label for="obs">
                    <g:message code="despachoPresidente.obs.label" default="Obs"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: despachoPresidenteInstance, field: 'obs', 'error')} ">
                <g:textField name="obs" value="${fieldValue(bean: despachoPresidenteInstance, field: 'obs')}" />

            </div>
        </td>
    </tr>
    </tbody>
</table>