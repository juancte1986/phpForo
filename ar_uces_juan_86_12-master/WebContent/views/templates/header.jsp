<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/sb-admin.css" media="screen" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/font-awesome.min.css" media="screen" type="text/css"/>
<!-- plugins de jquery validate -->	
<script src="${pageContext.request.contextPath}/js/lib/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/additional-methods.js"></script>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

	<div class="navbar-header">
		<a class="navbar-brand" href='<c:url value="/views/menu.jsp" />' >FORO</a>
	</div>
	
	<!-- Top Menu Items -->
	<c:if test="${sessionScope.usuarioSession != null}">
		<ul class="nav navbar-right top-nav">
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.usuarioSession.user}<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href='<c:url value="/logout.htm"/>'><i class="glyphicon glyphicon-off"></i> Salir</a></li>
				</ul>
			</li>
		</ul>
	</c:if>
	<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">
			<c:if test="${sessionScope.usuarioSession != null}">
				<li class="dropdown active"><a href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					<i class="glyphicon glyphicon-user"></i> Mi Perfil <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Editar tu info</a></li>
						<li><a href="#">Cambiar contraseña</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i
						class="glyphicon glyphicon-cog"></i> Configuracion <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Editar avatar</a></li>
						<li><a href="#">Editar Firma</a></li>
					</ul></li>
			</c:if>
			<c:if test="${sessionScope.usuarioSession == null}">
				<li class="active"><a href="tables.html"><i class="glyphicon glyphicon-user"></i> Resgistrarse</a></li>
			</c:if>
				<li><a href="tables.html"><i class="glyphicon glyphicon-envelope"></i> Contactenos</a></li>
			<c:if test="${sessionScope.usuarioSession != null}">
				<li><a href="tables.html"><i class="glyphicon glyphicon-trash"></i> Borrar cuenta</a></li>
			</c:if>
		</ul>
	</div>
</nav>
