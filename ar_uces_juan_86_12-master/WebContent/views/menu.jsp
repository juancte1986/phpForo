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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/tooltipster.css" media="screen" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/bootstrap.css" media="screen" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/prueba.css" media="screen" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/jquery-ui.css">
<!-- 	importar js -->
		<script src="${pageContext.request.contextPath}/js/lib/jquery-1.11.3.js"></script>
		<script src="${pageContext.request.contextPath}/js/lib/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/lib/jquery.tooltipster.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/lib/jquery-ui.js"></script>
		<script src="${pageContext.request.contextPath}/js/widgets/jquery.menu.js"></script>
		<script>
			debugger;
			$(function() {
				$("#iniciarMenu").mostrarEstadisticas({
					urlContext : '${pageContext.request.contextPath}'
				});
			});
		</script>
	</head>
<body>
	<div id="wrapper">
		<jsp:include page="/views/templates/header.jsp" />
		<div id="page-wrapper">
			<div class="container-fluid" id="iniciarMenu">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i>
								Desarrollo</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<img src='<c:url value="/imagen/php.jpg"/>' height="70px" width="70px">
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge" id="num-php"></div>
										<div>PHP</div>
									</div>
								</div>
							</div>
							<a href='<c:url value="/listarTemas.htm?idGenero=2"/>'>
								<div class="panel-footer">
									<span class="pull-left">Ir a temas</span> <span
										class="pull-right"><i class="glyphicon glyphicon-play-circle"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<img src='<c:url value="/imagen/java.jpg"/>' height="70px" width="70px">
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge" id="num-java"></div>
										<div>JAVA</div>
									</div>
								</div>
							</div>
							<a href='<c:url value="/listarTemas.htm?idGenero=1"/>'>
								<div class="panel-footer">
									<span class="pull-left">Ir a temas</span> <span
										class="pull-right"><i class="glyphicon glyphicon-play-circle"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<img src='<c:url value="/imagen/net.jpg"/>' height="70px" width="70px">
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge" id="num-net"></div>
										<div>.NET</div>
									</div>
								</div>
							</div>
							<a href='<c:url value="/listarTemas.htm?idGenero=3"/>'>
								<div class="panel-footer">
									<span class="pull-left">Ir a temas</span> <span
										class="pull-right"><i class="glyphicon glyphicon-play-circle"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<img src='<c:url value="/imagen/c.jpg"/>' height="70px" width="70px">
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge" id="num-c"></div>
										<div>C/C++</div>
									</div>
								</div>
							</div>
							<a href='<c:url value="/listarTemas.htm?idGenero=4"/>'>
								<div class="panel-footer">
									<span class="pull-left">Ir a temas</span> <span
										class="pull-right"><i class="glyphicon glyphicon-play-circle"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-stats"></i> Estadisticas del sitio
						</h3>
					</div>
					<div class="panel-body">
						<div class="list-group">
							<a href="#" class="list-group-item"> <div class="badge" id="num-temas">
									</div> <i class="glyphicon glyphicon-list-alt"></i> Temas
							</a> <a href="#" class="list-group-item"> <span class="badge" id="num-respuestas">
									</span> <i class="glyphicon glyphicon-share-alt"></i> Respuestas
							</a> <a href="#" class="list-group-item"> <span class="badge" id="num-usuarios">
									</span> <i class="glyphicon glyphicon-user"></i> Usuarios
								registrados
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>