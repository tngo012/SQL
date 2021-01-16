-- Left and Right Join

-- The syntax of a RIGHT JOIN

SELECT right_table.id AS R_id,
       left_table.val AS L_val,
       right_table.val AS R_val
FROM left_table
RIGHT JOIN right_table
ON left_table.id = right_table.id;

-- Select the city name (with alias), the country code,
-- the country name (with alias), the region,
-- and the city proper population
SELECT c1.name AS city, code, c2.name AS country,
       region, city_proper_pop
-- From left table (with alias)
FROM countries AS c2
  -- Join to right table (with alias)
  INNER JOIN cities AS c1
    -- Match on country code
    ON c1.country_code = c2.code
-- Order by descending country code
ORDER BY code DESC;

/*
5. Select country name AS country, the country's local name,
the language name AS language, and
the percent of the language spoken in the country
*/
SELECT c.name AS country, local_name, l.name AS language, percent
-- 1. From left table (alias as c)
FROM countries AS c
  -- 2. Join to right table (alias as l)
  INNER JOIN languages AS l
    -- 3. Match on fields
    ON c.code = l.code
-- 4. Order by descending country
ORDER BY country DESC;

