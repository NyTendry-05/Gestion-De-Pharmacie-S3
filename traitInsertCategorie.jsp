<%@ page import="utils.*, java.util.List" %>
<%

Categorie c=new Categorie(request.getParameter("nom_categorie"));
DatabaseUtils.insertObject("Categorie",c);
response.sendRedirect("index.jsp");
%>