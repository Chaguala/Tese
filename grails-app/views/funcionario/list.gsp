
<%@ page import="org.chaguala.sigem.funcionaro.Funcionario" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'funcionaro.label', default: 'Funcionario')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript',code: 'default.list.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="Funcionario"/>
    </div>

    <div id="list-funcionaro" class="content scaffold-list" role="main">

        <h3 id="titulo"><g:message code="default.list.label" args="[entityName]"/></h3>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="Funcionario"
                               titleKey="fp.tag.filterPane.titleText"/>

        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id"
                                  title="${message(encodeAs: 'JavaScript',code: 'funcionaro.id.label', default: 'Id')}"/>

                <g:sortableColumn property="nome"
                                  title="${message(encodeAs: 'JavaScript',code: 'funcionaro.name.label', default: 'Nome')}"/>

                <g:sortableColumn property="sexo"
                                  title="${message(encodeAs: 'JavaScript',code: 'funcionaro.sexo.label', default: 'Sexo')}"/>

                <g:sortableColumn property="datanasc"
                                  title="${message(encodeAs: 'JavaScript',code: 'funcionaro.datanasc.label', default: 'DataNasc')}"/>

                <g:sortableColumn property="identificacao"
                                  title="${message(encodeAs: 'JavaScript',code: 'funcionaro.identificacao.label', default: 'Identificacao')}"/>

                <g:sortableColumn property="numero"
                                  title="${message(encodeAs: 'JavaScript',code: 'funcionaro.numero.label', default: 'Numero')}"/>

                <g:sortableColumn property="endereco"
                                  title="${message(encodeAs: 'JavaScript',code: 'funcionaro.endereco.label', default: 'Endereco')}"/>

                <g:sortableColumn property="contacto"
                                  title="${message(encodeAs: 'JavaScript',code: 'funcionaro.contacto.label', default: 'Contacto')}"/>

                <g:sortableColumn property="email"
                                  title="${message(encodeAs: 'JavaScript',code: 'funcionaro.email.label', default: 'Email')}"/>

                <th><g:message code="funcionaro.bairro.label" default="Bairro"/></th>

                <th><g:message code="funcionaro.provincia.label" default="Provincia"/></th>

                <th><g:message code="funcionaro.pais.label" default="Pais"/></th>

            </tr>
            </thead>
            <tbody>
            <g:each in="${funcionaroInstanceList}" status="i" var="funcionaroInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${funcionaroInstance.id}">${fieldValue(bean: funcionaroInstance, field: "id")}</g:link></td>

                    <td><g:link action="show"
                                id="${funcionaroInstance.id}">${fieldValue(bean: funcionaroInstance, field: "nome")}</g:link></td>

                    <td><g:link action="show"
                                id="${funcionaroInstance.id}">${fieldValue(bean: funcionaroInstance, field: "sexo")}</g:link></td>


                    <td><g:link action="show"
                                id="${funcionaroInstance.id}">${fieldValue(bean: funcionaroInstance, field: "datanasc")}</g:link></td>

                    <td><g:link action="show"
                                id="${funcionaroInstance.id}">${fieldValue(bean: funcionaroInstance, field: "identificacao")}</g:link></td>

                    <td><g:link action="show"
                                id="${funcionaroInstance.id}">${fieldValue(bean: funcionaroInstance, field: "numero")}</g:link></td>

                    <td><g:link action="show"
                                id="${funcionaroInstance.id}">${fieldValue(bean: funcionaroInstance, field: "endereco")}</g:link></td>

                    <td><g:link action="show"
                                id="${funcionaroInstance.id}">${fieldValue(bean: funcionaroInstance, field: "contacto")}</g:link></td>

                    <td><g:link action="show"
                                id="${funcionaroInstance.id}">${fieldValue(bean: funcionaroInstance, field: "email")}</g:link></td>

                    <td><g:link action="show"
                                id="${funcionaroInstance.id}">${fieldValue(bean: funcionaroInstance, field: "bairro")}</g:link></td>

                    <td><g:link action="show"
                                id="${funcionaroInstance.id}">${fieldValue(bean: funcionaroInstance, field: "provincia")}</g:link></td>
                    <td><g:link action="show"
                                id="${funcionaroInstance.id}">${fieldValue(bean: funcionaroInstance, field: "pais")}</g:link></td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${funcionaroInstanceTotal}"/>
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
