<%@ page import="utils.*, java.util.List" %>
<%
    List<Forme> formes = DatabaseUtils.getAll("Forme", Forme.class);
    List<Unite> unites = DatabaseUtils.getAll("Unite", Unite.class);
    List<Categorie> categories = DatabaseUtils.getAll("Categorie", Categorie.class);
    List<Type> types = DatabaseUtils.getAll("Type_produit", Type.class);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacie - Ajouter Produit</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="asset/style.css">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a href="insertForme.html" class="navbar-brand">Forme</a>
            <a href="insertUnite.html" class="nav-link">Unite</a>
            <a href="insertCategorie.html" class="nav-link">Categorie</a>
            <a href="insertDosage.html" class="nav-link">Dosage</a>
            <a href="insertMaladie.html" class="nav-link">Maladie</a>
            <a href="insertToerana.html" class="nav-link">Toerana</a>
            <a href="insertTypeProduit.html" class="nav-link">Type Produit</a>
            <a href="insertLabo.jsp" class="nav-link">Labo</a>
            <a href="insertProduit.jsp" class="nav-link">Produits</a>
        </div>
    </nav>

    <!-- Form Section -->
    <div class="container form-container">
        <h1>Ajouter un Produit</h1>
        <form action="traitInsertProduit.jsp" method="get" class="row g-3">
            <div class="col-md-6">
                <label for="nom_produit" class="form-label">Nom du Produit</label>
                <input type="text" name="nom_produit" id="nom_produit" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label for="id_forme" class="form-label">Forme</label>
                <select name="id_forme" id="id_forme" class="form-select" required>
                    <option value="">Sélectionnez une Forme</option>
                    <% for (Forme forme : formes) { %>
                        <option value="<%= forme.getId_forme() %>"><%= forme.getNom_forme() %></option>
                    <% } %>
                </select>
            </div>
            <div class="col-md-6">
                <label for="id_unite" class="form-label">Unité</label>
                <select name="id_unite" id="id_unite" class="form-select" required>
                    <option value="">Sélectionnez une Unité</option>
                    <% for (Unite unite : unites) { %>
                        <option value="<%= unite.getId_unite() %>"><%= unite.getNom_unite() %></option>
                    <% } %>
                </select>
            </div>
            <div class="col-md-6">
                <label for="id_categorie" class="form-label">Catégorie</label>
                <select name="id_categorie" id="id_categorie" class="form-select" required>
                    <option value="">Sélectionnez une Catégorie</option>
                    <% for (Categorie category : categories) { %>
                        <option value="<%= category.getId_categorie() %>"><%= category.getNom_categorie() %></option>
                    <% } %>
                </select>
            </div>
            <div class="col-md-6">
                <label for="id_type" class="form-label">Type</label>
                <select name="id_type" id="id_type" class="form-select" required>
                    <option value="">Sélectionnez un Type</option>
                    <% for (Type type : types) { %>
                        <option value="<%= type.getId_type() %>"><%= type.getNom_type() %></option>
                    <% } %>
                </select>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Ajouter Produit</button>
            </div>
        </form>
    </div>

    <!-- Footer -->
    <footer>
        &copy; 2025 - Gestion de Pharmacie
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
