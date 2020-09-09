
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="banco_de_dados.*" %> 
<%@ page import="pojo.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body style="background-color: #F0FFF0;">
	
	<div class="container">
	<hr/>

	<h1 style="text-align:center;">Receitas </h1>
	<hr/>
	
	<table class="table table-hover" style="background-color: #98FB98;"> 
		<thead class="thead-dark">
		<th>Descrição</th>
		<th>Data da receita</th>
		<th>Tipo</th>
		<th>Valor</th>
		<th></th>
		<th></th>
		</thead>
	
	<%
		DecimalFormat fmt = new DecimalFormat("###0.00");
	
		ReceitaDao rdao = new ReceitaDao();
		for (Receita r: rdao.listar()) {
	%>
			<tr>
			
				<td><%= r.getDescricao() %></td>
				<td><%= r.getData().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %></td>
				<td><%= r.getTipo() %></td>
				<td>R$ <%= fmt.format(r.getValor()) %></td>
				<td><a style="color: #0000FF" href="cadastroReceita.jsp?id=<%= r.getIdReceita() %>">Alterar <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5L13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175l-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
</svg></a>
				<td><a style="color: #0000FF" href="excluirReceita.jsp?id=<%= r.getIdReceita() %>">Excluir <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
</svg></a>
			</tr>
	<% 
		}
	%>
	</table>
	
	<div class="text-right">
		<a href="cadastroReceita.jsp?id=0" class="btn btn-primary">Cadastrar Receita</a>
	</div>
	</div>
	
	<hr/>
	<hr/>
	<div class="container">
	
	<h1 style="text-align:center;">Despesas</h1>
	<hr/>


	<table class="table table-hover" style="background-color:#FFA07A;">
		<thead class="thead-dark">
		<th>Descrição</th>
		<th>Data da despesa</th>
		<th>Tipo</th>
		<th>Valor</th>
		<th></th>
		<th></th>
		</thead>
	
	<%
		DecimalFormat fmt2 = new DecimalFormat("###0.00");
	
		DespesaDao ddao = new DespesaDao();
		for (Despesa d: ddao.listar()) {
	%>
			<tr>
				<td><%= d.getDescricao() %></td>
				<td><%= d.getData().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %></td>
				<td><%= d.getTipo() %></td>
				<td>R$ <%= fmt.format(d.getValor()) %></td>
				<td><a style="color: #0000FF" href="cadastroDespesa.jsp?id=<%= d.getIdDespesa() %>">Alterar <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5L13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175l-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
</svg></a>
				<td><a style="color: #0000FF" href="excluirDespesa.jsp?id=<%= d.getIdDespesa() %>">Excluir <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
</svg></a>
			</tr>
	<% 
		}
	%>
	</table>
	
	<div class="text-right">
		<a href="cadastroDespesa.jsp?id=0" class="btn btn-primary">Cadastrar Despesa</a>
	</div> <br/>
		<div>
		<a href="#top" ><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-up-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 		 <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
		</svg> </a>
		</div>

		<div class="text-center">
		<a href="menu.jsp" class="btn btn-danger">Voltar</a>
		</div>
		<hr/>
		
	</div>
	



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>