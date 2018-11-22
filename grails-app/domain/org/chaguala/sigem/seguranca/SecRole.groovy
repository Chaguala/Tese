package org.chaguala.sigem.seguranca

class SecRole {

	String authority
	String description

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
		description nullable: true
	}

	String toString(){
		return "${description}"
	}
}
