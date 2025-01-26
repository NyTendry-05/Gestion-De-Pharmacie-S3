package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connex {
    public static Connection connexPostgres() throws Exception {
        // Vérification explicite du chargement du driver
        try {
            Class.forName("org.postgresql.Driver");
            System.out.println("Driver PostgreSQL chargé avec succès !");
        } catch (ClassNotFoundException e) {
            System.out.println("Erreur : Driver PostgreSQL introuvable.");
            e.printStackTrace();
        }
        
        // Connexion à la base de données
        Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/pharmacie", "postgres", "1234");
        System.out.println("Connexion établie !");
        return connection;
    }
}
