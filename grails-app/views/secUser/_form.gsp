<%@ page import="org.chaguala.sigem.seguranca.SecUser" %>


<table class="tabela">
    <tbody>


    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'username', 'error')} required">
                <label for="username">
                    <g:message code="secUser.username.label" default="Nome do utilizador"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>

        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'password', 'error')} required">
                <label for="password">
                    <g:message code="secUser.password.label" default="Senha do utilizador"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>


    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'username', 'error')} required">
                <g:textField name="username" size="50" required="" value="${secUserInstance?.username}"/>
            </div>
        </td>

        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'password', 'error')} required">
                <g:passwordField name="password" size="50" required="" value="${secUserInstance?.password}"/>
            </div>
        </td>
    </tr>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountExpired', 'error')} ">
                <label for="accountExpired">
                    <g:message code="secUser.accountExpired.label" default="Conta Expira"/>

                </label>
            </div>
        </td>

        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountLocked', 'error')} ">
                <label for="accountLocked">
                    <g:message code="secUser.accountLocked.label" default="Bloqueio da conta"/>

                </label>
            </div>
        </td>
    </tr>


    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountExpired', 'error')} ">
                <g:checkBox name="accountExpired" value="${secUserInstance?.accountExpired}"/>
            </div>
        </td>

        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountLocked', 'error')} ">
                <g:checkBox name="accountLocked" value="${secUserInstance?.accountLocked}"/>
            </div>
        </td>
    </tr>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'enabled', 'error')} ">
                <label for="enabled">
                    <g:message code="secUser.enabled.label" default="Activada"/>

                </label>
            </div>
        </td>

        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'passwordExpired', 'error')} ">
                <label for="passwordExpired">
                    <g:message code="secUser.passwordExpired.label" default="Expiracao da senha"/>

                </label>
            </div>
        </td>
    </tr>


    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'enabled', 'error')} ">
                <g:checkBox name="enabled" value="${secUserInstance?.enabled}"/>
            </div>
        </td>

        <td>
            <div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'passwordExpired', 'error')} ">
                <g:checkBox name="passwordExpired" value="${secUserInstance?.passwordExpired}"/>
            </div>
        </td>
    </tr>

    </tbody>
</table>

<table class="tabela">
    <tbody>

    <fieldset>
        <legend align="left"><h4 align="left">Atribuir Grupo:</h4></legend>
        <g:each in="${authorityList}">
            <tr>
                <td>
                    <label for="${it.authority}">${it.authority.encodeAsHTML()}</label>
                </td><td>
                <g:checkBox name="${it.authority}"/>

            </td>
            </tr>
        </g:each>
    </fieldset>
    </tbody>
</table>
