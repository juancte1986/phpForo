$.widget( 'custom.menuHorizontal', {
	options: {
		urlContext : "",
		usuarioSession:{}
	},

	_create: function () {
		this._bindVars();
		this._initialize();
		this._bindEvents();
	},

	_bindVars: function() {
		this.urlContext= this.options.urlContext;
		this.dialogRegister =  {
			autoOpen : false,
			minWidth : 350,
			minHeight: 370,
			title:'Registrarse',
			show : "scale",
			hide : "scale",
			resizable : "false",
			modal : "true",
			close : $.proxy(this._formReset, this)
		};
		this.dialogLogin =  {
			autoOpen : false,
			minWidth : 300,
			minHeight: 200,
			title:'Iniciar sesion',
			show : "scale",
			hide : "scale",
			resizable : "false", 	
			modal : "true",
			close : $.proxy(this._formReset, this)
		};
//		mapa de validates
		this.validatesMap = new Object(); 
		this.formLogin = this._crearFormLogin();
		this.formRegister = this._crearFormRegister();
		this.userSession = this.options.usuarioSession;
		
	},

	_initialize: function() {
		this._crearDialog();
		this._ocultarDivSesion();
	},

	_bindEvents: function() {
		this.element.find('#btn-iniciarSession').click($.proxy(this._showDialogLogin, this));
		this.element.find('#btn-registrarse').click($.proxy(this._showDialogRegister, this));
	},
	
	_formReset: function() {
		this.validatesMap['login'].resetForm();
		this.validatesMap['register'].resetForm();
	},
	
	_showDialogLogin: function() {	
		this.formLogin.dialog('open');
	},
	
	_showDialogRegister: function() {
		this.formRegister.dialog('open');
	},
	
	_crearDialog: function() {
		this.formLogin.dialog(this.dialogLogin);
		this.formRegister.dialog(this.dialogRegister);
	},
	
	_crearFormLogin: function() {
		var $formLogin = $('<form id="formLogin"></form>');
		$('<p><input class="form-control" type="text" id="userLogin" name= "userLogin" placeholder="Usuario"/></p>').appendTo($formLogin);
		$('<p><input class="form-control" type="password" id="passwordLogin" name="passwordLogin" placeholder="Password"/></p><br/>').appendTo($formLogin);
		$('<button id="cargarLogin" class="form-control btn btn-primary">Iniciar sesion</button>').appendTo($formLogin);
		//validate sole me funciona con el button en el form y llamando al evento submit desde el plugin 
		this.validatesMap['login'] = $formLogin.validate( {
			rules: {
				userLogin: "required", 
				passwordLogin: "required"
			},
			messages: {
				userLogin: "Por favor especifique el usuario", 
				passwordLogin: "Por favor especifique la contraseña"
			},
			submitHandler:$.proxy(this._loginCallback,this)
		});
		return $formLogin;
	},
	
	_crearFormRegister: function() {
		var $formRegister = $('<form id="registerForm"></form>');
		$('<p><input type="email" class="form-control" id="email" name="email" placeholder="email"></p>').appendTo($formRegister);
		$('<p><input type="text" class="form-control" id="userRegister" name="userRegister" placeholder="Usuario"></p>').appendTo($formRegister);
		$('<p><input type="password" class="form-control" id="passwordRegister" name="passwordRegister" placeholder="Contraseña"></p>').appendTo($formRegister);
		$('<p><input type="password" class="form-control" id="password_again" name="password_again" placeholder="Confirmar contraseña"></p><br/>').appendTo($formRegister);
		$('<button id="cargarRegister" class="form-control btn btn-primary">Registrarse</button>').appendTo($formRegister);
		//validate sole me funciona con el button en el form y llamando al evento submit desde el plugin 
		this.validatesMap['register'] = $formRegister.validate( {
			rules: { 
				email:{required: true, email: true},
				userRegister: "required",
				passwordRegister: "required",
				password_again: {equalTo: "#passwordRegister"}
			},
			messages: {
				email: {required: "Por favor especifique el email", email: "Ingrese una direccion de correo valida"},
				userRegister: "Por favor especifique el usuario",
				passwordRegister: "Por favor especifique la contraseña",
				password_again: { equalTo: "No coincide la pass con la confirmacion"},
				
			},
			submitHandler:$.proxy(this._registerCallback,this)
		});
		
		return $formRegister;
	},
	
	_loginCallback : function() {
//		El nombre de la variable tiene que coincidir con lo que recibo en el controller
		var usuarioForm = {};
		usuarioForm.user = this.formLogin.find("#userLogin").val();
		usuarioForm.password = this.formLogin.find("#passwordLogin").val();
		var url = this.urlContext+"/services/login";
		$.ajax({
			url : url,
			type : "POST",
			data:  JSON.stringify(usuarioForm),
			dataType : "json",
			contentType : "application/json;charset=UTF-8",
			success : $.proxy(this._procesarResultadoLogin, this),
			error : function() {
				alert("Error al obtener usuario");
			}
		});
	},
	
	_procesarResultadoLogin : function(data) {
		if (!data.error) {
			this.formLogin.dialog('close');
			this.userSession = data.usuarioSession;
			this._ocultarDivSesion();
		} else {
			this.validatesMap['login'].showErrors({"passwordLogin": data.message});
		}
	},
	
	_registerCallback : function() {
		var user = {};
		user.user = this.formRegister.find("#userRegister").val();
		user.pass = this.formRegister.find("#passwordRegister").val();
		user.email = this.formRegister.find("#email").val();
		user.isAdm = false;
		var url = this.urlContext+"/services/register";
		$.ajax({
			url : url,
			type : "POST",
			data:  JSON.stringify(user),
			dataType : "json",
			contentType : "application/json;charset=UTF-8",
			success : $.proxy(this._procesarResultadoRegister, this),
			error : function() {
				alert("Error al obtener usuario");
			}
		});
	},
	
	_procesarResultadoRegister : function(data) {
		if (!data.error) {
			this.formRegister.dialog('close');
			this.userSession = data.usuarioSession;
			this._ocultarDivSesion();

		} else {
			this.validatesMap['register'].showErrors({"password_again": data.message});
		}
	},
	
	_ocultarDivSesion: function() {
		if(this.userSession){
			this.element.find(".usuario-logueado").show();
			this.element.find(".usuario-noLogueado").hide();
			
		}else{
			this.element.find(".usuario-logueado").hide();
			this.element.find(".usuario-noLogueado").show();
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
