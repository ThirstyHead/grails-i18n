<!doctype html>

<html>

  <head>
    <langs:resources ></langs:resources>
  </head>

  
  <body>
    <h1><g:link controller="home" action="index"><g:message code="app.welcome" /></g:link></h1>

    <div>
      <g:message code="app.preferred.language" /> 
      <langs:selector langs="es, en, en_US, de, fr, ru, ja" 
                      default="en_US" 
                      url="${createLink(action:'index', controller:'home') }"/>
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
  </body>
</html>