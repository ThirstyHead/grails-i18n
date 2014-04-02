package bookstore

import org.springframework.context.i18n.LocaleContextHolder as LCH 

class Magazine {
  def grailsApplication

  String title
  String description
  String locale

  static constraints = {
    title()
    description()
    locale()
  }

  static transients = ['description', 'locale']
  
  def onLoad(){
    //get the current locale, default locale
    locale = LCH.getLocale()
    def defaultLocale = grailsApplication.config.grails.plugins.localeConfiguration.defaultLocale

    //load locale-specific fields from database
    def i18nFields = MagazineFields.findByLocaleAndParentId(locale,id)
    
    //if no fields for current locale, fail over to default locale
    if(!i18nFields){
      i18nFields = MagazineFields.findByLocaleAndParentId(defaultLocale,id)
    }

    //if no default locale, create one
    //NOTE: should be a rare case
    if(!i18nFields){
      i18nFields = new MagazineFields(locale:defaultLocale, 
                                      parentId:id, 
                                      description:"") 
      i18nFields.save()
    }      

    //populate this class's transient fields based on i18n fields
    description = i18nFields.description
  }





  String toString(){
    return "$locale edition of $title"
  }
}
