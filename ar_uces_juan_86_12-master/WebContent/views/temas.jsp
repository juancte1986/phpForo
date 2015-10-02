<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
			$.metodo = function(lista) {
				var url = '<c:url value="/services/tema/" />';
				var cadena = '<table>';
				cadena += '<thead>';
				cadena += '<tr>';
				cadena += '<th>Estado</th>';
				cadena += '<th>Tema / Autor</th>';
				cadena += '<th>Puntuacion</th>';
				cadena += '<th>Ultima respuesta</th>';
				cadena += '<th>Visitas</th>';
				cadena += '<th>Respuestas</th>';
				cadena += '</tr>';
				cadena += '</thead>';
				cadena += '<tbody>';
				if (lista == 0) {
					cadena += '<td colspan=6 align="center">No existen registros</td>';
				} else {
					$.each(lista, function(index, value) {
						cadena += '<tr>';
						cadena += '<td><img src="${pageContext.request.contextPath}/imagen/cerrado.jpeg" class="img-img-thumbnail small" alt="Responsive image"></td>';
						cadena += '<td>'
								+ '<a href="' + url + value.id + '">'
								+ value.titulo + '</a>  | '
								+ value.owner.user + '</td>';
						cadena += '<td>' + value.puntuacion + '</td>';
						cadena += '<td>Lolo Ayer 10: 45hs</td>';
						cadena += '<td>10</td>'
						cadena += '<td>200</td>';
						cadena += '</tr>';
					});
				}
				cadena += '</tbody>';
				cadena += '</table>';
				$("#tabla").html(cadena);
			}
		
			$(document).ready(function() {
				lista = ${temas};
				$.metodo(lista);
			});
		
			$(function() {
		
				$("#btn-tema").click(function() {
					$("#form-tema").dialog("open");
				});
		
				$("#form-tema").dialog({
					title : "Nuevo tema java",
					autoOpen : false,
					width : 800,
					height : 370,
					show : "scale",
					hide : "scale",
					resizable : "false",
					modal : "true"
				});
				
				$("#ajaxPostButtonTema").click(
						function() {
							var titulo = $("#tema-titulo").val();
							var texto = $(".jqte-test").val();
							var tema = {};
							tema.titulo = titulo;
							tema.texto= texto;
							$.ajax({
								url : '<c:url value="/services/newTema" />',
								type : "POST",
								data : JSON.stringify(tema),
								dataType : "json",
								contentType : "application/json;charset=UTF-8",
								beforeSend : function() {
									$("#resul").html("Sending create...");
								},
								success : function(result, status, xhr) {
									$("#form-tema").dialog("close");
									$.metodo(result.temas);
								},
								error : function(jqXHR, textStatus, errorThrown) {
									var errorHtml = "An error ocurred <br/>";
									errorHtml += "Status: " + textStatus + "<br/>";
									errorHtml += "Reason: <pre>" + errorThrown
											+ "</pre> <br/>";
									$("#resul").html(errorHtml);
								}
						});
				});
			});
		</script>
</body>
</html>