<%@ page import="org.chaguala.sigem.seguranca.SecRole; org.chaguala.sigem.seguranca.ClassificacaoEntidade; org.chaguala.sigem.seguranca.Requestmap" %>
<html>
<head>
    <meta name="layout" content="main"/>
<g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'permissoes.label', default: 'Permissões')}"/>
    <title>Criar Permissoes</title>
</head>

<body><richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                      title="${message(encodeAs: 'JavaScript', code: 'default.create.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>

<g:javascript>
    function verificarEntidades(){
        $('#entidade').load('${createLink(controller: 'requestmap', action: 'verificaEntidades')}'+"?classificacao="+document.getElementById("classificacaoId").value);
        $('#entidade').html('<img src="../images/ajax-loader.gif"/>');
      }
</g:javascript>

<div class="nav">
    <nav:render group="Requestmap"/>
</div>


<div id="messages">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${requestmap}">
        <div class="errors">
            <g:renderErrors bean="${requestmap}" as="list"/>
        </div>
    </g:hasErrors>
</div>


<div id="titulo">
    <h3><g:message code="default.create.label" args="[entityName]"/></h3>
</div>


<g:form action="verificaEntidades" method="post">
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
        <g:each in="${entidadesList}" status="i" var="controllerClasses">
            <tr>
                <g:if test="${i == 0}">
                    <td class="cell"><g:hiddenField name="entidade"
                                                    value="${controllerClasses.nomeClasse}"/>
                        ${controllerClasses.designacao}</td>

                    <td class="cell" align="center">
                        <g:if test="${createList[i] == i}"><g:checkBox name="create" id="create"
                                                                       style="width:20px"
                                                                       checked="${true}"
                                                                       value="${-2}"/></g:if>
                        <g:else><g:checkBox name="create" id="create" checked="${false}"
                                            style="width:20px"
                                            value="${i}"/></g:else>
                    </td>

                    <td class="cell" align="center">
                        <g:if test="${editList[i] == i}"><g:checkBox name="edit" id="edit"
                                                                     checked="${true}"
                                                                     style="width:20px"
                                                                     value="${-2}"/></g:if>
                        <g:else><g:checkBox style="width:20px" name="edit" id="edit"
                                            checked="${false}"
                                            value="${i}"/></g:else>

                    </td>

                    <td class="cell" align="center">
                        <g:if test="${removeList[i] == i}"><g:checkBox name="delete" id="delete"
                                                                       style="width:20px"
                                                                       checked="${true}"
                                                                       value="${-2}"/></g:if>
                        <g:else><g:checkBox name="delete" id="delete" checked="${false}"
                                            style="width:20px"
                                            value="${i}"/></g:else>
                    </td>

                    <td class="cell" align="center">
                        <g:if test="${listaList[i] == i}"><g:checkBox name="list" id="list"
                                                                      style="width:20px"
                                                                      checked="${true}"
                                                                      value="${-2}"/></g:if>
                        <g:else><g:checkBox style="width:20px" name="list" id="list"
                                            checked="${false}"
                                            value="${i}"/></g:else>

                    </td>
                </g:if>
                <g:else>
                    <td class="cell"><g:hiddenField name="entidade"
                                                    value="${controllerClasses.nomeClasse}"/>
                        ${controllerClasses.designacao}</td>

                    <td class="cell" align="center">
                        <g:if test="${createList[i] == i}"><g:checkBox name="create" id="create"
                                                                       style="width:20px"
                                                                       checked="${true}"
                                                                       value="${i}"/></g:if>
                        <g:else><g:checkBox style="width:20px" name="create" id="create"
                                            checked="${false}"
                                            value="${i}"/></g:else>
                    </td>

                    <td class="cell" align="center">
                        <g:if test="${editList[i] == i}"><g:checkBox style="width:20px" name="edit"
                                                                     id="edit" checked="${true}"
                                                                     value="${i}"/></g:if>
                        <g:else><g:checkBox style="width:20px" name="edit" id="edit"
                                            checked="${false}"
                                            value="${i}"/></g:else>

                    </td>

                    <td class="cell" align="center">
                        <g:if test="${removeList[i] == i}"><g:checkBox style="width:20px"
                                                                       name="delete"
                                                                       id="delete"
                                                                       checked="${true}"
                                                                       value="${i}"/></g:if>
                        <g:else><g:checkBox style="width:20px" name="delete" id="delete"
                                            checked="${false}"
                                            value="${i}"/></g:else>
                    </td>

                    <td class="cell" align="center">
                        <g:if test="${listaList[i] == i}"><g:checkBox style="width:20px" name="list"
                                                                      id="list"
                                                                      checked="${true}"
                                                                      value="${i}"/></g:if>
                        <g:else><g:checkBox style="width:20px" name="list" id="list"
                                            checked="${false}"
                                            value="${i}"/></g:else>

                    </td>
                </g:else>
            </tr>

        </g:each>
        </tbody>

    </table>

    <br>

    <fieldset>
        <legend align="center">Opções do Registo</legend>

        <div align="center">
            <g:actionSubmit action="actualiza" name="create" class="bt-order"
                            value="${message(encodeAs: 'JavaScript', code: 'Criar', default: 'Criar')}"/>
            &nbsp;&nbsp;
            <g:actionSubmit name="cancel" class="bt-order" action="show"
                            value="${message(encodeAs: 'JavaScript', code: 'Cancelar', default: 'Cancelar')}"/>
        </div>
    </fieldset>

    <div class="clear"></div>

</g:form>

</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>