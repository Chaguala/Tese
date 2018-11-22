
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Localidade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="localidade.create" default="Create Localidade" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="localidade.list" default="Listar" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

    <div class="body">
            <h4><g:message code="localidade.create" default="Criar novas localidades" /></h4>
        <fieldset>
            <legend title=""/>
        </fieldset>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${localidadeInstance}">
            <div class="errors">
                <g:renderErrors bean="${localidadeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigo"><g:message code="localidade.codigo" default="Codigo" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localidadeInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" placeholder="Codigo"
                                                 maxlength="20" value="${fieldValue(bean: localidadeInstance, field: 'codigo')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="designacao"><g:message code="localidade.designacao" default="Designacao" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localidadeInstance, field: 'designacao', 'errors')}">
                                    <g:textField name="designacao" size="40" placeholder="Designacao da Localidade"
                                                 maxlength="200" value="${fieldValue(bean: localidadeInstance, field: 'designacao')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="postoAdministrativo"><g:message code="localidade.postoAdministrativo" default="Posto Administrativo" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localidadeInstance, field: 'postoAdministrativo', 'errors')}">
                                    <g:select name="postoAdministrativo.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.PostoAdministrativo.list()}" optionKey="id" value="${localidadeInstance?.postoAdministrativo?.id}" noSelection="['null': '']" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="distrito"><g:message code="localidade.distrito" default="Distrito" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localidadeInstance, field: 'distrito', 'errors')}">
                                    <g:select name="distrito.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Distrito.list()}" optionKey="id" value="${localidadeInstance?.distrito?.id}"  />

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <fieldset>
                    <legend title=""/>
                </fieldset>

                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'Criar', 'default': 'Criar')}" /></span>
                </div>
                <fieldset>
                    <legend title=""/>
                </fieldset>

            </g:form>
        </div>
    </body>
</html>
