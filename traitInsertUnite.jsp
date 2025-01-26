<%@ page import="utils.*, java.util.List" %>
<%

Unite u=new Unite(request.getParameter("nom_unite"));
DatabaseUtils.insertObject("Unite",u);
response.sendRedirect("index.jsp");
%>