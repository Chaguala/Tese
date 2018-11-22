<%@ page import="org.chaguala.sigem.seguranca.SecRole; org.chaguala.sigem.seguranca.ClassificacaoEntidade; org.chaguala.sigem.seguranca.Requestmap" %>
<html>
<head>
    <meta name="layout" content="main"/>
<g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'permissoes.label', default: 'Permissões')}"/>
    <title>Criar Permissoes</title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
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
        <h4><g:message code="Criar novas permissoes" args="[entityName]"/></h4>
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
                                  optionKey="authority"  style="width:270px" onChange="submit();"
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

                    <td class="cell"><g:hiddenField name="entidade" value="${controllerClasses.nomeClasse}"/>
                        ${controllerClasses}</td>

                    <td class="cell" align="center">
                        %{--<label for="create"><g:message code="create.label" default="Criar"/></label>--}%
                        <g:checkBox style="width:20px" name="create" id="create" checked="${false}" value="${i}"/>

                    </td>

                    <td class="cell" align="center">
                        %{--<label for="edit"><g:message code="edit.label" default="Editar"/></label>--}%
                        <g:checkBox style="width:20px" name="edit" id="edit" checked="${false}" value="${i}"/>

                    </td>

                    <td class="cell" align="center">
                        %{--<label for="delete"><g:message code="delete.label" default="Remover"/></label>--}%
                        <g:checkBox style="width:20px" name="delete" id="delete" checked="${false}" value="${i}"/>
                    </td>

                    <td class="cell" align="center">
                        %{--<label for="list"><g:message code="listar.label" default="Listar"/></label>--}%
                        <g:checkBox style="width:20px" name="list" id="list" checked="${false}" value="${i}"/>

                    </td>

                </tr>

            </g:each>
            </tbody>

        </table>

        <br>

        <div align="center">
            <g:actionSubmit action="save" name="create" class="bt-order"
                            value="${message(encodeAs: 'JavaScript', code: 'Criar', default: 'Criar')}"/>
            &nbsp;&nbsp;
            <g:actionSubmit name="cancel" class="bt-order" action="show"
                            value="${message(encodeAs: 'JavaScript', code: 'Cancelar', default: 'Cancelar')}"/>
        </div>

        <div class="clear"></div>

    </g:form>

</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>

