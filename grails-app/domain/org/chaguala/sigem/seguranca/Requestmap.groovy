package org.chaguala.sigem.seguranca

class Requestmap {

	static auditable = true
	String url
	String configAttribute
	ClassificacaoEntidade classificacaoEntidade

	static mapping = {
		cache true
	}

	static constraints = {
		url blank: false, unique: true
		configAttribute blank: false
	}

	String toString(){
		return "${url}" - "${classificacaoEntidade}"
	}
}
