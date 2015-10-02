<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
	<head>
		<title>Foro Tecnico</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- 	linkear los css -->
		<link rel="stylesheet" href="http://jqueryvalidation.org/files/demo/site-demos.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/tooltipster.css" media="screen" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/bootstrap.css" media="screen" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/prueba.css" media="screen" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/jquery-ui.css" media="screen" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/form-signin.css" media="screen" type="text/css">
   		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/sb-admin.css" media="screen" type="text/css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/estilosfont-awesome.min.css" media="screen" type="text/css"/>
<!-- 	importar js -->
		<script src="${pageContext.request.contextPath}/js/lib/jquery-1.11.3.js"></script>
		<script src="${pageContext.request.contextPath}/js/lib/bootstrap.min.js"></script>
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
	<div id="wrapper">
		<jsp:include page="/views/templates/header.jsp" />
		<div id="page-wrapper">
			 <div class="container-fluid">
				<div class="card card-container">
					<img id="profile-img" class="profile-img-card"
						src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
					<p id="profile-name" class="profile-name-card"></p>
					<form:form method="POST" commandName="usuarioForm"
						action="procesarLogin.htm" id="form-login" class="form-signin">
						<div class="form-group">
							<form:input path="user" class="form-control" placeholder="Usuario"
								id="user" name="user" />
							<form:errors path="user" cssStyle="color: red" />
						</div>
						<div class="form-group">
							<form:password path="password" class="form-control"
								placeholder="Contraseña" id="password" name="password" />
							<form:errors path="password" cssStyle="color: red" />
						</div>
						<br />
						<form:button class="btn btn-lg btn-primary btn-block btn-signin">Iniciar sesion</form:button>
					</form:form>
					<a href="#" class="forgot-password"> Forgot the password? </a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>