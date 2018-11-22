package org.chaguala.sigem.seguranca

import java.text.SimpleDateFormat

class EntidadesService {

    String devolveString(String str) {
        def tamanho = str.length()
        String devolve = str.charAt(0)

        for (int i = 1; i < tamanho; i++) {
            if (str.charAt(i).compareTo(str.charAt(i).toUpperCase()) == 0)
                devolve = devolve + " " + str.charAt(i)
            else
                devolve = devolve + str.charAt(i)
        }

        return devolve
    }

    public Date devolveData(def data) {
        SimpleDateFormat formatar = new SimpleDateFormat("dd/MM/yyyy");
        java.sql.Date sqlDate = new java.sql.Date(formatar.parse(data).getTime());
        return sqlDate;
    }

}
