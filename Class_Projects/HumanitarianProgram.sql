-- SQLite
-- Humanitarian Program Impact Analysis
-- Allow foreign keys
PRAGMA foreign_keys = ON;

-- Create the tables
-- Jurisdiction_hierarchy
CREATE TABLE IF NOT EXISTS jurisdiction_hierarchy(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(30) NOT NULL UNIQUE,
level VARCHAR(20) NOT NULL CHECK (level IN ('County', 'Sub-county', 'Village')),
parent VARCHAR(30) NULL,
FOREIGN KEY (parent) REFERENCES jurisdiction_hierarchy(name) ON DELETE CASCADE
);

-- Village_locations
CREATE TABLE IF NOT EXISTS village_locations(
village_id INTEGER PRIMARY KEY AUTOINCREMENT,
village VARCHAR(30) NOT NULL UNIQUE,
total_population INTEGER NOT NULL CHECK (total_population >= 0),

FOREIGN KEY (village) REFERENCES jurisdiction_hierarchy(name) ON DELETE CASCADE
);

-- Beneficiary_partner_data
CREATE TABLE IF NOT EXISTS beneficiary_partner_data(
partner_id INTEGER PRIMARY KEY AUTOINCREMENT,
partner VARCHAR(30) NOT NULL,
village VARCHAR(30) NOT NULL,
beneficiaries INTEGER NOT NULL CHECK (beneficiaries >= 0),
beneficiary_type VARCHAR(30) NOT NULL CHECK (beneficiary_type IN ('Individuals', 'Households')),

FOREIGN KEY (village) REFERENCES village_locations(village) ON DELETE CASCADE
);

-- Insert the data
INSERT INTO jurisdiction_hierarchy (name, level, parent) VALUES
('Nairobi', 'County', NULL),
('Kiambu', 'County', NULL),
('Mombasa', 'County', NULL),

('Westlands', 'Sub-county', 'Nairobi'),
('Kasarani', 'Sub-county', 'Nairobi'),
('Lari', 'Sub-county', 'Kiambu'),
('Gatundu South', 'Sub-county', 'Kiambu'),
('Kisauni', 'Sub-county', 'Mombasa'),
('Likoni', 'Sub-county', 'Mombasa'),

('Parklands', 'Village', 'Westlands'),
('Kangemi', 'Village', 'Westlands'),
('Roysambu', 'Village', 'Kasarani'),
('Githurai', 'Village', 'Kasarani'),
('Kiamwangi', 'Village', 'Lari'),
('Lari Town', 'Village', 'Lari'),
('Kamwangi', 'Village', 'Gatundu South'),
('Kisauni Town', 'Village', 'Kisauni'),
('Mtopanga', 'Village', 'Kisauni'),
('Likoni Town', 'Village', 'Likoni'),
('Shika Adabu', 'Village', 'Likoni')
;


INSERT INTO village_locations (village, total_population) VALUES
('Parklands', 15000),
('Kangemi', 18000),
('Roysambu', 13000),
('Githurai', 12500),
('Kiamwangi', 12800),
('Lari Town', 9485),
('Kamwangi', 5212),
('Kisauni Town', 20500),
('Mtopanga', 15500),
('Likoni Town', 12000),
('Shika Adabu', 9000)
;


INSERT INTO beneficiary_partner_data (partner, village, beneficiaries, beneficiary_type) VALUES
('IRC', 'Parklands', 1450, 'Individuals'),
('NRC', 'Parklands', 50, 'Households'),
('SCI', 'Kangemi', 1123, 'Individuals'),
('IMC', 'Kangemi', 1245, 'Individuals'),
('CESVI', 'Roysambu', 5200, 'Individuals'),
('IMC', 'Githurai', 70, 'Households'),
('IRC', 'Githurai', 2100, 'Individuals'),
('SCI', 'Kiamwangi', 1800, 'Individuals'),
('IMC', 'Lari Town', 1340, 'Individuals'),
('CESVI', 'Kamwangi', 55, 'Households'),
('IRC', 'Kisauni Town', 4500, 'Individuals'),
('SCI', 'Kisauni Town', 1670, 'Individuals'),
('IMC', 'Mtopanga', 1340, 'Individuals'),
('CESVI','Likoni Town', 4090, 'Individuals'),
('IRC', 'Shika Adabu', 2930, 'Individuals'),
('SCI', 'Shika Adabu', 5200, 'Individuals')
;

-- POJECT TASKS
-- 1ST TASK - Aggregate Functions, GROUP BY % CASE WHEN
-- 1. Total beneficiaries per partner (convert households to individuals).
SELECT partner, SUM(
    CASE
    WHEN beneficiary_type = 'Households' 
    THEN beneficiaries * 6
    ELSE beneficiaries
    END
    ) AS total_individuals
FROM beneficiary_partner_data
GROUP BY partner
ORDER BY total_individuals DESC;


-- 2. Count the number of villages served per partner.
SELECT partner, COUNT(
    DISTINCT village) AS villages_served
FROM beneficiary_partner_data
GROUP BY partner
ORDER BY villages_served DESC;


-- 3. Compute the average beneficiaries per village.
SELECT ROUND(AVG(
    village_total), 2) AS avg_beneficiaries_per_village
FROM(SELECT village,SUM(CASE
    WHEN beneficiary_type = 'Households' THEN beneficiaries * 6
    ELSE beneficiaries
    END
    ) AS village_total
    FROM beneficiary_partner_data
    GROUP BY village
);


-- 4. Identify partners serving more than 5000 beneficiaries (HAVING).
SELECT partner, SUM(
    CASE WHEN beneficiary_type = 'Households' THEN beneficiaries * 6
    ELSE beneficiaries
    END
    ) AS total_individuals
FROM beneficiary_partner_data
GROUP BY partner
HAVING total_individuals > 5000
ORDER BY total_individuals DESC;


-- 5. Find villages with multiple partners (HAVING).
SELECT village, COUNT(
    DISTINCT partner) AS num_partners
FROM beneficiary_partner_data
GROUP BY village
HAVING num_partners > 1
ORDER BY num_partners DESC;



-- 2ND TASK - JOINS $ COMBINED QUERIES
-- 1. Join to calculate coverage per village
SELECT vl.village, vl.total_population,
    SUM(
    CASE WHEN bp.beneficiary_type = 'Households' THEN bp.beneficiaries * 6
    ELSE bp.beneficiaries
    END
    ) AS total_beneficiaries,
    ROUND(SUM(CASE WHEN bp.beneficiary_type = 'Households' THEN bp.beneficiaries * 6
    ELSE bp.beneficiaries
    END
    ) * 1.0 / vl.total_population, 4) AS coverage_rate
FROM village_locations vl
INNER JOIN beneficiary_partner_data bp ON vl.village = bp.village
GROUP BY vl.village, vl.total_population
ORDER BY coverage_rate DESC;


-- 2. Create a combined query 
SELECT 
    vl.village AS village, 
    bp.partner, 
    'Has Partner' AS status
FROM village_locations vl
LEFT JOIN beneficiary_partner_data bp ON vl.village = bp.village
WHERE bp.partner IS NOT NULL

UNION

SELECT 
    vl.village, 
    'No Partner' AS partner, 
    'Unserved' AS status
FROM village_locations vl
LEFT JOIN beneficiary_partner_data bp ON vl.village = bp.village
WHERE bp.village IS NULL

ORDER BY village;



-- 3RD TASK - NESTED QUERIES / SUBQUERIES
-- 1. Find villages where coverage > avg village coverage
SELECT village, coverage_rate
FROM(
    SELECT vl.village, ROUND(SUM(
    CASE WHEN bp.beneficiary_type = 'Households' THEN bp.beneficiaries * 6
    ELSE bp.beneficiaries
    END
    ) * 1.0 / vl.total_population, 4) AS coverage_rate
FROM village_locations vl
INNER JOIN beneficiary_partner_data bp ON vl.village = bp.village
GROUP BY vl.village, vl.total_population
) AS village_coverage
WHERE coverage_rate > (
    SELECT AVG(Coverage_rate)
    FROM(
    SELECT vl.village, ROUND(SUM(
    CASE WHEN bp.beneficiary_type = 'Households' THEN bp.beneficiaries * 6
    ELSE bp.beneficiaries
    END
    ) * 1.0 / vl.total_population, 4) AS coverage_rate
    FROM village_locations vl
    INNER JOIN beneficiary_partner_data bp ON vl.village = bp.village
    GROUP BY vl.village, vl.total_population
    )
)
ORDER BY coverage_rate DESC;


-- 2. Find partners who serve more than the avg num_beneficiaries
SELECT partner, SUM(
    CASE WHEN beneficiary_type = 'Households' THEN beneficiaries * 6
    ELSE beneficiaries
    END
    ) AS total_individuals
FROM beneficiary_partner_data
GROUP BY partner
HAVING total_individuals > (
    SELECT AVG(
    partner_total)
    FROM(
    SELECT partner, SUM(
    CASE WHEN beneficiary_type = 'Households' THEN beneficiaries * 6
    ELSE beneficiaries
    END
    ) AS partner_total
    FROM beneficiary_partner_data
    GROUP BY partner
    )
)
ORDER BY total_individuals DESC;


-- 4TH TASK - CTEs (COMMON TABLE EXPRESSIONS)
-- 1. District-level summary
WITH sub-county_totals AS(
    SELECT
    jh_sub.name AS sub_county,
    jh_county.name AS county,
    SUM(
    vl.total_population) AS total_population,
    SUM(
    CASE WHEN bp.beneficiary_type = 'Households' THEN bp.beneficiaries * 6
    ELSE bp.beneficiaries
    END
    ) AS total_beneficiaries
    FROM jurisdiction_hierarchy jh_village
    INNER JOIN jurisdiction_hierarchy jh_sub
        ON jh_village.parent = jh_sub.name
    INNER JOIN jurisdiction_hierarchy jh_county
        ON jh_sub.parent = jh_county.name
    INNER JOIN village_locations vl
        ON jh_village.name = vl.village
    LEFT JOIN beneficiary_partner_data bp
        ON vl.village = bp.village
    WHERE jh_village.level = 'Village'
    GROUP BY jh_sub.name, jh_county.name
),
    -- 2. Rank districts by coverage
ranked AS (
    SELECT 
    sub_county,
    county,
    total_population,
    total_beneficiaries,
    ROUND(
    total_beneficiaries * 1.0 / total_population, 4) AS coverage_rate,
    RANK() OVER(
    PARTITION BY county
    ORDER BY total_beneficiaries DESC
    ) AS rank_in_county
    FROM sub_county_totals
)
SELECT * FROM ranked
ORDER BY county, rank_in_county;



-- 5TH TASK - WINDOW FUNCTIONS
-- 1. 
