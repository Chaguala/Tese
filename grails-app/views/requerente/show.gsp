
<%@ page import="org.chaguala.sigem.requerente.Requerente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="requerente.show" default="Show Requerente" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="requerente.list" default="Listar" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="requerente.new" default="Criar novo" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

    <div class="body">
            <h4><g:message code="requerente.show" default="Detalhes" /></h4>
        <fieldset>
            <legend title=""/>
        </fieldset>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            %{--<fieldset>--}%
                %{--<legend title=""/>--}%
            %{--</fieldset>--}%

            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${requerenteInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "id")}</td>
                                
                            </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="requerente.nome" default="Nome" />:</td>

                            <td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "nome")}</td>

                        </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.sexo" default="Sexo" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "sexo")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.tipoidentificacao" default="Tipoidentificacao" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "tipoidentificacao")}</td>
                                
                            </tr>
                            

                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.bairro" default="Bairro" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="bairro" action="show" id="${requerenteInstance?.bairro?.id}">${requerenteInstance?.bairro?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.contacto" default="Contacto" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "contacto")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.datanasc" default="Datanasc" />:</td>
                                
                                <td valign="top" class="value"><g:formatDate date="${requerenteInstance?.datanasc}" /></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.email" default="Email" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "email")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.endereco" default="Endereco" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "endereco")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.identificacao" default="Identificacao" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: requerenteInstance, field: "identificacao")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.pais" default="Pais" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="pais" action="show" id="${requerenteInstance?.pais?.id}">${requerenteInstance?.pais?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="requerente.provincia" default="Provincia" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="provincia" action="show" id="${requerenteInstance?.provincia?.id}">${requerenteInstance?.provincia?.encodeAsHTML()}</g:link></td>
                                
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
