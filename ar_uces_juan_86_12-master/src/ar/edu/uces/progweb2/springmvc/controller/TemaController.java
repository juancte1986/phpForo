package ar.edu.uces.progweb2.springmvc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import ar.edu.uces.progweb2.springmvc.dao.GeneroDao;
import ar.edu.uces.progweb2.springmvc.dao.TemaDao;
import ar.edu.uces.progweb2.springmvc.model.Tema;
import ar.edu.uces.progweb2.springmvc.model.Usuario;
import ar.edu.uces.progweb2.springmvc.modelView.TemaForm;
import ar.edu.uces.progweb2.springmvc.transformer.GeneroTransformer;
import ar.edu.uces.progweb2.springmvc.transformer.TemaTransformer;

@SessionAttributes({"usuarioSession"})
@Controller
public class TemaController {

	private TemaDao temaDao;
	private TemaTransformer temaTransformer;

	@Autowired
	public void setTemaDao(TemaDao temaDao) {
		this.temaDao = temaDao;
	}
	
	@Autowired
	public void setTemaTranformer(TemaTransformer temaTransformer) {
		this.temaTransformer = temaTransformer;
	}

	@RequestMapping(value = "/listarTemas", method = RequestMethod.GET)
	public String listarTemas(ModelMap model, @RequestParam("idGenero")Long idGenero){
		GeneroTransformer transformer = new GeneroTransformer();
		List<Tema> temas = this.temaDao.listarTemas(transformer.transformToGenero(idGenero));
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			String json = mapper.writeValueAsString(temas);
			model.addAttribute("temas", json);
			model.addAttribute("idGenero",idGenero);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
		return "/views/tema.jsp";
	}

	@RequestMapping(value = "/nuevoTema", method = RequestMethod.POST)
	public @ResponseBody Map<String, List<Tema>> crearTema(@RequestBody TemaForm temaForm, ModelMap model ){
		Usuario usuario = (Usuario) model.get("usuarioSession");
		this.temaDao.save(this.temaTransformer.transformToTema(temaForm, usuario));
		GeneroTransformer transformer2 = new GeneroTransformer();
		List<Tema> temas = this.temaDao.listarTemas(transformer2.transformToGenero(temaForm.getIdGenero()));
		HashMap<String, List<Tema>> mapa = new HashMap<String,List<Tema>>();
		mapa.put("temas", temas);
		
		return mapa;
	}
}
