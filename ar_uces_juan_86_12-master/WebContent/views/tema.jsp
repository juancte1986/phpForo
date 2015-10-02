<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Temas</title>
<!-- 	linkear los css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilos/jquery-te-1.4.0.css"
	media="screen" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilos/jquery-ui.css"
	media="screen" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilos/tooltipster.css"
	media="screen" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilos/bootstrap.css"
	media="screen" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilos/prueba.css"
	media="screen" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilos/jquery.dataTables.css"
	media="screen" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilos/form-signin.css">
<!-- 	importar js -->
<script src="${pageContext.request.contextPath}/js/lib/jquery-1.11.3.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/lib/jquery.tooltipster.min.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/js/lib/jquery.dataTables.js"></script>
<script
	src="${pageContext.request.contextPath}/js/lib/jquery-te-1.4.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/widgets/jquery.tema.js"></script>
<script>
			$(function() {
				$("#tema").mostrarTema ({
					urlContext : '${pageContext.request.contextPath}',
					usuarioSession: '${sessionScope.usuarioSession}',
					temas : ${temas},
					idGenero : ${idGenero}
				});
			});
</script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/views/templates/header.jsp" />
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Desarrollo</a>
                            </li>
							<li class="active"><i class="fa fa-dashboard"></i>
								Temas</li>
						</ol>
					</div>
				</div>
				<div id="tema">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="glyphicon glyphicon-stats"></i> JAVA
							</h3>
						</div>
						<div class="panel-body">
							<div id="btn-temas" align="right">
								<button class="btn btn btn-primary" id="btn-crear-tema">Crear
									tema</button>
							</div>
							<br />
							<table id="tabla-temas" class="display" cellspacing="0"
								width="100%">
								<thead>
									<tr>
										<th>Estado</th>
										<th>Tema</th>
										<th>Autor</th>
										<th>Puntuacion</th>
										<th>fecha</th>
										<th>Visitas</th>
										<th>id</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>