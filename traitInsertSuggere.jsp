<%@ page import="utils.*, java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.sql.Date" %>
<%
    int id_produit = Integer.parseInt(request.getParameter("id_produit"));
    String moisString = request.getParameter("mois");
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDate localDate = LocalDate.parse(moisString, formatter);
    Date sqlDate = Date.valueOf(localDate);
    ProduitSuggered pds = new ProduitSuggered(id_produit, sqlDate);
    pds.insertProductSuggere();

    response.sendRedirect("produit_recommande.jsp");
%>