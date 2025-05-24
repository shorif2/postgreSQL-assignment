-- Active: 1747462031077@@localhost@5100@wildlife
CREATE DATABASE wildlife

-- create table
-- 1.rangers 
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    region VARCHAR(100)

)
-- 2. species
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100),
    scientific_name VARCHAR(100),
    discovery_date DATE,
    conservation_status VARCHAR(100)
)
-- 3. sightings (with foreign keys)
CREATE TABLE sightings (
sighting_id SERIAL PRIMARY KEY,
species_id FOREIGN KEY,
ranger_id FOREIGN KEY,
location VARCHAR(100),
sighting_time DATE,
notes VARCHAR(100)
)
--insert data to rangers
INSERT INTO rangers (name, region)
VALUES ('Alice Green',  'Northern Hills'),('Bob White', 'River Delta'),('Carol King', 'Mountain Range')

--insert data to species
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status)
VALUES ('Snow Leopard','Panthera uncia','1775-01-01','Endangered'),
('Bengal Tiger','Panthera tigris tigris','1758-01-01','Endangered'),
('Red Panda','Ailurus fulgens','1825-01-01','Vulnerable'),
('Asiatic Elephant','Elephas maximus indicus','1758-01-01','Endangered')

-- 3. sightings

CREATE TABLE sightings (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    region VARCHAR(100)

)

SELECT * FROM species

SELECT * From rangers