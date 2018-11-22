
<%@ page import="org.chaguala.sigem.actividade.Actividade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="actividade.create" default="Create Actividade" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="actividade.list" default="Listar actividade" /></g:link></span>
        </div>
        <div class="body">
            <h4><g:message code="actividade.create" default="Criar actividade" /></h4>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${actividadeInstance}">
            <div class="errors">
                <g:renderErrors bean="${actividadeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="designacao"><g:message code="actividade.designacao" default="Designacao" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actividadeInstance, field: 'designacao', 'errors')}">
                                    <g:textField placeholder="Designacao da actividade"
                                                 size="50" name="designacao" maxlength="200" value="${fieldValue(bean: actividadeInstance, field: 'designacao')}" />

                                </td>
                            </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="estado"><g:message code="actividade.estado" default="Estado" />:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: actividadeInstance, field: 'estado', 'errors')}">
                                <g:select name="estado" from="${actividadeInstance.constraints.estado.inList}" value="${actividadeInstance.estado}" valueMessagePrefix="actividade.estado"  />

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
