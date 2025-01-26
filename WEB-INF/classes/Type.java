package utils;

public class Type {

    int id_type;
    String nom_type;
    
    public int getId_type() {
        return id_type;
    }

    public void setId_type(int id_type) {
        this.id_type = id_type;
    }


    public Type() {
    }

    public Type(String nom_type) {
        this.nom_type = nom_type;
    }

    public String getNom_type() {
        return nom_type;
    }

    public void setNom_type(String nom_type) {
        this.nom_type = nom_type;
    }
}
