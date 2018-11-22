<%@ page import="org.chaguala.sigem.seguranca.ClassificacaoEntidade" %>


<table class="tabela">
    <tbody>
    
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: classificacaoEntidadeInstance, field: 'designacao', 'error')} ">
                <label for="designacao">
                    <g:message code="classificacaoEntidade.designacao.label" default="Designacao"/>
                    
                </label>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: classificacaoEntidadeInstance, field: 'designacao', 'error')} ">
                <g:textField name="designacao" size="100" value="${classificacaoEntidadeInstance?.designacao}"/>
            </div>
        </td>
    </tr>

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: classificacaoEntidadeInstance, field: 'descricao', 'error')} ">
                <label for="descricao">
                    <g:message code="classificacaoEntidade.descricao.label" default="Descricao"/>
                    
                </label>
            </div>
        </td>
    </tr>
    

    <tr>
        <td>
            <div class="fieldcontain ${hasErrors(bean: classificacaoEntidadeInstance, field: 'descricao', 'error')} ">
                <g:textField name="descricao" size="100" value="${classificacaoEntidadeInstance?.descricao}"/>
            </div>
        </td>
    </tr>
    

    </tbody>
</table>