<%@ page import="org.chaguala.sigem.seguranca.Requestmap" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript', code: 'requestmap.label', default: 'Requestmap')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript', code: 'default.show.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="Requestmap"/>
    </div>
%{--<a href="#show-requestmap" class="skip" tabindex="-1"><g:message code="default.link.skip.label"--}%
%{--default="Skip to content&hellip;"/></a>--}%

%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>--}%
%{--<li><g:link class="create" action="create"><g:message code="default.new.label"--}%
%{--args="[entityName]"/></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%

    <div id="show-requestmap" class="content scaffold-show" role="main">
        <h1 align="center"><g:message code="default.show.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>


        <fieldset>
            <legend><g:message code="default.show.label" args="[entityName]"/></legend>

            <ol class="property-list requestmap">

                <g:if test="${requestmapInstance?.url}">
                    <li class="fieldcontain">
                        <span id="url-label" class="property-label"><g:message
                                code="requestmap.url.label" default="Url"/></span>

                        <span class="property-value" aria-labelledby="url-label"><g:fieldValue
                                bean="${requestmapInstance}"
                                field="url"/></span>

                    </li>
                </g:if>

                <g:if test="${requestmapInstance?.configAttribute}">
                    <li class="fieldcontain">
                        <span id="configAttribute-label" class="property-label"><g:message
                                code="requestmap.configAttribute.label" default="Config Attribute"/></span>

                        <span class="property-value" aria-labelledby="configAttribute-label"><g:fieldValue
                                bean="${requestmapInstance}"
                                field="configAttribute"/></span>

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
                                <g:form action="delete">
                                    <g:hiddenField name="id" value="${requestmapInstance?.id}"/>
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
