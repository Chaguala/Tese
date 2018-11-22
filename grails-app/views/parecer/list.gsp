
<%@ page import="org.chaguala.sigem.parecer.Parecer" %>

<!DOCTYPE html>
<html>
<head>
    %{--<meta name="layout" content="test">--}%

    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'parecer.label', default: 'Parecer')}"/>
    <title><g:message code="Parecer" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript',code: 'Parecer', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>

    <div class="nav">
        <nav:render group="Parecer"/>
    </div>


    <fieldset>
        <legend title=""/>
    </fieldset>

    <div id="list-parecer" class="content scaffold-list" role="main">

        <h4 id="titulo"><g:message code="Listagem de pareceres registados" args="[entityName]"/></h4>

        <fieldset>
            <legend title=""/>
        </fieldset>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="Parecer"
                               titleKey="fp.tag.filterPane.titleText"/>
        <table>
            <thead>
            <tr>
                <g:sortableColumn property="id"
                                  title="${message(encodeAs: 'JavaScript',code: 'parecer.id.label', default: 'Id')}"/>

                <g:sortableColumn property="pedido"
                                  title="${message(encodeAs: 'JavaScript',code: 'parecer.pedido.label', default: 'Pedido')}"/>

                <g:sortableColumn property="nivel"
                                  title="${message(encodeAs: 'JavaScript',code: 'parecer.nivel.label', default: 'Nivel')}"/>

                <g:sortableColumn property="parecer"
                                  title="${message(encodeAs: 'JavaScript',code: 'parecer.parecer.label', default: 'Parecer')}"/>

                <g:sortableColumn property="obs"
                                  title="${message(encodeAs: 'JavaScript',code: 'parecer.obs.label', default: 'Obs')}"/>
            </tr>
            </thead>
            <tbody>
            <g:each in="${parecerInstanceList}" status="i" var="parecerInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${parecerInstance.id}">${fieldValue(bean: parecerInstance, field: "id")}</g:link></td>

                    <td><g:link action="show"
                                id="${parecerInstance.id}">${fieldValue(bean: parecerInstance, field: "pedido")}</g:link></td>

                    <td><g:link action="show"
                                id="${parecerInstance.id}">${fieldValue(bean: parecerInstance, field: "nivel")}</g:link></td>

                    <td><g:link action="show"
                                id="${parecerInstance.id}">${fieldValue(bean: parecerInstance, field: "parecer")}</g:link></td>

                    <td><g:link action="show"
                                id="${parecerInstance.id}">${fieldValue(bean: parecerInstance, field: "obs")}</g:link></td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <fieldset>
            <legend title=""/>
        </fieldset>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${parecerInstanceTotal}"/>
                        <filterpane:filterButton textKey="fp.tag.filterButton.text"
                                                 appliedTextKey="fp.tag.filterButton.appliedText"
                                                 text="Filtro de Pesquisa" appliedText="Alterar Resultados de Pesquisa"/>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
