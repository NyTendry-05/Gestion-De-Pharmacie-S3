package utils;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

public class DatabaseUtils {

    /**
     * Insère un objet Java dans une base PostgreSQL.
     *
     * @param tableName Nom de la table dans laquelle insérer les données
     * @param object L'objet à insérer
     * @return true si l'insertion est réussie, sinon false
     * @throws Exception Si une erreur de connexion se produit
     */
    public static boolean insertObject(String tableName, Object object) throws Exception {
        Class<?> clazz = object.getClass();
        Field[] fields = clazz.getDeclaredFields();
    
        // Construction de la requête SQL
        StringBuilder columns = new StringBuilder();
        StringBuilder placeholders = new StringBuilder();
        StringBuilder defaultValues = new StringBuilder();
    
        for (Field field : fields) {
            Object attrValue = field.get(object);
            if (columns.length() > 0) {
                columns.append(", ");
                placeholders.append(", ");
                defaultValues.append(", ");
            }
            columns.append(field.getName());
            placeholders.append("?");
            defaultValues.append("DEFAULT");
        }
    
        String sql = "INSERT INTO " + tableName + " (" + columns + ") VALUES (" + placeholders + ")";
        System.out.println("Requête générée : " + sql); // Pour le debug
    
        // Exécution de la requête SQL
        try (Connection connection = Connex.connexPostgres(); // Utilisation de Connex pour la connexion
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
    
            // Affectation des valeurs des champs dans la requête
            int index = 1;
            for (Field field : fields) {
                Object attrValue = field.get(object);
                if (attrValue != null) {
                    field.setAccessible(true); // Permet d'accéder aux champs privés
                    preparedStatement.setObject(index++, attrValue);
                } else {
                    preparedStatement.setNull(index++, java.sql.Types.NULL); // Utilisation de DEFAULT
                }
            }
    
            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0;
    
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (IllegalAccessException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static <T> List<T> getAll(String tableName, Class<T> clazz) {
        List<T> results = new ArrayList<>();
        String sql = "SELECT * FROM " + tableName; // Assurez-vous que le nom de la table est correct

        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql); ResultSet resultSet = preparedStatement.executeQuery()) {

            Field[] fields = clazz.getDeclaredFields();

            while (resultSet.next()) {
                T instance = clazz.getDeclaredConstructor().newInstance();

                for (Field field : fields) {
                    field.setAccessible(true);
                    String columnName = field.getName();

                    try {
                        Object value = resultSet.getObject(columnName);

                        if (value != null) {
                            if (field.getType() == double.class || field.getType() == Double.class) {
                                // Convert BigDecimal to double
                                if (value instanceof BigDecimal) {
                                    value = ((BigDecimal) value).doubleValue();
                                }
                            } else if (field.getType() == int.class || field.getType() == Integer.class) {
                                // Convert numeric to integer if needed
                                if (value instanceof Number) {
                                    value = ((Number) value).intValue();
                                }
                            }
                            // Assigner la valeur au champ
                            field.set(instance, value);
                        }
                    } catch (SQLException e) {
                        System.err.println("Erreur lors de l'extraction de la colonne : " + columnName);
                        e.printStackTrace();
                    }
                }

                results.add(instance);
            }

        } catch (SQLException | ReflectiveOperationException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return results;
    }

    public static <T> List<T> getById(String tableName, Class<T> clazz, int id) {
        List<T> results = new ArrayList<>();
        String sql = "SELECT * FROM " + tableName + " Where id_" + tableName + " =" + id;
        System.out.println(sql);
        try (Connection connection = Connex.connexPostgres(); PreparedStatement preparedStatement = connection.prepareStatement(sql); ResultSet resultSet = preparedStatement.executeQuery()) {

            Field[] fields = clazz.getDeclaredFields();

            while (resultSet.next()) {
                T instance = clazz.getDeclaredConstructor().newInstance();

                for (Field field : fields) {
                    field.setAccessible(true);
                    Object value = resultSet.getObject(field.getName());
                    field.set(instance, value);
                }

                results.add(instance);
            }

        } catch (SQLException | ReflectiveOperationException e) {
            e.printStackTrace();
        } catch (Exception e) { // Gérer toutes les autres exceptions levées par Connex.connexPostgres
            e.printStackTrace();
        }

        return results;
    }

}
