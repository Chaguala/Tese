import org.chaguala.sigem.seguranca.SecRole
import org.chaguala.sigem.seguranca.SecUser
import org.chaguala.sigem.seguranca.SecUserSecRole

class BootStrap {

    def init = { servletContext ->

        def adminRole = new SecRole(authority: 'ROLE_ADMIN').save(flush: true)
        //   def userRole = new SecRole(authority: 'ROLE_USER').save(flush: true)
        def testUser = new SecUser(username: 'admin', password: 'admin', enabled: true)
        testUser.save(flush: true)
        SecUserSecRole.create testUser, adminRole, true
    }

    def destroy = {
    }
}
