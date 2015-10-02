package ar.edu.uces.progweb2.springmvc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.uces.progweb2.springmvc.model.Genero;
import ar.edu.uces.progweb2.springmvc.model.Tema;

@Transactional(readOnly = true)
@Component
public class TemaDao {
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Tema get(long id) {
		Session session = sessionFactory.getCurrentSession();
		Tema out = (Tema) session.get(Tema.class, id);
		return out;
	}
	
	@SuppressWarnings("unchecked")
	public List<Tema> listarTemas(Genero genero) {
		Session session = sessionFactory.getCurrentSession();
		org.hibernate.Query q = session.createQuery("FROM Tema t where t.genero.id = :genero_id"); 
		q.setParameter("genero_id", genero.getId());
		
		return q.list();
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void save(Tema Tema) {
		Session session = sessionFactory.getCurrentSession();
		session.save(Tema);
	}

	public Long countTemas() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Tema.class);
		return (Long) criteria.setProjection(Projections.rowCount()).uniqueResult();
	}

	public Long countTemasEspecifico(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Query q= session.createQuery("FROM Tema t where id_genero = :id");
		q.setParameter("id", id);
		return new Long(q.list().size());
	}
}
