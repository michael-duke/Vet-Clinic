/*Queries that provide answers to the questions from all projects.*/

--Monday

/*
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered = 'TRUE' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN('Agumon','Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 'TRUE';
SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
*/

--Tuesday
UPDATE animals SET species = NULL;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
--1st transaction
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon'
WHERE species IS NULL;
--2nd transaction
COMMIT;
SELECT * FROM animals ORDER BY id;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
--3rd transaction
ROLLBACK;
SELECT * FROM animals ORDER BY id;