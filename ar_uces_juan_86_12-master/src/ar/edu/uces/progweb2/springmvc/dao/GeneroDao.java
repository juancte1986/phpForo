package ar.edu.uces.progweb2.springmvc.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.uces.progweb2.springmvc.model.Genero;

@Transactional(readOnly = true)
@Component
public class GeneroDao {
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Genero get(long id) {
		Session session = sessionFactory.getCurrentSession();
		Genero genero = (Genero) session.get(Genero.class, id);
		return genero;
	}

}
