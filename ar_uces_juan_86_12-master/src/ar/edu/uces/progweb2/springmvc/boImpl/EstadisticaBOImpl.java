package ar.edu.uces.progweb2.springmvc.boImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ar.edu.uces.progweb2.springmvc.bo.EstadisticaBO;
import ar.edu.uces.progweb2.springmvc.dao.RespuestaDao;
import ar.edu.uces.progweb2.springmvc.dao.TemaDao;
import ar.edu.uces.progweb2.springmvc.dao.UsuarioDao;
import ar.edu.uces.progweb2.springmvc.dto.EstadisticasDTO;
import ar.edu.uces.progweb2.springmvc.transformer.TransformerEstadistica;

@Component
public class EstadisticaBOImpl implements EstadisticaBO{
	
	private TemaDao temaDao;
	private RespuestaDao respuestaDao;
	private UsuarioDao usuarioDao;
	private TransformerEstadistica transformer;
	
	@Autowired
	public void setUsuarioDao(UsuarioDao usuarioDao) {
		this.usuarioDao = usuarioDao;
	}
	
	@Autowired
	public void setTemaDao(TemaDao temaDao) {
		this.temaDao = temaDao;
	}
	
	@Autowired
	public void setTransformer(TransformerEstadistica transformer) {
		this.transformer = transformer;
	}

	@Autowired
	public void setRespuestaDao(RespuestaDao respuestaDao) {
		this.respuestaDao = respuestaDao;
	}

	@Override
	public EstadisticasDTO getEstadisticas() {
		Long numTemas = this.temaDao.countTemas();
		Long numRespuestas = this.respuestaDao.countRespuestas();
		Long numUsuarios = this.usuarioDao.countUsuarios();
		Long numJava = this.temaDao.countTemasEspecifico(new Long("1"));
		Long numPhp = this.temaDao.countTemasEspecifico(new Long("2"));
		Long numNet = this.temaDao.countTemasEspecifico(new Long("3"));
		Long numC = this.temaDao.countTemasEspecifico(new Long("4"));
		
		return this.transformer.transformarResult(numTemas, numRespuestas, numUsuarios, numJava, numNet, numPhp, numC);
	}
}
