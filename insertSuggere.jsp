<%@ page import="utils.*, java.util.List" %>
<%
    List<Produit> products = DatabaseUtils.getAll("Produits", Produit.class);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Produits</title>
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
                    <li class="nav-item"><a class="nav-link" href="insertForme.html">Forme</a></li>
                    <li class="nav-item"><a class="nav-link" href="insertUnite.html">Unite</a></li>
                    <li class="nav-item"><a class="nav-link" href="insertMaladie.html">Maladie</a></li>
                    <li class="nav-item"><a class="nav-link" href="insertToerana.html">Toerana</a></li>
                    <li class="nav-item"><a class="nav-link" href="insertTypeProduit.html">Type Produit</a></li>
                    <li class="nav-item"><a class="nav-link" href="insertLabo.jsp">Labo</a></li>
                    <li class="nav-item"><a class="nav-link" href="insertProduit.jsp">Produits</a></li>
                    <li class="nav-item"><a class="nav-link" href="insertVente.jsp">Vente</a></li>
                    <li class="nav-item"><a class="nav-link" href="produit_recommande.jsp">Produit_suggere</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- Form Section -->
<section class="py-5">
    <div class="container">
        <h1 class="mb-4">Suggestion</h1>

        <form id="venteForm" action="traitInsertSuggere.jsp">
            <div class="mb-3">
                <label for="id_produit" class="form-label">Produit</label>
                <select name="id_produit" id="id_produit" class="form-select">
                    <option value="" disabled selected>Choisir un produit</option>
                    <% for (Produit p : products) { %>
                        <option value="<%= p.getId_produit() %>"><%= p.getNom_produit() %></option>
                    <% } %>
                </select>
            </div>
            
            <div class="mb-3">
                <label for="mois" class="form-label">Mois</label>
                <input type="date" name="mois" id="">
            </div>

            <input type="submit" value="valider">
        </form>
    </div>
</section>

<footer class="footer bg-light py-3 text-center">
    <div class="container">
        <p>© 2025 Mediplus. All Rights Reserved.</p>
    </div>
</footer>



<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
