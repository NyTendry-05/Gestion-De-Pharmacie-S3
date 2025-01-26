package utils;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class Client {

    int id_client;
    String nom_client;

    public Client() {
    }

    public Client(int id_client, String nom_client) {
        this.id_client = id_client;
        this.nom_client = nom_client;
    }

    public int getId_client() {
        return id_client;
    }

    public void setId_client(int id_client) {
        this.id_client = id_client;
    }

    public String getNom_client() {
        return nom_client;
    }

    public void setNom_client(String nom_client) {
        this.nom_client = nom_client;
    }

    public static List<Client> listClientFiltre(String date) {
        List<Client> list_client = new ArrayList<>();
        String sql = "SELECT c.id_client, c.nom_client "
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
                    // Créer un objet Produit et remplir ses champs
                    Client produit = new Client();
                    produit.setId_client(resultSet.getInt("id_client"));
                    produit.setNom_client(resultSet.getString("nom_client"));
                    list_client.add(produit);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) { // Gérer toutes les autres exceptions
            e.printStackTrace();
        }
        return list_client;
    }

}
