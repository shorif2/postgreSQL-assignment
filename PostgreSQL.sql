-- Active: 1747462031077@@localhost@5100@wildlife
CREATE DATABASE wildlife

-- create table
-- 1.rangers 
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    region VARCHAR(100)
)

DROP TABLE rangers

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

--Problem 1
INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains')

--Problem 2
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;

--Problem 3
SELECT * From sightings WHERE location ILIKE '%Pass%'

--Problem 4
SELECT r.name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name;

--Problem 5
SELECT sp.common_name
FROM species sp
LEFT JOIN sightings si ON sp.species_id = si.species_id
WHERE si.species_id IS NULL;

--Problem 6
SELECT sp.common_name, s.sighting_time, r.name
FROM sightings s
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC
LIMIT 2;

--Problem 7
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

--Problem 8
SELECT 
  sighting_id,
  CASE
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;


--Problem 9
DELETE FROM rangers
WHERE NOT EXISTS (
  SELECT 1
  FROM sightings
  WHERE sightings.ranger_id = rangers.ranger_id
);
--rangers
SELECT * FROM rangers

--species
SELECT * From species

--sightings
SELECT * From sightings


