
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Bairro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="bairro.show" default="Show Bairro" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="bairro.list" default="Listar" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="bairro.new" default="Criar Novo" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <h4><g:message code="bairro.show" default="Detalhes" /></h4>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${bairroInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="bairro.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: bairroInstance, field: "id")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="bairro.designacao" default="Designacao" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: bairroInstance, field: "designacao")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="bairro.localidade" default="Localidade" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="localidade" action="show" id="${bairroInstance?.localidade?.id}">${bairroInstance?.localidade?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="bairro.postoAdministrativo" default="Posto Administrativo" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="postoAdministrativo" action="show" id="${bairroInstance?.postoAdministrativo?.id}">${bairroInstance?.postoAdministrativo?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="bairro.distrito" default="Distrito" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="distrito" action="show" id="${bairroInstance?.distrito?.id}">${bairroInstance?.distrito?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
                <fieldset>
                    <legend title=""/>
                </fieldset>

                <div class="buttons">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'Editar', 'default': 'Editar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Apagar', 'default': 'Apagar')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Tem certeza de que pretende apagar esse registo?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
