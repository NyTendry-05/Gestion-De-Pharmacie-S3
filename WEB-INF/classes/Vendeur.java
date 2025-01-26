package utils;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class Vendeur {

    private int id_vendeur;
    private String nom_vendeur;
    private String genre;

    public Vendeur(int id_vendeur, String nom_vendeur, String genre) {
        this.id_vendeur = id_vendeur;
        this.nom_vendeur = nom_vendeur;
        this.genre = genre;
    }

    public Vendeur() {
    }

    public int getId_vendeur() {
        return id_vendeur;
    }

    public void setId_vendeur(int id_vendeur) {
        this.id_vendeur = id_vendeur;
    }

    public String getNom_vendeur() {
        return nom_vendeur;
    }

    public void setNom_vendeur(String nom_vendeur) {
        this.nom_vendeur = nom_vendeur;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public static String getNameById(int id_vendeur) {
        String name = "";
        String sql = "SELECT nom_vendeur "
                + "FROM Vendeur "
                + "WHERE id_vendeur = ?";

        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id_vendeur);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Vendeur vendeur = new Vendeur();
                    vendeur.setNom_vendeur(resultSet.getString("nom_vendeur"));

                    name = vendeur.getNom_vendeur();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) { // Gérer toutes les autres exceptions
            e.printStackTrace();
        }
        return name;
    }

}
