package utils;

import java.util.List;
import java.sql.*;
import java.util.ArrayList;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Produit {

    int id_produit;
    String nom_produit;
    int id_forme;
    int id_unite;
    int id_categorie;
    int id_type;
    double prix_produit;

    public Produit(String nom_produit, int id_forme, int id_unite, int id_categorie, int id_type, double prix_produit) {
        this.nom_produit = nom_produit;
        this.id_forme = id_forme;
        this.id_unite = id_unite;
        this.id_categorie = id_categorie;
        this.id_type = id_type;
        this.prix_produit = prix_produit;
    }

    public Produit(String nom_produit, int id_forme, int id_unite, int id_categorie, int id_type) {
        this.nom_produit = nom_produit;
        this.id_forme = id_forme;
        this.id_unite = id_unite;
        this.id_categorie = id_categorie;
        this.id_type = id_type;
    }

    public Produit(int id_produit, String nom_produit, int id_forme, int id_unite, int id_categorie, int id_type) {
        this.id_produit = id_produit;
        this.nom_produit = nom_produit;
        this.id_forme = id_forme;
        this.id_unite = id_unite;
        this.id_categorie = id_categorie;
        this.id_type = id_type;
    }

    public Produit() {
    }

    public int getId_produit() {
        return id_produit;
    }

    public void setId_produit(int id_produit) {
        this.id_produit = id_produit;
    }

    public String getNom_produit() {
        return nom_produit;
    }

    public void setNom_produit(String nom_produit) {
        this.nom_produit = nom_produit;
    }

    public int getId_forme() {
        return id_forme;
    }

    public void setId_forme(int id_forme) {
        this.id_forme = id_forme;
    }

    public int getId_unite() {
        return id_unite;
    }

    public void setId_unite(int id_unite) {
        this.id_unite = id_unite;
    }

    public int getId_categorie() {
        return id_categorie;
    }

    public void setId_categorie(int id_categorie) {
        this.id_categorie = id_categorie;
    }

    public int getId_type() {
        return id_type;
    }

    public void setId_type(int id_type) {
        this.id_type = id_type;
    }

    public static List<Produit> getProductByFilter(int id_maladie, int id_type) {
        List<Produit> list_product = new ArrayList<>();
        String sql = "SELECT P.id_produit id_produit, P.nom_produit nom_produit, P.id_type id_type, P.id_forme id_forme, P.id_unite id_unite, P.id_categorie id_categorie "
                + "FROM Produit P "
                + "JOIN produit_maladie PM ON P.id_produit = PM.id_produit "
                + "WHERE P.id_type = ? AND PM.id_maladie = ?";

        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Passer les paramètres au PreparedStatement
            preparedStatement.setInt(1, id_type);
            preparedStatement.setInt(2, id_maladie);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    // Créer un objet Produit et remplir ses champs
                    Produit produit = new Produit();
                    produit.setId_produit(resultSet.getInt("id_produit"));
                    produit.setNom_produit(resultSet.getString("nom_produit"));
                    produit.setNom_produit(resultSet.getString("prix_produit"));
                    produit.setId_type(resultSet.getInt("id_type"));
                    produit.setId_forme(resultSet.getInt("id_forme"));
                    produit.setId_unite(resultSet.getInt("id_unite"));
                    produit.setId_categorie(resultSet.getInt("id_categorie"));

                    list_product.add(produit);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) { // Gérer toutes les autres exceptions
            e.printStackTrace();
        }

        return list_product;
    }

    public static List<Produit> getProductByFormeAndType(int id_forme, int id_type) {
        List<Produit> list_product = new ArrayList<>();
        String sql = "SELECT * "
                + "FROM Produits "
                + "WHERE id_type = ? AND id_forme = ?";

        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Passer les paramètres au PreparedStatement
            preparedStatement.setInt(1, id_type);
            preparedStatement.setInt(2, id_forme);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    // Créer un objet Produit et remplir ses champs
                    Produit produit = new Produit();
                    produit.setId_produit(resultSet.getInt("id_produit"));
                    produit.setNom_produit(resultSet.getString("nom_produit"));
                    produit.setPrix_produit(resultSet.getDouble("prix_produit"));
                    produit.setId_type(resultSet.getInt("id_type"));
                    produit.setId_forme(resultSet.getInt("id_forme"));
                    produit.setId_unite(resultSet.getInt("id_unite"));
                    produit.setId_categorie(resultSet.getInt("id_categorie"));

                    list_product.add(produit);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) { // Gérer toutes les autres exceptions
            e.printStackTrace();
        }
        return list_product;
    }

    public double getPrix_produit() {
        return prix_produit;
    }

    public void setPrix_produit(double prix_produit) {
        this.prix_produit = prix_produit;
    }

    public boolean insertProduct() {
        String sql = "INSERT INTO Produits (id_produit,nom_produit, id_forme, id_unite, id_categorie, id_type, prix_produit) VALUES (default,?, ?, ?, ?, ?, ?)";

        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Passer les paramètres au PreparedStatement
            preparedStatement.setString(1, this.getNom_produit());
            preparedStatement.setInt(2, this.getId_forme());
            preparedStatement.setInt(3, this.getId_unite());
            preparedStatement.setInt(4, this.getId_categorie());
            preparedStatement.setInt(5, this.getId_type());
            preparedStatement.setDouble(6, this.getPrix_produit());

            // Exécuter l'insertion
            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0; // Retourne true si une ligne a été insérée

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) { // Gérer toutes les autres exceptions
            e.printStackTrace();
        }

        return false; // Retourne false si l'insertion a échoué
    }

    public int getIdMax() {
        String sql = "SELECT COUNT(*) FROM produits";
        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql); ResultSet resultSet = preparedStatement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt(1); // Retourne la première colonne du résultat
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0; // Retourne 0 si une erreur survient
    }

    public static List<Produit> getProduitSuggere(String date1, String date2) {
        List<Produit> list_product = new ArrayList<>();
        String sql = "SELECT * "
                + "FROM Produits P "
                + "JOIN Produit_du_mois PM "
                + "ON PM.id_produit=P.id_produit "
                + "WHERE PM.mois >= ? AND PM.mois <= ? ";

        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate1 = LocalDate.parse(date1, formatter);
            Date sqlDate1 = Date.valueOf(localDate1);
            LocalDate localDate2 = LocalDate.parse(date2, formatter);
            Date sqlDate2 = Date.valueOf(localDate2);
            preparedStatement.setDate(1, sqlDate1);
            preparedStatement.setDate(2, sqlDate2);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    // Créer un objet Produit et remplir ses champs
                    Produit produit = new Produit();
                    produit.setId_produit(resultSet.getInt("id_produit"));
                    produit.setNom_produit(resultSet.getString("nom_produit"));
                    produit.setPrix_produit(resultSet.getDouble("prix_produit"));
                    produit.setId_type(resultSet.getInt("id_type"));
                    produit.setId_forme(resultSet.getInt("id_forme"));
                    produit.setId_unite(resultSet.getInt("id_unite"));
                    produit.setId_categorie(resultSet.getInt("id_categorie"));

                    list_product.add(produit);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) { // Gérer toutes les autres exceptions
            e.printStackTrace();
        }
        return list_product;
    }

    public static List<Produit> listClientFiltre(String date) {
        List<Produit> list_product = new ArrayList<>();
        String sql = "SELECT * "
                + "FROM Client c "
                + "JOIN vente_produit vp ON c.id_client = vp.id_client "
                + "JOIN Produits p ON p.id_produit = vp.id_produit "
                + "JOIN Vente v ON vp.id_vente = v.id_vente "
                + "WHERE v.date_vente = ?";

        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate1 = LocalDate.parse(date, formatter);
            Date sqlDate1 = Date.valueOf(localDate1);
            preparedStatement.setDate(1, sqlDate1);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Produit produit = new Produit();
                    produit.setId_produit(resultSet.getInt("id_produit"));
                    produit.setNom_produit(resultSet.getString("nom_produit"));
                    produit.setPrix_produit(resultSet.getDouble("prix_produit"));
                    produit.setId_type(resultSet.getInt("id_type"));
                    produit.setId_forme(resultSet.getInt("id_forme"));
                    produit.setId_unite(resultSet.getInt("id_unite"));
                    produit.setId_categorie(resultSet.getInt("id_categorie"));

                    list_product.add(produit);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) { // Gérer toutes les autres exceptions
            e.printStackTrace();
        }
        return list_product;
    }

    public static Produit getById(int id) {
        Produit result = new Produit();
        String sql = "SELECT * FROM Produits Where id_produit = ?";

        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Produit produit = new Produit();
                    produit.setId_produit(resultSet.getInt("id_produit"));
                    produit.setNom_produit(resultSet.getString("nom_produit"));
                    produit.setPrix_produit(resultSet.getDouble("prix_produit"));
                    produit.setId_type(resultSet.getInt("id_type"));
                    produit.setId_forme(resultSet.getInt("id_forme"));
                    produit.setId_unite(resultSet.getInt("id_unite"));
                    produit.setId_categorie(resultSet.getInt("id_categorie"));

                    result = produit;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) { // Gérer toutes les autres exceptions
            e.printStackTrace();
        }
        return result;
    }
}
