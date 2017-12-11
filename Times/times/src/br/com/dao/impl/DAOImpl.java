package br.com.dao.impl;

import java.lang.reflect.ParameterizedType;

import javax.persistence.EntityManager;

import br.com.dao.DAO;

public class DAOImpl<T,K> implements DAO<T,K> {
	
	protected EntityManager em;
    protected Class<T> classe;

    @SuppressWarnings("unchecked")
    public DAOImpl(EntityManager em) {
        em = FactorySingleton.getInstance().createEntityManager();
        classe = (Class<T>) ((ParameterizedType) getClass()
                .getGenericSuperclass())
                .getActualTypeArguments()[0];
    }

	@Override
	public void insert(T entity){
		// TODO Auto-generated method stub
		try {
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            // TODO: handle exception
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
        }
	}

	@Override
	public void update(T entity){
		// TODO Auto-generated method stub
		try {
            em.getTransaction().begin();
            em.merge(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            // TODO: handle exception
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
        }
	}

	@Override
	public void remove(K id){
		// TODO Auto-generated method stub
		T t = searchById(id);

        if (t == null) {
            throw new NullPointerException("Entidade não Encontrada");
        }

        try {

            em.getTransaction().begin();
            em.remove(t);
            em.getTransaction().commit();
        } catch (Exception e) {
            // TODO: handle exception
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
        }
	}

	@Override
	public T searchById(K id) {
		// TODO Auto-generated method stub
		return em.find(classe, id);
	}

}
