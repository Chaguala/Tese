
<%@ page import="org.chaguala.sigem.auditoria.Auditoria" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'auditoria.label', default: 'Auditoria')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels>
    <richui:tabLabel selected="${tabContent1}" title="${message(encodeAs: 'JavaScript',code: 'default.show.label', args: [entityName])}"/>
    
</richui:tabLabels>

    <richui:tabContents>
        <richui:tabContent>
            <div class="nav">
                <nav:render group="Auditoria"/>
            </div>

            <div id="show-auditoria" class="content scaffold-show" role="main">

                <h3 id="titulo"><g:message code="default.show.label" args="[entityName]"/></h3>

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <fieldset>
                    <legend><g:message code="default.show.label" args="[entityName]"/></legend>

                    <table class="tabela">
                        <tbody>

                        

                        <g:if test="${auditoriaInstance?.actor}">
                            <tr>
                                <td>
                                    <span id="actor-label" class="property-label"><g:message
                                            code="auditoria.actor.label"
                                            default="Actor"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="actor-label"><g:fieldValue
                                            bean="${auditoriaInstance}"
                                            field="actor"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${auditoriaInstance?.uri}">
                            <tr>
                                <td>
                                    <span id="uri-label" class="property-label"><g:message
                                            code="auditoria.uri.label"
                                            default="Uri"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="uri-label"><g:fieldValue
                                            bean="${auditoriaInstance}"
                                            field="uri"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${auditoriaInstance?.className}">
                            <tr>
                                <td>
                                    <span id="className-label" class="property-label"><g:message
                                            code="auditoria.className.label"
                                            default="Class Name"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="className-label"><g:fieldValue
                                            bean="${auditoriaInstance}"
                                            field="className"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${auditoriaInstance?.persistedObjectId}">
                            <tr>
                                <td>
                                    <span id="persistedObjectId-label" class="property-label"><g:message
                                            code="auditoria.persistedObjectId.label"
                                            default="Persisted Object Id"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="persistedObjectId-label"><g:fieldValue
                                            bean="${auditoriaInstance}"
                                            field="persistedObjectId"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${auditoriaInstance?.persistedObjectVersion}">
                            <tr>
                                <td>
                                    <span id="persistedObjectVersion-label" class="property-label"><g:message
                                            code="auditoria.persistedObjectVersion.label"
                                            default="Persisted Object Version"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="persistedObjectVersion-label"><g:fieldValue
                                            bean="${auditoriaInstance}"
                                            field="persistedObjectVersion"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${auditoriaInstance?.eventName}">
                            <tr>
                                <td>
                                    <span id="eventName-label" class="property-label"><g:message
                                            code="auditoria.eventName.label"
                                            default="Event Name"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="eventName-label"><g:fieldValue
                                            bean="${auditoriaInstance}"
                                            field="eventName"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${auditoriaInstance?.propertyName}">
                            <tr>
                                <td>
                                    <span id="propertyName-label" class="property-label"><g:message
                                            code="auditoria.propertyName.label"
                                            default="Property Name"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="propertyName-label"><g:fieldValue
                                            bean="${auditoriaInstance}"
                                            field="propertyName"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${auditoriaInstance?.oldValue}">
                            <tr>
                                <td>
                                    <span id="oldValue-label" class="property-label"><g:message
                                            code="auditoria.oldValue.label"
                                            default="Old Value"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="oldValue-label"><g:fieldValue
                                            bean="${auditoriaInstance}"
                                            field="oldValue"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${auditoriaInstance?.newValue}">
                            <tr>
                                <td>
                                    <span id="newValue-label" class="property-label"><g:message
                                            code="auditoria.newValue.label"
                                            default="New Value"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="newValue-label"><g:fieldValue
                                            bean="${auditoriaInstance}"
                                            field="newValue"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${auditoriaInstance?.dateCreated}">
                            <tr>
                                <td>
                                    <span id="dateCreated-label" class="property-label"><g:message
                                            code="auditoria.dateCreated.label"
                                            default="Date Created"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                                            format="dd-MM-yyyy"
                                            date="${auditoriaInstance?.dateCreated}"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        

                        <g:if test="${auditoriaInstance?.lastUpdated}">
                            <tr>
                                <td>
                                    <span id="lastUpdated-label" class="property-label"><g:message
                                            code="auditoria.lastUpdated.label"
                                            default="Last Updated"/></span>
                                </td>
                                
                                <td>
                                    <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                                            format="dd-MM-yyyy"
                                            date="${auditoriaInstance?.lastUpdated}"/></span>
                                </td>
                                
                            </tr>
                        </g:if>
                        
                        </tbody>
                    </table>
                </fieldset>
                <g:form>
                    <fieldset>
                        <legend align="center">Opções do Detalhe</legend>

                        <div align="center">
                            <table class="tabela2">
                                <tr>
                                    <td>
                                        <g:form action="edit">
                                            <g:hiddenField name="id" value="${auditoriaInstance?.id}"/>
                                            <span class="button"><g:actionSubmit class="bt-order" action="edit"
                                                                                 value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
                                        </g:form>
                                    </td>
                                    <td>
                                        <g:form action="delete">
                                            <g:hiddenField name="id" value="${auditoriaInstance?.id}"/>
                                            <span class="button"><g:actionSubmit class="bt-order" action="delete"
                                                                                 value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                                                 onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
                                        </g:form>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </fieldset>
                </g:form>
            </div>
        </richui:tabContent>

        

    </richui:tabContents></richui:tabView></body>
</html>
