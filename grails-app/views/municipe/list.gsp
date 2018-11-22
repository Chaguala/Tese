<%@ page import="org.chaguala.sigem.municipe.Municipe" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'municipe.label', default: 'Municipe')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript',code: 'default.list.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="Municipe"/>
    </div>

    <div id="list-municipe" class="content scaffold-list" role="main">

        <h3 id="titulo"><g:message code="default.list.label" args="[entityName]"/></h3>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="Municipe"
                               titleKey="fp.tag.filterPane.titleText"/>

        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id"
                                  title="${message(encodeAs: 'JavaScript',code: 'municipe.id.label', default: 'Id')}"/>

                <g:sortableColumn property="nome"
                                  title="${message(encodeAs: 'JavaScript',code: 'municipe.name.label', default: 'Nome')}"/>

                <g:sortableColumn property="sexo"
                                  title="${message(encodeAs: 'JavaScript',code: 'municipe.sexo.label', default: 'Sexo')}"/>

                <g:sortableColumn property="datanasc"
                                  title="${message(encodeAs: 'JavaScript',code: 'municipe.datanasc.label', default: 'DataNasc')}"/>

                <g:sortableColumn property="identificacao"
                                  title="${message(encodeAs: 'JavaScript',code: 'municipe.identificacao.label', default: 'Identificacao')}"/>

                <g:sortableColumn property="numero"
                                  title="${message(encodeAs: 'JavaScript',code: 'municipe.numero.label', default: 'Numero')}"/>

                <g:sortableColumn property="endereco"
                                  title="${message(encodeAs: 'JavaScript',code: 'municipe.endereco.label', default: 'Endereco')}"/>

                <g:sortableColumn property="contacto"
                                  title="${message(encodeAs: 'JavaScript',code: 'municipe.contacto.label', default: 'Contacto')}"/>

                <g:sortableColumn property="email"
                                  title="${message(encodeAs: 'JavaScript',code: 'municipe.email.label', default: 'Email')}"/>

                <th><g:message code="municipe.bairro.label" default="Bairro"/></th>

                <th><g:message code="municipe.provincia.label" default="Provincia"/></th>

                <th><g:message code="municipe.pais.label" default="Pais"/></th>

            </tr>
            </thead>
            <tbody>
            <g:each in="${municipeInstanceList}" status="i" var="municipeInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${municipeInstance.id}">${fieldValue(bean: municipeInstance, field: "id")}</g:link></td>

                    <td><g:link action="show"
                                id="${municipeInstance.id}">${fieldValue(bean: municipeInstance, field: "nome")}</g:link></td>

                    <td><g:link action="show"
                                id="${municipeInstance.id}">${fieldValue(bean: municipeInstance, field: "sexo")}</g:link></td>


                    <td><g:link action="show"
                                id="${municipeInstance.id}">${fieldValue(bean: municipeInstance, field: "datanasc")}</g:link></td>

                    <td><g:link action="show"
                                id="${municipeInstance.id}">${fieldValue(bean: municipeInstance, field: "identificacao")}</g:link></td>

                    <td><g:link action="show"
                                id="${municipeInstance.id}">${fieldValue(bean: municipeInstance, field: "numero")}</g:link></td>

                    <td><g:link action="show"
                                id="${municipeInstance.id}">${fieldValue(bean: municipeInstance, field: "endereco")}</g:link></td>

                    <td><g:link action="show"
                                id="${municipeInstance.id}">${fieldValue(bean: municipeInstance, field: "contacto")}</g:link></td>

                    <td><g:link action="show"
                                id="${municipeInstance.id}">${fieldValue(bean: municipeInstance, field: "email")}</g:link></td>

                    <td><g:link action="show"
                                id="${municipeInstance.id}">${fieldValue(bean: municipeInstance, field: "bairro")}</g:link></td>

                    <td><g:link action="show"
                                id="${municipeInstance.id}">${fieldValue(bean: municipeInstance, field: "provincia")}</g:link></td>
                    <td><g:link action="show"
                                id="${municipeInstance.id}">${fieldValue(bean: municipeInstance, field: "pais")}</g:link></td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${municipeInstanceTotal}"/>
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
