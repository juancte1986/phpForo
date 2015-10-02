package ar.edu.uces.progweb2.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import ar.edu.uces.progweb2.springmvc.dao.UsuarioDao;
import ar.edu.uces.progweb2.springmvc.model.Usuario;
import ar.edu.uces.progweb2.springmvc.modelView.FormRegister;
import ar.edu.uces.progweb2.springmvc.modelView.UsuarioForm;
import ar.edu.uces.progweb2.springmvc.transformer.UsuarioTransformer;
import ar.edu.uces.progweb2.springmvc.validator.LoginValidator;

@SessionAttributes("usuarioSession")
@Controller
public class UsuarioController {

	private UsuarioDao usuarioDao;
	private LoginValidator loginValidator;
	
	@Autowired
	public void setUsuarioDao(UsuarioDao usuarioDao) {
		this.usuarioDao = usuarioDao;
	}
	
	@Autowired
	public void setLoginValidator(LoginValidator loginValidator) {
		this.loginValidator = loginValidator;
	}
	
	@RequestMapping(value = "/login")
	public String iniciarSesion (ModelMap model) {
		model.addAttribute("usuarioForm", new UsuarioForm());
		return "/views/login.jsp";
	}

	@RequestMapping(value = "/procesarLogin", method = RequestMethod.POST)
	public String procesarFormUsuario (@ModelAttribute("usuarioForm") UsuarioForm usuarioForm, ModelMap model, BindingResult result ) {
		this.loginValidator.validate(usuarioForm, result);
		if (result.hasErrors()) {
			return "/views/login.jsp";
		}
		UsuarioTransformer transformer = new UsuarioTransformer();
		Usuario usuario = this.usuarioDao.buscarUsuario(transformer.transformToUsuario(usuarioForm));
		if(usuario == null){
			model.addAttribute("errorLogin", true);
			return "/views/login.jsp";
		}
		model.addAttribute("usuarioSession", usuario);
		return "/views/menu.jsp";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model, SessionStatus status) {
		status.setComplete();
		model.remove("usuarioSession");
		model.addAttribute("usuarioForm", new UsuarioForm());
		return "/views/login.jsp";
	}
	
	@RequestMapping(value = "/procesarRegister")
	public String inicarrRegister(ModelMap model) {
		model.addAttribute("formRegister",new FormRegister());
		return "/views/register.jsp";
	}
	
	@RequestMapping(value = "/procesarRegister", method = RequestMethod.POST)
	public String procesarRegister(@ModelAttribute("formRegister") FormRegister formRegister, ModelMap model) {
//		if(this.usuarioDao.isUserDisponible(formRegister)){
//			this.usuarioDao.save(formRegister);
//			
//		}else{
//		}
//		return "login.htm";
		return null;
	}

}
