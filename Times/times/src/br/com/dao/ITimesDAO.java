package br.com.dao;

import java.util.List;

import br.com.model.Times;

public interface ITimesDAO extends DAO<Times, Integer> {
	List<Times> listarTodos();
}
