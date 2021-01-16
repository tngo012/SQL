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
Select country name AS country, the country's local name,
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

/*
CROSSing the Rubicon
CROSS JOINs - create all possible combinations of two tables
*/

-- Pairing prime ministers with presidents to schedule for individual meetings
-- Syntax
SELECT prime_minister, president
FROM prime_minister AS p1
CROSS JOIN president AS p2
WHERE p1.continent IN ('North America', 'Oceania');

-- PRACTICE
-- Select fields
SELECT c.name AS country, region, p.life_expectancy AS life_exp
-- From countries (alias as c)
FROM countries AS c
  -- Join to populations (alias as p)
  LEFT JOIN populations AS p
    -- Match on country code
    ON c.code = p.country_code
-- Focus on 2010
WHERE p.year = 2010
-- Order by life_exp
ORDER BY p.life_expectancy
-- Limit to 5 records
LIMIT 5;


/*
State of the UNION

Set Theory Venn Diagrams: Union, Union All, Intersect, Except
Union - includes every record in both tables, but does not double count those in both tables
Union All - includes every record in both tables, and does replicate those in both tables
Intersect - includes only records found in both tables
Except - includes only some records in one table, but not the other
*/

-- Syntax for UNION and UNION ALL

-- All prime ministers and monarchs
SELECT prime_minister AS leader, country
FROM prime_minister
UNION
SELECT monarch, country
FROM monarchs
ORDER BY country;

-- PRACTICE
-- Select fields from 2010 table
SELECT *
  -- From 2010 table
  FROM economies2010
	-- Set theory clause
	UNION
-- Select fields from 2015 table
SELECT *
  -- From 2015 table
  FROM economies2015
-- Order by code and year
ORDER BY code, year;

-- Select field
SELECT country_code
  -- From cities
  FROM cities
	-- Set theory clause
	UNION
-- Select field
SELECT code
  -- From currencies
  FROM currencies
-- Order by country_code
ORDER BY country_code;

-- Select fields
SELECT code, year
  -- From economies
  FROM economies
	-- Set theory clause
	UNION ALL
-- Select fields
SELECT country_code, year
  -- From populations
  FROM populations
-- Order by code, year
ORDER BY code, year;

/*
Intersectional Data Science
*/

SELECT id
FROM left_one
INTERSECT
SELECT id
FROM right_one

-- PRACTICE

-- Select fields
SELECT code, year
  -- From economies
  FROM economies
	-- Set theory clause
	INTERSECT
-- Select fields
SELECT country_code, year
  -- From populations
  FROM populations
-- Order by code and year
ORDER BY code, year;

-- Select fields
SELECT code, name
  -- From countries
  FROM countries
	-- Set theory clause
	INTERSECT
-- Select fields
SELECT country_code, name
  -- From cities
  FROM cities;


/*
EXCEPTional
*/

