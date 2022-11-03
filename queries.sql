/*Queries that provide answers to the questions from all projects.*/
-- DAY 1
SELECT * from 
	animals
	WHERE name LIKE '%mon';

SELECT name from 
	animals
	WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-01-01';

SELECT name from 
	animals
	WHERE neutered = 'true' AND escape_attempts < 3;

SELECT date_of_birth from 
	animals
	WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name , escape_attempts from 
	animals
	WHERE weight_kg > 10.5;

SELECT * from 
	animals
	WHERE neutered = 'true';

SELECT * from 
	animals
	WHERE name != 'Gabumon';

SELECT * from 
	animals
	WHERE weight_kg BETWEEN 10.4 AND 17.3;
    
-- DAY 2
UPDATE animals
	SET species = 'unspecifie';
ROLLBACK;

UPDATE animals
	SET species = 'digimon'
		WHERE name LIKE '%mon';
		
UPDATE animals
	SET species = 'pokemon'
		WHERE species = 'NULL';	
COMMIT;

DELETE 
	FROM animals;
ROLLBACK;

BEGIN;
SAVEPOINT sp1;
DELETE 
	FROM animals 
		WHERE date_of_birth > '2022-01-01';
UPDATE animals 
	SET weight_kg = weight_kg * -1;
ROLLBACK TO sp1;
UPDATE animals
	SET weight_kg = weight_kg * -1
		WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(id)
	FROM animals;

SELECT COUNT(*)
	FROM animals
	WHERE escape_attempts = 0;

SELECT AVG(weight_kg)
	FROM animals;

SELECT neutered, MAX(escape_attempts) AS escape_attempts
	FROM animals
	GROUP BY neutered;

SELECT MAX(weight_kg), MIN(weight_kg)
	FROM animals

SELECT AVG(escape_attempts) AS AVG_escape_attempts
	FROM animals
	WHERE date_of_birth >= '1990/01/01' AND date_of_birth <= '2000/12/31';
