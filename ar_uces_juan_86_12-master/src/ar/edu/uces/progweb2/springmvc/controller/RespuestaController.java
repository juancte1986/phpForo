package ar.edu.uces.progweb2.springmvc.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import ar.edu.uces.progweb2.springmvc.dao.RespuestaDao;
import ar.edu.uces.progweb2.springmvc.dao.TemaDao;
import ar.edu.uces.progweb2.springmvc.model.Respuesta;
import ar.edu.uces.progweb2.springmvc.model.Tema;
import ar.edu.uces.progweb2.springmvc.model.Usuario;

@SessionAttributes({"usuarioSession"})
@Controller
public class RespuestaController {

	private TemaDao temaDao;
	private RespuestaDao respuestaDao;

	@Autowired
	public void setTemaDao(TemaDao temaDao) {
		this.temaDao = temaDao;
	}
	@Autowired
	public void setRespuestaDao(RespuestaDao respuestaDao){
		this.respuestaDao = respuestaDao;
	}

	@RequestMapping(value ="/respuesta/{id}", method = RequestMethod.GET)
	public String listarRespuestas(@PathVariable long id, ModelMap model){
		List<Respuesta> respuestas = this.respuestaDao.listarRespuestas(id);
		ObjectMapper mapper = new ObjectMapper();
		String json="";
		try {
			json = mapper.writeValueAsString(respuestas);
			if(respuestas != null){
				model.addAttribute("idGenero",respuestas.get(0).getTema().getGenero().getId());
			}
			model.addAttribute("idTema", id);
			model.addAttribute("respuestas", json);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
		
		return "/views/respuesta.jsp";
	}
	
	@RequestMapping(value = "/cargarRespuesta/{id}", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> cargarRespuesta(@PathVariable Long id, @RequestBody String texto, ModelMap model){
		Usuario usuario = (Usuario) model.get("usuarioSession");
		Tema tema = this.temaDao.get(id);
		texto = texto.substring(1, texto.length()-1);
		texto = texto.replace("\"","'");
		texto = texto.replace("\\","");
		this.crearRespueta(tema, texto, usuario);
		List<Respuesta> respuestas = this.respuestaDao.listarRespuestas(id);
		Map<String, Object> mapa= new HashMap<String, Object>();
		mapa.put("respuestas", respuestas);
		
		return mapa;
	}
	
	private void crearRespueta(Tema tema, String texto, Usuario usuario ){
		Respuesta respuesta = new Respuesta();
		respuesta.setDenuncia(0);
		respuesta.setFecha(new Date());
		respuesta.setMeGusta(0);
		respuesta.setSender(usuario);
		respuesta.setTema(tema);
		respuesta.setTexto(texto);
		this.respuestaDao.save(respuesta);
	}
	
}
