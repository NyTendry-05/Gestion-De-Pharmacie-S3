package utils;

import java.sql.*;

public class ProduitSuggered extends Produit{

    int id_produit_du_mois;
    Date mois;
    int id_produit;

    public ProduitSuggered(){}

    public ProduitSuggered(int id_produit, Date mois) {
        this.id_produit = id_produit;
        this.mois = mois;
    }

    public ProduitSuggered(int id_produit_du_mois, int id_produit, Date mois) {
        this.id_produit_du_mois = id_produit_du_mois;
        this.id_produit = id_produit;
        this.mois = mois;
    }
    
    public boolean insertProductSuggere() {
        String sql = "INSERT INTO Produit_du_mois (mois, id_produit) VALUES (?, ?)";

        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Passer les paramètres au PreparedStatement
            preparedStatement.setDate(1, this.getMois());
            preparedStatement.setInt(2, this.getId_produit());

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

    public int getId_produit_du_mois() {
        return id_produit_du_mois;
    }

    public void setId_produit_du_mois(int id_produit_du_mois) {
        this.id_produit_du_mois = id_produit_du_mois;
    }

    public Date getMois() {
        return mois;
    }

    public void setMois(Date mois) {
        this.mois = mois;
    }

    public int getId_produit() {
        return id_produit;
    }

    public void setId_produit(int id_produit) {
        this.id_produit = id_produit;
    }
}
