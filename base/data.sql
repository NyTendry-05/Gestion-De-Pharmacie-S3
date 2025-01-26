-- Insérer des données dans la table Maladie
INSERT INTO Maladie (nom_maladie) VALUES 
('Diabète'), 
('Hypertension'), 
('Grippe'), 
('Asthme'), 
('Migraine'), 
('Cancer'), 
('Anémie'), 
('Malaria'), 
('Covid-19'), 
('Arthrite');

-- Insérer des données dans la table Toerana
INSERT INTO Toerana (nom_toerana) VALUES 
('Antananarivo'), 
('Fianarantsoa'), 
('Toamasina'), 
('Mahajanga'), 
('Toliara'), 
('Antsiranana'), 
('Ambatondrazaka'), 
('Moramanga'), 
('Nosy Be'), 
('Manakara');

-- Insérer des données dans la table Type
INSERT INTO type (nom_type) VALUES 
('Enfant'), 
('Adulte'), 
('Senior'), 
('Femme enceinte'), 
('Sportif'), 
('Personne âgée'), 
('Chirurgie'), 
('Orthopédique'), 
('Urgence'), 
('Pédiatrie');

-- Insérer des données dans la table Categorie
INSERT INTO Categorie (nom_categorie) VALUES 
('Antibiotique'), 
('Antalgique'), 
('Antiseptique'), 
('Antidiabétique'), 
('Antihypertenseur'), 
('Vitamines'), 
('Anti-inflammatoire'), 
('Antiviral'), 
('Antimalarique'), 
('Médicament général');

-- Insérer des données dans la table Unite
INSERT INTO Unite (nom_unite) VALUES 
('Boîte'), 
('Flacon'), 
('Blister'), 
('Ampoule'), 
('Sachet'), 
('Tube'), 
('Injection'), 
('Suppositoire'), 
('Patch'), 
('Capsule');

-- Insérer des données dans la table Forme
INSERT INTO Forme (nom_forme) VALUES 
('Injectable'), 
('Voie orale'), 
('Comprimé'), 
('Sirop'), 
('Solution'), 
('Poudre'), 
('Gélule'), 
('Crème'), 
('Inhalateur'), 
('Spray');

-- Insérer des données dans la table Produits
INSERT INTO Produits (nom_produit, prix_produit, id_forme, id_unite, id_categorie, id_type) VALUES 
('Paracétamol', 100000.00, 3, 1, 2, 2), 
('Ibuprofène', 200000.00, 3, 1, 7, 2), 
('Amoxicilline', 300000.00, 3, 2, 1, 2), 
('Vitamine C', 50000.00, 2, 3, 6, 1), 
('Insuline', 1500000.00, 1, 7, 4, 3), 
('Salbutamol', 400000.00, 10, 9, 7, 2), 
('Chloroquine', 800000.00, 3, 1, 9, 2), 
('Aspirine', 150000.00, 3, 1, 2, 2), 
('Zinc', 70000.00, 2, 3, 6, 1), 
('Remdesivir', 5000000.00, 1, 2, 8, 3),
('Vitamine B', 250000.00, 3, 1, 2, 2);

INSERT INTO Produits (nom_produit, prix_produit, id_forme, id_unite, id_categorie, id_type) VALUES 
('P1', 100000.00, 3, 1, 2, 2), 
('P2', 1000000.00, 3, 1, 7, 2);

-- Insérer des données dans la table Stock
INSERT INTO Stock (quantite, id_produit) VALUES 
(100, 1), 
(200, 2), 
(150, 3), 
(300, 4), 
(50, 5), 
(80, 6), 
(60, 7), 
(400, 8), 
(500, 9), 
(20, 10);

-- Insérer des données dans la table Laboratoire
INSERT INTO Laboratoire (nom_labo, id_toerana) VALUES 
('Pharma-Antananarivo', 1), 
('Pharma-Toamasina', 3), 
('Pharma-Fianarantsoa', 2), 
('Pharma-Toliara', 5), 
('Pharma-Mahajanga', 4), 
('Pharma-Nosy Be', 8), 
('Pharma-Moramanga', 7), 
('Pharma-Manakara', 10), 
('Pharma-Ambatondrazaka', 6), 
('Pharma-Antsiranana', 9);

-- Insérer des données dans la table mvt_stock
INSERT INTO mvt_stock (quantite, is_sortie, id_labo, id_produit) VALUES 
(20, TRUE, 1, 1), 
(30, TRUE, 2, 2), 
(15, FALSE, 3, 3), 
(40, TRUE, 4, 4), 
(10, FALSE, 5, 5), 
(25, TRUE, 6, 6), 
(5, FALSE, 7, 7), 
(35, TRUE, 8, 8), 
(50, FALSE, 9, 9), 
(10, TRUE, 10, 10);

-- Insérer des données dans la table produit_maladie
INSERT INTO produit_maladie (id_produit, id_maladie) VALUES 
(1, 3), 
(2, 5), 
(3, 1), 
(4, 2), 
(5, 4), 
(6, 8), 
(7, 7), 
(8, 9), 
(9, 10), 
(10, 6);
INSERT INTO type (nom_type) VALUES 
('Bebe');

INSERT INTO Client (nom_client) VALUES 
('Bebe');

INSERT INTO Client (nom_client) VALUES 
('Ambinintsoa'),
('Antonio'),
('Tommy'),
('Mihaja');

INSERT INTO Vendeur (nom_vendeur, genre) VALUES 
('Ravo', 'F'),
('Antema', 'F'),
('Josh', 'M'),
('Zo', 'M');
