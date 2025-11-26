USE tifosi;

-- On vide les tables dans le bon ordre
DELETE FROM focaccia_ingredient;
DELETE FROM boisson;
DELETE FROM focaccia;
DELETE FROM ingredient;
DELETE FROM marque;

-- 1) marque
-- CSV : nom
LOAD DATA LOCAL INFILE 'data/marque.csv'
INTO TABLE marque
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom);

-- 2) ingredient
-- CSV : nom
LOAD DATA LOCAL INFILE 'data/ingredient.csv'
INTO TABLE ingredient
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom);

-- 3) focaccia
-- CSV : nom,prix,ingredients
-- On ignore la colonne ingredients (texte)
LOAD DATA LOCAL INFILE 'data/focaccia.csv'
INTO TABLE focaccia
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom, prix, @ingredients_texte);

-- 4) boisson
-- CSV : nom,marque
DROP TEMPORARY TABLE IF EXISTS boisson_tmp;

CREATE TEMPORARY TABLE boisson_tmp (
  nom VARCHAR(150),
  marque VARCHAR(100)
);

LOAD DATA LOCAL INFILE 'data/boisson.csv'
INTO TABLE boisson_tmp
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom, marque);

-- On insère dans la vraie table boisson en reliant la marque texte à la table marque
INSERT INTO boisson (nom, id_marque, prix)
SELECT bt.nom, m.id_marque, 0
FROM boisson_tmp bt
JOIN marque m ON m.nom = bt.marque;

