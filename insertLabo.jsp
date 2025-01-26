<%@ page import="utils.*, java.util.List" %>
<%
    List<Forme> formes = DatabaseUtils.getAll("Forme", Forme.class);
    List<Unite> unites = DatabaseUtils.getAll("Unite", Unite.class);
    List<Categorie> categorie = DatabaseUtils.getAll("Categorie", Categorie.class);
    List<Type> types = DatabaseUtils.getAll("Type", Type.class);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="traitInsertProduit.jsp" method="get">
        <input type="text" name="nom_produit">
        
        <select name="id_toerana">
            <option value="">Forme</option>
            <% 
                for (Forme forme : formes) { 
            %>
                <option value="<%= forme.getId_Forme() %>"><%= forme.getNom_toerana() %></option>
            <% 
                } 
            %>
        </select>

        <select name="id_unite">
            <option value="">Unité</option>
            <% 
                for (Unite unite : unites) { 
            %>
                <option value="<%= unite.getId_Unite() %>"><%= unite.getNom_Unite() %></option>
            <% 
                } 
            %>
        </select>

        <select name="id_categorie">
            <option value="">Catégories</option>
            <% 
                for (Categorie category : categorie) { 
            %>
                <option value="<%= category.getId_Categorie() %>"><%= category.getNom_Categorie() %></option>
            <% 
                } 
            %>
        </select>

        <select name="id_type">
            <option value="">Type</option>
            <% 
                for (Type type : types) { 
            %>
                <option value="<%= type.getId_Type() %>"><%= type.getNom_Type() %></option>
            <% 
                } 
            %>
        </select>

        <input type="submit">
    </form>
</body>
</html>
