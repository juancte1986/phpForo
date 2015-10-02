package ar.edu.uces.progweb2.springmvc.transformer;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ar.edu.uces.progweb2.springmvc.dao.GeneroDao;
import ar.edu.uces.progweb2.springmvc.model.Genero;
import ar.edu.uces.progweb2.springmvc.model.Respuesta;
import ar.edu.uces.progweb2.springmvc.model.Tema;
import ar.edu.uces.progweb2.springmvc.model.Usuario;
import ar.edu.uces.progweb2.springmvc.modelView.TemaForm;

@Component
public class TemaTransformer {
	
	GeneroDao generoDao;
	
	@Autowired
	public void setGeneroDao(GeneroDao generoDao) {
		this.generoDao = generoDao;
	}
	
	public Tema transformToTema(TemaForm temaForm, Usuario usuario) {
		Tema tema = new Tema();
		tema.setOwner(usuario);
		tema.setTitulo(temaForm.getTitulo());
		tema.setEstado(temaForm.getEstado());
		tema.setPuntuacion(0);
		Genero genero = this.generoDao.get(new Long(1));
		tema.setGenero(genero);
		tema.setFecha(new Date());
		tema.setVisitas(0);
		tema.setRespuesta(this.crearRespueta(tema, temaForm.getRespuesta()));
		
		return tema;
	}
	
	private Respuesta crearRespueta(Tema tema, String texto){
		Respuesta respuesta = new Respuesta();
		respuesta.setDenuncia(0);
		respuesta.setFecha(tema.getFecha());
		respuesta.setMeGusta(0);
		respuesta.setSender(tema.getOwner());
		respuesta.setTema(tema);
		respuesta.setTexto(texto);
		
		return respuesta;
	}

}
