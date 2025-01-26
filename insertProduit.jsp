<%@ page import="utils.*, java.util.List" %>
<%
    List<Forme> formes = DatabaseUtils.getAll("Forme", Forme.class);
    List<Unite> unites = DatabaseUtils.getAll("Unite", Unite.class);
    List<Categorie> categories = DatabaseUtils.getAll("Categorie", Categorie.class);
    List<Type> types = DatabaseUtils.getAll("Type", Type.class);
    List<Produit> products = DatabaseUtils.getAll("Produits", Produit.class);
    List<Maladie> maladie = DatabaseUtils.getAll("Maladie", Maladie.class);
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
                    <li class="nav-item">
                        <select name="table" id="tableDropdown" class="form-select" onchange="redirectToPage()">
                            <option selected disabled>Recherche</option>
                            <option value="reach_form.jsp">Forme</option>
                            <option value="reach_unite.jsp">Unite</option>
                            <option value="reach_maladie.jsp">Maladie</option>
                            <option value="reach_lieu.jsp">Toerana</option>
                            <option value="reach_type.jsp">Type</option>
                            <option value="reach_labo.jsp">Labo</option>
                            <option value="reach_produit.jsp">Produits</option>
                        </select>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- Form Section -->
<section class="py-5">
    <div class="container">
        <h1 class="mb-4">Ajouter un Produit</h1>
        <form action="traitInsertProduit.jsp" method="get">
            <div class="mb-3">
                <label for="nom_produit" class="form-label">Nom du Produit</label>
                <input type="text" id="nom_produit" name="nom_produit" class="form-control">
            </div>

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
                <label for="prix_produit" class="form-label">Prix (AR)</label>
                <input type="number" id="prix_produit" name="prix_produit" class="form-control">
            </div>

            <div class="mb-3">
                <label for="id_unite" class="form-label">Unite</label>
                <select name="id_unite" id="id_unite" class="form-select">
                    <option>Unite</option>
                    <% for (Unite unite : unites) { %>
                        <option value="<%= unite.getId_unite() %>"><%= unite.getNom_unite() %></option>
                    <% } %>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Maladies</label>
                <div class="form-check">
                    <% for (Maladie m : maladie) { %>
                        <div>
                            <input type="checkbox" class="form-check-input" id="maladie_<%= m.getId_maladie() %>" name="id_maladie" value="<%= m.getId_maladie() %>">
                            <label class="form-check-label" for="maladie_<%= m.getId_maladie() %>"><%= m.getNom_maladie() %></label>
                        </div>
                    <% } %>
                </div>
            </div>

            <div class="mb-3">
                <label for="id_categorie" class="form-label">Categorie</label>
                <select name="id_categorie" id="id_categorie" class="form-select">
                    <option>Categories</option>
                    <% for (Categorie category : categories) { %>
                        <option value="<%= category.getId_categorie() %>"><%= category.getNom_categorie() %></option>
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

            <button type="submit" class="btn btn-primary">Ajouter</button>
        </form>
    </div>
</section>

<!-- Product Table Section -->
<section class="py-5">
    <div class="container">
        <h2 class="mb-4">Liste des Produits</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Nom du Produit</th>
                    <th>Prix (AR)</th>
                </tr>
            </thead>
            <tbody>
                <% for (Produit p : products) { %>
                    <tr>
                        <td><%= p.getNom_produit() %></td>
                        <td><%= p.getPrix_produit() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white py-3">
    <div class="container text-center">
        &copy; 2025 - Gestion de Pharmacie
    </div>
</footer>

<script>
    function redirectToPage() {
        const dropdown = document.getElementById('tableDropdown');
        const selectedValue = dropdown.value;
        if (selectedValue) {
            window.location.href = selectedValue;
        }
    }
</script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
