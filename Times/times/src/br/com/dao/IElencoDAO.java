package br.com.dao;
import java.util.List;
import br.com.model.Elenco;

public interface IElencoDAO extends DAO<Elenco, Integer>{
	List<Elenco> listarTodos();
	List<Elenco> listarFiltrado(int idTime);
}