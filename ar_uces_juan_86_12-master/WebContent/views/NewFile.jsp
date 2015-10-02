<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>Java : String</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- 		<link rel="stylesheet" -->
<!-- 			href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/estilos/jquery-te-1.4.0.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilos/tabla.css"
	media="screen" type="text/css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilos/tooltipster.css"
	media="screen" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilos/bootstrap.css"
	media="screen" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilos/prueba.css"
	media="screen" type="text/css" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}js/jquery.tooltipster.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-te-1.4.0.min.js"
	charset="utf-8"></script>
<script type="text/javascript">	

			$(function() {
				$.widget( 'capacitacion.algo', {
					options: {
					},
					_create: function () {
						debugger;
						this._bindVars();
						this._initialize();
						this._bindEvents();;
					},

					_bindVars: function(){
						debugger;
						this.configDialog =  {
							autoOpen : false,
							minWidth : 1000,
							minHeight: 400,
							title:'Respuesta rapida',
							show : "scale",
							hide : "scale",
							resizable : "false",
							modal : "true"
						};
					},

					_initialize: function() {
						this._crearDialog();
					},

					_bindEvents: function() {
						debugger;
						this.element.find('#tabla').find('.panel-respuesta').find('.panel-footer').find('#derecha').find('.btn-respuesta').click($.proxy(this._mostrarDialog, this));
						this.element.find('#btnGuardarRespuesta').click($.proxy(this._guardar, this ));
					},
					
					_mostrarDialog: function() {
						debugger;
						this.superDialog.dialog('open');
					},
					
					_crearDialog: function() {
						debugger;
						var var_dialog =$('<div id="form-respuesta"></div>');
						var var_jqte =  
						this.element.find('#respuesta').html(var_dialog);
						this.superDialog = var_dialog.dialog(this.configDialog);
						this.element.find('#respuesta').find('#form-respuesta').find('#jqte-respuesta').jqte();
					},
					
					_guardar: function() {
					    var texto = this.element.find(".jqte-respuesta").val();
						$.ajax({
							url : '<c:url value="/services/cargarRespuesta/" />'+idTema,
							type : "POST",
							data:  JSON.stringify(texto),
							dataType : "json",
							contentType : "application/json;charset=UTF-8",
							beforeSend : function() {
								$("#respuestaPostAjax").html("Sending create...");
							},
							success : function(result, status, xhr){
								var lista = result.respuestas;
								this._listar(lista);
								
							},
							error : function(jqXHR, textStatus, errorThrown) {
								var errorHtml = "An error ocurred <br/>";
								errorHtml += "Status: " + textStatus + "<br/>";
								errorHtml += "Reason: <pre>" + errorThrown + "</pre> <br/>";
								$("#respuestaPostAjax").html(errorHtml);
							}
						});
					},
					
					_listar: function (lista) {
						var cadena="";
						$.each(lista, function(index, value) {
							idTema = value.tema.id,
							cadena +='<div class="panel-respuesta">';
							cadena +='<div class="panel panel-default" style:>';
							cadena +='<div class="panel-heading2">';
							cadena +='<div class="derechaFloat">#'+index+' | <a href="#">Arriba</a></div>';
							cadena +='10/02/2013';
							cadena +='</div>';
							cadena +='<div class="panel-datos">';
							cadena +='<div class="derechaFloat"> ';
							cadena +='Mensajes: 100<br/>';
							cadena +='Ubicacion: Buenos Aires<br/>';
							cadena +='Antiguedad: 4 años<br/>';
							cadena +='</div>';
							cadena +='<div style="max-width: 100px;">';
							cadena +='<div>magocap</div>';
							cadena +='<img src="${pageContext.request.contextPath}/imagen/cerrado.jpeg"class="img-img-thumbnail small" alt="Responsive image">';
							cadena +='</div>';
							cadena +='</div>';
							cadena +='<div class="panel-body">';
							cadena +='<div align="center">'+value.tema.titulo+'</div>';
							cadena +='<div>'+value.texto+'</div>';
							cadena +='</div>';
							cadena +='<div class="panel-footer">';
							cadena +='<div align="right" id="derecha">';
							cadena +='<button id="btn4" type="button" class=" btn-primary">Citar</button>';
							cadena +='<button type="button" class="btn-primary btn-respuesta">Responder</button>';
							cadena +='<button id="btn5" type="button" class=" btn-primary">Denunciar</button>';
							cadena +='</div>';
							cadena +='</div>';
							cadena +='</div>';
							cadena +='</div>';
						});
						$("#tabla").html(cadena);
					},
					
					destroy: function() {
						for( var name in this.calls ) {
							this.calls[name].abort();
							this.calls[name] = null;
						}
						
						if (typeof(CollectGarbage) == "function") {
							CollectGarbage();
						}
					}
				});
			});
			
			$.metodo = function(lista) {
				var cadena="";
				$.each(lista, function(index, value) {
					idTema = value.tema.id,
					cadena +='<div class="panel-respuesta">';
					cadena +='<div class="panel panel-default" style:>';
					cadena +='<div class="panel-heading2">';
					cadena +='<div class="derechaFloat">#'+index+' | <a href="#">Arriba</a></div>';
					cadena +='10/02/2013';
					cadena +='</div>';
					cadena +='<div class="panel-datos">';
					cadena +='<div class="derechaFloat"> ';
					cadena +='Mensajes: 100<br/>';
					cadena +='Ubicacion: Buenos Aires<br/>';
					cadena +='Antiguedad: 4 años<br/>';
					cadena +='</div>';
					cadena +='<div style="max-width: 100px;">';
					cadena +='<div>magocap</div>';
					cadena +='<img src="${pageContext.request.contextPath}/imagen/cerrado.jpeg"class="img-img-thumbnail small" alt="Responsive image">';
					cadena +='</div>';
					cadena +='</div>';
					cadena +='<div class="panel-body">';
					cadena +='<div align="center">'+value.tema.titulo+'</div>';
					cadena +='<div>'+value.texto+'</div>';
					cadena +='</div>';
					cadena +='<div class="panel-footer">';
					cadena +='<div align="right" id="derecha">';
					cadena +='<button id="btn4" type="button" class=" btn-primary">Citar</button>';
					cadena +='<button type="button" class=" btn-primary btn-respuesta">Responder</button>';
					cadena +='<button id="btn5" type="button" class=" btn-primary">Denunciar</button>';
					cadena +='</div>';
					cadena +='</div>';
					cadena +='</div>';
					cadena +='</div>';
				});
				$("#tabla").html(cadena);
			};
	
			$(document).ready(function() {
				var lista = ${respuestas};
				$.metodo(lista);
			});			
</script>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<jsp:include page="/views/templates/header.jsp" />
		</div>
		<div class="page-content">
			<div class="input-group search">
				<input type="text" class="form-control" placeholder="Buscar tema...">
				<span class="input-group-btn">
					<button class="btn btn-default" style= "button">Ir</button>
				</span>
			</div>
			<br />
			<div class="panel panel-default">
				<div class="panel-body">
					<nav>
						<ul class="pager">
							<li><a href='<c:url value="/listarTemas.htm" />'
								aria-label="Previous"> <span aria-hidden="true">&laquo;
										Volver</span>
							</a></li>
						</ul>
					</nav>
					<div id="super">
						<div id="tabla">
						</div>
						<div id="respuesta"></div>
<!-- 						<div id="form-respuesta"> -->
<!-- 							<div class="jqte-respuesta"></div> -->
<!-- 							<input type="file" id="cargarImagen"> -->
<!-- 							<div align="center" class="form-group"> -->
<!-- 								<button id="btn-guardarRespuesta" type="button" -->
<!-- 									class="btn btn-primary">Guardar respuesta</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
					<div align="right">
						<nav>
							<ul class="pagination">
								<li><a href="#" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="panel-footer">
					<nav>
						<ul class="pager">
							<li><a href="#" aria-label="Previous"> <span
									aria-hidden="true">Te gusto el tema</span>
							</a></li>
							<li><a href="#" aria-label="Previous"> <span
									aria-hidden="true">No te gusto el tema</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<div class="page-footer">
			<jsp:include page="/views/templates/footer.jsp" />
		</div>
	</div>
</body>
</html>