package ar.edu.uces.progweb2.springmvc.model;

import java.util.Date;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

public class Tema {
	
	private Long id;
	private Usuario owner;
	private String titulo;
	private EstadoTema estado;
	private Integer puntuacion;
	private Genero genero;
	@JsonIgnore
	private Respuesta respuesta;
	private Date fecha;
	private int visitas;

	public int getVisitas() {
		return visitas;
	}

	public void setVisitas(int visitas) {
		this.visitas = visitas;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Usuario getOwner() {
		return owner;
	}

	public void setOwner(Usuario owner) {
		this.owner = owner;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public EstadoTema getEstado() {
		return estado;
	}

	public void setEstado(EstadoTema estado) {
		this.estado = estado;
	}
	
	public Respuesta getRespuesta() {
		return respuesta;
	}

	public void setRespuesta(Respuesta respuesta) {
		this.respuesta = respuesta;
	}

	public Integer getPuntuacion() {
		return puntuacion;
	}

	public void setPuntuacion(Integer puntuacion) {
		this.puntuacion = puntuacion;
	}
	
	public Genero getGenero() {
		return genero;
	}

	public void setGenero(Genero genero) {
		this.genero = genero;
	}
	
	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
}
