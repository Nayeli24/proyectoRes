<%@ page import="pruebaSeguridad.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="usuario.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${usuarioInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${usuarioInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${usuarioInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidoPat', 'error')} required">
	<label for="apellidoPat">
		<g:message code="usuario.apellidoPat.label" default="Apellido Pat" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoPat" required="" value="${usuarioInstance?.apellidoPat}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidoMat', 'error')} required">
	<label for="apellidoMat">
		<g:message code="usuario.apellidoMat.label" default="Apellido Mat" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoMat" required="" value="${usuarioInstance?.apellidoMat}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'areaDpto', 'error')} required">
	<label for="areaDpto">
		<g:message code="usuario.areaDpto.label" default="Area Dpto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="areaDpto" required="" value="${usuarioInstance?.areaDpto}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'empresa', 'error')} ">
	<label for="empresa">
		<g:message code="usuario.empresa.label" default="Empresa" />
		
	</label>
	<g:select id="empresa" name="empresa.id" from="${pruebaSeguridad.Empresa.list()}" optionKey="id" value="${usuarioInstance?.empresa?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="usuario.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${usuarioInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="usuario.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${usuarioInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="usuario.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${usuarioInstance?.accountLocked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="usuario.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="usuario.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${usuarioInstance?.passwordExpired}" />

</div>

