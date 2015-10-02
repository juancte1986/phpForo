$.widget('custom.mostrarEstadisticas', {
	options : {
		urlContext : ""
	},

	_create : function() {;
		this._bindVars();
		this._initialize();
		this._bindEvents();

	},

	_bindVars : function() {
		this.urlContext = this.options.urlContext;
		this.temas = this.element.find("#num-temas");
		this.respuestas = this.element.find("#num-respuestas");
		this.usuarios = this.element.find("#num-usuarios");
		this.java = this.element.find("#num-java");
		this.php = this.element.find("#num-php");
		this.net = this.element.find("#num-net");
		this.c = this.element.find("#num-c");
	},

	_initialize : function() {
		this._completarCallback();
	},

	_bindEvents : function() {

	},

	_completarCallback : function() {
		//llamada ajax
		var url = this.urlContext + "/services/estadisticas";
		$.ajax({
			url : url,
			type : "POST",
			contentType : "application/json;charset=UTF-8",
			success : $.proxy(this._procesarRespuestaCompletarCallback, this),
			error : function() {
				alert("Error al obtener los datos");
			}
		});
	},

	_procesarRespuestaCompletarCallback : function(data) {
		if (!data.error) {
			 this.respuestas.html(data.estadisticasDTO.numRespuestas);
			 this.usuarios.html(data.estadisticasDTO.numUsuarios);
			 this.temas.html(data.estadisticasDTO.numTemas);
			 this.java.html(data.estadisticasDTO.numJava);
			 this.php.html(data.estadisticasDTO.numPhp);
			 this.net.html(data.estadisticasDTO.numNet);
			 this.c.html(data.estadisticasDTO.numC);
		} else {
			alert(data.message);
		}
	},

	destroy : function() {

	}

});
