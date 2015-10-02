$.widget( 'custom.aplicarLogin', {
	options: {
		urlContext : "",
		uri:"",
		errorLogin: false
	},

	_create: function () {
		this._bindVars();
		this._initialize();
		this._bindEvents();
	},

	_bindVars: function() {
		this.urlContext= this.options.urlContext;
		this.uri = this.options.uri;
		this.errorLogin = this.options.errorLogin;
		this.formLogin = this.element.find("#form-login");
		this.validatorLogin = new Object(); 
		
	},

	_initialize: function() {
		this._crearValidator();
		this._mostrarErrorCredenciales();
	},

	_bindEvents: function() {
		
	},
	
	_crearValidator: function() {
		var config ={ 
				rules: {
					user: "required", 
					password: "required"
				},
				messages: {
					user: "Por favor especifique el usuario", 
					password: "Por favor especifique la contraseña"
				}
		};	
		this.validatorLogin = this.formLogin.validate(config);
	},
	
	_mostrarErrorCredenciales: function() {
		if (this.errorLogin) {
			this.validatorLogin.showErrors({"password": "Credenciales incorrectas"});	
		}
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
