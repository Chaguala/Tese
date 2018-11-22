<%=packageName%>
<% import grails.persistence.Event %>

<table class="tabela">
    <tbody>
    <% excludedProps = Event.allEvents.toList() << 'version' << 'dateCreated' << 'lastUpdated'
    persistentPropNames = domainClass.persistentProperties*.name
    boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate')
    if (hasHibernate && org.codehaus.groovy.grails.orm.hibernate.cfg.GrailsDomainBinder.getMapping(domainClass)?.identity?.generator == 'assigned') {
        persistentPropNames << domainClass.identifier.name
    }
    props = domainClass.properties.findAll { persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) }
    Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))

    int contaMod = 1
    int ordenaPosicao = 1
    ArrayList listaEntredas = new ArrayList()
    for (p in props) {
        if (p.embedded) {
            def embeddedPropNames = p.component.persistentProperties*.name
            def embeddedProps = p.component.properties.findAll { embeddedPropNames.contains(it.name) && !excludedProps.contains(it.name) }
            Collections.sort(embeddedProps, comparator.constructors[0].newInstance([p.component] as Object[]))
    %>
    <fieldset class="embedded">
        <legend><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></legend>
        <%
                for (ep in p.component.properties) {
                    renderFieldForProperty(ep, p.component, "${p.name}.", contaMod, props.size())
                }
        %></fieldset><%
            } else {
                renderFieldForProperty(p, domainClass, "", contaMod, props.size())
                listaEntredas.add(p)
                if (listaEntredas.size() == 2) {
                    int countModa = 1
                    int tamanho = listaEntredas.size()
                    for (i in listaEntredas) {
                        renderFieldForProperty_aux(i, domainClass, "", countModa, tamanho)
                        countModa = countModa + 1
                    }
                    listaEntredas = new ArrayList()
                }
                if ( p == props[props.size() - 1] && props.size() % 2 != 0)
                    renderFieldForProperty_aux(p, domainClass, "", 1, 1)
            }
            contaMod = contaMod + 1
        }

        private renderFieldForProperty(p, owningClass, prefix = "", int contaMod, int totalpop) {
            boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate')
            boolean display = true
            boolean required = false

            if (hasHibernate) {
                cp = owningClass.constrainedProperties[p.name]
                display = (cp ? cp.display : true)
                required = (cp ? !(cp.propertyType in [boolean, Boolean]) && !cp.nullable && (cp.propertyType != String || !cp.blank) : false)
            }
            if (display) {
                if (contaMod % 2 != 0) {
    %>
    <tr>
        <td>
            <div class="fieldcontain \${hasErrors(bean: ${propertyName}, field: '${prefix}${p.name}', 'error')} ${required ? 'required' : ''}">
                <label for="${prefix}${p.name}">
                    <g:message code="${domainClass.propertyName}.${prefix}${p.name}.label" default="${p.naturalName}"/>
                    <% if (required) { %><span class="required-indicator">*</span><% } %>
                </label>
            </div>
        </td>
        <% } else {

        %>
        <td>
            <div class="fieldcontain \${hasErrors(bean: ${propertyName}, field: '${prefix}${p.name}', 'error')} ${required ? 'required' : ''}">
                <label for="${prefix}${p.name}">
                    <g:message code="${domainClass.propertyName}.${prefix}${p.name}.label" default="${p.naturalName}"/>
                    <% if (required) { %><span class="required-indicator">*</span><% } %>
                </label>
            </div>
        </td>
    </tr>
    <% }

        if (totalpop % 2 != 0 && contaMod == totalpop) {
    %>
    </tr>
    <% }

    }

    }

    private renderFieldForProperty_aux(p, owningClass, prefix = "", int contaMod, int totalpop) {
        boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate')
        boolean display = true
        boolean required = false

        if (hasHibernate) {
            cp = owningClass.constrainedProperties[p.name]
            display = (cp ? cp.display : true)
            required = (cp ? !(cp.propertyType in [boolean, Boolean]) && !cp.nullable && (cp.propertyType != String || !cp.blank) : false)
        }
        if (display) {
            if (contaMod % 2 != 0) {
    %>

    <tr>
        <td>
            <div class="fieldcontain \${hasErrors(bean: ${propertyName}, field: '${prefix}${p.name}', 'error')} ${required ? 'required' : ''}">
                ${renderEditor(p)}
            </div>
        </td>
        <% } else {

        %>
        <td>
            <div class="fieldcontain \${hasErrors(bean: ${propertyName}, field: '${prefix}${p.name}', 'error')} ${required ? 'required' : ''}">
                ${renderEditor(p)}
            </div>
        </td>
    </tr>
    <%
            if (totalpop % 2 != 0 && contaMod == totalpop) {
    %>
    </tr>
    <% }

    }
    }
    }
    %>

    </tbody>
</table>