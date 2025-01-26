package utils;

public class Maladie {

    int id_maladie;
    String nom_maladie;
    
    public int getId_maladie() {
        return id_maladie;
    }

    public void setId_maladie(int id_maladie) {
        this.id_maladie = id_maladie;
    }


    public Maladie() {
    }

    public Maladie(String nom_maladie) {
        this.nom_maladie = nom_maladie;
    }

    public String getNom_maladie() {
        return nom_maladie;
    }

    public void setNom_maladie(String nom_maladie) {
        this.nom_maladie = nom_maladie;
    }

}
