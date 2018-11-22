<%@ page import="org.chaguala.sigem.despacho.Despacho" %>


<table class="tabela">
    <tbody>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: despachoInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="despacho.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: despachoInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao"
                             size="30"
                             placeholder="Designacao do tipo de despacho" maxlength="200" value="${fieldValue(bean: despachoInstance, field: 'designacao')}" />

            </div>
        </td>
    </tr>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: despachoInstance, field: 'estado', 'error')} ">
                <label for="estado">
                    <g:message code="despacho.estado.label" default="Estado"/>

                </label>
            </div>
        </td>
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: despachoInstance, field: 'estado', 'error')} ">
                <g:select name="estado" from="${despachoInstance.constraints.estado.inList}" value="${despachoInstance.estado}" valueMessagePrefix="despacho.estado"  />

            </div>
        </td>
    </tr>

    </tbody>
</table>