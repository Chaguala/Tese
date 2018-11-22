
<%@ page import="org.chaguala.sigem.requerente.Requerente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="requerente.create" default="Create Requerente" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="requerente.list" default="Listar" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

    <div class="body">
            <h4><g:message code="requerente.create" default="Criar novo requerente" /></h4>
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
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'nome', 'error')} ">
                                    <label for="nome">
                                        <g:message code="requerente.nome.label" default="Nome do requerente"/>

                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'nome', 'error')} ">
                                    <g:textField name="nome"
                                                 size="75"
                                                 placeholder="Nome do requerente"
                                                 maxlength="200" value="${fieldValue(bean: requerenteInstance, field: 'nome')}" />

                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'sexo', 'error')} ">
                                    <label for="sexo">
                                        <g:message code="requerente.sexo.label" default="Sexo"/>

                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'sexo', 'error')} ">
                                    <g:select name="sexo" from="${requerenteInstance.constraints.sexo.inList}" value="${requerenteInstance.sexo}" valueMessagePrefix="requerente.sexo"  />

                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'datanasc', 'error')} required">
                                    <label for="datanasc">
                                        <g:message code="requerente.datanasc.label" default="Data de Nascimento"/>
                                        <span class="required-indicator">*</span>
                                    </label>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'datanasc', 'error')} required">
                                    <g:datePicker name="datanasc" formatString = "dd/MM/yyyy" value="${requerenteInstance?.datanasc}"  />
                                    %{--<g:formatDate format="yyyy-MM-dd" name="datanasc" value="${requerenteInstance?.datanasc}"  />--}%
                                    %{--<g:datePicker name="myDate" value="${new Date()}" noSelection="['':'-Choose-']"/>--}%
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'tipoidentificacao', 'error')} ">
                                    <label for="tipoidentificacao">
                                        <g:message code="requerente.tipoidentificacao.label" default="Tipo de Identificacao"/>

                                    </label>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'tipoidentificacao', 'error')} ">
                                    <g:select name="tipoidentificacao" from="${requerenteInstance.constraints.tipoidentificacao.inList}" value="${requerenteInstance.tipoidentificacao}" valueMessagePrefix="requerente.tipoidentificacao"  />

                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'identificacao', 'error')} ">
                                    <label for="identificacao">
                                        <g:message code="requerente.identificacao.label" default="Identificacao"/>

                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'identificacao', 'error')} ">
                                    <g:textField name="identificacao" placeholder="Numero de identificacao" value="${fieldValue(bean: requerenteInstance, field: 'identificacao')}" />

                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'contacto', 'error')} required">
                                    <label for="contacto">
                                        <g:message code="requerente.contacto.label" default="Contacto"/>
                                        <span class="required-indicator">*</span>
                                    </label>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'contacto', 'error')} required">
                                    <g:textField name="contacto" placeholder="Contacto" value="${fieldValue(bean: requerenteInstance, field: 'contacto')}" />

                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'endereco', 'error')} ">
                                    <label for="endereco">
                                        <g:message code="requerente.endereco.label" default="Endereco"/>

                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'endereco', 'error')} ">
                                    <g:textField name="endereco"
                                                 size="75"
                                                 placeholder="Endereco"
                                                 value="${fieldValue(bean: requerenteInstance, field: 'endereco')}" />

                                </div>
                            </td>
                        </tr>

                        <td>
                            <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'email', 'error')} ">
                                <label for="email">
                                    <g:message code="requerente.email.label" default="Email"/>

                                </label>
                            </div>
                        </td>
                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'email', 'error')} ">
                                    <g:textField name="email" size="75"
                                                 placeholder="Email" value="${fieldValue(bean: requerenteInstance, field: 'email')}" />

                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'bairro', 'error')} required">
                                    <label for="bairro">
                                        <g:message code="requerente.bairro.label" default="Bairro"/>
                                        <span class="required-indicator">*</span>
                                    </label>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'bairro', 'error')} required">
                                    <g:select name="bairro.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Bairro.list()}" optionKey="id" value="${requerenteInstance?.bairro?.id}"  />

                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'provincia', 'error')} required">
                                    <label for="provincia">
                                        <g:message code="requerente.provincia.label" default="Provincia"/>
                                        <span class="required-indicator">*</span>
                                    </label>
                                </div>
                            </td>

                        </tr>


                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'provincia', 'error')} required">
                                    <g:select name="provincia.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Provincia.list()}" optionKey="id" value="${requerenteInstance?.provincia?.id}"  />

                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'pais', 'error')} required">
                                    <label for="pais">
                                        <g:message code="requerente.pais.label" default="Pais"/>
                                        <span class="required-indicator">*</span>
                                    </label>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="fieldcontain ${hasErrors(bean: requerenteInstance, field: 'pais', 'error')} required">
                                    <g:select name="pais.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Pais.list()}" optionKey="id" value="${requerenteInstance?.pais?.id}"  />

                                </div>
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
            </g:form>
        </div>
    </body>
</html>
