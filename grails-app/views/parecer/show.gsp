
<%@ page import="org.chaguala.sigem.parecer.Parecer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="parecer.show" default="Show Parecer" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="parecer.list" default="Listar" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="listPedidos"><g:message code="parecer.new" default="Creiar novo parecer" /></g:link></span>
        </div>
        <div class="body">
            <h4><g:message code="parecer.show" default="Detalhes do Parecer" /></h4>

            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${parecerInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="parecer.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: parecerInstance, field: "id")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="parecer.nivel" default="Nivel" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="nivel" action="show" id="${parecerInstance?.nivel?.id}">${parecerInstance?.nivel?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="parecer.numero" default="Numero" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: parecerInstance, field: "numero")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="parecer.obs" default="Obs" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: parecerInstance, field: "obs")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="parecer.parecer" default="Parecer" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: parecerInstance, field: "parecer")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="parecer.pedido" default="Pedido" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="pedido" action="show" id="${parecerInstance?.pedido?.id}">${parecerInstance?.pedido?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                        </tbody>
                    </table>
                </div>

                <fieldset>
                    <legend title=""/>
                </fieldset>

                <div class="buttons">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'Editar', 'default': 'Editar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Apagar', 'default': 'Apagar')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
