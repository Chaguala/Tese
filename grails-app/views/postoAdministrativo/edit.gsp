
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.PostoAdministrativo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="postoAdministrativo.edit" default="Edit PostoAdministrativo" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="postoAdministrativo.list" default="Listar" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="postoAdministrativo.new" default="Criar" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <h4><g:message code="postoAdministrativo.edit" default="Actualizar dados" /></h4>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${postoAdministrativoInstance}">
            <div class="errors">
                <g:renderErrors bean="${postoAdministrativoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${postoAdministrativoInstance?.id}" />
                <g:hiddenField name="version" value="${postoAdministrativoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigo"><g:message code="postoAdministrativo.codigo" default="Codigo" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postoAdministrativoInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" placeholder="Codigo"
                                                 maxlength="20" value="${fieldValue(bean: postoAdministrativoInstance, field: 'codigo')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="designacao"><g:message code="postoAdministrativo.designacao" default="Designacao" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postoAdministrativoInstance, field: 'designacao', 'errors')}">
                                    <g:textField name="designacao" size="50"
                                                 placeholder="Designacao do posto" maxlength="200" value="${fieldValue(bean: postoAdministrativoInstance, field: 'designacao')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bairros"><g:message code="postoAdministrativo.bairros" default="Bairros" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postoAdministrativoInstance, field: 'bairros', 'errors')}">
                                    
<ul>
<g:each in="${postoAdministrativoInstance?.bairros}" var="bairroInstance">
    <li><g:link controller="bairro" action="show" id="${bairroInstance.id}">${bairroInstance?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="bairro" params="['postoAdministrativo.id': postoAdministrativoInstance?.id]" action="create"><g:message code="bairro.new" default="New Bairro" /></g:link>


                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="distrito"><g:message code="postoAdministrativo.distrito" default="Distrito" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postoAdministrativoInstance, field: 'distrito', 'errors')}">
                                    <g:select name="distrito.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Distrito.list()}" optionKey="id" value="${postoAdministrativoInstance?.distrito?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="localidades"><g:message code="postoAdministrativo.localidades" default="Localidades" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postoAdministrativoInstance, field: 'localidades', 'errors')}">
                                    
<ul>
<g:each in="${postoAdministrativoInstance?.localidades}" var="localidadeInstance">
    <li><g:link controller="localidade" action="show" id="${localidadeInstance.id}">${localidadeInstance?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="localidade" params="['postoAdministrativo.id': postoAdministrativoInstance?.id]" action="create"><g:message code="localidade.new" default="New Localidade" /></g:link>


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
