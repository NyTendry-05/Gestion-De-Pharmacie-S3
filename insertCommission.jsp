<%@ page import="utils.*, java.util.List" %>
<%
    
    List<Vendeur> vendeurs = DatabaseUtils.getAll("Vendeur", Vendeur.class);
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
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- Form Section -->
<section class="py-5">
    <div class="container">
        <h1 class="mb-4">Commission</h1>

        <form id="venteForm" action="listCommission.jsp">
            <div class="mb-3">
                
                <label for="id_vendeur" class="form-label">Vendeur</label>
                <select name="id_vendeur" id="id_vendeur" class="form-select">
                    <option value="" disabled selected>Choisir un vendeur</option>
                    <% for (Vendeur p : vendeurs) { %>
                        <option value="<%= p.getId_vendeur() %>"><%= p.getNom_vendeur() %></option>
                    <% } %>
                </select>
                <label for="">Date_debut</label>
                <input type="date" name="date1" id="" class="form-select">
                <label for="">Date_fin</label>
                <input type="date" name="date2" id="" class="form-select">
            </div>
                <input type="submit" value="valider">
        </form>
    </div>
</section>



<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
