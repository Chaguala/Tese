<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Distrito" %>


<table class="tabela">
    <tbody>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: distritoInstance, field: 'codigo', 'error')} ">
                <label for="codigo">
                    <g:message code="distrito.codigo.label" default="Codigo"/>

                </label>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: distritoInstance, field: 'codigo', 'error')} ">
                <g:textField name="codigo" placeholder="Codigo" maxlength="20" value="${distritoInstance?.codigo}"/>
            </div>
        </td>

    </tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: distritoInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="distrito.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>

    <tr>

        <td>
            <div class="fieldcontain ${hasErrors(bean: distritoInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao"
                             size="50"
                             placeholder="Designacao do distrito"
                             maxlength="200" required="" value="${distritoInstance?.designacao}"/>
            </div>
        </td>
    </tr>

    <g:if test="${!session.provinciaInstance}">
        <tr>
            <td>
                <div class="fieldcontain ${hasErrors(bean: distritoInstance, field: 'provincia', 'error')} required">
                    <label for="provincia">
                        <g:message code="distrito.provincia.label" default="Provincia"/>
                        <span class="required-indicator">*</span>
                    </label>
                </div>
            </td>

        </tr>


        <tr>
            <td>
                <div class="fieldcontain ${hasErrors(bean: distritoInstance, field: 'provincia', 'error')} required">
                    <g:select id="provincia" name="provincia.id"
                              from="${org.chaguala.sigem.distibuicaoAdministrativa.Provincia.list()}"
                              optionKey="id" required="" value="${distritoInstance?.provincia?.id}"
                              class="many-to-one"/>
                </div>
            </td>
        </tr>
    </g:if>

    </tbody>
</table>