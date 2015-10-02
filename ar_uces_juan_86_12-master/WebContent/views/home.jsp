<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<div class="page-header">
		<jsp:include page="/views/templates/header.jsp" />
	</div>
	<div class="page-content">
		<div id="default">
			<div class="panel panel-default">
				<div class="panel-heading2">Programacion</div>
				<div class="panel-body"
					style="background-image: url('${pageContext.request.contextPath}/imagen/programacion.jpeg')">
					<div class="btn-group" role="group" aria-label="...">
						<a href="<c:url value='/listarTemas.htm' />"
							class="btn btn-success btn-lg" role="button">Java</a> <a href="#"
							class="btn btn-success btn-lg" role="button">PHP</a> <a href="#"
							class="btn btn-success btn-lg" role="button">.NET</a> <a href="#"
							class="btn btn-success btn-lg" role="button">C/C++</a>
					</div>
				</div>
			</div>
			<div class="panel panel-default"
				style="background-image: url('${pageContext.request.contextPath}/imagen/hardware.jpg'); background-repeat: no-repeat">
				<div class="panel-heading2">Ayuda Tecnica</div>
				<div class="panel-body">
					<div class="btn-group" role="group" aria-label="...">
						<a href="#" class="btn btn-danger btn-lg" role="button">Linux</a>
						<a href="#" class="btn btn-danger btn-lg" role="button">Winwodws</a>
						<a href="#" class="btn btn-danger btn-lg" role="button">Mac</a> <a
							href="#" class="btn btn-danger btn-lg" role="button">Hardware</a>
					</div>
				</div>
			</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th class="active">Estadisticas</th>
					<th class="active">Cumpleaños <span
						class="label label-default" id="cumple">6</span></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="active">
						<ul class="list-group">
							<li class="list-group-item"><span class="badge">14</span>
								Temas/Discuciones</li>
							<li class="list-group-item"><span class="badge">14</span>
								Mensajes/Respuestas</li>
							<li class="list-group-item"><span class="badge">14</span>
								Usuarios registrados</li>
						</ul>
					</td>
					<td class="active">
						<p class="text-muted">Pepe (50 años)</p> <img
						src="${pageContext.request.contextPath}/imagen/hard2.jpeg"
						class="img-img-thumbnail small" alt="Responsive image">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="resul"></div>
	<div class="page-footer">
		<jsp:include page="/views/templates/footer.jsp" />
	</div>
</div>
