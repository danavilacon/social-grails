import com.crossover.*

class BootStrap {

    def init = { servletContext ->
    	def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
      	def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

		def testUser = new User(username: 'user', password: 'password').save(flush: true)
		def adminUser = new User(username: 'admin', password: 'password').save(flush: true)
		
		UserRole.create testUser, userRole, true
		UserRole.create adminUser, adminRole, true

		assert User.count() == 2
		assert Role.count() == 2
		assert UserRole.count() == 2

		def company = new Company(name: 'CROSSOVER').save(flush: true)
		assert Company.count() == 1

		def itDepartment = new Department(name: 'IT',company:company).save(flush: true)
		def comercialDepartment = new Department(name: 'COMERCIAL',company:company).save(flush: true)
		assert Department.count() == 2

		def itUser = new UserDepartment(user: adminUser,department:itDepartment).save(flush: true)
		def comercialUser = new UserDepartment(user: testUser,department:comercialDepartment).save(flush: true)
		assert UserDepartment.count() == 2

		def itBlog = new Blog(name: 'IT Blog',description: 'TEST BLOG',department:itDepartment).save(flush: true)
		def comercialBlog = new Blog(name: 'COMERCIAL Blog',description: 'TEST BLOG',department:comercialDepartment).save(flush: true)
		assert Blog.count() == 2

		def itPost = new Post(title: 'IT Post TEST',content: 'TEST IT CONTENT',blog:itBlog,user:adminUser).save(flush: true)
		def comercialPost = new Post(title: 'COMERCIAL Post Test',content: 'TEST COMERCIAL CONTENT',blog:comercialBlog,user:testUser).save(flush: true)
		assert Post.count() == 2		

		def itComment = new Comment(content: 'IT Comment TEST',rating: 5,post:comercialPost,user:adminUser).save(flush: true)
		def comercialComment = new Comment(content: 'COMERCIAL Comment Test',rating: 1,post:itPost,user:testUser).save(flush: true)
		assert Comment.count() == 2				

    }
    def destroy = {
    }
}
