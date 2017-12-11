<%@page import="br.com.control.ElencoServlet"%>
<%@page import="br.com.model.Elenco"%>
<%@page import="br.com.dao.impl.ElencoDAOImpl"%>
<%@page import="br.com.dao.IElencoDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="br.com.model.Times"%>
<%@page import="br.com.dao.impl.TimesDAOImpl"%>
<%@page import="br.com.dao.ITimesDAO"%>
<%@page import="br.com.singleton.FactorySingleton"%>
<%@page import="javax.persistence.EntityManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@include file="pgs/topo.jsp"%>

<%	
	IElencoDAO edao = new ElencoDAOImpl();
	ITimesDAO tdao = new TimesDAOImpl();
	List<Times> listaTimes = tdao.listarTodos();
%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="row">

				<!-- EXIBIÇÃO DA LISTA DE FUNCIONARIO -->
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bell fa-fw"></i> Lista de Elenco
							<form name="formTime" class="horizontal-form" action="elencoServlet" method="POST">
								<input type="hidden" name="acao" value="listar"/>
								<input name="codigo" type="hidden" value="${time.id }"/>	
								
								<select onchange="javascript:document.formTime.submit();" id="selectTime" name="time" class="form-control" >
								<option value="" >Selecione um time..</option>	
								<option value="0" >Listar todos</option>		
									<c:forEach items='<%= listaTimes %>' var="time">											
										<option value="${time.id}"> ${time.nome} </option>
									</c:forEach>																				
								</select>
							</form>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>#</th>
											<th>Nome</th>
											<th>Posição</th>
											<th>Alterar</th>
											<th>Deletar</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="elenco" items="${listaElenco }">
											<tr>
												<td style="width: 8%">${elenco.id}</td>
												<td>${elenco.nome}</td>
												<td>${elenco.posicao}</td>												
												<td><c:url value="elencoServlet" var="alterar">
														<c:param name="acao" value="carregar" />
														<c:param name="codigo" value="${elenco.id}" />
													</c:url> <a href="${alterar}" class="btn btn-warning">Alterar</a></td>
												<td><c:url value="elencoServlet" var="deletar">
														<c:param name="acao" value="excluir" />
														<c:param name="codigo" value="${elenco.id}" />
														<c:param name="time" value="0" />
													</c:url> <a href="${deletar}"
													onclick="return confirm ('Deseja excluir?')"
													class="btn btn-danger">Excluir</a></td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->

						</div>
						<!-- /.panel-body -->
					</div>
				</div>

				<!-- CADASTRO INDIVIDUAL DE FUNCIONARIO -->
				<div class="col-lg-4">
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-bell fa-fw"></i> Cadastrar Jogador
							</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<form class="horizontal-form" action="elencoServlet"
									method="post">
									<input type="hidden" name="acao" value="alterar">
									<section class="col-lg-12">
										<input type="hidden" name="codigo" value="${elenco.id}"/>
										<label for="nome"> Nome </label> 
										<input required	class="form-control" name="nome" type="text" value="${elenco.nome }"> 
										<label for="cidade"> Posição </label>
										<input required	class="form-control" name="posicao" type="text" value="${elenco.posicao }"> 
										<label for="estadio"> Time:</label> 
										<select required id="selectTime" name="time" class="form-control">
										<option value="" >Selecione um time..</option>		
											<c:forEach items='<%= listaTimes %>' var="time">											
												<option value="${time.id}"> ${time.nome} </option>
											</c:forEach>																				
										</select> <br>
										<button type="submit" class="btn btn-success">
											Alterar</button>
									</section>
								</form>
							</div>
							<!-- /.panel-body -->
						</div>
					</div>
				</div>

			</div>
			<!-- /.row -->


		</div>
	</div>
</div>
<%@include file="pgs/footer.jsp"%>