<%@ page import="utils.*, java.util.List" %>
<%
    int id_maladie = Integer.parseInt(request.getParameter("maladie"));
    int id_type = Integer.parseInt(request.getParameter("type"));
    List<Produit> product = Produit.getProductByFilter(id_maladie, id_type);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste Generalise</title>
    <!-- Favicon -->
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/table.css">
</head>
<body>
    <header class="header">
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
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Header Inner -->
        <div class="header-inner bg-primary text-white py-2">
            <div class="container text-center">
                <h1>Liste Generalise</h1>
            </div>
        </div>
    </header>

    <main class="container my-5">
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Nom Produit</th>
                        <th>Type</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (product != null && !product.isEmpty()) { 
                        for (Produit produit : product) { 
                    %>
                    <tr>
                        <td><%= produit.getNom_produit() %></td>
                        <td><%= produit.getId_type() %></td>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="2" class="text-center">Aucun produit trouve</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </main>

    <footer class="footer bg-light py-3 text-center">
        <div class="container">
            <p>© 2025 Mediplus. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap and JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
