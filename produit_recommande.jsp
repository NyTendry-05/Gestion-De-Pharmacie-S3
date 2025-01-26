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
                    <li class="nav-item"><a class="nav-link" href="insertSuggere.jsp">Insertion</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="header-inner bg-primary text-white py-2">
        <div class="container text-center">
            <h1>Liste des produits suggere</h1>
        </div>
    </div>
</header>

<!-- Form Section -->
<section class="py-5">
    <div class="container">
        <h1 class="mb-4">Suggestion</h1>

        <form id="venteForm" action="listSuggere.jsp">
            <div class="mb-3">
                <label for="date1" class="form-label">Date_debut</label>
                <input type="date" name="date1" id="">
                <label for="date2" class="form-label">Date_fin</label>
                <input type="date" name="date2" id="">
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
