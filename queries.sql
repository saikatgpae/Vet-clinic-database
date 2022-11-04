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

-- DAY 3
SELECT O.full_name AS owners_name, A.name AS animals_name
	FROM owners AS O
	JOIN animals AS A ON A.owner_id = O.id
	WHERE O.full_name='Melody Pond';

SELECT * 
	FROM animals AS A
	JOIN species AS S
		ON A.species_id = S.id
		WHERE S.id = 1;

SELECT O.full_name, A.name
	FROM owners AS O
	LEFT JOIN animals AS A
		ON A.owner_id = O.id

SELECT S.id AS species_id, S.name AS species_name, COUNT(A.species_id) AS total_number_of_animals
	FROM species AS S
	JOIN animals AS A
	ON A.species_id = S.id
	GROUP BY S.id

SELECT *
	FROM species AS S
	JOIN animals AS A
	ON S.id = A.species_id
	JOIN owners AS O
	ON O.id = A.owner_id
	WHERE S.id = 2 AND O.full_name = 'Jennifer Orwell';

SELECT O.full_name AS heighest_number_of_animals_holder, COUNT(*) AS total_number_of_animals
	FROM animals AS A
	JOIN owners AS O
	ON O.id = A.owner_id
	GROUP BY O.full_name
	ORDER BY COUNT(*) DESC LIMIT 1;
