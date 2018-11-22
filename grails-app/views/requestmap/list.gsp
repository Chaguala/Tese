<%@ page import="org.chaguala.sigem.seguranca.Requestmap" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'requestmap.label', default: 'Requestmap')}"/>
    <title><g:message code="Permissoes" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript', code: 'Permissoes', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="Requestmap"/>
    </div>

    <div id="titulo">
        <h4><g:message code="Listagem de Permissoes" args="[entityName]"/></h4>
    </div>

    <div id="list-requestmap" class="content scaffold-list" role="main">
        %{--<h1><g:message code="default.list.label" args="[entityName]"/></h1>--}%
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        %{--<div>--}%
            %{--<b>${message(encodeAs: 'JavaScript', code: 'listagem.label', default: 'Listagem')}</b>--}%
            %{--<hr class="thin"/>--}%
        %{--</div>--}%

        <filterpane:filterPane domain="Requestmap"
                               titleKey="fp.tag.filterPane.titleText"/>

        <table>
            <thead>
            <tr>
                
                <g:sortableColumn property="url"
                                  title="${message(encodeAs: 'JavaScript', code: 'requestmap.url.label', default: 'Url')}"/>
                
                <g:sortableColumn property="configAttribute"
                                  title="${message(encodeAs: 'JavaScript', code: 'requestmap.configAttribute.label', default: 'Config Attribute')}"/>
                
            </tr>
            </thead>
            <tbody>
            <g:each in="${requestmapInstanceList}" status="i" var="requestmapInstance">
                <tr class="${(i % 2) == 0 ? 'dbodd' : 'dbeven'}" onMouseOver="this.className = 'dbhover';" onMouseOut="this.className = '${(i % 2) == 0 ? 'dbodd' : 'dbeven'}';">
                    <td><g:link action="show"
                                id="${requestmapInstance.id}">${fieldValue(bean: requestmapInstance, field: "url")}</g:link></td>
                    
                    <td>${fieldValue(bean: requestmapInstance, field: "configAttribute")}</td>
                    
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${requestmapInstanceTotal}"/>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
