--Fanafody rehetra ho an'ny areti-tendra ho an'ny enfant--
SELECT *
FROM Produits P
JOIN produit_maladie PM
ON P.id_produit=PM.id_produit
WHERE P.id_type = 1 and PM.id_maladie = 1;

--lister les vente de id_type=1 et id_forme=3;
SELECT *
FROM vente
WHERE id_type = 2 AND id_forme = 3;

SELECT * 
FROM Produits P
JOIN Produit_du_mois PM
ON PM.id_produit=P.id_produit
WHERE PM.mois >= '2024-01-01' AND PM.mois <= '2025-01-01';

SELECT c.id_client, c.nom_client, p.nom_produit
FROM Client c
JOIN vente_produit vp ON c.id_client = vp.id_client
JOIN Produits p ON p.id_produit = vp.id_produit
JOIN Vente v ON vp.id_vente = v.id_vente
WHERE v.date_vente = '2025-01-16';

SELECT SUM(c.commission) sum
FROM Commission c
JOIN Vendeur v
ON v.id_vendeur=c.id_vendeur
WHERE c.date_commission >= '2025-01-01' AND c.date_commission < '2025-02-01' AND v.genre = 'M';

SELECT SUM(commission) sum
FROM Commission
WHERE date_commission >= '2025-01-01' AND date_commission < '2025-02-01' AND id_vendeur = 1;

SELECT nom_vendeur
FROM Vendeur
WHERE id_vendeur = 1;