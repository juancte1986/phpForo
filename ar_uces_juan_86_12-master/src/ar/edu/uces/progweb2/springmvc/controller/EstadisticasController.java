package ar.edu.uces.progweb2.springmvc.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ar.edu.uces.progweb2.springmvc.bo.EstadisticaBO;
import ar.edu.uces.progweb2.springmvc.dto.EstadisticasDTO;

@Controller
public class EstadisticasController {
	
	EstadisticaBO estadisticaBO;
	
	@Autowired
	public void setEstadisticaBO(EstadisticaBO estadisticaBO) {
		this.estadisticaBO = estadisticaBO;
	}

	@RequestMapping(value = "/estadisticas", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> obtenerEstadisticas(){
		Map<String, Object> mapa = new HashMap<String, Object>();
		EstadisticasDTO estadisticasDTO = this.estadisticaBO.getEstadisticas();
		//falta una excepcion de negocio para devolver error en true  
	    mapa.put("estadisticasDTO",estadisticasDTO);
		return mapa;
	}
}
