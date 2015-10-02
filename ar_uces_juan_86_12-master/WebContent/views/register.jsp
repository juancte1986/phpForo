<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>Foro Tecnico</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- 	linkear los css -->
		<link rel="stylesheet" href="http://jqueryvalidation.org/files/demo/site-demos.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/tooltipster.css" media="screen" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/bootstrap.css" media="screen" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/prueba.css" media="screen" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/jquery-ui.css">
<!-- 	importar js -->
		<script src="${pageContext.request.contextPath}/js/lib/jquery-1.11.3.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/lib/jquery.tooltipster.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/lib/jquery-ui.js"></script>
		<script src="${pageContext.request.contextPath}/js/widgets/jquery.login.js"></script>
		<script>
			$(function() {
				$("#content").aplicarLogin({
					urlContext : '${pageContext.request.contextPath}',
					errorLogin: '${errorLogin}'
				});
			});
		</script>
	</head>
	<body>
		<div class="container">
			<jsp:include page="/views/templates/header.jsp" />
			<div class="page-header">
				<div style="float: right;">
					<img src="${pageContext.request.contextPath}/imagen/foro4.jpeg" height="50" width="100"/>
				</div>
  				<h1>Foro <small>Registrarse</small></h1>
			</div>
			<div class="page-content" id="content">
				<form:form method="POST"  commandName="usuarioForm" action="procesarLogin.htm" id="form-login" >
				 	 <div class="form-group col-xs-4">
						 <div class="form-group">
							<form:input path="user" class="form-control" placeholder="Usuario" id="user" name="user"/>
							<form:errors path="user" cssStyle="color: red" />
						</div>
						<div>
							<form:password path="password" class="form-control" placeholder="Contraseña" id="password" name="password"/>
							<form:errors path="password" cssStyle="color: red" />
						</div>
						<br/><form:button class="btn btn-primary">Iniciar sesion</form:button>	
					</div>
				</form:form>
			</div>
			<div class="page-footer">
				<jsp:include page="/views/templates/footer.jsp" />
			</div>
		</div>
	</body>
</html>