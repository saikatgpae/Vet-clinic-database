/* Database schema to keep the structure of entire database. */
-- DAY 1
DROP TABLE IF EXISTS animals;
CREATE TABLE animals(
	id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
	name TEXT NOT NULL,
	date_of_birth date,
	escape_attempts INT,
	neutered BOOL,
	weight_kg DEC
);

-- DAY 2
ALTER TABLE animals ADD species TEXT;

-- DAY 3
DROP TABLE IF EXISTS owners;
CREATE TABLE owners(
	id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
	full_name TEXT NOT NULL,
	age INT
);

DROP TABLE IF EXISTS species;
CREATE TABLE species(
	id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
	name TEXT NOT NULL
);

ALTER TABLE animals
	DROP COLUMN species;

ALTER TABLE animals
	ADD species_id INT;

ALTER TABLE animals
	ADD species_id INT,
	ADD FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals
	ADD owner_id INT,
	ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

-- DAY 4
DROP TABLE IF EXISTS vets;
CREATE TABLE vets(
	id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
	name TEXT NOT NULL,
	date_of_graduation date,
	age INT
);

DROP TABLE IF EXISTS specializations;
CREATE TABLE specializations (
  vet_id INT NOT null,
  species_id INT NOT null,
  CONSTRAINT fk_vets FOREIGN KEY(vet_id) REFERENCES vets(id),
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id)
);

create table visits (
  animal_id INT NOT null,
  vet_id INT NOT null,
  last_visit DATE,
  CONSTRAINT fk_animal_id FOREIGN KEY(animal_id) REFERENCES animals(id),
  CONSTRAINT fk_vet_id FOREIGN KEY(vet_id) REFERENCES vets(id)
);
