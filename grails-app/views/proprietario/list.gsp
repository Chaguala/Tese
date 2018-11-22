<%@ page import="org.chaguala.sigem.proprietario.Proprietario" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'proprietario.label', default: 'Requerente')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript',code: 'default.list.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="Requerente"/>
    </div>

    <div id="list-proprietario" class="content scaffold-list" role="main">

        <h3 id="titulo"><g:message code="default.list.label" args="[entityName]"/></h3>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="Requerente"
                               titleKey="fp.tag.filterPane.titleText"/>

        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id"
                                  title="${message(encodeAs: 'JavaScript',code: 'proprietario.id.label', default: 'Id')}"/>

                <g:sortableColumn property="numero"
                                  title="${message(encodeAs: 'JavaScript',code: 'proprietario.numero.label', default: 'Numero')}"/>

                <g:sortableColumn property="nome"
                                  title="${message(encodeAs: 'JavaScript',code: 'proprietario.name.label', default: 'Nome')}"/>

                <g:sortableColumn property="sexo"
                                  title="${message(encodeAs: 'JavaScript',code: 'proprietario.sexo.label', default: 'Sexo')}"/>

                <g:sortableColumn property="datanasc"
                                  title="${message(encodeAs: 'JavaScript',code: 'proprietario.datanasc.label', default: 'DataNasc')}"/>

                <g:sortableColumn property="identificacao"
                                  title="${message(encodeAs: 'JavaScript',code: 'proprietario.tipoidentificacao.label', default: 'Identificacao')}"/>

                <g:sortableColumn property="numero"
                                  title="${message(encodeAs: 'JavaScript',code: 'proprietario.identificacao.label', default: 'Numero')}"/>

                <g:sortableColumn property="endereco"
                                  title="${message(encodeAs: 'JavaScript',code: 'proprietario.endereco.label', default: 'Endereco')}"/>

                <g:sortableColumn property="contacto"
                                  title="${message(encodeAs: 'JavaScript',code: 'proprietario.contacto.label', default: 'Contacto')}"/>

                <g:sortableColumn property="email"
                                  title="${message(encodeAs: 'JavaScript',code: 'proprietario.email.label', default: 'Email')}"/>

                <th><g:message code="proprietario.bairro.label" default="Bairro"/></th>

                <th><g:message code="proprietario.provincia.label" default="Provincia"/></th>

                <th><g:message code="proprietario.pais.label" default="Pais"/></th>

            </tr>
            </thead>
            <tbody>
            <g:each in="${proprietarioInstanceList}" status="i" var="proprietarioInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${proprietarioInstance.id}">${fieldValue(bean: proprietarioInstance, field: "id")}</g:link></td>

                    <td><g:link action="show"
                                id="${proprietarioInstance.id}">${fieldValue(bean: proprietarioInstance, field: "numero")}</g:link></td>


                    <td><g:link action="show"
                                id="${proprietarioInstance.id}">${fieldValue(bean: proprietarioInstance, field: "nome")}</g:link></td>

                    <td><g:link action="show"
                                id="${proprietarioInstance.id}">${fieldValue(bean: proprietarioInstance, field: "sexo")}</g:link></td>


                    <td><g:link action="show"
                                id="${proprietarioInstance.id}">${fieldValue(bean: proprietarioInstance, field: "datanasc")}</g:link></td>

                    <td><g:link action="show"
                                id="${proprietarioInstance.id}">${fieldValue(bean: proprietarioInstance, field: "tipoidentificacao")}</g:link></td>

                    <td><g:link action="show"
                                id="${proprietarioInstance.id}">${fieldValue(bean: proprietarioInstance, field: "identificacao")}</g:link></td>


                    <td><g:link action="show"
                                id="${proprietarioInstance.id}">${fieldValue(bean: proprietarioInstance, field: "endereco")}</g:link></td>

                    <td><g:link action="show"
                                id="${proprietarioInstance.id}">${fieldValue(bean: proprietarioInstance, field: "contacto")}</g:link></td>

                    <td><g:link action="show"
                                id="${proprietarioInstance.id}">${fieldValue(bean: proprietarioInstance, field: "email")}</g:link></td>

                    <td><g:link action="show"
                                id="${proprietarioInstance.id}">${fieldValue(bean: proprietarioInstance, field: "bairro")}</g:link></td>

                    <td><g:link action="show"
                                id="${proprietarioInstance.id}">${fieldValue(bean: proprietarioInstance, field: "provincia")}</g:link></td>
                    <td><g:link action="show"
                                id="${proprietarioInstance.id}">${fieldValue(bean: proprietarioInstance, field: "pais")}</g:link></td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${proprietarioInstanceTotal}"/>
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
