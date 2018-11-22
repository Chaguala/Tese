<%@ page import="org.chaguala.sigem.requerente.Requerente" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="requerente.list" default="Requerente List" /></title>
</head>
<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="requerente.new" default="Criar" /></g:link></span>
</div>
<fieldset>
    <legend title=""/>
</fieldset>

<div class="body">
    <h4><g:message code="requerente.list" default="Lista requerente" /></h4>
    <fieldset>
        <legend title=""/>
    </fieldset>

    <g:if test="${flash.message}">
        <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>
                <g:sortableColumn property="id"
                                  title="${message(encodeAs: 'JavaScript',code: 'requerente.id.label', default: 'id')}"/>
                <g:sortableColumn property="nome"
                                  title="${message(encodeAs: 'JavaScript',code: 'requerente.name.label', default: 'Nome do Requerente')}"/>
                <g:sortableColumn property="sexo"
                                  title="${message(encodeAs: 'JavaScript',code: 'requerente.sexo.label', default: 'Sexo')}"/>
                <g:sortableColumn property="datanasc"
                                  title="${message(encodeAs: 'JavaScript',code: 'requerente.datanasc.label', default: 'DataNasc')}"/>
                <g:sortableColumn property="identificacao"
                                  title="${message(encodeAs: 'JavaScript',code: 'requerente.tipoidentificacao.label', default: 'Identificacao')}"/>
                <g:sortableColumn property="numero"
                                  title="${message(encodeAs: 'JavaScript',code: 'requerente.identificacao.label', default: 'Numero')}"/>
                <g:sortableColumn property="endereco"
                                  title="${message(encodeAs: 'JavaScript',code: 'requerente.endereco.label', default: 'Endereco')}"/>
                <g:sortableColumn property="contacto"
                                  title="${message(encodeAs: 'JavaScript',code: 'requerente.contacto.label', default: 'Contacto')}"/>
                <g:sortableColumn property="email"
                                  title="${message(encodeAs: 'JavaScript',code: 'requerente.email.label', default: 'Email')}"/>
                <th><g:message code="requerente.bairro.label" default="Bairro"/></th>
                <th><g:message code="requerente.provincia.label" default="Provincia"/></th>
            </tr>
            </thead>

            <tbody>
            <g:each in="${requerenteInstanceList}" status="i" var="requerenteInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td><g:link action="create"
                                id="${requerenteInstance.id}">${fieldValue(bean: requerenteInstance, field: "id")}</g:link></td>
                    <td><g:link action="create"
                                id="${requerenteInstance.id}">${fieldValue(bean: requerenteInstance, field: "nome")}</g:link></td>
                    <td><g:link action="create"
                                id="${requerenteInstance.id}">${fieldValue(bean: requerenteInstance, field: "sexo")}</g:link></td>
                    <td><g:link action="create"
                                id="${requerenteInstance.id}">${fieldValue(bean: requerenteInstance, field: "datanasc")}</g:link></td>
                    <td><g:link action="create"
                                id="${requerenteInstance.id}">${fieldValue(bean: requerenteInstance, field: "tipoidentificacao")}</g:link></td>
                    <td><g:link action="create"
                                id="${requerenteInstance.id}">${fieldValue(bean: requerenteInstance, field: "identificacao")}</g:link></td>
                    <td><g:link action="create"
                                id="${requerenteInstance.id}">${fieldValue(bean: requerenteInstance, field: "endereco")}</g:link></td>
                    <td><g:link action="create"
                                id="${requerenteInstance.id}">${fieldValue(bean: requerenteInstance, field: "contacto")}</g:link></td>
                    <td><g:link action="create"
                                id="${requerenteInstance.id}">${fieldValue(bean: requerenteInstance, field: "email")}</g:link></td>
                    <td><g:link action="create"
                                id="${requerenteInstance.id}">${fieldValue(bean: requerenteInstance, field: "bairro")}</g:link></td>
                    <td><g:link action="create"
                                id="${requerenteInstance.id}">${fieldValue(bean: requerenteInstance, field: "provincia")}</g:link></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${requerenteInstanceTotal}" />
    </div>
</div>
</body>
</html>
