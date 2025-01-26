<%@ page import="utils.*, java.util.List" %>
<%

    List<Produit> products = DatabaseUtils.getAll("Produits", Produit.class);
    List<Client> clients = DatabaseUtils.getAll("Client", Client.class);
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
                    <li class="nav-item"><a class="nav-link" href="insertClientVente.jsp">Client</a></li>
                    <li class="nav-item"><a class="nav-link" href="insertCommission.jsp">Commission</a></li>
                    <li class="nav-item"><a class="nav-link" href="insertCommissionGenre.jsp">Commission_genre</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- Form Section -->
<section class="py-5">
    <div class="container">
        <h1 class="mb-4">Vendre</h1>

        <form id="venteForm" action="traitInsertVente.jsp">
            <div class="mb-3">
                <label for="id_produit" class="form-label">Produit</label>
                <select name="id_produit" id="id_produit" class="form-select">
                    <option value="" disabled selected>Choisir un produit</option>
                    <% for (Produit p : products) { %>
                        <option value="<%= p.getId_produit() %>"><%= p.getNom_produit() %></option>
                    <% } %>
                </select>
                <label for="id_client" class="form-label">Client</label>
                <select name="id_client" id="id_client" class="form-select">
                    <option value="" disabled selected>Choisir un client</option>
                    <% for (Client p : clients) { %>
                        <option value="<%= p.getId_client() %>"><%= p.getNom_client() %></option>
                    <% } %>
                </select>
                <label for="id_vendeur" class="form-label">Vendeur</label>
                <select name="id_vendeur" id="id_vendeur" class="form-select">
                    <option value="" disabled selected>Choisir un vendeur</option>
                    <% for (Vendeur p : vendeurs) { %>
                        <option value="<%= p.getId_vendeur() %>"><%= p.getNom_vendeur() %></option>
                    <% } %>
                </select>
                <label for="">Date</label>
                <input type="date" name="date" id="" class="form-select">
            </div>
            
            <div class="mb-3">
                <label for="quantite" class="form-label">Quantité</label>
                <input type="number" id="quantite" name="quantite" class="form-control" min="1">
            </div>

            <input type="submit" value="valider">
        </form>
    </div>
</section>



<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
