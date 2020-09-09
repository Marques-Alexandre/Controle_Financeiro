<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="banco_de_dados.*" %> 
<%@ page import="pojo.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
		int id = Integer.parseInt(request.getParameter("id"));
		ReceitaDao rdao = new ReceitaDao();
		rdao.excluir(id);
		response.sendRedirect("index.jsp");
	%>

</body>
</html>