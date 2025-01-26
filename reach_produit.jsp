<%@ page import="utils.*, java.util.List" %>
<%
    List<Forme> formes = DatabaseUtils.getAll("Forme", Forme.class);
    List<Type> types = DatabaseUtils.getAll("Type", Type.class);
    List<Maladie> maladie = DatabaseUtils.getAll("Maladie", Maladie.class);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recherche des Produits</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/table.css">
</head>
<body>

<header class="header">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="index.jsp"><img src="img/logo.png" alt="Logo"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- Form Section -->
<section class="py-5">
    <div class="container">
        <h1 class="mb-4">Ajouter un Produit</h1>
        <form action="listProduit.jsp" method="get">
            <div class="mb-3">
                <label for="id_forme" class="form-label">Forme</label>
                <select name="id_forme" id="id_forme" class="form-select">
                    <option>Forme</option>
                    <% for (Forme forme : formes) { %>
                        <option value="<%= forme.getId_forme() %>"><%= forme.getNom_forme() %></option>
                    <% } %>
                </select>
            </div>

            <div class="mb-3">
                <label for="id_type" class="form-label">Type</label>
                <select name="id_type" id="id_type" class="form-select">
                    <option>Type</option>
                    <% for (Type type : types) { %>
                        <option value="<%= type.getId_type() %>"><%= type.getNom_type() %></option>
                    <% } %>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Rechercher</button>
        </form>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white py-3">
    <div class="container text-center">
        &copy; 2025 - Gestion de Pharmacie
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
