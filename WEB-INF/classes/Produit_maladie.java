package utils;
public class Produit_maladie {
    int id_produit;
    int id_maladie;
    
    public Produit_maladie(int id_produit, int id_maladie) {
        this.id_produit = id_produit;
        this.id_maladie = id_maladie;
    }

    public int getId_produit() {
        return id_produit;
    }

    public void setId_produit(int id_produit) {
        this.id_produit = id_produit;
    }

    public int getId_maladie() {
        return id_maladie;
    }

    public void setId_maladie(int id_maladie) {
        this.id_maladie = id_maladie;
    }
}
