
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
<title>Listar</title>
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
			</tr>
	<% 
		}
	%>
	</table>
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
			</tr>
	<% 
		}
	%>
	</table>
	
	</div>
	<hr/>
	<hr/>
	<div class="container">
	<h2 style="text-align:center;">Saldo Final</h2>
	<hr/>
	<table class="table table-hover" style="background-color:#D3D3D3;">
		
	<%
		Receita r = new Receita();
		Despesa d = new Despesa();
		rdao.somarReceita(r);
		ddao.somarDespesa(d);
	%>
	
	<th style="text-align:center;">R$ <%= fmt.format(r.getValorSoma() - d.getValorSoma()) %></th>
	</table>
	</br>
	<div>
		<a href="#top" ><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-up-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 		 <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
		</svg> </a>
		</div>
		
		<div class="text-right">
		<a href="menu.jsp" class="btn btn-danger">Voltar</a>
		</div>
	<hr/>
	</div>
	



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>