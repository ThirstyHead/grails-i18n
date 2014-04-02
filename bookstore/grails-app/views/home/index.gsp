<!doctype html>

<html>

  <head>
    <langs:resources ></langs:resources>
  </head>

  
  <body>
    <h1><g:link controller="home" action="index"><g:message code="app.welcome" /></g:link></h1>

    <div>
      <g:message code="app.preferred.language" /> 
      <langs:selector langs="es, en_US, de" 
                      default="en_US" 
                      url="${createLink(action:'index', controller:'home') }"/>
    </div>

    <div>
      <p>Due to the <code>grails.plugins.localeConfiguration.supportedLocales</code> setting in <code>grails-app/conf/Config.groovy</code> (courtesy of the <a href="http://grails.org/plugin/locale-configuration">Locale Configuration Plugin</a>), the following locales are not allowed:</p>

      <langs:selector langs="en, fr, ru, ja" 
                      url="${createLink(action:'index', controller:'home') }"/>

      <p>Selecting any of the disallowed locales will place you in the default locale (currently "en_US") as specified by the <code>grails.plugins.localeConfiguration.defaultLocale</code> setting in <code>grails-app/conf/Config.groovy</code></p>
    </div>
    
    <hr />

    <div>
      <g:link controller="book" action="index"><g:message code="app.browse.books" /></g:link>
    </div>

    <div>
      <g:message code="app.today.is" args="${[ new Date() ]}" />
      <br>
      <g:message code="app.total.books" args="${[ 100000 ]}" />
      <br>
      <g:message code="app.average.price" args="${[ 19.95 ]}" />
    </div>

    <hr />
  
    <g:link controller="magazine" action="index">View Magazines</g:link>

    <hr />    

    <div>
      <g:link controller="locale" action="locales">View all static java.util.Locale locales</g:link>

      <br>

      <g:link controller="locale" action="available_locales">View all available locales</g:link>

      <br>

      <g:link controller="locale" action="iso_languages">View all iso_languages</g:link>

      <br>

      <g:link controller="locale" action="iso_countries">View all iso_countries</g:link>
    </div>


  </body>
</html>