CREATE OR REPLACE DATABASE linkedin_network;
CREATE OR REPLACE SCHEMA linkedin_network.staging;

CREATE OR REPLACE TABLE linkedin_network.staging.connections (
    Full_Name STRING,
    Position STRING,
    company STRING,
    connected_on STRING,
    Email_Address STRING,
    url STRING,
    job_category STRING
);

DELETE FROM linkedin_network.staging.connections WHERE Full_Name='Full Name';

// Connections by Job Category (Bar or Pie)
SELECT job_category, COUNT(*) AS total_connections
FROM connections
GROUP BY job_category
ORDER BY total_connections DESC;

//Top 10 Companies with Most Connections
SELECT company, COUNT(*) AS connection_count
FROM connections
GROUP BY company
ORDER BY connection_count DESC
LIMIT 10;

// % of Data Science-Aligned Connections
SELECT 
  COUNT(*) AS total_connections,
  SUM(CASE WHEN job_category = 'Data Science' THEN 1 ELSE 0 END) AS data_science_connections,
  ROUND(100.0 * SUM(CASE WHEN job_category = 'Data Science' THEN 1 ELSE 0 END) / COUNT(*), 2) AS ds_alignment_percentage
FROM connections;

// Connection Trends Over Time
SELECT 
  TO_DATE(connected_on, 'DD MON YYYY') AS connection_date,
  COUNT(*) AS connections
FROM connections
GROUP BY connection_date
ORDER BY connection_date;