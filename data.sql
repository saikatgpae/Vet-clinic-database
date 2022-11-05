/* Populate database with sample data. */
-- DAY 1
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES 	('Agumon', '2020-3-2', 0, FALSE, 10.23),
			('Gabumon', '2018-11-15', 2, TRUE,8.00),
			('Pikachu', '2021-1-7', 1, FALSE,15.04),
	 		('Devimon', '2017-5-12', 5, TRUE,11.00);

-- DAY 2
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES 	('Charmander', '2020-2-8', 0, FALSE ,-11),
			('Plantmon', '2020-11-15', 2, TRUE ,-5.7),
			('Squirtle', '1993-4-2', 3, FALSE ,-12.13),
			('Angemon', '2005-6-12', 1, TRUE ,-45),
			('Boarmon', '2005-6-7', 7, TRUE ,20.4),
			('Blossom', '1998-10-13', 3, TRUE ,17),
			('Ditto', '2022-5-14', 4, TRUE ,22);

-- DAY 3
INSERT INTO owners (full_name, age)
	VALUES 	('Sam Smith', 34),
			('Jennifer Orwell', 19),
			('Bob ', 45),
			('Melody Pond', 77),
			('Dean Winchester', 14),
			('Jodie Whittaker', 38);

INSERT INTO species (name)
	VALUES 	('Pokemon'),
			('Digimon');
UPDATE animals
	SET species_id = 2
		WHERE name LIKE '%mon';
		
UPDATE animals		
	SET species_id = 1
		WHERE name NOT LIKE '%mon';
        
UPDATE animals SET owner_id =1  WHERE name='Agumon';
UPDATE animals SET owner_id =2  WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id =3   WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id =4   WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id =5   WHERE name IN ('Angemon', 'Boarmon');

-- DAY 4
INSERT INTO vets(name, age, date_of_graduation)
	VALUES 	('William Tatcher', 45, '2000-4-23'),
			('Maisy Smith', 26, '2019-2-17'),
			('Stephanie Mendez', 64, '1981-5-4'),
			('Jack Harkness', 38, '2008-1-8');

INSERT INTO specializations (vet_id, species_id)
	VALUES 	(1,1),
			(3,1),
			(3,2),
			(4,2);

INSERT INTO visits (vet_id, animal_id, last_visit)
	VALUES	(1, 6, '2020-5-24'),
			(3, 6, '2020-7-22'),
			(4, 7, '2021-2-2'),
			(2, 8, '2020-1-5'),
			(2, 8, '2020-3-8'),
			(2, 8, '2020-5-14'),
			(3, 9, '2021-5-14'),
			(4, 10, '2021-2-24'),
			(2, 11, '2019-12-21'),
			(1, 11, '2020-8-10'),
			(2, 11, '2021-4-7'),
			(3, 12, '2019-9-29'),
			(4, 13, '2020-10-3'),
			(4, 13, '2020-11-4'),
			(2, 14, '2019-2-24'),
			(2, 14, '2019-5-15'),
			(2, 14, '2020-2-27'),
			(2, 14, '2020-8-3'),
			(3, 15, '2020-5-24'),
			(1, 15, '2021-1-11');
			