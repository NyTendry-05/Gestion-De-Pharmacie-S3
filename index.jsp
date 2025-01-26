<%@ page import="utils.*, java.util.List" %>
<%
    List<Maladie> Maladies = DatabaseUtils.getAll("Maladie", Maladie.class);
    List<Type> Type = DatabaseUtils.getAll("Type", Type.class);
%>
<!doctype html>
<html lang="en">
<head>
    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Title -->
    <title>Mediplus - Formulaire</title>
    
    <!-- Favicon -->
    <link rel="icon" href="img/favicon.png">
    
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
                    <li class="nav-item"><a class="nav-link" href="produit_recommande.jsp">Produit_suggere</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- Form Section -->
<section class="py-5">
    <div class="container">
        <h1 class="mb-4">Selectionnez les details</h1>
        <form action="listeGeneralise.jsp" method="get">
            <div class="mb-3">
                <label for="maladie" class="form-label">Maladie</label>
                <select name="maladie" id="maladie" class="form-select">
                    <% for(Maladie maladie : Maladies) { %>
                        <option value="<%= maladie.getId_maladie() %>"><%= maladie.getNom_maladie() %></option>
                    <% } %>
                </select>
            </div>
            <div class="mb-3">
                <label for="type" class="form-label">Type</label>
                <select name="type" id="type" class="form-select">
                    <% for(Type type : Type) { %>
                        <option value="<%= type.getId_type() %>"><%= type.getNom_type() %></option>
                    <% } %>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Valider</button>
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
