USE tifosi;

DELETE FROM focaccia_ingredient;

LOAD DATA LOCAL INFILE 'data/focaccia_ingredient.csv'
INTO TABLE focaccia_ingredient
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_focaccia, id_ingredient, quantite);
