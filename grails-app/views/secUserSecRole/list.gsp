
<%@ page import="org.chaguala.sigem.seguranca.SecUserSecRole" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'secUserSecRole.label', default: 'SecUserSecRole')}"/>
    <title><g:message code="Previlegios" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript', code: 'Previlegios', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="SecUserSecRole"/>
    </div>
%{--<a href="#list-secUserSecRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label"--}%
%{--default="Skip to content&hellip;"/></a>--}%


%{--<div id="nav" class="nav" role="navigation">--}%
%{--<nav:render group="SecUserSecRole"/>--}%
%{--</div>--}%

    <div id="titulo">
        <h3><g:message code="Listagem de Previlegios" args="[entityName]"/></h3>
    </div>

    <div id="list-secUserSecRole" class="content scaffold-list" role="main">
        %{--<h1><g:message code="default.list.label" args="[entityName]"/></h1>--}%
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div>
            <b>${message(encodeAs: 'JavaScript', code: 'listagem.label', default: 'Listagem')}</b>
            <hr class="thin"/>
        </div>

        <filterpane:filterPane domain="SecUserSecRole"
                               titleKey="fp.tag.filterPane.titleText"/>

        <table>
            <thead>
            <tr>
                
                <th><g:message code="secUserSecRole.secRole.label" default="Sec Role"/></th>
                
                <th><g:message code="secUserSecRole.secUser.label" default="Sec User"/></th>
                
            </tr>
            </thead>
            <tbody>
            <g:each in="${secUserSecRoleInstanceList}" status="i" var="secUserSecRoleInstance">
                <tr class="${(i % 2) == 0 ? 'dbodd' : 'dbeven'}" onMouseOver="this.className = 'dbhover';" onMouseOut="this.className = '${(i % 2) == 0 ? 'dbodd' : 'dbeven'}';">
                    <td><g:link action="show"
                                id="${secUserSecRoleInstance.id}">${fieldValue(bean: secUserSecRoleInstance, field: "secRole")}</g:link></td>
                    
                    <td>${fieldValue(bean: secUserSecRoleInstance, field: "secUser")}</td>
                    
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${secUserSecRoleInstanceTotal}"/>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
