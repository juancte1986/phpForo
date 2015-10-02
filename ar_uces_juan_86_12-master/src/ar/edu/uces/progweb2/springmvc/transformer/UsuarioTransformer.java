package ar.edu.uces.progweb2.springmvc.transformer;

import ar.edu.uces.progweb2.springmvc.model.Usuario;
import ar.edu.uces.progweb2.springmvc.modelView.UsuarioForm;

public class UsuarioTransformer {
	
	public Usuario transformToUsuario(UsuarioForm usuarioForm){
		Usuario usuario = new Usuario();
		usuario.setUser(usuarioForm.getUser());
		usuario.setPass(usuarioForm.getPassword());
		return usuario;
	}
}
