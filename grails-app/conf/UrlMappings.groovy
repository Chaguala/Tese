class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?" {
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
//		"/"(controller: 'unidadeOrganica', action: 'listaUnidaeOrganica')
        "/"(controller: 'login', action: 'index')
		"500"(view: '/error')
	}
}
