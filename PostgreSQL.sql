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
species_id INT,
ranger_id INT,
location VARCHAR(100),
sighting_time TIMESTAMP,
notes TEXT,
FOREIGN KEY (species_id) REFERENCES species(species_id),
FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id)
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

--insert data to sightings
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes)
VALUES
(1,1,'Peak Ridge','2024-05-10 07:45:00','Camera trap image captured'),
(2,2,'Bankwood Area','2024-05-12 16:20:00','Juvenile seen'),
(3,3,'Bamboo Grove East','2024-05-15 09:10:00','Feeding observed'),
(1,2,'Snowfall Pass','2024-05-18 18:30:00', NULL);


--rangers
SELECT * FROM species

--species
SELECT * From rangers

--sightings
SELECT * From sightings

--Problem 1
INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains')

--Problem 2
SELECT DISTINCT species_id
FROM sightings;