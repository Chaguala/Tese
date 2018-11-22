
<%@ page import="org.chaguala.sigem.requerente.Requerente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="requerente.edit" default="Edit Requerente" /></title>
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
            <h4><g:message code="requerente.edit" default="Actualizar dados" /></h4>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${requerenteInstance}">
            <div class="errors">
                <g:renderErrors bean="${requerenteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${requerenteInstance?.id}" />
                <g:hiddenField name="version" value="${requerenteInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="nome"><g:message code="requerente.nome" default="Nome" />:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: requerenteInstance, field: 'nome', 'errors')}">
                                <g:textField name="nome"
                                             size="75" maxlength="200" value="${fieldValue(bean: requerenteInstance, field: 'nome')}" />

                            </td>
                        </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sexo"><g:message code="requerente.sexo" default="Sexo" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requerenteInstance, field: 'sexo', 'errors')}">
                                    <g:select name="sexo" from="${requerenteInstance.constraints.sexo.inList}" value="${requerenteInstance.sexo}" valueMessagePrefix="requerente.sexo"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipoidentificacao"><g:message code="requerente.tipoidentificacao" default="Tipoidentificacao" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requerenteInstance, field: 'tipoidentificacao', 'errors')}">
                                    <g:select name="tipoidentificacao" from="${requerenteInstance.constraints.tipoidentificacao.inList}" value="${requerenteInstance.tipoidentificacao}" valueMessagePrefix="requerente.tipoidentificacao"  />

                                </td>
                            </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="identificacao"><g:message code="requerente.identificacao" default="Identificacao" />:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: requerenteInstance, field: 'identificacao', 'errors')}">
                                <g:textField name="identificacao" value="${fieldValue(bean: requerenteInstance, field: 'identificacao')}" />

                            </td>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contacto"><g:message code="requerente.contacto" default="Contacto" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requerenteInstance, field: 'contacto', 'errors')}">
                                    <g:textField name="contacto" value="${fieldValue(bean: requerenteInstance, field: 'contacto')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="datanasc"><g:message code="requerente.datanasc" default="Datanasc" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requerenteInstance, field: 'datanasc', 'errors')}">
                                    <g:datePicker name="datanasc" value="${requerenteInstance?.datanasc}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="requerente.email" default="Email" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requerenteInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" size="75" value="${fieldValue(bean: requerenteInstance, field: 'email')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endereco"><g:message code="requerente.endereco" default="Endereco" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requerenteInstance, field: 'endereco', 'errors')}">
                                    <g:textField name="endereco" size="75" value="${fieldValue(bean: requerenteInstance, field: 'endereco')}" />

                                </td>
                            </tr>

                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="bairro"><g:message code="requerente.bairro" default="Bairro" />:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: requerenteInstance, field: 'bairro', 'errors')}">
                                <g:select name="bairro.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Bairro.list()}" optionKey="id" value="${requerenteInstance?.bairro?.id}"  />

                            </td>
                        </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="provincia"><g:message code="requerente.provincia" default="Provincia" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requerenteInstance, field: 'provincia', 'errors')}">
                                    <g:select name="provincia.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Provincia.list()}" optionKey="id" value="${requerenteInstance?.provincia?.id}"  />

                                </td>
                            </tr>


                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="pais"><g:message code="requerente.pais" default="Pais" />:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: requerenteInstance, field: 'pais', 'errors')}">
                                <g:select name="pais.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Pais.list()}" optionKey="id" value="${requerenteInstance?.pais?.id}"  />

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
            </g:form>
        </div>
    </body>
</html>
