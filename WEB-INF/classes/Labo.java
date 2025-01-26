package utils;
public class Labo {
    int id_toerana;
    String nom_labo;
    
    public Labo(String nom_labo, int id_toerana) {
        this.nom_labo = nom_labo;
        this.id_toerana = id_toerana;
    }
    public Labo() {
    }
    public String getNom_labo() {
        return nom_labo;
    }
    public void setNom_labo(String nom_labo) {
        this.nom_labo = nom_labo;
    }
    public int getId_toerana() {
        return id_toerana;
    }
    public void setId_toerana(int id_toerana) {
        this.id_toerana = id_toerana;
    }
}
