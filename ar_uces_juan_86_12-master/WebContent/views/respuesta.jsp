<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Respuestas</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<!-- 	linkear los css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/jquery-te-1.4.0.css" media="screen" type="text/css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/jquery-ui.css" media="screen" type="text/css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/bootstrap.css" media="screen" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/prueba.css" media="screen" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/jquery.dataTables.css" media="screen" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/form-signin.css"/>
		<!-- importar los js -->
		<script src="${pageContext.request.contextPath}/js/lib/jquery-1.11.3.js"></script>
		<script src="${pageContext.request.contextPath}/js/lib/jquery-ui.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/lib/jquery.tooltipster.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/lib/jquery-te-1.4.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/lib/jquery.dataTables.js"></script>
		<script src="${pageContext.request.contextPath}/js/widgets/jquery.respuesta.js"></script>
		<script>
			$(function() {
				$("#respuesta").mostrarRespuestas ({
					urlContext : '${pageContext.request.contextPath}',
					usuarioSession: '${sessionScope.usuarioSession}',
					respuestas : ${respuestas},
					idGenero : ${idGenero},
					idTema : ${idTema}
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
                            <li>
                                <i class="fa fa-edit"></i>  <a href="index.html">Temas</a>
                            </li>
                             <li class="active">
                                <i class="fa fa-edit"></i> Respuestas
                            </li>
                        </ol>
                    </div>
                </div>
                <!--/ Page Heading -->
				<div id="respuesta">
					<nav>
					<ul class="pager">
						<li><a id="btn-tegusto"
							href='<c:url value="/listarTemas.htm?idGenero=${idGenero}" />'
							aria-label="Previous"> <span aria-hidden="true">Te gusto</span></a>
						</li>
					</ul>
					</nav>
					<div class="panel panel-default">
						<div class="panel-body">
							<div id="btn-temas" align="right">
								<button class="btn btn-default" id="btn-crear-respuesta">Respuesta
									rapida</button>
							</div>
							<br />
							<table id="tabla-respuestas" class="display" cellspacing="0"
								width="100%">
								<thead>
									<tr>
										<th></th>
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