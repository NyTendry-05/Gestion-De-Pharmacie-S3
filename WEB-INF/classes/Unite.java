package utils;

public class Unite {

    int id_unite;
    String nom_unite;
    
    public int getId_unite() {
        return id_unite;
    }

    public void setId_unite(int id_unite) {
        this.id_unite = id_unite;
    }


    public Unite() {
    }

    public Unite(String nom_unite) {
        this.nom_unite = nom_unite;
    }

    public String getNom_unite() {
        return nom_unite;
    }

    public void setNom_unite(String nom_unite) {
        this.nom_unite = nom_unite;
    }
}
