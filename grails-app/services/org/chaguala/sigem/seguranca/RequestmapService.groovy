package org.chaguala.sigem.seguranca

class RequestmapService {

    int verificaArrey(String str) {

        if (str.startsWith("["))
            return -3
        else
            return Integer.parseInt(str)
    }

    String devolveController(String srt) {
        String devolve = srt
        if (devolve.charAt(0).compareTo(devolve.charAt(0).toUpperCase()) == 0)
            devolve = devolve.charAt(0).toLowerCase().toString() + devolve.substring(1)

        return devolve
    }

    boolean existePermicao(List<Entidades> entidadesList) {
        boolean existe = false
        def permissao = null
        if (entidadesList)
            for (int i = 0; i < entidadesList.size(); i++) {
                permissao = Requestmap.findAllByUrlIlike("%" + entidadesList[i].nomeClasse + "%")
                if (permissao) {
                    existe = true
                    i = entidadesList.size()
                }

            }

        return existe
    }
}
