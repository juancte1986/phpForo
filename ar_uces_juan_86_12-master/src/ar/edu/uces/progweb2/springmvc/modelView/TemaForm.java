package ar.edu.uces.progweb2.springmvc.modelView;

import ar.edu.uces.progweb2.springmvc.model.EstadoTema;
import ar.edu.uces.progweb2.springmvc.model.Usuario;

public class TemaForm {
	
	private String titulo;
	private String respuesta;
	private Long idGenero;
	private EstadoTema estado;
	
	public EstadoTema getEstado() {
		return estado;
	}
	public void setEstado(EstadoTema estado) {
		this.estado = estado;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getRespuesta() {
		return respuesta;
	}
	public void setRespuesta(String respuesta) {
		this.respuesta = respuesta;
	}
	public Long getIdGenero() {
		return idGenero;
	}
	public void setIdGenero(Long idGenero) {
		this.idGenero = idGenero;
	}
	
	
}
