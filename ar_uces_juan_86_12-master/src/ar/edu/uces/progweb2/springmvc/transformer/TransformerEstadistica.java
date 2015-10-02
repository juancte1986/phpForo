package ar.edu.uces.progweb2.springmvc.transformer;

import org.springframework.stereotype.Component;

import ar.edu.uces.progweb2.springmvc.dto.EstadisticasDTO;

@Component
public class TransformerEstadistica {

	public EstadisticasDTO transformarResult(Long numTemas, Long numRespuestas,
			Long numUsuarios, Long numJava, Long numNet, Long numPhp, Long numC) {
			EstadisticasDTO estadisticasDTO = new EstadisticasDTO();
			
			estadisticasDTO.setNumC(numC.toString());
			estadisticasDTO.setNumJava(numJava.toString());
			estadisticasDTO.setNumNet(numNet.toString());
			estadisticasDTO.setNumRespuestas(numRespuestas.toString());
			estadisticasDTO.setNumTemas(numTemas.toString());
			estadisticasDTO.setNumUsuarios(numUsuarios.toString());
			estadisticasDTO.setNumPhp(numPhp.toString());
			
			return estadisticasDTO;
	}

}
