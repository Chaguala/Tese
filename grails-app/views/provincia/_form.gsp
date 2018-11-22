<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Provincia" %>
<table class="tabela">
    <tbody>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: provinciaInstance, field: 'codigo', 'error')} ">
                <label for="codigo">
                    <g:message code="provincia.codigo.label" default="Codigo"/>

                </label>
            </div>
        </td>
    </tr>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: provinciaInstance, field: 'codigo', 'error')} ">
                <g:textField name="codigo" placeholder="codigo" maxlength="20" value="${provinciaInstance?.codigo}"/>
            </div>
        </td>
    </tr>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: provinciaInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="provincia.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>


    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: provinciaInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao"
                             size="50"
                             placeholder="Designacao da provincia" maxlength="200" required="" value="${provinciaInstance?.designacao}"/>
            </div>
        </td>
    </tr>

    <g:if test="${!session.paisInstance}">
        <tr>
            <td>
                <div class="fieldcontain ${hasErrors(bean: provinciaInstance, field: 'pais', 'error')} required">
                    <label for="pais">
                        <g:message code="provincia.pais.label" default="Pais"/>
                        <span class="required-indicator">*</span>
                    </label>
                </div>
            </td>
        </tr>


        <tr>

            <td>
                <div class="fieldcontain ${hasErrors(bean: provinciaInstance, field: 'pais', 'error')} required">
                    <g:select id="pais" name="pais.id"
                              from="${org.chaguala.sigem.distibuicaoAdministrativa.Pais.list()}" optionKey="id"
                              required="" value="${provinciaInstance?.pais?.id}" class="many-to-one"/>
                </div>
            </td>
        </tr>

    </g:if>
    </tbody>
</table>