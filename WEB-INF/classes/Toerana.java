package utils;

public class Toerana {

    
    int id_toerana;
    String nom_toerana;
    
    public Toerana(String nom_toerana) {
        this.nom_toerana = nom_toerana;
    }

    public Toerana() {
    }
    
    public String getNom_toerana() {
        return nom_toerana;
    }

    public void setNom_toerana(String nom_toerana) {
        this.nom_toerana = nom_toerana;
    }

    public int getId_toerana() {
        return id_toerana;
    }
    
    public void setId_toerana(int id_toerana) {
        this.id_toerana = id_toerana;
    }
    public Toerana(int id_toerana, String nom_toerana) {
        this.id_toerana = id_toerana;
        this.nom_toerana = nom_toerana;
    }
}
