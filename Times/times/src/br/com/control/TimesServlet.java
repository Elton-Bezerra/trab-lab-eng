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

import br.com.dao.ITimesDAO;
import br.com.dao.impl.TimesDAOImpl;
import br.com.model.Times;
import br.com.singleton.FactorySingleton;

@WebServlet("/timesServlet")
public class TimesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EntityManager em = FactorySingleton.getInstance().createEntityManager();
	ITimesDAO tdao = new TimesDAOImpl(em);

	public TimesServlet() {
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
			retorno = "index.jsp";
			break;

		case "excluir":
			excluir(request);
			listar(request);// busca a lista
			retorno = "index.jsp";
			break;
		case "carregar":
			// abre a pagina com o formulario preenchido
			listar(request);
			carregar(request);
			retorno = "alterarTime.jsp";
			break;
		case "listar":
			listar(request);
			retorno = "index.jsp";
			break;
		case "alterar":
			try {
				alterar(request);
				listar(request);
				retorno = "index.jsp";
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
		System.out.println("Código: " + codigo);
		tdao.remove(codigo);
	}

	private void alterar(HttpServletRequest request) {
		Times t = new Times();

		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date data = null;
		try {
			data = formatter.parse(request.getParameter("dataFundacao"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.sql.Date sqlDate = new java.sql.Date(data.getTime());
		t.setId(Integer.parseInt(request.getParameter("codigo")));
		t.setNome(request.getParameter("nome"));
		t.setCidade(request.getParameter("cidade"));
		t.setEstadio(request.getParameter("estadio"));
		t.setPatrimonio(Double.parseDouble(request.getParameter("patrimonio")));
		t.setDataFundacao(sqlDate);		 
		t.setQtdSocios(Integer.parseInt(request.getParameter("qtdSocios")));

		tdao.update(t);
	}

	private void listar(HttpServletRequest request) {

		List<Times> lista = tdao.listarTodos();
		request.setAttribute("listaTimes", lista);

	}
	

	private void carregar(HttpServletRequest req) {
		// TODO Auto-generated method stub
		int codigo = Integer.parseInt(req.getParameter("codigo"));
		Times time = new Times();
		time = tdao.searchById(codigo);

		// coloca o chalé no request
		req.setAttribute("time", time);
	}
	
	
	@SuppressWarnings("deprecation")
	private void cadastrar(HttpServletRequest request) {
		Times t = new Times();
		
		
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date data = null;
		try {
			data = formatter.parse(request.getParameter("dataFundacao"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.sql.Date sqlDate = new java.sql.Date(data.getTime());
		
		t.setNome(request.getParameter("nome"));
		t.setCidade(request.getParameter("cidade"));
		t.setEstadio(request.getParameter("estadio"));
		t.setPatrimonio(Double.parseDouble(request.getParameter("patrimonio")));
		t.setDataFundacao(sqlDate);		 
		t.setQtdSocios(Integer.parseInt(request.getParameter("qtdSocios")));
		 
		tdao.insert(t);
	}

}
