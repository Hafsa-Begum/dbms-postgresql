CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    region VARCHAR(50) NOT NULL DEFAULT 'Mid point of region'
);
CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(100),
    discovery_date DATE,
    conservation_status VARCHAR(25)
);
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    species_id INTEGER REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location TEXT,
    notes VARCHAR(250)
);

DROP TABLE rangers;
SELECT * FROM rangers;
DROP TABLE species;
SELECT * FROM species;
DROP TABLE sightings;
SELECT * FROM sightings;

--insert data to rangers
INSERT INTO rangers (name, region ) VALUES
('Alice Green','Northern Hills'),
('Bob White','River Delta'),
('Carol King','Mountain Range')

--insert data to species
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01','Endangered'),
('Bengal Tiger', 'Panthera tigris' , '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus','1758-01-01' ,'Endangered')

--insert data to sightings
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL)
-- Problem - 1
INSERT INTO rangers (name, region ) VALUES
('Derek Fox','Coastal Plains')

-- Problem - 2
SELECT count(DISTINCT discovery_date) as unique_species_count FROM species;
-- Problem - 3
SELECT * FROM sightings
    WHERE location LIKE('%Pass');
-- Problem - 4
SELECT name, count(*) FROM rangers as r
JOIN sightings s on r.ranger_id = s.ranger_id
GROUP BY r.name;
-- Problem - 5
SELECT common_name FROM species as sp
LEFT JOIN sightings s on sp.species_id = s.species_id
WHERE s.species_id IS NULL;;
-- Problem - 6
SELECT common_name, sighting_time, name  FROM 
rangers as r
JOIN sightings s on r.ranger_id = s.ranger_id
JOIN species sp on sp.species_id = s.species_id 
ORDER BY sighting_time DESC LIMIT(2);
-- Problem - 7
UPDATE species
    set conservation_status = 'Historic'
    WHERE discovery_date < '1800-01-01';
-- Problem - 8
SELECT sighting_id,
    CASE 
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon' 
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    ELSE 'Evening'
    END as time_of_day
    FROM sightings;
-- Problem - 9
DELETE FROM rangers
USING rangers AS r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
WHERE r.ranger_id = rangers.ranger_id
  AND s.ranger_id IS NULL;