
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Localidade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="localidade.show" default="Show Localidade" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="localidade.list" default="Listar" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="localidade.new" default="Criar Nova" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>


    <div class="body">
            <h4><g:message code="localidade.show" default="Detalhes" /></h4>
        <fieldset>
            <legend title=""/>
        </fieldset>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${localidadeInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="localidade.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: localidadeInstance, field: "id")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="localidade.codigo" default="Codigo" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: localidadeInstance, field: "codigo")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="localidade.designacao" default="Designacao" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: localidadeInstance, field: "designacao")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="localidade.postoAdministrativo" default="Posto Administrativo" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="postoAdministrativo" action="show" id="${localidadeInstance?.postoAdministrativo?.id}">${localidadeInstance?.postoAdministrativo?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="localidade.bairros" default="Bairros" />:</td>
                                
                                <td  valign="top" style="text-align: left;" class="value">
                                    <ul>
                                    <g:each in="${localidadeInstance?.bairros}" var="bairroInstance">
                                        <li><g:link controller="bairro" action="show" id="${bairroInstance.id}">${bairroInstance.encodeAsHTML()}</g:link></li>
                                    </g:each>
                                    </ul>
                                </td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="localidade.distrito" default="Distrito" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="distrito" action="show" id="${localidadeInstance?.distrito?.id}">${localidadeInstance?.distrito?.encodeAsHTML()}</g:link></td>
                                
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
                <fieldset>
                    <legend title=""/>
                </fieldset>

            </g:form>
        </div>
    </body>
</html>
