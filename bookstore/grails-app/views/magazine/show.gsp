
<%@ page import="bookstore.Magazine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'magazine.label', default: 'Magazine')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-magazine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-magazine" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list magazine">
			
				<g:if test="${magazineInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="magazine.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${magazineInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${magazineInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="magazine.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${magazineInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${magazineInstance?.locale}">
				<li class="fieldcontain">
					<span id="locale-label" class="property-label"><g:message code="magazine.locale.label" default="Locale" /></span>
					
						<span class="property-value" aria-labelledby="locale-label"><g:fieldValue bean="${magazineInstance}" field="locale"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:magazineInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${magazineInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
