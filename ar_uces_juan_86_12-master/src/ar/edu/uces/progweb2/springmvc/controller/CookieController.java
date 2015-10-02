package ar.edu.uces.progweb2.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CookieController {
	
	@RequestMapping(value="iniciarCookie")
	public String iniciarCookie(){
		return"/views/cookie.jsp";
	}

}
