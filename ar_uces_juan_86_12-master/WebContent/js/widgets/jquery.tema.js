$.widget( 'custom.mostrarTema', {
	options: {
		urlContext:"",
		temas:{},
		usuarioSession:{},
		idGenero : ""
	},
		
	_create: function () {
		this._bindVars();
		this._initialize();
		this._bindEvents();
		
	},
	
	_bindVars: function() {
		this.idGenero = this.options.idGenero;
		this.urlContext = this.options.urlContext;
		this.tabla = this.element.find('#tabla-temas');
		this.temas = this.options.temas;
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
					"Guardar" : $.proxy(this._cargarTemaCallback, this), 
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
		
	},
	
	_initialize: function() {
		this._crearDataTable();
		this._crearDialogEditor();
		this._crearDialogImagen();
		this.tabla.on( 'click', 'tr', $.proxy( this._onTablaTrClick, this ) );
	},
	
	_onTablaTrClick: function() {
    	var nRow = $(event.target).parents('tr:first');
    	if( nRow.length > 0 ) {
	    	var data = this.tabla.fnGetData( nRow[0] );
	    	if( data ) {
	    		this._abrirTema( data );
	    	}
    	}
	},
	
	_bindEvents: function() {
		this.element.find('#btn-crear-tema').click($.proxy(this._mostrarDialogEditor,this));
	},
	
	_crearDialogEditor: function() {
		debugger;
		var $formEditor = $('<form id= "editor"></form>');
		$('<input type="text" class="form-control" id="tema-titulo" placeholder="Titulo del tema">').appendTo($formEditor);
		$('<input type="text" class="jqte-respuesta form-control">').appendTo($formEditor);
		$formEditor.find(".jqte-respuesta").jqte();
		
		this.dialogEditor = $formEditor.dialog(this.configDialogEditor);
	},
	
	_crearDialogImagen: function() {
		debugger;
		var $formImagen = $('<form id="form-imagen" enctype="multipart/form-data"></form>');
		$('<input type="file" id="imag-file" name="file">').appendTo($formImagen);
		$('<div id="load" style="display:none;"><img src="\\springmvc\\imagen\\477.GIF"></div>').appendTo($formImagen);

		this.dialogImagen = $formImagen.dialog(this.configDialogImagen);
	},
		
	_crearDataTable: function() {
		this.tabla.dataTable({
			data : this.temas,
			columns : [
	           { data : 'estado.descripcion'},
	           { data : 'titulo' },
	           { data : 'owner.user'},
	           { data : 'puntuacion'},
	           { data : 'fecha'},
	           { data : 'visitas'},
	           { 
	        	   data : null,
	        	   bSortable : false,
	        	   mRender : function(obj) {
	        		   return '<a href=/springmvc/services/respuesta/' + obj.id + '>' + 'Abrir' + '</a>';
	        	   }
	           }
	           
	        ],

		});
	},
	
	_mostrarDialogEditor: function() {
		this.dialogEditor.dialog('open');
	},

	_mostrarDialogImagen: function() {
		this.dialogImagen.dialog('open');
	},
	
	_cargarTemaCallback: function() {
		var temaForm = {};
		temaForm.titulo = this.dialogEditor.find("#tema-titulo").val();
		temaForm.respuesta = this.dialogEditor.find(".jqte-respuesta").val();
		temaForm.idGenero = this.idGenero;
		var estado = {};
		estado.descripcion = 'Abierto';
		estado.id= 1;
		temaForm.estado= estado;
		var url = this.urlContext + '/services/nuevoTema';
		$.ajax({
			url : url,
			type : "POST",
			data:  JSON.stringify(temaForm),
			dataType : "json",
			contentType : "application/json;charset=UTF-8",
			success : $.proxy(this._procesarResultadoTema, this),
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
	
	_procesarResultadoTema: function(data) {
		if(!data.error){
			this.tabla.fnClearTable();
    		this.tabla.fnDraw();
			this.tabla.fnAddData(data.temas);
			this.dialogEditor.dialog('close');
		} else {
			alert(data.message);
		}
	},
	
	_abrirTema: function(data) {
		
	},

	destroy: function() {
		
	}
		
});
