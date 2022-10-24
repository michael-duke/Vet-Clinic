/* Database schema to keep the structure of entire database. */
DROP TABLE IF EXISTS visits;
DROP TABLE IF EXISTS specializations;
DROP TABLE IF EXISTS vets;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS animals;
--Week 1
--Monday

/*
CREATE TABLE animals (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);
*/

--Tuesday
/*
CREATE TABLE animals (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL,
    species varchar(100) NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);
*/

--Wednesday
/*
CREATE TABLE owners (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    full_name varchar(100) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE species (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL
);

CREATE TABLE animals (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL,
    species_id INT NULL REFERENCES species(id) ON DELETE CASCADE,
    owner_id INT NULL REFERENCES owners(id) ON DELETE CASCADE,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);
*/

--Thursday
/*
CREATE TABLE owners (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    full_name varchar(100) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE species (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL
);

CREATE TABLE animals (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL,
    species_id INT NULL REFERENCES species(id) ON DELETE CASCADE,
    owner_id INT NULL REFERENCES owners(id) ON DELETE CASCADE,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

CREATE TABLE vets (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
    species_id INT NULL REFERENCES species(id) ON DELETE CASCADE,
    vet_id INT NULL REFERENCES vets(id) ON DELETE CASCADE
);

CREATE TABLE visits (
    animal_id INT NULL REFERENCES animals(id) ON DELETE CASCADE,
    vet_id INT NULL REFERENCES vets(id) ON DELETE CASCADE,
    date_of_visit DATE NOT NULL
);
*/

-- Week 2
--Monday

CREATE TABLE owners (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    full_name varchar(100) NOT NULL,
    age INT NULL
);

CREATE TABLE species (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL
);

CREATE TABLE animals (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL,
    species_id INT NULL REFERENCES species(id) ON DELETE CASCADE,
    owner_id INT NULL REFERENCES owners(id) ON DELETE CASCADE,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

CREATE TABLE vets (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL
);

CREATE TABLE visits (
    animal_id INT NULL REFERENCES animals(id) ON DELETE CASCADE,
    vet_id INT NULL REFERENCES vets(id) ON DELETE CASCADE,
    date_of_visit DATE NOT NULL
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Create index to enhance performance
CREATE INDEX visits_animal_id ON visits(animal_id);
CREATE INDEX visits_vet_id ON visits(vet_id);
CREATE INDEX owners_email ON owners(email);