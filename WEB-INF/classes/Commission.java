package utils;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class Commission {

    int id_vendeur;
    double commission;
    Date date_commission;
    int id_vente_produit;

    public Commission(int id_vendeur, double commission, Date date_commission, int id_vente_produit) {
        this.commission = commission;
        this.date_commission = date_commission;
        this.id_vendeur = id_vendeur;
        this.id_vente_produit = id_vente_produit;
    }

    public Commission() {
    }

    public int getId_vendeur() {
        return id_vendeur;
    }

    public void setId_vendeur(int id_vendeur) {
        this.id_vendeur = id_vendeur;
    }

    public double getCommission() {
        return commission;
    }

    public void setCommission(double commission) {
        this.commission = commission;
    }

    public Date getDate_commission() {
        return date_commission;
    }

    public void setDate_commission(Date date_commission) {
        this.date_commission = date_commission;
    }

    public int getId_vente_produit() {
        return id_vente_produit;
    }

    public void setId_vente_produit(int id_vente_produit) {
        this.id_vente_produit = id_vente_produit;
    }

    public static double calcul(double pourcentage, double prix) {
        double result = prix * pourcentage / 100;
        return result;
    }

    public static List<Commission> listCommission(String date1, String date2, int id_vendeur) {
        List<Commission> listVendeur = new ArrayList<>();
        String sql = "SELECT * "
                + "FROM Commission c "
                + "JOIN Vendeur v "
                + "ON v.id_vendeur=c.id_vendeur "
                + "WHERE c.date_commission >= ? AND c.date_commission < ? AND v.id_vendeur = ?";

        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate1 = LocalDate.parse(date1, formatter);
            Date sqlDate1 = Date.valueOf(localDate1);
            LocalDate localDate2 = LocalDate.parse(date2, formatter);
            Date sqlDate2 = Date.valueOf(localDate2);
            preparedStatement.setDate(1, sqlDate1);
            preparedStatement.setDate(2, sqlDate2);
            preparedStatement.setInt(3, id_vendeur);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Commission vendeur = new Commission();
                    vendeur.setId_vendeur(resultSet.getInt("id_vendeur"));
                    vendeur.setCommission(resultSet.getDouble("commission"));
                    vendeur.setDate_commission(resultSet.getDate("date_commission"));
                    vendeur.setId_vente_produit(resultSet.getInt("id_vente_produit"));

                    listVendeur.add(vendeur);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) { // Gérer toutes les autres exceptions
            e.printStackTrace();
        }
        return listVendeur;
    }

    public static List<Commission> listCommissionGenre(String date1, String date2, String id_vendeur) {
        List<Commission> listVendeur = new ArrayList<>();
        String sql = "SELECT SUM(c.commission) sum "
                + "FROM Commission c "
                + "JOIN Vendeur v "
                + "ON v.id_vendeur=c.id_vendeur "
                + "WHERE c.date_commission >= ? AND c.date_commission < ? AND v.genre = ?";

        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate1 = LocalDate.parse(date1, formatter);
            Date sqlDate1 = Date.valueOf(localDate1);
            LocalDate localDate2 = LocalDate.parse(date2, formatter);
            Date sqlDate2 = Date.valueOf(localDate2);
            preparedStatement.setDate(1, sqlDate1);
            preparedStatement.setDate(2, sqlDate2);
            preparedStatement.setString(3, id_vendeur);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Commission vendeur = new Commission();
                    vendeur.setCommission(resultSet.getDouble("sum"));

                    listVendeur.add(vendeur);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) { // Gérer toutes les autres exceptions
            e.printStackTrace();
        }
        return listVendeur;
    }

    public static double sumCommission(String date1, String date2, int id_vendeur)
    {
        double result = 0;
        String sql = "SELECT SUM(commission) sum "
                + "FROM Commission "
                + "WHERE date_commission >= ? AND date_commission < ? AND id_vendeur = ?";

        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate1 = LocalDate.parse(date1, formatter);
            Date sqlDate1 = Date.valueOf(localDate1);
            LocalDate localDate2 = LocalDate.parse(date2, formatter);
            Date sqlDate2 = Date.valueOf(localDate2);
            preparedStatement.setDate(1, sqlDate1);
            preparedStatement.setDate(2, sqlDate2);
            preparedStatement.setInt(3, id_vendeur);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    result=resultSet.getDouble("sum");
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
