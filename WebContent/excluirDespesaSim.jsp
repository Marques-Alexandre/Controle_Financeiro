<%@page import="banco_de_dados.DespesaDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Excluir despesa</title>
</head>
<body>
	<% 
		int id = Integer.parseInt(request.getParameter("id"));
		DespesaDao ddao = new DespesaDao();
		ddao.excluir(id);
		response.sendRedirect("index.jsp");
		
	%>

</body>
</html>