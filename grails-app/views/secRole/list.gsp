z
<%@ page import="org.chaguala.sigem.seguranca.SecRole" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'secRole.label', default: 'SecRole')}"/>
    <title><g:message code="Grupos" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript', code: 'Grupo', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="SecRole"/>
    </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

    <div id="titulo">
        <h4><g:message code="Listagem de Grupos" args="[entityName]"/></h4>
    </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

    <div id="list-secRole" class="content scaffold-list" role="main">
        %{--<h1><g:message code="default.list.label" args="[entityName]"/></h1>--}%
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        %{--<div>--}%
            %{--<b>${message(encodeAs: 'JavaScript', code: 'listagem.label', default: 'Listagem')}</b>--}%
            %{--<hr class="thin"/>--}%
        %{--</div>--}%

        <filterpane:filterPane domain="SecRole"
                               titleKey="fp.tag.filterPane.titleText"/>

        <table>
            <thead>
            <tr>
                
                <g:sortableColumn property="authority"
                                  title="${message(encodeAs: 'JavaScript', code: 'secRole.authority.label', default: 'Autoridade')}"/>
                
                <g:sortableColumn property="description"
                                  title="${message(encodeAs: 'JavaScript', code: 'secRole.description.label', default: 'Designacao')}"/>
                
            </tr>
            </thead>
            <tbody>
            <g:each in="${secRoleInstanceList}" status="i" var="secRoleInstance">
                <tr class="${(i % 2) == 0 ? 'dbodd' : 'dbeven'}" onMouseOver="this.className = 'dbhover';" onMouseOut="this.className = '${(i % 2) == 0 ? 'dbodd' : 'dbeven'}';">
                    <td><g:link action="show"
                                id="${secRoleInstance.id}">${fieldValue(bean: secRoleInstance, field: "authority")}</g:link></td>
                    
                    <td>${fieldValue(bean: secRoleInstance, field: "description")}</td>
                    
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${secRoleInstanceTotal}"/>
                    </td>
                </tr>
            </table>

        </div>
    </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
