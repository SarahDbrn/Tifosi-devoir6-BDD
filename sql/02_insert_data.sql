USE tifosi;

SET SESSION local_infile = 1;

-- 1) marque
TRUNCATE TABLE marque;

LOAD DATA LOCAL INFILE 'data/marque.csv'
INTO TABLE marque
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom);

-- 2) ingredient
TRUNCATE TABLE ingredient;

LOAD DATA LOCAL INFILE 'data/ingredient.csv'
INTO TABLE ingredient
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom);

-- 3) focaccia
TRUNCATE TABLE focaccia;

LOAD DATA LOCAL INFILE 'data/focaccia.csv'
INTO TABLE focaccia
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom, prix);

-- 4) boisson (avec marque jointe)
DROP TEMPORARY TABLE IF EXISTS boisson_tmp;

CREATE TEMPORARY TABLE boisson_tmp (
  nom VARCHAR(150),
  marque VARCHAR(100),
  prix DECIMAL(6,2)
);

LOAD DATA LOCAL INFILE 'data/boisson.csv'
INTO TABLE boisson_tmp
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom, marque, prix);

TRUNCATE TABLE boisson;

INSERT INTO boisson (nom, id_marque, prix)
SELECT bt.nom, m.id_marque, bt.prix
FROM boisson_tmp bt
JOIN marque m ON m.nom = bt.marque;
