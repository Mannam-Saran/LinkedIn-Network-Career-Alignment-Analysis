// View: Connections by Job Category
CREATE OR REPLACE VIEW linkedin_network.staging.connections_by_category AS
SELECT 
    job_category,
    COUNT(*) AS total_connections
FROM linkedin_network.staging.connections
GROUP BY job_category
ORDER BY total_connections DESC;

// View: % Aligned with Data Science
CREATE OR REPLACE VIEW linkedin_network.staging.ds_alignment_summary AS
SELECT 
    COUNT(*) AS total_connections,
    SUM(CASE WHEN job_category = 'Data Science' THEN 1 ELSE 0 END) AS data_science_connections,
    ROUND(100.0 * SUM(CASE WHEN job_category = 'Data Science' THEN 1 ELSE 0 END) / COUNT(*), 2) AS ds_alignment_percentage
FROM linkedin_network.staging.connections;

// View: Top 10 Companies by Number of Connections
CREATE OR REPLACE VIEW linkedin_network.staging.top_companies AS
SELECT 
    company,
    COUNT(*) AS connection_count
FROM linkedin_network.staging.connections
GROUP BY company
ORDER BY connection_count DESC
LIMIT 10;

CREATE OR REPLACE VIEW connection_trends AS
SELECT 
  TO_DATE(connected_on, 'DD MON YYYY') AS connection_date,
  COUNT(*) AS new_connections
FROM linkedin_network.staging.connections
GROUP BY connection_date
ORDER BY connection_date;


SELECT * FROM linkedin_network.staging.connections_by_category;
SELECT * FROM linkedin_network.staging.ds_alignment_summary;
SELECT * FROM linkedin_network.staging.top_companies;
SELECT * FROM connection_trends;