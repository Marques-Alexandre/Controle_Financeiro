<%@page import="pojo.Despesa"%>
<%@page import="banco_de_dados.DespesaDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body style="background-color: #F0FFF0;">
<div class="container">
	<hr/>
	
	 <h1 class="display-4" style="text-align:center;">Cadastro de Despesas</h1>
	<hr/>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		DespesaDao ddao = new DespesaDao();
		Despesa d = ddao.consultar(id);
	%>
	<form action="salvarDespesa.jsp" method="post">
		<input type="hidden" name="iddespesa" value="<%= d.getIdDespesa() %>" />
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">Descrição</span>
		  </div>
		  <input type="text" name="descricao" value="<%= d.getDescricao() %>"class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">  
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">Data</span>
		  </div>
		  <input type="Date" name="dataDespesa" value="<%= d.getData() %>"class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">Tipo</span>
		  </div>
		  <input type="text" name="tipo" value="<%= d.getTipo() %>" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">Valor</span>
		  </div>
		  <input type="number" name="valor" value="<%= d.getValor() %>"class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		</div>
		
		<div class="text-center">
		<input class="btn btn-success" type="submit" value="Salvar"/> &nbsp &nbsp &nbsp
		<a href=index.jsp  class="btn btn-danger">Cancelar</a>	
		</div>
		<hr/>
	</form>
	<br/><br/><br/><br/>
	<hr/>
	<div class="text-center">
		<h6><i>Sistema de Controle Financeiro</i></h6>
	</div>
	<hr/>
	
	</div>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>