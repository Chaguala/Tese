<%@ page import="org.chaguala.sigem.seguranca.SecRole; org.chaguala.sigem.seguranca.ClassificacaoEntidade; org.chaguala.sigem.seguranca.Requestmap" %>


<table class="tabela">
    <tbody>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: requestmapInstance, field: 'url', 'error')} required">
                <label for="configAttribute"><g:message code="grupo.label"
                                                        default="Grupo"/></label>
            </div>
        </td>

        <td>
            <div class="fieldcontain ${hasErrors(bean: requestmapInstance, field: 'configAttribute', 'error')} required">
                <label for="configAttribute"><g:message code="classificacao.label"
                                                        default="Classificação das Entidades"/></label>
            </div>
        </td>
    </tr>


    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: requestmapInstance, field: 'url', 'error')} required">
                <g:select id="configAttribute" name="configAttribute" from="${SecRole.list()}"
                          optionKey="authority" style="width:270px" onChange="submit();"
                          value="${params.configAttribute}"
                          noSelection="['null': 'Seleccione o Grupo']"/>
            </div>
        </td>

        <td>
            <div class="fieldcontain ${hasErrors(bean: requestmapInstance, field: 'configAttribute', 'error')} required">
                <g:select onChange="submit();" id="classificacaoId" name="classificacao"
                          from="${ClassificacaoEntidade.list()}"
                          optionKey="id" style="width:270px"
                          value="${params.classificacao}"
                          noSelection="['null': 'Seleccione a Classificação']"/>
            </div>
        </td>
    </tr>

    </tbody>
</table>


<table width="100%">
    <thead>
    <tr class="dbhead">

        <th><g:message code="controller.label" default="Endidade"/></th>
        <th><g:message code="create.label" default="Criar"/></th>
        <th><g:message code="edit.label" default="Editar"/></th>
        <th><g:message code="delete.label" default="Remover"/></th>
        <th><g:message code="listar.label" default="Listar"/></th>

    </tr>
    </thead>
    <tbody>
    <div id="entidade">

    </div>
    <g:each in="${session.entidadesList}" status="i" var="controllerClasses">
        <tr>

            <td class="cell">${controllerClasses}</td>

            <td class="cell" align="center">
                <label for="create"><g:message code="create.label" default="Criar"/></label>
                <g:checkBox style="width:20px" name="create" id="create" checked="${false}" value="create"/>

            </td>

            <td class="cell" align="center">
                <label for="edit"><g:message code="edit.label" default="Editar"/></label>
                <g:checkBox style="width:20px" name="edit" id="edit" checked="${false}" value="edit"/>

            </td>

            <td class="cell" align="center">
                <label for="delete"><g:message code="delete.label" default="Remover"/></label>
                <g:checkBox style="width:20px" name="delete" id="delete" checked="${false}" value="delete"/>
            </td>

            <td class="cell" align="center">
                <label for="list"><g:message code="listar.label" default="Listar"/></label>
                <g:checkBox style="width:20px" name="list" id="list" checked="${false}" value="list"/>

            </td>

        </tr>

    </g:each>
    </tbody>

</table>

<div class="paginateButtons">
    <g:paginate total="${entidadesList.size()}"/>
</div>