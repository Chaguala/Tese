<%@ page import="org.chaguala.sigem.taxaipa.TaxaIPA" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: taxaIPAInstance, field: 'deidadex', 'error')} required">
                <label for="deidadex">
                    <g:message code="taxaIPA.deidadex.label" default="Deidadex"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: taxaIPAInstance, field: 'aidadey', 'error')} required">
                <label for="aidadey">
                    <g:message code="taxaIPA.aidadey.label" default="Aidadey"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: taxaIPAInstance, field: 'deidadex', 'error')} required">
                <g:textField name="deidadex" value="${fieldValue(bean: taxaIPAInstance, field: 'deidadex')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: taxaIPAInstance, field: 'aidadey', 'error')} required">
                <g:textField name="aidadey" value="${fieldValue(bean: taxaIPAInstance, field: 'aidadey')}" />

            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: taxaIPAInstance, field: 'observacao', 'error')} ">
                <label for="observacao">
                    <g:message code="taxaIPA.observacao.label" default="Observacao"/>
                    
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: taxaIPAInstance, field: 'valor', 'error')} required">
                <label for="valor">
                    <g:message code="taxaIPA.valor.label" default="Valor"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: taxaIPAInstance, field: 'observacao', 'error')} ">
                <g:textField name="observacao" value="${fieldValue(bean: taxaIPAInstance, field: 'observacao')}" />

            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: taxaIPAInstance, field: 'valor', 'error')} required">
                <g:textField name="valor" value="${fieldValue(bean: taxaIPAInstance, field: 'valor')}" />

            </div>
        </td>
    </tr>
    

    </tbody>
</table>