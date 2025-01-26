<%@ page import="utils.*, java.util.List" %>
<%
int idT=Integer.parseInt(request.getParameter("id_toerana"));
Labo f=new Labo(request.getParameter("nom_labo"),idT);
DatabaseUtils.insertObject("Laboratoire",f);
response.sendRedirect("index.jsp");
%>