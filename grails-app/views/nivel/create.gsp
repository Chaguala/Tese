
<%@ page import="org.chaguala.sigem.nivel.Nivel" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="nivel.create" default="Create Nivel" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="nivel.list" default="Listar" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <h4><g:message code="nivel.create" default="Criar novo nivel" /></h4>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${nivelInstance}">
            <div class="errors">
                <g:renderErrors bean="${nivelInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nivel"><g:message code="nivel.nivel" default="Nivel" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nivelInstance, field: 'nivel', 'errors')}">
                                    <g:textField name="nivel" maxlength="200" value="${fieldValue(bean: nivelInstance, field: 'nivel')}" />

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
