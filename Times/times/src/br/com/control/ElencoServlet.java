package br.com.control;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.dao.IElencoDAO;
import br.com.dao.ITimesDAO;
import br.com.dao.impl.ElencoDAOImpl;
import br.com.dao.impl.TimesDAOImpl;
import br.com.model.Elenco;
import br.com.model.Times;
import br.com.singleton.FactorySingleton;

@WebServlet("/elencoServlet")
public class ElencoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IElencoDAO edao = new ElencoDAOImpl();
	ITimesDAO tdao = new TimesDAOImpl();

	public ElencoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String retorno = "";
		String acao = request.getParameter("acao");

		switch (acao) {
		case "cadastrar":
			cadastrar(request);
			listar(request);
			retorno = "elenco.jsp";
			break;

		case "excluir":
			excluir(request);
			listar(request);// busca a lista
			retorno = "elenco.jsp";
			break;
		case "carregar":
			// abre a pagina com o formulario preenchido
			listar(request);
			carregar(request);
			retorno = "alterarElenco.jsp";
			break;
		case "listar":
			listar(request);
			retorno = "elenco.jsp";
			break;	
		case "alterar":
			try {
				alterar(request);				
				listar(request);
				retorno = "elenco.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}

			break;
		}

		request.getRequestDispatcher(retorno).forward(request, response);
	}

	private void excluir(HttpServletRequest req) {
		// TODO Auto-generated method stub
		int codigo = Integer.parseInt(req.getParameter("codigo"));
		edao.remove(codigo);
	}

	private void alterar(HttpServletRequest request) {
		Elenco e = new Elenco();
		System.out.println(request.getParameter("codigo"));
		e.setId(Integer.parseInt(request.getParameter("codigo")));
		e.setNome(request.getParameter("nome"));
		e.setPosicao(request.getParameter("posicao"));
		e.setTime(tdao.searchById(Integer.parseInt(request.getParameter("time"))));
		edao.update(e);
	}

	private void listar(HttpServletRequest request) {
		
		if(Integer.parseInt(request.getParameter("time")) == 0){
			List<Elenco> lista = edao.listarTodos();
			request.setAttribute("listaElenco", lista);	
		} else {			
			List<Elenco> lista = edao.listarFiltrado(Integer.parseInt(request.getParameter("time")));
			request.setAttribute("listaElenco", lista);		
		}
	}
	

	private void carregar(HttpServletRequest req) {
		// TODO Auto-generated method stub
		int codigo = Integer.parseInt(req.getParameter("codigo"));
		Elenco elenco = new Elenco();
		elenco = edao.searchById(codigo);

		// coloca o chalé no request
		req.setAttribute("elenco", elenco);
	}
	
	
	private void cadastrar(HttpServletRequest request) {
		Elenco e = new Elenco();
		
		e.setNome(request.getParameter("nome"));
		e.setPosicao(request.getParameter("posicao"));
		e.setTime(tdao.searchById(Integer.parseInt(request.getParameter("time"))));
		 
		edao.insert(e);
	}

}
