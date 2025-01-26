package utils;

public class Forme {
    
    int id_forme;
    String nom_forme;

    public Forme() {
    }
    
    public Forme(int id_forme, String nom_forme) {
        this.id_forme = id_forme;
        this.nom_forme = nom_forme;
    }
    
    public Forme(String nom_forme) {
        this.nom_forme = nom_forme;
    }

    public int getId_forme() {
        return id_forme;
    }

    public void setId_forme(int id_forme) {
        this.id_forme = id_forme;
    }

    public String getNom_forme() {
        return nom_forme;
    }

    public void setNom_forme(String nom_forme) {
        this.nom_forme = nom_forme;
    }
}
