<%@ page import="utils.*, java.util.List" %>
<%
    String date = request.getParameter("date");
    List<Client> client = Client.listClientFiltre(date);
    List<Produit> produit = Produit.listClientFiltre(date);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste Clients</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Header Inner -->
        <div class="header-inner bg-primary text-white py-2">
            <div class="container text-center">
                <h1>Liste des clients</h1>
            </div>
        </div>
    </header>

    <main class="container my-5">
        <h2>Date : <%= date %></h2>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Id_client</th>
                        <th>Nom clients</th>
                        <th>Nom produit</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (client != null && !client.isEmpty()) { 
                        for (int i = 0; i < client.size(); i++) {
                    %>
                    <tr>
                        <td><%= client.get(i).getId_client() %></td>
                        <td><%= client.get(i).getNom_client() %></td>
                        <td><%= produit.get(i).getNom_produit() %></td>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="2" class="text-center">Aucun client trouvé</td>
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
