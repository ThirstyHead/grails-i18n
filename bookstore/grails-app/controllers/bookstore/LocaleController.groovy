package bookstore

class LocaleController {
    def index(){
      redirect action:"available_locales"
    }

    def locales(){
      // http://www.oracle.com/technetwork/articles/javase/locale-140624.html
      // http://docs.oracle.com/javase/7/docs/api/java/util/Locale.html
      def out = []
      java.util.Locale.declaredFields.each{
        out << it
      }
      render "Fields:<br> " + out.join("<br>")      
    }

    def available_locales(){
      def out = []
      Locale.availableLocales.sort().each{
        out << it
        out << "country: ${it.country}"
        out << "displayCountry: ${it.displayCountry}"
        out << "displayLanguage: ${it.displayLanguage}"
        out << "displayName: ${it.displayName}"
        out << "language: ${it.language}"
        out << "=" * 25
      }

      // render Locale.availableLocales.sort().join("<br>")
      render "${Locale.availableLocales.size()} Available Locales: <br><br>" + out.join("<br>")
    }

    def iso_languages(){
      render "${Locale.getISOLanguages().size()} Available iso_languages: <br><br>" + 
             Locale.getISOLanguages().sort().join("<br>")
    }

    def iso_countries(){
      render "${Locale.getISOCountries().size()} Available iso_countries: <br><br>" + 
             Locale.getISOCountries().sort().join("<br>")
    }


}
