<%@ page import="org.chaguala.sigem.seguranca.SecUserSecRole" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserSecRoleInstance, field: 'secRole', 'error')} required">
                <label for="secRole">
                    <g:message code="secUserSecRole.secRole.label" default="Sec Role"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserSecRoleInstance, field: 'secUser', 'error')} required">
                <label for="secUser">
                    <g:message code="secUserSecRole.secUser.label" default="Sec User"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserSecRoleInstance, field: 'secRole', 'error')} required">
                <g:select id="secRole" name="secRole.id" from="${org.chaguala.sigem.seguranca.SecRole.list()}" optionKey="id" required="" value="${secUserSecRoleInstance?.secRole?.id}" class="many-to-one"/>
            </div>
        </td>
        
        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserSecRoleInstance, field: 'secUser', 'error')} required">
                <g:select id="secUser" name="secUser.id" from="${org.chaguala.sigem.seguranca.SecUser.list()}" optionKey="id" required="" value="${secUserSecRoleInstance?.secUser?.id}" class="many-to-one"/>
            </div>
        </td>
    </tr>
    

    </tbody>
</table>