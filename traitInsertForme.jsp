<%@ page import="utils.*, java.util.List" %>
<%

Forme f=new Forme(request.getParameter("nom_forme"));
DatabaseUtils.insertObject("Forme",f);
response.sendRedirect("index.jsp");
%>