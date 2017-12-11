<%@page import="br.com.dao.impl.TimesDAOImpl"%>
<%@page import="br.com.singleton.FactorySingleton"%>
<%@page import="br.com.dao.ITimesDAO"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="br.com.model.Times"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@include file="pgs/topo.jsp"%>

<%
	ITimesDAO tdao = new TimesDAOImpl();
	List<Times> lista = tdao.listarTodos();
	Times t = (Times) request.getAttribute("time");
	System.out.println(t.getNome());
%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="row">

				<!-- EXIBIÇÃO DA LISTA DE FUNCIONARIO -->
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bell fa-fw"></i> Lista de Funcionarios
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
											<th>Cidade</th>
											<th>Estádio</th>
											<th>Patrimônio</th>
											<th>Sócios</th>
											<th>Alterar</th>
											<th>Deletar</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="team" items="<%=lista%>">
											<tr>
												<td style="width: 8%">${team.id}</td>
												<td>${team.nome}</td>
												<td>${team.cidade}</td>
												<td>${team.estadio}</td>

												<td>R$ <fmt:formatNumber value="${team.patrimonio}"
														maxFractionDigits="2" /></td>
												<td>${team.qtdSocios}</td>
												<td><c:url value="timesServlet" var="alterar">
														<c:param name="acao" value="carregar" />
														<c:param name="codigo" value="${team.id}" />
													</c:url> <a href="${alterar}" class="btn btn-warning">Alterar</a></td>
												<td><c:url value="timesServlet" var="deletar">
														<c:param name="acao" value="excluir" />
														<c:param name="codigo" value="${team.id}" />
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
								<i class="fa fa-bell fa-fw"></i> Alterar Time
							</div>
							<!-- /.panel-heading -->
							<div class="panel-body">

								<form class="horizontal-form" action="timesServlet" method="post">
									<input type="hidden" name="acao" value="alterar">
									<section class="col-md-12">
										<input type="hidden" name="codigo" value="${time.id}"/>
										
										
										<label for="nome"> Nome </label> 
										<input class="form-control" name="nome" type="text" value="${time.nome}">
										<label for="cidade"> Cidade </label> 
										<input class="form-control" name="cidade" type="text" value="${time.cidade}">																				
										<label for="estadio"> Estádio:</label> 
										<input required class="form-control" name="estadio" type="text" value="${time.estadio }"> 
										<label for="patrimonio"> Patrimônio:</label>
										<input required class="form-control" name="patrimonio" type="text" value="${time.patrimonio }"> 
										<label for="dataFundacao">Data	de fundação: </label>
										<input class="form-control" name="dataFundacao" type="date" value="${time.dataFundacao }"> 
										<label for="socios"> Número de	Sócios Torcedores: </label>
										<input required class="form-control" min="0" name="qtdSocios" type="number" value="${time.qtdSocios }"> <br>
										
										<button type="submit" class="btn btn-warning">Alterar</button>
										<br>
										<br>										
										<a href="timesServlet?acao=listar" class="btn btn-default">Voltar</a>																				
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