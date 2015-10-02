		<script type="text/javascript">
		
			$(function() {
				$.widget( 'capacitacion.algo', {
					options: {
						respuestas:{}
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
						this.respuestas = this.options.respuestas;
						this.superDialog = {};
					},
	
					_initialize: function() {
						this._crearDialog();
						this._listarRespuestas(this.respuestas);
					},
	
					_bindEvents: function() {
						debugger;
						this.element.find('#tabla').find('.panel-respuesta').find('.panel-footer').find('#derecha').find('.btn-respuesta').click($.proxy(this._mostrarDialog, this));
	// 					no sirve porque es un button del dialog
	// 					this.element.find('#respuesta').find('#form-respuesta').find('#btn-guardar-respuesta').click($.proxy(this._guardar, this ));
					},
					
					_mostrarDialog: function() {
						debugger;
						this.superDialog.dialog('open');
					},
					
					_crearDialog: function() {
						debugger;
						var $var_dialog = $('<div id="form-respuesta"></div>');
						var $var_jqte = $('<div class="jqte-respuesta"></div>');
						var $var_btn_guardar = $('<button id="btn-guardar-resp">Guardar</button>');
						$var_jqte.appendTo($var_dialog);
						$var_btn_guardar.appendTo($var_dialog);
						$var_btn_guardar.click($.proxy(this._guardar, this ));
						this.element.find('#respuesta').html($var_dialog);
						this.superDialog = $var_dialog.dialog(this.configDialog);
						$var_jqte.jqte();
					},
					
					_guardar: function() {
						// tengo que recuperarlo del dialog, el objeto jqte no lo guarda. 
					    var texto = this.superDialog.find('.jqte-respuesta').val();
						$.ajax({
							url : '<c:url value="/services/cargarRespuesta/" />'+idTema,
							type : "POST",
							data:  JSON.stringify(texto),
							dataType : "json",
							contentType : "application/json;charset=UTF-8",
							success : $.proxy(function(result){
								this.superDialog.dialog('close');
								$.proxy(this._listarRespuestas(result.respuestas),this);
							},this)
						});
					},
					
					_listarRespuestas: function (lista) {
						debugger;
						var cadena = "";
						for(var i = 0; i < lista.length; i++) {
							idTema = lista[i].tema.id;
							cadena +='<div class="panel-respuesta">';
							cadena +='<div class="panel panel-default" style:>';
							cadena +='<div class="panel-heading2">';
							cadena +='<div class="derechaFloat">#'+ i +' | <a href="#">Arriba</a></div>';
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
							cadena +='<div align="center">'+lista[i].tema.titulo+'</div>';
							cadena +='<div>'+lista[i].texto+'</div>';
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
						}
						
						this.element.find('#tabla').html(cadena);
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
			
			$(function() {
				$("#super").algo({
					respuestas : ${respuestas}
				});
			});
	</script>