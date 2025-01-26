<%@ page import="utils.*, java.util.List" %>
<%
String nom=request.getParameter("nom_produit");
int id_forme=Integer.parseInt(request.getParameter("id_forme"));
int id_unite=Integer.parseInt(request.getParameter("id_unite"));
int id_categorie=Integer.parseInt(request.getParameter("id_categorie"));
int id_type=Integer.parseInt(request.getParameter("id_type"));
double prix_produit=Double.parseDouble(request.getParameter("prix_produit"));

Produit p=new Produit(nom,id_forme,id_unite,id_categorie,id_type,prix_produit);

p.insertProduct();
int idP=p.getIdMax();
String[] maladiesSelectionnees = request.getParameterValues("id_maladie");
if (maladiesSelectionnees != null) {
    for (String maladieIdStr : maladiesSelectionnees) {
        int idMaladie = Integer.parseInt(maladieIdStr); // Conversion de String à int
        Produit_maladie pm = new Produit_maladie(idP, idMaladie);
        DatabaseUtils.insertObject("produit_maladie", pm);
    }
}
response.sendRedirect("index.jsp");
%>