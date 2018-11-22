package org.chaguala.sigem.reports
import groovy.sql.Sql

class ListPedidosController {

    def index() { }


    class MyFancySqlController {

        def dataSource // the Spring-Bean "dataSource" is auto-injected

        def list = {
            def db = new Sql(dataSource) // Create a new instance of groovy.sql.Sql with the DB of the Grails app

            def result = db.rows("SELECT foo, bar FROM my_view") // Perform the query

            [ result: result ] // return the results as model
        }

    }
}
