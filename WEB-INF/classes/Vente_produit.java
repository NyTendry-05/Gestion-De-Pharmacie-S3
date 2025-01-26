package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Vente_produit {
    
    int id_produit;
    int id_vente;
    int id_client;
    int id_vendeur;
    int quantite;

    public Vente_produit(int id_produit, int id_vente, int id_client, int id_vendeur, int quantite) {
        this.id_produit = id_produit;
        this.id_vente = id_vente;
        this.id_client = id_client;
        this.id_vendeur = id_vendeur;
        this.quantite = quantite;
    }
    public Vente_produit() {}
    public int getId_produit() {
        return id_produit;
    }
    public void setId_produit(int id_produit) {
        this.id_produit = id_produit;
    }
    public int getId_vente() {
        return id_vente;
    }
    public void setId_vente(int id_vente) {
        this.id_vente = id_vente;
    }
    public int getquantite() {
        return quantite;
    }
    public void setquantite(int quantite) {
        this.quantite = quantite;
    }

    public int getId_client() {
        return id_client;
    }

    public void setId_client(int id_client) {
        this.id_client = id_client;
    }

    public int getId_vendeur() {
        return id_vendeur;
    }

    public void setId_vendeur(int id_vendeur) {
        this.id_vendeur = id_vendeur;
    }

    public int getIdMax() {
        String sql = "SELECT COUNT(*) FROM vente_produit";
        try (Connection connection = Connex.connexPostgres();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt(1); // Retourne la première colonne du résultat
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0; // Retourne 0 si une erreur survient
    }

}
