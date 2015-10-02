 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<link rel="stylesheet"
			href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
		<link type="text/css" rel="stylesheet"
			href="${pageContext.request.contextPath}/estilos/jquery-te-1.4.0.css">
		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
		<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/widgets/jquery.editor.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/lib/jquery-te-1.4.0.min.js"
			charset="utf-8"></script>
		<script type="text/javascript">
			$(function() {
				$("#mama").editar();
			});
		</script>
	</head>
	<body>
		<div id="mama">
			<button id="btn-editor">mostrar</button>
			<div id="result"></div>
		</div>
	</body>
</html>
