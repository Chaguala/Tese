
<%@ page import="org.chaguala.sigem.seguranca.SecUserSecRole" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'secUserSecRole.label', default: 'SecUserSecRole')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript', code: 'default.show.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="SecUserSecRole"/>
    </div>
%{--<a href="#show-secUserSecRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label"--}%
%{--default="Skip to content&hellip;"/></a>--}%

%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>--}%
%{--<li><g:link class="create" action="create"><g:message code="default.new.label"--}%
%{--args="[entityName]"/></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%

    <div id="show-secUserSecRole" class="content scaffold-show" role="main">
        <h1 align="center"><g:message code="default.show.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>


        <fieldset>
            <legend><g:message code="default.show.label" args="[entityName]"/></legend>

            <ol class="property-list secUserSecRole">
                
                <g:if test="${secUserSecRoleInstance?.secRole}">
                    <li class="fieldcontain">
                        <span id="secRole-label" class="property-label"><g:message
                                code="secUserSecRole.secRole.label" default="Sec Role"/></span>
                        
                        <span class="property-value" aria-labelledby="secRole-label"><g:link
                                controller="secRole" action="show"
                                id="${secUserSecRoleInstance?.secRole?.id}">${secUserSecRoleInstance?.secRole?.encodeAsHTML()}</g:link></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${secUserSecRoleInstance?.secUser}">
                    <li class="fieldcontain">
                        <span id="secUser-label" class="property-label"><g:message
                                code="secUserSecRole.secUser.label" default="Sec User"/></span>
                        
                        <span class="property-value" aria-labelledby="secUser-label"><g:link
                                controller="secUser" action="show"
                                id="${secUserSecRoleInstance?.secUser?.id}">${secUserSecRoleInstance?.secUser?.encodeAsHTML()}</g:link></span>
                        
                    </li>
                </g:if>
                
            </ol>
        </fieldset>
        <g:form>
            <fieldset>
                <legend align="center">Opções do Detalhe</legend>

                <div align="center">
                    <table width="800px" class="tabela2">
                        <tr>
                            <td>
                                <g:form action="edit">
                                    <g:hiddenField name="id" value="${secUserSecRoleInstance?.id}"/>
                                    <span class="button"><g:actionSubmit class="bt-order" action="edit"
                                                                         value="${message(encodeAs: 'JavaScript', code: 'default.button.edit.label', default: 'Edit')}"/></span>
                                </g:form>
                            </td>
                            <td>
                                <g:form action="delete">
                                    <g:hiddenField name="id" value="${secUserSecRoleInstance?.id}"/>
                                    <span class="button"><g:actionSubmit class="bt-order" action="delete"
                                                                         value="${message(encodeAs: 'JavaScript', code: 'default.button.delete.label', default: 'Delete')}"
                                                                         onclick="return confirm('${message(encodeAs: 'JavaScript', code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
                                </g:form>
                            </td>
                        </tr>
                    </table>
                </div>
            </fieldset>
        </g:form>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
