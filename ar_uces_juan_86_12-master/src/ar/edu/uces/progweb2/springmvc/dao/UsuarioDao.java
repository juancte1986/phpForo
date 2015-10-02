package ar.edu.uces.progweb2.springmvc.dao;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.uces.progweb2.springmvc.model.Tema;
import ar.edu.uces.progweb2.springmvc.model.Usuario;

@Transactional(readOnly = false)
@Component
public class UsuarioDao {

	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Usuario get(long id) {
		Session session = sessionFactory.getCurrentSession();
		Usuario out = (Usuario) session.get(Usuario.class, id);
		return out;
	}

	public Usuario buscarUsuario(Usuario usuario){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Usuario u where u.user=:user and u.pass=:pass");
		query.setParameter("user", usuario.getUser());
		query.setParameter("pass", usuario.getPass());
		return (Usuario) query.uniqueResult();
	}
	
	public boolean isUserDisponible(Usuario usuario){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Usuario u where u.user=:user");
		query.setParameter("user", usuario.getUser());
		 if(query.uniqueResult() != null){
			return false; 
		}else{
			return true;
		}
	}

	public void save(Usuario usuario) {
		Session session = sessionFactory.getCurrentSession();
		session.save(usuario);
	}

	public Long countUsuarios() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		return (Long) criteria.setProjection(Projections.rowCount()).uniqueResult();
	}
}	
