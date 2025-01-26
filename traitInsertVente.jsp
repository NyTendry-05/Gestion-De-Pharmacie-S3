<%@ page import="utils.*, java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.sql.Date" %>
<%
int idP=Integer.parseInt(request.getParameter("id_produit"));
int idV=Integer.parseInt(request.getParameter("id_vendeur"));
int idC=Integer.parseInt(request.getParameter("id_client"));
int qtt=Integer.parseInt(request.getParameter("quantite"));

String moisString = request.getParameter("date");
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
LocalDate localDate = LocalDate.parse(moisString, formatter);
Date sqlDate = Date.valueOf(localDate);

Vente v=new Vente(sqlDate);
v.insertVente();
int idVente=v.getIdMax();
Vente_produit vp=new Vente_produit(idP,idVente,idC,idV,qtt);
DatabaseUtils.insertObject("Vente_produit",vp);

int idVenteProduit=vp.getIdMax();
Produit p = Produit.getById(idP);
if(p.getPrix_produit() * qtt >= 200000)
{
    double commission = Commission.calcul(5, p.getPrix_produit() * qtt);
    Commission com = new Commission(idV, commission, sqlDate, idVenteProduit);
    DatabaseUtils.insertObject("Commission",com);
}

out.print("p:"+idP+" v:"+idVente+" qt: "+qtt);
response.sendRedirect("index.jsp");
%>