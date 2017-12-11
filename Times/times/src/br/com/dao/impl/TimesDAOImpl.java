package br.com.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.dao.ITimesDAO;
import br.com.model.Times;

public class TimesDAOImpl extends DAOImpl<Times, Integer> implements ITimesDAO {

	public TimesDAOImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Times> listarTodos() {
		TypedQuery<Times> query = em.createQuery(" from Times", Times.class);
		return query.getResultList();
	}

}
