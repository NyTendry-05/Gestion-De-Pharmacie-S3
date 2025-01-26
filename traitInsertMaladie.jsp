<%@ page import="utils.*, java.util.List" %>
<%

Maladie m=new Maladie(request.getParameter("nom_maladie"));
DatabaseUtils.insertObject("Maladie",m);
response.sendRedirect("index.jsp");
%>