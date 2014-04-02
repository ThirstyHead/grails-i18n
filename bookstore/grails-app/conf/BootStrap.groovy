import bookstore.*

class BootStrap {

    def init = { servletContext ->
      def m1 = new Magazine(title:"Wired")
      m1.save(failOnError:true)

      def m1_en = new MagazineFields(parentId:m1.id, 
                                     locale:"en_US", 
                                     description:"About computers")
      m1_en.save(failOnError:true)

      def m1_es = new MagazineFields(parentId:m1.id, 
                                     locale:"es", 
                                     description:"Acerca de las computadoras")
      m1_es.save(failOnError:true)



    }
    def destroy = {
    }
}
