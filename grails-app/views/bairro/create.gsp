
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Bairro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="bairro.create" default="Create Bairro" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="bairro.list" default="Listar" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <h4><g:message code="bairro.create" default="Crir novo bairro" /></h4>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${bairroInstance}">
            <div class="errors">
                <g:renderErrors bean="${bairroInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="designacao"><g:message code="bairro.designacao" default="Designacao" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bairroInstance, field: 'designacao', 'errors')}">
                                    <g:textField name="designacao" maxlength="200" value="${fieldValue(bean: bairroInstance, field: 'designacao')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="localidade"><g:message code="bairro.localidade" default="Localidade" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bairroInstance, field: 'localidade', 'errors')}">
                                    <g:select name="localidade.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Localidade.list()}" optionKey="id" value="${bairroInstance?.localidade?.id}" noSelection="['null': '']" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="postoAdministrativo"><g:message code="bairro.postoAdministrativo" default="Posto Administrativo" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bairroInstance, field: 'postoAdministrativo', 'errors')}">
                                    <g:select name="postoAdministrativo.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.PostoAdministrativo.list()}" optionKey="id" value="${bairroInstance?.postoAdministrativo?.id}" noSelection="['null': '']" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="distrito"><g:message code="bairro.distrito" default="Distrito" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bairroInstance, field: 'distrito', 'errors')}">
                                    <g:select name="distrito.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Distrito.list()}" optionKey="id" value="${bairroInstance?.distrito?.id}"  />

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'Criar', 'default': 'Criar')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
