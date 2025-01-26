package utils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Vente {

    int id_vente;
    Date date_vente;

    public Vente() {
    }

    public Vente(Date date_vente) {
        this.date_vente = date_vente;
    }

    public Vente(int id_vente, Date date_vente) {
        this.id_vente = id_vente;
        this.date_vente = date_vente;
    }

    public Date getDate() {
        return date_vente;
    }

    public void setDate(Date date_vente) {
        this.date_vente = date_vente;
    }

    public int getId_vente() {
        return id_vente;
    }

    public void setId_vente(int id_vente) {
        this.id_vente = id_vente;
    }

    public int getIdMax() {
        String sql = "SELECT COUNT(*) FROM vente";
        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql); ResultSet resultSet = preparedStatement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt(1); // Retourne la première colonne du résultat
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0; // Retourne 0 si une erreur survient
    }

    public boolean insertVente() {
        String sql = "INSERT INTO vente (id_vente,date_vente) VALUES (default,?)";

        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Passer les paramètres au PreparedStatement
            preparedStatement.setDate(1, this.getDate());

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
}
