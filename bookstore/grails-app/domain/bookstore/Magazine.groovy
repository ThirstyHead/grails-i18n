package bookstore

import org.springframework.context.i18n.LocaleContextHolder as LCH 

class Magazine {
  def grailsApplication

  String title
  String description
  String locale

  static constraints = {
    title()
    description(bindable: true)
    locale()
  }

  static transients = ['description', 'locale']
  
  String toString(){
    return "$locale edition of $title"
  }

  /////////////////////////
  // i18n Lifecycle Events
  /////////////////////////
  /**
    * Load i18n fields when this class is loaded
    */
  def onLoad(){
    //get i18nFields
    def i18nFields = loadI18nFields(id)

    log.debug("onLoad: $i18nFields")

    //populate this class's transient fields based on i18n fields
    description = i18nFields.description
  }


  /**
    * Save i18n fields after this class is saved
    */
  def afterInsert(){
    //load (or create) i18n partner class
    def i18nFields = loadI18nFields(locale, id)

    //populate this class's i18n fields based on transient fields 
    i18nFields.description = description

    //save i18nFields
    i18nFields.save()

    log.debug("afterInsert: $i18nFields")
  }


  /**
    * Update i18n fields after this class is updated
    * TODO: Only triggers if fields in this class are changed.
    *       Changes in i18n fields only is a no-op. #hmmm
    */
  def afterUpdate(){
    //load (or create) i18n partner class
    def i18nFields = loadI18nFields(locale, id)

    //populate this class's i18n fields based on transient fields 
    i18nFields.description = description

    //save i18nFields
    i18nFields.save()

    log.debug("afterUpdate: $i18nFields")
  }



  /**
    * Load i18n fields for:
    * 1. current locale
    * 2. if no record for current locale, then find record for default locale
    * 3. if no record for default locale, create one and return it
    */  
  def loadI18nFields(parentId){
    //get the current locale, default locale
    locale = LCH.getLocale()
    def defaultLocale = grailsApplication.config.grails.plugins.localeConfiguration.defaultLocale

    //load locale-specific fields from database
    def i18nFields = MagazineFields.findByLocaleAndParentId(locale,parentId)
    
    //if no fields for current locale, fail over to default locale
    if(!i18nFields){
      i18nFields = MagazineFields.findByLocaleAndParentId(defaultLocale,parentId)
    }

    //if no default locale, create one
    //NOTE: should be a rare case
    if(!i18nFields){
      i18nFields = new MagazineFields(locale:defaultLocale, 
                                      parentId:parentId, 
                                      description:"") 
      i18nFields.save()
    } 

    return i18nFields    
  }



  /**
    * Load i18n fields for:
    * 1. specific locale
    * 2. if no record for specific locale, create one and return it
    */  
  def loadI18nFields(locale, parentId){
    //get the current locale
    locale = LCH.getLocale()

    //load locale-specific fields from database
    def i18nFields = MagazineFields.findByLocaleAndParentId(locale,parentId)
    
    //if no locale-specific record, create one
    if(!i18nFields){
      i18nFields = new MagazineFields(locale:locale, 
                                      parentId:parentId) 
    } 

    return i18nFields    
  }







}
