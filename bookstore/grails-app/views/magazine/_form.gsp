<%@ page import="bookstore.Magazine" %>



<div class="fieldcontain ${hasErrors(bean: magazineInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="magazine.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${magazineInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: magazineInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="magazine.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${magazineInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: magazineInstance, field: 'locale', 'error')} ">
	<label for="locale">
		<g:message code="magazine.locale.label" default="Locale" />
		
	</label>
	<g:textField name="locale" value="${magazineInstance?.locale}"/>

</div>

