<%@ page import="utils.*, java.util.List" %>
<%

Type f=new Type(request.getParameter("nom_type"));
DatabaseUtils.insertObject("Type",f);
response.sendRedirect("index.jsp");
%>