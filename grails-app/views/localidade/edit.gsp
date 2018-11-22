
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Localidade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="localidade.edit" default="Edit Localidade" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="localidade.list" default="istar" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="localidade.new" default="Criar Nova" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

    <div class="body">
            <h4><g:message code="localidade.edit" default="Actualizar dados" /></h4>
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
            <g:form method="post" >
                <g:hiddenField name="id" value="${localidadeInstance?.id}" />
                <g:hiddenField name="version" value="${localidadeInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigo"><g:message code="localidade.codigo" default="Codigo" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localidadeInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" maxlength="20" value="${fieldValue(bean: localidadeInstance, field: 'codigo')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="designacao"><g:message code="localidade.designacao" default="Designacao" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localidadeInstance, field: 'designacao', 'errors')}">
                                    <g:textField name="designacao" maxlength="200" value="${fieldValue(bean: localidadeInstance, field: 'designacao')}" />

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
                                    <label for="bairros"><g:message code="localidade.bairros" default="Bairros" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localidadeInstance, field: 'bairros', 'errors')}">
                                    
<ul>
<g:each in="${localidadeInstance?.bairros}" var="bairroInstance">
    <li><g:link controller="bairro" action="show" id="${bairroInstance.id}">${bairroInstance?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="bairro" params="['localidade.id': localidadeInstance?.id]" action="create"><g:message code="bairro.new" default="New Bairro" /></g:link>


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
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'Actualizar', 'default': 'Actualizar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Apagar', 'default': 'Apagar')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
                <fieldset>
                    <legend title=""/>
                </fieldset>

            </g:form>
        </div>
    </body>
</html>
