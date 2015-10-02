(function($) {
	$.widget( 'custom.editar', {
		options: {
			urlContext:"",
			urlGuardar:""
		},

		_create: function () {
			this._bindVars();
			this._initialize();
			this._bindEvents();
		},

		_bindVars: function() {
			this.configDialogEditor = {
				autoOpen : false, 
				minWidth : 800, 
				minHeight: 370, 
				title : 'Editor', 
				show : "scale",
				hide : "scale", 
				resizable : "false", 
				modal : false, 
				buttons:{
					"Guardar":$.proxy(this._cargarRespuestaCallback, this), 
					"Imagen":$.proxy(this._mostrarDialogImagen, this)
				}
			};
			this.configDialogImagen = {
				autoOpen : false, 
				minWidth : 350, 
				minHeight: 370, 
				title:'imagen', 
				show : "scale",
				hide : "scale", 
				resizable : "false", 
				modal : false, 
				buttons:{
					"Guardar":$.proxy(this._cargarImagenCallback, this)
				}
			};
			this.dialogEditor = this._crearDialogEditor();
			this.dialogImagen = this._crearDialogImagen();
		},

		_initialize: function() {

		},

		_bindEvents: function() {
			//bindeo el evento para mostrar el dialog para editar respuesta
			//lo oculto por que lo voy a mostrar de otra dek widget que invoca ente widget 
			this.element.find("#btn-editor").click($.proxy(this._mostrarDialogEditor, this));
		},

		_crearDialogEditor: function() {
			// creo el dialog con el formulario para editar
			var $formEditor = $('<form id= "editor"></form>');
			$('<input type="text" class="form-control" id="tema-titulo" placeholder="Titulo del tema">').appendTo($formEditor);
			$('<input type="text" class="jqte-respuesta form-control">').appendTo($formEditor);
			// aplico el plugin de jqte sobre el div 
			$formEditor.find(".jqte-respuesta").jqte();
			return $formEditor.dialog(this.configDialogEditor);
		},

		_crearDialogImagen: function() {
			var $formImagen = $('<form id="form-imagen" enctype="multipart/form-data"></form>');
			$('<input type="file" id="imag-file" name="file">').appendTo($formImagen);
			$('<div id="load" style="display:none;"><img src="\\springmvc\\imagen\\477.GIF"></div>').appendTo($formImagen);

			return $formImagen.dialog(this.configDialogImagen);
		},

		mostrarDialogEditor: function() {
			this.dialogEditor.dialog('open');
		},

		_mostrarDialogImagen: function() {
			this.dialogImagen.dialog('open');
		},

		_cargarRespuestaCallback: function() {
			var tema = {}
			tema.titulo = this.dialogEditor.fin("#tema-titulo");
			tema.texto = this.dialogEditor.find(".jqte-respuesta");
			url = urlContext + urlGuardar;
			$.ajax({
				url : url,
				type : "POST",
				data:  JSON.stringify(tema),
				dataType : "json",
				contentType : "application/json;charset=UTF-8",
				success : $.proxy(this._procesarResultadoRegister, this),
				error : function() {
					alert("Error al obtener usuario");
				}
			});

		},

		_cargarImagenCallback: function() {
			var formData = new FormData(this.dialogImagen[0]);
			var ruta = '/springmvc/services/guardarImagen';
			$.ajax({
				url: ruta,
				type: "POST",
				data: formData,
				contentType: false,
				processData: false,
				success: $.proxy(this._procesarResultadoImagen, this),
				error : function() {
				}
			});
		},

		_procesarResultadoImagen: function(data) {
			if(!data.error){
				$carga = this.dialogImagen.find("#load");
				setTimeout($.proxy(function() {
					$('<img src="/springmvc'+data.path+'"/>').appendTo(this.dialogEditor.find(".jqte").find(".jqte_editor"));
					this.dialogImagen.dialog('close');
					$carga.hide();
				}, this), 1000);

				$carga.show();
			}
		},

		destroy: function() {

		}

	});
})(jQuery);
