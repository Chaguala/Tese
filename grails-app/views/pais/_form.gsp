<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Pais" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'codigo', 'error')} ">
                <label for="codigo">
                    <g:message code="pais.codigo.label" default="Codigo"/>
                    
                </label>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'codigo', 'error')} ">
                <g:textField name="codigo" placeholder="Codigo" maxlength="20" value="${paisInstance?.codigo}"/>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'designacao', 'error')} required">
                <label for="designacao">
                    <g:message code="pais.designacao.label" default="Designacao"/>
                    <span class="required-indicator">*</span>
                </label>
            </div>
        </td>
    </tr>
    
    <tr>

        
        <td>
            <div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'designacao', 'error')} required">
                <g:textField name="designacao"
                             size="80"
                             placeholder="Nome do pais"
                             maxlength="200" required="" value="${paisInstance?.designacao}"/>
            </div>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'nacionalidade', 'error')} ">
                <label for="nacionalidade">
                    <g:message code="pais.nacionalidade.label" default="Nacionalidade"/>
                    
                </label>
            </div>
        </td>
        
    </tr>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'nacionalidade', 'error')} ">
                <g:textField name="nacionalidade"
                             placeholder="Nacionalidade"
                             maxlength="200" required="" value="${paisInstance?.nacionalidade}"/>
            </div>
        </td>
        
</tr>
    </tbody>
</table>