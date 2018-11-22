<%@ page import="org.chaguala.sigem.seguranca.SecRole" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: secRoleInstance, field: 'authority', 'error')} required">
                <label for="authority">
                    <g:message code="secRole.authority.label" default="Autoridade"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: secRoleInstance, field: 'authority', 'error')} required">
                <g:textField name="authority" size="60" placeholder="Autoridade" required="" value="${secRoleInstance?.authority}"/>
            </div>
        </td>
    </tr>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: secRoleInstance, field: 'description', 'error')} ">
                <label for="description">
                    <g:message code="secRole.description.label" default="Designacao"/>
                    
                </label>
            </div>
        </td>
    </tr>
    <tr>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: secRoleInstance, field: 'description', 'error')} ">
                <g:textField name="description" size="60" placeholder="Designacao" value="${secRoleInstance?.description}"/>
            </div>
        </td>
    </tr>
    

    </tbody>
</table>