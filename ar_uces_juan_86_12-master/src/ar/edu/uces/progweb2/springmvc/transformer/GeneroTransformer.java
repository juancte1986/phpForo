package ar.edu.uces.progweb2.springmvc.transformer;

import org.springframework.stereotype.Component;

import ar.edu.uces.progweb2.springmvc.model.Genero;

@Component
public class GeneroTransformer {
	
	public Genero transformToGenero(Long idGenero){
		Genero genero = new Genero();
		genero.setId(idGenero);
		
		return genero;
	}

}
