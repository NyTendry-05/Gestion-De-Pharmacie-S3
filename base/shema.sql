drop database pharmacie;
create database pharmacie;
\c pharmacie

CREATE TABLE Maladie(
   id_maladie SERIAL,
   nom_maladie VARCHAR(50) ,
   PRIMARY KEY(id_maladie)
);

CREATE TABLE Toerana(
   id_toerana SERIAL,
   nom_toerana VARCHAR(50) ,
   PRIMARY KEY(id_toerana)
);

CREATE TABLE type(
   id_type SERIAL,
   nom_type VARCHAR(50) ,
   PRIMARY KEY(id_type)
);

CREATE TABLE Categorie(
   id_categorie SERIAL,
   nom_categorie VARCHAR(50) ,
   PRIMARY KEY(id_categorie)
);

CREATE TABLE Unite(
   id_unite SERIAL,
   nom_unite VARCHAR(50) ,
   PRIMARY KEY(id_unite)
);

CREATE TABLE Forme(
   id_forme SERIAL,
   nom_forme VARCHAR(50) ,
   PRIMARY KEY(id_forme)
);

CREATE TABLE Vente(
   id_vente SERIAL,
   date_vente DATE,
   PRIMARY KEY(id_vente)
);

CREATE TABLE Produits(
   id_produit SERIAL,
   nom_produit VARCHAR(50) ,
   prix_produit NUMERIC(15,2)  ,
   id_forme INTEGER NOT NULL,
   id_unite INTEGER NOT NULL,
   id_categorie INTEGER NOT NULL,
   id_type INTEGER NOT NULL,
   PRIMARY KEY(id_produit),
   FOREIGN KEY(id_forme) REFERENCES Forme(id_forme),
   FOREIGN KEY(id_unite) REFERENCES Unite(id_unite),
   FOREIGN KEY(id_categorie) REFERENCES Categorie(id_categorie),
   FOREIGN KEY(id_type) REFERENCES type(id_type)
);

CREATE TABLE Stock(
   id_stock SERIAL,
   quantite INTEGER,
   id_produit INTEGER NOT NULL,
   PRIMARY KEY(id_stock),
   FOREIGN KEY(id_produit) REFERENCES Produits(id_produit)
);

CREATE TABLE Laboratoire(
   id_labo SERIAL,
   nom_labo VARCHAR(50) ,
   id_toerana INTEGER NOT NULL,
   PRIMARY KEY(id_labo),
   FOREIGN KEY(id_toerana) REFERENCES Toerana(id_toerana)
);

CREATE TABLE mvt_stock(
   id_mvt_stock SERIAL,
   quantite INTEGER,
   is_sortie BOOLEAN,
   id_labo INTEGER NOT NULL,
   id_produit INTEGER NOT NULL,
   PRIMARY KEY(id_mvt_stock),
   FOREIGN KEY(id_labo) REFERENCES Laboratoire(id_labo),
   FOREIGN KEY(id_produit) REFERENCES Produits(id_produit)
);

CREATE TABLE produit_maladie(
   id_produit INTEGER,
   id_maladie INTEGER,
   PRIMARY KEY(id_produit, id_maladie),
   FOREIGN KEY(id_produit) REFERENCES Produits(id_produit),
   FOREIGN KEY(id_maladie) REFERENCES Maladie(id_maladie)
);

CREATE TABLE Client(
   id_client SERIAL,
   nom_client VARCHAR(50),
   PRIMARY KEY(id_client)
);

CREATE TABLE Vendeur(
   id_vendeur SERIAL,
   nom_vendeur VARCHAR(20),
   genre CHAR,
   PRIMARY KEY(id_vendeur)
);

CREATE TABLE vente_produit(
   id_vente_produit SERIAL PRIMARY KEY, 
   id_produit INTEGER,
   id_vente INTEGER,
   id_client INTEGER,
   id_vendeur INTEGER,
   quantite INTEGER,
   FOREIGN KEY(id_vendeur) REFERENCES Vendeur(id_vendeur),
   FOREIGN KEY(id_produit) REFERENCES Produits(id_produit),
   FOREIGN KEY(id_vente) REFERENCES Vente(id_vente),
   FOREIGN KEY(id_client) REFERENCES Client(id_client)
);

CREATE TABLE Produit_du_mois(
   id_produit_du_mois SERIAL, 
   mois DATE, 
   id_produit INTEGER NOT NULL, 
   PRIMARY KEY(id_produit_du_mois),
   UNIQUE(id_produit),
   FOREIGN KEY(id_produit) REFERENCES Produits(id_produit)
);

CREATE TABLE Commission(
   id_commission SERIAL,
   id_vendeur INTEGER,
   commission DECIMAL(15,2),
   date_commission DATE,
   id_vente_produit INTEGER,
   FOREIGN KEY(id_vendeur) REFERENCES Vendeur(id_vendeur),
   FOREIGN KEY(id_vente_produit) REFERENCES vente_produit(id_vente_produit)
);