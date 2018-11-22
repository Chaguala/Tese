<%@ page import="org.chaguala.sigem.seguranca.Entidades" %>


<table class="tabela">
    <tbody>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: entidadesInstance, field: 'designacao', 'error')} required">
                <label for="configAttribute"><g:message code="entidade.label"
                                                        default="Entidade"/></label>
            </div>
        </td>
        <td>
            <div class="fieldcontain ${hasErrors(bean: entidadesInstance, field: 'designacao', 'error')} required">
                <g:select id="configAttribute" name="configAttribute" from="${eliminaEntidade}"
                          class="fieldLength"
                          value="${params.configAttribute}"
                          noSelection="['null': 'Seleccione a Entidade']"/>
            </div>
        </td>
    </tr>

    </tbody>
</table>