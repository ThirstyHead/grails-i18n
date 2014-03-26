<!doctype html>

<html>
  
  <body>
    <h1><g:message code="app.welcome" /></h1>

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