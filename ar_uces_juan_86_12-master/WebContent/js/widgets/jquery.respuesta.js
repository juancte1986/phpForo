$.widget( 'custom.mostrarRespuestas', {
	options: {
		urlContext:"",
		respuestas:{},
		usuarioSession:"",
		idGenero : "",
		idTema : ""
	},
		
	_create: function () {
		this._bindVars();
		this._initialize();
		this._bindEvents();
		
	},
	
	_bindVars: function() {
		this.urlContext = this.options.urlContext;
		this.respuestas = this.options.respuestas;
		this.idGenero = this.options.idGenero;
		this.idTema = this.options.idTema;
		this.tabla = this.element.find('#tabla-respuestas');
		this.configDialogEditor = {
				autoOpen : false, 
				minWidth : 800, 
				minHeight: 370, 
				title : 'Nueva respuesta', 
				show : "scale",
				hide : "scale", 
				resizable : "false", 
				modal : false, 
				buttons:{
					"Guardar" : $.proxy(this._cargarRespuestaCallback, this), 
					"Imagen" : $.proxy(this._mostrarDialogImagen, this)
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
		this.dialogEditor = new Object();
		this.dialogImagen = new Object();
		this.avatarDefault = '/imagen/avatarDefault.jpg';
	},
	
	_initialize: function() {
		this._crearDataTable();
		this._crearDialogEditor();
		this._crearDialogImagen();
	},
	
	_bindEvents: function() {
		this.element.find('#btn-tegusto').click($.proxy(this._cargaMeGustaCallback,this));
		this.element.find('#btn-crear-respuesta').click($.proxy(this._mostrarDialogEditor,this));
	},
	
	_cargaMeGustaCallback: function() {
		
	},
	
	_crearDialogEditor: function() {
		var $formEditor = $('<form id= "editor"></form>');
		$('<div class="jqte-respuesta"></div>').appendTo($formEditor);
		$formEditor.find(".jqte-respuesta").jqte();
		this.dialogEditor = $formEditor.dialog(this.configDialogEditor);
	},
	
	_crearDialogImagen: function() {
		var $formImagen = $('<form id="form-imagen" enctype="multipart/form-data"></form>');
		$('<input type="file" id="imag-file" name="file">').appendTo($formImagen);
		$('<div id="load" style="display:none;"><img src="\\springmvc\\imagen\\477.GIF"></div>').appendTo($formImagen);

		this.dialogImagen = $formImagen.dialog(this.configDialogImagen);
	},
	
	_mostrarDialogEditor: function() {
		this.dialogEditor.dialog('open');
	},

	_mostrarDialogImagen: function() {
		this.dialogImagen.dialog('open');
	},
	
	_cargarRespuestaCallback: function() {
		var texto = this.dialogEditor.find(".jqte-respuesta").val();
		var url = this.urlContext + '/services/cargarRespuesta/' + this.idTema  ;
		$.ajax({
			url : url,
			type : "POST",
			data:  JSON.stringify(texto),
			dataType : "json",
			contentType : "application/json;charset=UTF-8",
			success : $.proxy(this._procesarResultadoRespuesta, this),
			error : function() {
				alert("Error al guardar la respuesta");
			}
		});

	},

	_cargarImagenCallback: function() {
		var formData = new FormData(this.dialogImagen[0]);
		var ruta = this.urlContext + '/services/guardarImagen';
		$.ajax({
			url: ruta,
			type: "POST",
			data: formData,
			contentType: false,
			processData: false,
			success: $.proxy(this._procesarResultadoImagen, this),
			error : function() {
				alert("Error no se pudo guardar la imagen ");
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
		} else {
			alert(data.message);
		}
	},
	
	_procesarResultadoRespuesta: function(data) {
		if(!data.error){
			this.tabla.fnClearTable();
    		this.tabla.fnDraw();
			this.tabla.fnAddData(data.respuestas);
			this.dialogEditor.dialog('close');
		} else {
			alert(data.message);
		}
	},
	
	_crearHeaderRespuesta: function(data) {
		var sender = data.sender;
		var url = this.urlContext + this.avatarDefault;
		var ubicacion = sender.ubicacion == null ? 'N/C' : sender.ubicacion;
		var fecha = sender.fecha == null ? 'N/C' : sender.ubicacion;
		$usuarioHeader= $('<div class="media"></div>');
		$usuarioFoto = $('<div class="media-left"><a href="#"><img class="media-object" src="' + url + '"></a></div>');
		$usuarioDatos = $(' <div class="media-body"><h4 class="media-heading">Usuario: '+sender.user+'<br/>Ubicacion de ingreso: ' + ubicacion + '<br/>Fecha: '+ fecha +'</h4></div>');
		
		($usuarioFoto).appendTo($usuarioHeader);
		($usuarioDatos).appendTo($usuarioHeader);
		
		return $usuarioHeader;
		
	},
	
	_crearPanelTabla: function(data) {
		// el panel-respuesta me permite que la respuesta no tengo un ancho maximo de 900px 
		$panel = $('<div class="panel panel-default"></div>');
		$panelHeader = $('<div class="panel-heading2"></div>');
		$panelBody = $('<div class="panel-body-respuesta panel-respuesta"></div>');
		$panelFooter = $('<div class="page-footer-respuesta">');
		
		$('<div align="center">'+data.tema.titulo+'</div>'+
				'<div>'+data.texto+'</div>').appendTo($panelBody);
		$('<div align="right" id="derecha">' +
				'<button type="button" class="btn btn-link btn-citar">Citar</button>' +
				'<button type="button" class="btn btn-link btn-denunciar">Denunciar</button></div>')
				.appendTo($panelFooter);
		(this._crearHeaderRespuesta(data)).appendTo($panelHeader);
		($panelHeader).appendTo($panel);
		($panelBody).appendTo($panel);
		($panelFooter).appendTo($panel);
		
		//me devuelve el html puro
		return $panel.html();
	},
	
	_crearDataTable: function() {
		this.tabla.dataTable({
			data : this.respuestas,
			columns : [
	           { 
	        	   data : null,
	        	   bSortable : false,
	        	   mRender : $.proxy(this._crearPanelTabla, this)
	           }
			]
		});
	},

	destroy: function() {
		
	}
		
});
