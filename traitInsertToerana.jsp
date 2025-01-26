<%@ page import="utils.*, java.util.List" %>
<%

Toerana f=new Toerana(request.getParameter("nom_toerana"));
DatabaseUtils.insertObject("Toerana",f);
response.sendRedirect("index.jsp");
%>