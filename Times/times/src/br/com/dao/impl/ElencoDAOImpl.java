package br.com.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import br.com.dao.IElencoDAO;
import br.com.model.Elenco;

public class ElencoDAOImpl extends DAOImpl<Elenco, Integer> implements IElencoDAO {

	public ElencoDAOImpl(EntityManager em) {
		super(em);
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Elenco> listarTodos() {
		TypedQuery<Elenco> query = em.createQuery(" from Elenco", Elenco.class);
		return query.getResultList();
	}

	@Override
	public List<Elenco> listarFiltrado(int idTime) {
		TypedQuery<Elenco> query = em.createQuery("FROM Elenco where idTime = "+ idTime , Elenco.class);
		return query.getResultList();
	}
	
	
}
