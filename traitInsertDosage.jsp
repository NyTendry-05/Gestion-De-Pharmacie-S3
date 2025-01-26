<%@ page import="utils.*, java.util.List" %>
<%
double v = Double.parseDouble(request.getParameter("dosage"));
Dosage d=new Dosage(v);
DatabaseUtils.insertObject("Dosage",d);
response.sendRedirect("index.jsp");
%>