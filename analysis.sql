--Movies vs TV Shows growth over time
SELECT release_year, type, COUNT(*) AS total_content
FROM Netflix
WHERE release_year >= 2000
GROUP BY release_year, type
ORDER BY release_year;

--Content growth AFTER Netflix global expansion
SELECT release_year, COUNT(*) AS total_content
FROM Netflix
WHERE release_year >= 2015
GROUP BY release_year
ORDER BY release_year;

--Top countries contribution share
SELECT country,
       COUNT(*) AS total_content,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM Netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_content DESC
LIMIT 5;

--Content maturity vs explosion phase
SELECT
  CASE
    WHEN release_year < 2000 THEN 'Pre-2000'
    WHEN release_year BETWEEN 2000 AND 2010 THEN '2000-2010'
    WHEN release_year BETWEEN 2011 AND 2015 THEN '2011-2015'
    ELSE 'Post-2015'
  END AS content_phase,
  COUNT(*) AS total_content
FROM Netflix
GROUP BY content_phase
ORDER BY total_content DESC;
