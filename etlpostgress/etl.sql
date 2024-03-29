
CREATE TABLE video_games (
    Name VARCHAR(255),
    Platform VARCHAR(50),
    Year_of_Release VARCHAR(50),
    Genre VARCHAR(50),
    Publisher VARCHAR(255),
    NA_Sales VARCHAR(50),
    EU_Sales VARCHAR(50),
    JP_Sales VARCHAR(50),
    Other_Sales VARCHAR(50),
    Global_Sales VARCHAR(50),
    Critic_Score  VARCHAR(50),
    Critic_Count  VARCHAR(50),
    User_Score VARCHAR(5),
    User_Count VARCHAR(50),
    Developer VARCHAR(255),
    Rating VARCHAR(5)
);

COPY video_games
FROM '/var/lib/postgresql/data/ivideosgame.csv'
WITH CSV HEADER DELIMITER ',' QUOTE '"';



-- TABLA world_indicators
ALTER TABLE world_indicators 
RENAME COLUMN "Series Name" TO series_name;
ALTER TABLE world_indicators 
RENAME COLUMN "Series Code" TO series_code;
ALTER TABLE world_indicators 
RENAME COLUMN "Country Name" TO country_name;
ALTER TABLE world_indicators  
RENAME COLUMN "Country Code" TO country_code;
ALTER TABLE world_indicators 
RENAME COLUMN "2000 [YR2000]" TO yr_2000;
ALTER TABLE world_indicators 
RENAME COLUMN "2001 [YR2001]" TO yr_2001;
ALTER TABLE world_indicators 
RENAME COLUMN "2002 [YR2002]" TO yr_2002;
ALTER TABLE world_indicators 
RENAME COLUMN "2003 [YR2003]" TO yr_2003;
ALTER TABLE world_indicators 
RENAME COLUMN "2004 [YR2004]" TO yr_2004;
ALTER TABLE world_indicators 
RENAME COLUMN "2005 [YR2005]" TO yr_2005;
ALTER TABLE world_indicators 
RENAME COLUMN "2006 [YR2006]" TO yr_2006;
ALTER TABLE world_indicators   
RENAME COLUMN "2007 [YR2007]" TO yr_2007;
ALTER TABLE world_indicators 
RENAME COLUMN "2008 [YR2008]" TO yr_2008;
ALTER TABLE world_indicators 
RENAME COLUMN "2009 [YR2009]" TO yr_2009;
ALTER TABLE world_indicators  
RENAME COLUMN "2010 [YR2010]" TO yr_2010;
ALTER TABLE world_indicators 
RENAME COLUMN "2011 [YR2011]" TO yr_2011;
ALTER TABLE world_indicators  
RENAME COLUMN "2012 [YR2012]" TO yr_2012;
ALTER TABLE world_indicators 
RENAME COLUMN "2013 [YR2013]" TO yr_2013;
ALTER TABLE world_indicators 
RENAME COLUMN "2014 [YR2014]" TO yr_2014;
ALTER TABLE world_indicators 
RENAME COLUMN "2015 [YR2015]" TO yr_2015;
ALTER TABLE world_indicators 
RENAME COLUMN "2016 [YR2016]" TO yr_2016;
ALTER TABLE world_indicators   
RENAME COLUMN "2017 [YR2017]" TO yr_2017;
ALTER TABLE world_indicators 
RENAME COLUMN "2018 [YR2018]" TO yr_2018;
ALTER TABLE world_indicators 
RENAME COLUMN "2019 [YR2019]" TO yr_2019;

-- SELECT * FROM world_indicators LIMIT 10;

-- 202 vlores con ..
SELECT yr_2019, COUNT(yr_2019) AS num_reg
FROM world_indicators 
GROUP BY yr_2019;

SELECT country_code, COUNT(country_code) AS num_paises
FROM world_indicators 
GROUP BY country_code;

SELECT series_name, COUNT(series_name) AS clase_series
FROM world_indicators
GROUP BY series_name; 

/*
SELECT
  SUM(CASE WHEN series_name IS NULL THEN 1 ELSE 0 END) AS nulos_series_name,
  SUM(CASE WHEN series_name = '' THEN 1 ELSE 0 END) AS vacios_series_name,
  SUM(CASE WHEN series_code IS NULL THEN 1 ELSE 0 END) AS nulos_series_code,
  SUM(CASE WHEN series_code = '' THEN 1 ELSE 0 END) AS vacios_series_code,
  SUM(CASE WHEN country_name IS NULL THEN 1 ELSE 0 END) AS nulos_country_name,
  SUM(CASE WHEN country_name = '' THEN 1 ELSE 0 END) AS vacios_country_name,
  SUM(CASE WHEN country_code IS NULL THEN 1 ELSE 0 END) AS nulos_country_code,
  SUM(CASE WHEN country_code = '' THEN 1 ELSE 0 END) AS vacios_country_code,

  SUM(CASE WHEN yr_2000 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2000,
  SUM(CASE WHEN yr_2000 = '' THEN 1 ELSE 0 END) AS vacios_yr_2000,
  
  SUM(CASE WHEN yr_2001 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2001,
  SUM(CASE WHEN yr_2001 = '' THEN 1 ELSE 0 END) AS vacios_yr_2001,

  SUM(CASE WHEN yr_2002 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2002,
  SUM(CASE WHEN yr_2002 = '' THEN 1 ELSE 0 END) AS vacios_yr_2002,

  SUM(CASE WHEN yr_2003 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2003,
  SUM(CASE WHEN yr_2003 = '' THEN 1 ELSE 0 END) AS vacios_yr_2003,

  SUM(CASE WHEN yr_2004 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2004,
  SUM(CASE WHEN yr_2004 = '' THEN 1 ELSE 0 END) AS vacios_yr_2004,

  SUM(CASE WHEN yr_2004 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2004,
  SUM(CASE WHEN yr_2004 = '' THEN 1 ELSE 0 END) AS vacios_yr_2004,

  SUM(CASE WHEN yr_2005 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2005,
  SUM(CASE WHEN yr_2005 = '' THEN 1 ELSE 0 END) AS vacios_yr_2005,
  SUM(CASE WHEN yr_2006 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2006,
  SUM(CASE WHEN yr_2006 = '' THEN 1 ELSE 0 END) AS vacios_yr_2006,
  SUM(CASE WHEN yr_2007 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2007,
  SUM(CASE WHEN yr_2007 = '' THEN 1 ELSE 0 END) AS vacios_yr_2007,
  SUM(CASE WHEN yr_2008 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2008,
  SUM(CASE WHEN yr_2008 = '' THEN 1 ELSE 0 END) AS vacios_yr_2008,
  SUM(CASE WHEN yr_2009 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2009,
  SUM(CASE WHEN yr_2009 = '' THEN 1 ELSE 0 END) AS vacios_yr_2009,
  SUM(CASE WHEN yr_2010 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2010,
  SUM(CASE WHEN yr_2010 = '' THEN 1 ELSE 0 END) AS vacios_yr_2010,

  SUM(CASE WHEN yr_2011 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2011,
  SUM(CASE WHEN yr_2011 = '' THEN 1 ELSE 0 END) AS vacios_yr_2011,
  SUM(CASE WHEN yr_2012 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2012,
  SUM(CASE WHEN yr_2012 = '' THEN 1 ELSE 0 END) AS vacios_yr_2012,
  SUM(CASE WHEN yr_2013 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2013,
  SUM(CASE WHEN yr_2013 = '' THEN 1 ELSE 0 END) AS vacios_yr_2013,  

  SUM(CASE WHEN yr_2014 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2014,
  SUM(CASE WHEN yr_2014 = '' THEN 1 ELSE 0 END) AS vacios_yr_2014,
  SUM(CASE WHEN yr_2015 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2015,
  SUM(CASE WHEN yr_2015 = '' THEN 1 ELSE 0 END) AS vacios_yr_2015,
  SUM(CASE WHEN yr_2016 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2016,
  SUM(CASE WHEN yr_2016 = '' THEN 1 ELSE 0 END) AS vacios_yr_2016,  

  SUM(CASE WHEN yr_2017 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2017,
  SUM(CASE WHEN yr_2017 = '' THEN 1 ELSE 0 END) AS vacios_yr_2017,
  SUM(CASE WHEN yr_2018 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2018,
  SUM(CASE WHEN yr_2018 = '' THEN 1 ELSE 0 END) AS vacios_yr_2018,

  SUM(CASE WHEN yr_2019 IS NULL THEN 1 ELSE 0 END) AS nulos_yr_2019,
  SUM(CASE WHEN yr_2019 = '' THEN 1 ELSE 0 END) AS vacios_yr_2019,


  SUM(CASE WHEN yr_2019 = '..' THEN 1 ELSE 0 END) AS raros_yr_2019
FROM world_indicators;

*/

-- Nulo (NULL): Sin valor definido, valor desconocido.
-- Vacío (''): Hay un valor que es una cadena vacía.


DELETE FROM world_indicators
WHERE series_name IS NULL;

DELETE FROM world_indicators
WHERE series_code IS NULL;

-- SELECT * FROM world_indicators LIMIT 10;

SELECT COUNT(series_name)
FROM world_indicators;

-- Reemplazar los campos año 2018 y 2019 con valores atípicos ".."
UPDATE world_indicators
SET
  yr_2000 = REPLACE(yr_2000, '..', '0'),
  yr_2001 = REPLACE(yr_2001, '..', '0'),
  yr_2002 = REPLACE(yr_2002, '..', '0'),
  yr_2003 = REPLACE(yr_2003, '..', '0'),
  yr_2004 = REPLACE(yr_2004, '..', '0'),
  yr_2005 = REPLACE(yr_2005, '..', '0'),
  yr_2006 = REPLACE(yr_2006, '..', '0'),
  yr_2007 = REPLACE(yr_2007, '..', '0'),
  yr_2008 = REPLACE(yr_2008, '..', '0'),
  yr_2009 = REPLACE(yr_2009, '..', '0'),
  yr_2010 = REPLACE(yr_2010, '..', '0'),
  yr_2011 = REPLACE(yr_2011, '..', '0'),
  yr_2012 = REPLACE(yr_2012, '..', '0'),
  yr_2013 = REPLACE(yr_2013, '..', '0'),
  yr_2014 = REPLACE(yr_2014, '..', '0'),
  yr_2015 = REPLACE(yr_2015, '..', '0'),
  yr_2016 = REPLACE(yr_2016, '..', '0'),
  yr_2017 = REPLACE(yr_2017, '..', '0'),

  yr_2018 = REPLACE(yr_2018, '..', '0'),
  yr_2019 = REPLACE(yr_2019, '..', '0')
WHERE yr_2019 = '..' OR yr_2018 = '..' OR yr_2017 = '..' OR yr_2016 = '..' OR yr_2015 = '..' OR yr_2014 = '..'OR yr_2013 = '..'
OR yr_2012 = '..' OR yr_2011 = '..' OR yr_2010 = '..' OR yr_2009 = '..' OR yr_2008 = '..' OR yr_2007 = '..' OR yr_2006 = '..'
OR yr_2005 = '..' OR yr_2004 = '..' OR yr_2003 = '..' OR yr_2002 = '..' OR yr_2001 = '..' OR yr_2000 = '..';


-- Actualiza los valores eliminando las comas y convirtiéndolos a numérico para las columnas desde yr_2000 hasta yr_2019
-- Actualiza los valores eliminando las comas y convirtiéndolos a numérico para las columnas desde yr_2000 hasta yr_2019



UPDATE world_indicators
SET 
  yr_2000 = REPLACE(yr_2000, ',', '.')::NUMERIC,
  yr_2001 = REPLACE(yr_2001, ',', '.')::NUMERIC,
  yr_2002 = REPLACE(yr_2002, ',', '.')::NUMERIC,
  yr_2003 = REPLACE(yr_2003, ',', '.')::NUMERIC,
  yr_2004 = REPLACE(yr_2004, ',', '.')::NUMERIC,
  yr_2005 = REPLACE(yr_2005, ',', '.')::NUMERIC,
  yr_2006 = REPLACE(yr_2006, ',', '.')::NUMERIC,
  yr_2007 = REPLACE(yr_2007, ',', '.')::NUMERIC,
  yr_2008 = REPLACE(yr_2008, ',', '.')::NUMERIC,
  yr_2009 = REPLACE(yr_2009, ',', '.')::NUMERIC,
  yr_2010 = REPLACE(yr_2010, ',', '.')::NUMERIC,
  yr_2011 = REPLACE(yr_2011, ',', '.')::NUMERIC,
  yr_2012 = REPLACE(yr_2012, ',', '.')::NUMERIC,
  yr_2013 = REPLACE(yr_2013, ',', '.')::NUMERIC,
  yr_2014 = REPLACE(yr_2014, ',', '.')::NUMERIC,
  yr_2015 = REPLACE(yr_2015, ',', '.')::NUMERIC,
  yr_2016 = REPLACE(yr_2016, ',', '.')::NUMERIC,
  yr_2017 = REPLACE(yr_2017, ',', '.')::NUMERIC,
  yr_2018 = REPLACE(yr_2018, ',', '.')::NUMERIC,
  yr_2019 = REPLACE(yr_2019, ',', '.')::NUMERIC
WHERE 
  yr_2000 IS NOT NULL AND yr_2000 != '' AND
  yr_2001 IS NOT NULL AND yr_2001 != '' AND
  yr_2002 IS NOT NULL AND yr_2002 != '' AND
  yr_2003 IS NOT NULL AND yr_2003 != '' AND
  yr_2004 IS NOT NULL AND yr_2004 != '' AND
  yr_2005 IS NOT NULL AND yr_2005 != '' AND
  yr_2006 IS NOT NULL AND yr_2006 != '' AND
  yr_2007 IS NOT NULL AND yr_2007 != '' AND
  yr_2008 IS NOT NULL AND yr_2008 != '' AND
  yr_2009 IS NOT NULL AND yr_2009 != '' AND
  yr_2010 IS NOT NULL AND yr_2010 != '' AND
  yr_2011 IS NOT NULL AND yr_2011 != '' AND
  yr_2012 IS NOT NULL AND yr_2012 != '' AND
  yr_2013 IS NOT NULL AND yr_2013 != '' AND
  yr_2014 IS NOT NULL AND yr_2014 != '' AND
  yr_2015 IS NOT NULL AND yr_2015 != '' AND
  yr_2016 IS NOT NULL AND yr_2016 != '' AND
  yr_2017 IS NOT NULL AND yr_2017 != '' AND
  yr_2018 IS NOT NULL AND yr_2018 != '' AND
  yr_2019 IS NOT NULL AND yr_2019 != '';


-- Cambia el tipo de dato de la columna a NUMERIC(50, 15)
ALTER TABLE world_indicators
ALTER COLUMN yr_2000 TYPE NUMERIC(50, 15) USING yr_2000::NUMERIC(50, 15);


-- Repite el proceso para las columnas yr_2001 hasta yr_2019 
ALTER TABLE world_indicators
ALTER COLUMN yr_2001 TYPE NUMERIC(50, 15) USING yr_2001::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2002 TYPE NUMERIC(50, 15) USING yr_2002::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2002 TYPE NUMERIC(50, 15) USING yr_2002::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2003 TYPE NUMERIC(50, 15) USING yr_2003::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2004 TYPE NUMERIC(50, 15) USING yr_2004::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2005 TYPE NUMERIC(50, 15) USING yr_2005::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2006 TYPE NUMERIC(50, 15) USING yr_2006::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2007 TYPE NUMERIC(50, 15) USING yr_2007::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2008 TYPE NUMERIC(50, 15) USING yr_2008::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2009 TYPE NUMERIC(50, 15) USING yr_2009::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2010 TYPE NUMERIC(50, 15) USING yr_2010::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2011 TYPE NUMERIC(50, 15) USING yr_2011::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2012 TYPE NUMERIC(50, 15) USING yr_2012::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2013 TYPE NUMERIC(50, 15) USING yr_2013::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2014 TYPE NUMERIC(50, 15) USING yr_2014::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2015 TYPE NUMERIC(50, 15) USING yr_2015::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2016 TYPE NUMERIC(50, 15) USING yr_2016::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2017 TYPE NUMERIC(50, 15) USING yr_2017::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2018 TYPE NUMERIC(50, 15) USING yr_2018::NUMERIC(50, 15);

ALTER TABLE world_indicators
ALTER COLUMN yr_2019 TYPE NUMERIC(50, 15) USING yr_2019::NUMERIC(50, 15);

-- tabla world_indicators  series_code se relaciona con tabla idh

-- tabla console_sales se relaciona con Año

UPDATE console_sales
SET 
  sales = REPLACE(sales, '.', '')::NUMERIC
WHERE 
  sales IS NOT NULL AND sales != '';

ALTER TABLE console_sales
ALTER COLUMN sales TYPE NUMERIC(30, 2) USING sales::NUMERIC(30, 2);

SELECT
  MAX(year) AS max_year,
  MIN(year) AS min_year
FROM console_sales;


-- Tabla indicadores_desarrollo_humano relaciona con code a la tabla series_code
SELECT short_definition, COUNT(short_definition) AS num_reg
FROM indicadores_desarrollo_humano
GROUP BY short_definition;

-- Tabla juegos 
-- Añadir columnas para año, mes y día
ALTER TABLE juegos
ADD COLUMN year_j INTEGER,
ADD COLUMN month_j INTEGER,
ADD COLUMN day_j INTEGER;

-- Actualizar las nuevas columnas con los valores extraídos de la columna original
UPDATE juegos
SET
  year_j = EXTRACT(YEAR FROM release_date),
  month_j = EXTRACT(MONTH FROM release_date),
  day_j = EXTRACT(DAY FROM release_date);


-- Eliminar la columna fecha
/*
ALTER TABLE video_games
DROP COLUMN tier;
*/

-- Añadir columna tier a la tabla video_games
ALTER TABLE juegos
ADD COLUMN tier VARCHAR(25);

-- Actualizar la nueva columna con clasificación 
UPDATE juegos
SET tier =
  CASE 
    WHEN POSITION('-' IN owners) > 0 AND LEFT(owners, POSITION('-' IN owners) - 1)::numeric BETWEEN 0 AND 20000 THEN 'tier_13'
    WHEN POSITION('-' IN owners) > 0 AND LEFT(owners, POSITION('-' IN owners) - 1)::numeric BETWEEN 20000 AND 50000 THEN 'tier_12'
    WHEN POSITION('-' IN owners) > 0 AND LEFT(owners, POSITION('-' IN owners) - 1)::numeric BETWEEN 50000 AND 100000 THEN 'tier_11'
    WHEN POSITION('-' IN owners) > 0 AND LEFT(owners, POSITION('-' IN owners) - 1)::numeric BETWEEN 100000 AND 200000 THEN 'tier_10'
    WHEN POSITION('-' IN owners) > 0 AND LEFT(owners, POSITION('-' IN owners) - 1)::numeric BETWEEN 200000 AND 500000 THEN 'tier_9'
    WHEN POSITION('-' IN owners) > 0 AND LEFT(owners, POSITION('-' IN owners) - 1)::numeric BETWEEN 500000 AND 1000000 THEN 'tier_8'
    WHEN POSITION('-' IN owners) > 0 AND LEFT(owners, POSITION('-' IN owners) - 1)::numeric BETWEEN 1000000 AND 2000000 THEN 'tier_7'
    WHEN POSITION('-' IN owners) > 0 AND LEFT(owners, POSITION('-' IN owners) - 1)::numeric BETWEEN 2000000 AND 5000000 THEN 'tier_6'
    WHEN POSITION('-' IN owners) > 0 AND LEFT(owners, POSITION('-' IN owners) - 1)::numeric BETWEEN 5000000 AND 10000000 THEN 'tier_5'
    WHEN POSITION('-' IN owners) > 0 AND LEFT(owners, POSITION('-' IN owners) - 1)::numeric BETWEEN 10000000 AND 20000000 THEN 'tier_4'
    WHEN POSITION('-' IN owners) > 0 AND LEFT(owners, POSITION('-' IN owners) - 1)::numeric BETWEEN 20000000 AND 50000000 THEN 'tier_3'
    WHEN POSITION('-' IN owners) > 0 AND LEFT(owners, POSITION('-' IN owners) - 1)::numeric BETWEEN 50000000 AND 100000000 THEN 'tier_2'
    WHEN POSITION('-' IN owners) > 0 AND LEFT(owners, POSITION('-' IN owners) - 1)::numeric BETWEEN 100000000 AND 200000000 THEN 'tier_1'
    ELSE 'tier_unknown'
  END;
/*
SELECT
  MAX(year_j) AS max_year_j,
  MIN(year_j) AS min_year_j
FROM juegos;
*/

-- Tratamiento de video_games 

UPDATE video_games
SET year_of_release = 9999
WHERE year_of_release = 'N/A';

-- Cambiar el tipo de dato de la columna year_of_release a INTEGER
ALTER TABLE video_games
ALTER COLUMN year_of_release TYPE INTEGER USING year_of_release::INTEGER;
/*
na_sales numeric(15,2)
eu_sales numeric(15,2)
jp_sales numeric(15,2)
other_sales numeric(15,2)
global_sales numeric(15,2)
critic_score integer
critic_count integer
user_score  numeric(15,2)
user_count  integer
*/
-- REVISAR OBSERVACIONES (N/A, nulos, vacíos, NA) 
SELECT
  COUNT(*) AS total_records,
  SUM(CASE WHEN na_sales IN ('N/A', 'NA') OR na_sales IS NULL OR na_sales = '' THEN 1 ELSE 0 END) AS count_na_sales,
  SUM(CASE WHEN eu_sales IN ('N/A', 'NA') OR eu_sales IS NULL OR eu_sales = '' THEN 1 ELSE 0 END) AS count_eu_sales,
  SUM(CASE WHEN jp_sales IN ('N/A', 'NA') OR jp_sales IS NULL OR jp_sales = '' THEN 1 ELSE 0 END) AS count_jp_sales,
  SUM(CASE WHEN other_sales IN ('N/A', 'NA') OR other_sales IS NULL OR other_sales = '' THEN 1 ELSE 0 END) AS count_other_sales,
  SUM(CASE WHEN global_sales IN ('N/A', 'NA') OR global_sales IS NULL OR global_sales = '' THEN 1 ELSE 0 END) AS count_global_sales,
  SUM(CASE WHEN critic_score IN ('N/A', 'NA') OR critic_score IS NULL OR critic_score = '' THEN 1 ELSE 0 END) AS count_critic_score,
  SUM(CASE WHEN critic_count IN ('N/A', 'NA') OR critic_count IS NULL OR critic_count = '' THEN 1 ELSE 0 END) AS count_critic_count,
  SUM(CASE WHEN user_score IN ('N/A', 'NA') OR user_score IS NULL OR user_score = '' THEN 1 ELSE 0 END) AS count_user_score,
  SUM(CASE WHEN user_count IN ('N/A', 'NA') OR user_count IS NULL OR user_count = '' THEN 1 ELSE 0 END) AS count_user_count
FROM video_games;

-- Calcula la media de cada columna

-- Actualiza los valores en la tabla reemplazando los valores no válidos por 0
-- Actualiza los valores en la tabla reemplazando los valores no válidos por 0

-- Actualiza los valores en la tabla reemplazando los valores no válidos por 0
-- Actualiza los valores en la tabla reemplazando los valores no válidos por 0

-- Actualiza los valores en la tabla reemplazando los valores no válidos por 0
UPDATE video_games
SET
  na_sales = CASE WHEN na_sales ~ E'^\\d+\\.\\d+$' THEN na_sales::NUMERIC ELSE 0 END,
  eu_sales = CASE WHEN eu_sales ~ E'^\\d+\\.\\d+$' THEN eu_sales::NUMERIC ELSE 0 END,
  jp_sales = CASE WHEN jp_sales ~ E'^\\d+\\.\\d+$' THEN jp_sales::NUMERIC ELSE 0 END,
  other_sales = CASE WHEN other_sales ~ E'^\\d+\\.\\d+$' THEN other_sales::NUMERIC ELSE 0 END,
  global_sales = CASE WHEN global_sales ~ E'^\\d+\\.\\d+$' THEN global_sales::NUMERIC ELSE 0 END,
  critic_score = CASE WHEN critic_score ~ E'^\\d+$' THEN critic_score::NUMERIC ELSE 0 END,
  critic_count = CASE WHEN critic_count ~ E'^\\d+$' THEN critic_count::NUMERIC ELSE 0 END,
  user_score = CASE WHEN user_score ~ E'^\\d+\\.\\d+$' THEN user_score::NUMERIC ELSE 0 END,
  user_count = CASE WHEN user_count ~ E'^\\d+$' THEN user_count::NUMERIC ELSE 0 END
WHERE
  na_sales IN ('N/A', 'NA') OR eu_sales IN ('N/A', 'NA') OR jp_sales IN ('N/A', 'NA') OR other_sales IN ('N/A', 'NA') OR global_sales IN ('N/A', 'NA') OR critic_score IN ('N/A', 'NA') OR critic_count IN ('N/A', 'NA') OR user_score IN ('N/A', 'NA') OR user_count IN ('N/A', 'NA') OR
  na_sales IS NULL OR eu_sales IS NULL OR jp_sales IS NULL OR other_sales IS NULL OR global_sales IS NULL OR critic_score IS NULL OR critic_count IS NULL OR user_score IS NULL OR user_count IS NULL OR
  na_sales = '' OR eu_sales = '' OR jp_sales = '' OR other_sales = '' OR global_sales = '' OR critic_score = '' OR critic_count = '' OR user_score = '' OR user_count = '';

-- convertir los campos
ALTER TABLE video_games
ALTER COLUMN na_sales TYPE NUMERIC(25, 2) USING COALESCE(NULLIF(CAST(na_sales AS NUMERIC), 0));

ALTER TABLE video_games
ALTER COLUMN eu_sales TYPE NUMERIC(25, 2) USING COALESCE(NULLIF(CAST(eu_sales AS NUMERIC), 0));

ALTER TABLE video_games
ALTER COLUMN jp_sales TYPE NUMERIC(25, 2) USING COALESCE(NULLIF(CAST(jp_sales AS NUMERIC), 0));

ALTER TABLE video_games
ALTER COLUMN other_sales TYPE NUMERIC(25, 2) USING COALESCE(NULLIF(CAST(other_sales AS NUMERIC), 0));

ALTER TABLE video_games
ALTER COLUMN global_sales TYPE NUMERIC(25, 2) USING COALESCE(NULLIF(CAST(global_sales AS NUMERIC), 0));

ALTER TABLE video_games
ALTER COLUMN critic_score TYPE INTEGER USING COALESCE(NULLIF(CAST(critic_score AS INTEGER), 0));

ALTER TABLE video_games
ALTER COLUMN critic_count TYPE INTEGER USING COALESCE(NULLIF(CAST(critic_count AS INTEGER), 0));

ALTER TABLE video_games
ALTER COLUMN user_score TYPE NUMERIC(25, 2) USING COALESCE(NULLIF(CAST(user_score AS NUMERIC), 0));

ALTER TABLE video_games
ALTER COLUMN user_count TYPE INTEGER USING COALESCE(NULLIF(CAST(user_count AS INTEGER), 0));

/*
SELECT
  AVG(na_sales) AS avg_na_sales,
  AVG(eu_sales) AS avg_eu_sales,
  AVG(jp_sales) AS avg_jp_sales,
  AVG(other_sales) AS avg_other_sales,
  AVG(global_sales) AS avg_global_sales,
  AVG(critic_score) AS avg_critic_score,
  AVG(critic_count) AS avg_critic_count,
  AVG(user_score) AS avg_user_score,
  AVG(user_count) AS avg_user_count
FROM video_games;

-- REEMPLZAR OBSERVACIONES POR LA MEDIA
UPDATE video_games
SET
  na_sales = CASE WHEN na_sales = 0 OR na_sales IS NULL THEN (SELECT AVG(na_sales) FROM video_games) ELSE na_sales END,
  eu_sales = CASE WHEN eu_sales = 0 OR eu_sales IS NULL THEN (SELECT AVG(eu_sales) FROM video_games) ELSE eu_sales END,
  jp_sales = CASE WHEN jp_sales = 0 OR jp_sales IS NULL THEN (SELECT AVG(jp_sales) FROM video_games) ELSE jp_sales END,
  other_sales = CASE WHEN other_sales = 0 OR other_sales IS NULL THEN (SELECT AVG(other_sales) FROM video_games) ELSE other_sales END,
  global_sales = CASE WHEN global_sales = 0 OR global_sales IS NULL THEN (SELECT AVG(global_sales) FROM video_games) ELSE global_sales END,
  critic_score = CASE WHEN critic_score = 0 OR critic_score IS NULL THEN (SELECT AVG(critic_score) FROM video_games) ELSE critic_score END,
  critic_count = CASE WHEN critic_count = 0 OR critic_count IS NULL THEN (SELECT AVG(critic_count) FROM video_games) ELSE critic_count END,
  user_score = CASE WHEN user_score = 0 OR user_score IS NULL THEN (SELECT AVG(user_score) FROM video_games) ELSE user_score END,
  user_count = CASE WHEN user_count = 0 OR user_count IS NULL THEN (SELECT AVG(user_count) FROM video_games) ELSE user_count END
WHERE
  na_sales = 0 OR
  eu_sales = 0 OR
  jp_sales = 0 OR
  other_sales = 0 OR
  global_sales = 0 OR
  critic_score = 0 OR
  critic_count = 0 OR
  user_score = 0 OR
  user_count = 0 OR
  na_sales IS NULL OR
  eu_sales IS NULL OR
  jp_sales IS NULL OR
  other_sales IS NULL OR
  global_sales IS NULL OR
  critic_score IS NULL OR
  critic_count IS NULL OR
  user_score IS NULL OR
  user_count IS NULL;
*/


-- 6704 registros con scores vacios de 16719

SELECT
  MAX(year_of_release) AS max_year,
  MIN(year_of_release) AS min_year
FROM video_games
WHERE year_of_release != 9999;

-- juegos  de 1997 --2019
-- console_sales de 2008 --2018
-- console_sales de 1980 --2020 y un  999 y hay nulos

-- tabla Calendario

SELECT * FROM console_sales LIMIT 5;
SELECT * FROM indicadores_desarrollo_humano LIMIT 5;
SELECT * FROM juegos LIMIT 5;
SELECT * FROM video_games LIMIT 5;
SELECT * FROM world_indicators LIMIT 5;
SELECT * FROM paises LIMIT 5;
SELECT * FROM calendario LIMIT 5;




-- Verificar las primeras filas de la tabla de calendario
SELECT COUNT(fecha)
FROM calendario;
-- 112 190 464

SELECT * FROM world_indicators LIMIT 25;

SELECT country_name, COUNT(country_name) AS num_reg
FROM world_indicators
GROUP BY country_name;

SELECT country_name, country_code, COUNT(*) AS num_reg
FROM world_indicators
GROUP BY country_name, country_code;


-- tabla wold_indicators 
-- ALTER TABLE world_indicators DROP new_column;
ALTER TABLE world_indicators ADD COLUMN idlocalidad INT;


UPDATE world_indicators
SET idlocalidad = 
    CASE
        WHEN country_name = 'Unión Europea' AND country_code = 'EUU' THEN 1
        WHEN country_name = 'Mundo' AND country_code = 'WLD' THEN 0
        WHEN country_name = 'Japón' AND country_code = 'JPN' THEN 3
        WHEN country_name = 'Estados Unidos' AND country_code = 'USA' THEN 2
        ELSE NULL
    END;

UPDATE world_indicators
SET idlocalidad = 
    CASE
        WHEN country_name = 'Unión Europea' AND country_code = 'EUU' THEN 2
        WHEN country_name = 'Mundo' AND country_code = 'WLD' THEN 1
        WHEN country_name = 'Japón' AND country_code = 'JPN' THEN 4
        WHEN country_name = 'Estados Unidos' AND country_code = 'USA' THEN 3
        ELSE NULL
    END;


DROP TABLE IF EXISTS paises;
-- Crear la nueva tabla
CREATE TABLE paises (
    idlocalidad INT,
    country_name VARCHAR(255),
    country_code VARCHAR(255)
);

-- Insertar múltiples registros en la tabla paises
INSERT INTO paises (idlocalidad, country_name, country_code)
VALUES 
    (1, 'Mundo', 'WLD'),
    (2, 'Estados Unidos', 'USA'),
    (3, 'Unión Europea', 'EUU'),
    (4, 'Japón', 'JPN');

-- Eliminar las columnas country_code y country_name de la tabla world_indicators
ALTER TABLE world_indicators
DROP COLUMN country_code,
DROP COLUMN country_name;


-- Contar registros para cada desarrollador en la tabla video_games
WITH video_games_counts AS (
    SELECT developer, COUNT(*) AS cat_reg
    FROM video_games
    GROUP BY developer
),
-- Contar registros para cada desarrollador en la tabla juegos
juegos_counts AS (
    SELECT developer, COUNT(*) AS cat_reg
    FROM juegos
    GROUP BY developer
)
-- Unir los resultados de ambas tablas
SELECT
    COALESCE(vg.developer, j.developer) AS developer,
    COALESCE(vg.cat_reg, 0) AS cat_reg_video_games,
    COALESCE(j.cat_reg, 0) AS cat_reg_juegos
FROM
    video_games_counts vg
FULL OUTER JOIN
    juegos_counts j ON vg.developer = j.developer;


DROP TABLE IF EXISTS developers;
-- Crear la tabla para desarrolladores normalizados
CREATE TABLE developers(
    developer VARCHAR(255)
);

-- Insertar desarrolladores únicos de video_games
INSERT INTO developers (developer)
SELECT DISTINCT developer FROM video_games;
-- solmente copio 1697
SELECT COUNT(DISTINCT developer) AS total_developers
FROM video_games;

SELECT count(developer)
FROM video_games;

-- Insertar desarrolladores únicos de juegos
INSERT INTO developers (developer)
SELECT DISTINCT developer FROM juegos;
-- solmente copio 17113
SELECT *  FROM developers LIMIT 20;

-- Añadir columna adicional a la tabla developers
ALTER TABLE developers ADD COLUMN developer_clean TEXT;


-- Actualizar la columna developer_clean con valores normalizados
UPDATE developers
SET developer_clean = (
  SELECT string_agg(distinct d, ',' order by d)
  FROM (
    SELECT unnest(string_to_array(developer, ',' )) as d
  ) s
);

-- Mostrar los resultados para validar
SELECT * FROM developers WHERE developer_clean = 'alpixel games';

UPDATE developers
SET developer_clean = LOWER(TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(developer_clean, '''', ''), '-', ''), ',', ''), '.',''), ':','')));



SELECT developer, COUNT(developer) AS cat_reg
FROM developers
GROUP BY developer;

SELECT developer_clean, COUNT(developer_clean) AS Mat_reg
FROM developers
GROUP BY developer_clean;


-- Querys de revisión
SELECT * FROM developers LIMIT 10;

SELECT 
    developer_clean,
    regexp_split_to_table(developer_clean, E'\\s*[,;]\\s*') as word
FROM developers
ORDER BY developer_clean;


SELECT word, count(*) 
FROM (
    SELECT 
        developer_clean,
        regexp_split_to_table(developer_clean, E'\\s*[,;]\\s*') as word
    FROM developers
) s
GROUP BY word
ORDER BY count(*) DESC;


-- Normalizar registros

/*
UPDATE developers
SET developer_clean = 'alpixel games'
WHERE POSITION('alpixel games' IN developer_clean) > 0;
*/

UPDATE developers
SET developer_clean = 'abstraction games'
WHERE developer_clean IN ('abstraction games','abstraction games;the bitmap brothers','the bitmap brothers','abstraction games;wayforward','wayforward');

UPDATE developers
SET developer_clean = 'alawar'  
WHERE developer_clean IN ('alawar', 'alawar dreamdale', 'alawar entertainment', 'alawar entertainmentalawar entertainment inc', 'alawar entertainment;amegami', 'amegami', 'alawar entertainment;toyman interactive', 'toyman interactive', 'alawar fivebn', 'alawar fridays games','alawar;mirball games','mirball games', 'alawar stargaze','alawar stargaze;alawar entertainment', 'alawar;whalebox studio', 'whalebox studio');

UPDATE developers
SET developer_clean = '1c company'
WHERE developer_clean IN ('1c 1c company', '1c 1c companybattlefrontcom', '1c 1c company inoco', '1c 1c companythq', '1c 1c company various');

UPDATE developers 
SET developer_clean = '3rise'
WHERE developer_clean IN ('3rise;橘子班','橘子班');

UPDATE developers
SET developer_clean = '64k barchboi'
WHERE developer_clean IN ('64k;barchboi', 'barchboi');

UPDATE developers
SET developer_clean = '7dots'
WHERE developer_clean IN ('7dots', '7dots;rock frog', 'rock frog');

UPDATE developers
SET developer_clean = '2d heroes' 
WHERE developer_clean IN ('2d heroes;ursa games', 'ursa games');

UPDATE developers 
SET developer_clean = '2k czech'
WHERE developer_clean IN ('2k czech','2k czech','2k czech;feral interactive (mac)','feral interactive (mac)');

UPDATE developers
SET developer_clean = '2k marin'
WHERE developer_clean IN ('2k marin', '2k marin', '2k marin', '2k marin;2k china;digital extremes;2k australia;blind squirrel', '2k china', 'digital extremes', '2k australia', 'blind squirrel', '2k marindigital extremes', '2k marinirrational games');

UPDATE developers
SET developer_clean = '2xl games'
WHERE developer_clean IN ('2xl games', '2xl games', '2xl games;blitworks', 'blitworks');

UPDATE developers 
SET developer_clean = '2play'
WHERE developer_clean IN ('2play', '2 players', '2play;prasius', 'prasius');

UPDATE developers
SET developer_clean = '1c game studios'
WHERE developer_clean IN ('1c game studios;777 studios', '777 studios');


UPDATE developers
SET developer_clean = '10tacle studios'
WHERE developer_clean IN ('10tacle studios', '10tacle studios fusionsphere systems');

UPDATE developers 
SET developer_clean = '16 bit psych'
WHERE developer_clean IN ('16 bit psych;kyle b', 'kyle b');



--- tabla developers serial

CREATE TABLE developer_mapping (
  developer_key SERIAL PRIMARY KEY,
  developer_clean VARCHAR(255) UNIQUE NOT NULL
);

INSERT INTO developer_mapping (developer_clean)
SELECT DISTINCT developer_clean
FROM developers
WHERE developer_clean IS NOT NULL;

/*
ALTER TABLE developers
ADD COLUMN iddeveloper SERIAL PRIMARY KEY;
ALTER TABLE developers
DROP COLUMN iddeveloper;
*/


ALTER TABLE developers
ADD COLUMN developer_key INTEGER;

ALTER TABLE developers
ADD CONSTRAINT fk_developer_key
FOREIGN KEY (developer_key) REFERENCES developer_mapping(developer_key);

UPDATE developers
SET developer_key = developer_mapping.developer_key
FROM developer_mapping
WHERE developers.developer_clean = developer_mapping.developer_clean;


DELETE FROM developers WHERE developer_key IS NULL;



--- Tabla juegos
ALTER TABLE juegos
ADD COLUMN developer_key INTEGER;

UPDATE juegos AS j
SET developer_key = d.developer_key
FROM developers AS d
WHERE j.developer = d.developer;

ALTER TABLE juegos
ADD CONSTRAINT fk_developer_key
FOREIGN KEY (developer_key) REFERENCES developer_mapping(developer_key);

-- video_games
-- previo
UPDATE video_games
SET developer = 'No Clasificado'
WHERE developer IS NULL OR developer = '';

-- Agregar "No Clasificado" a developer_mapping con un nuevo índice único
INSERT INTO developer_mapping (developer_clean)
VALUES ('No Clasificado');



-- Verificar si "No Clasificado" está en developers y si tiene una clave foránea
SELECT *
FROM developers
WHERE developer = 'No Clasificado';

INSERT INTO developers (developer, developer_clean, developer_key)
VALUES 
    ('No Clasificado', 'No Clasificado', 18297);


-- Paso 1: Agregar la columna developer_key
ALTER TABLE video_games
ADD COLUMN developer_key INTEGER;

-- Paso 2: Actualizar developer_key en video_games usando la tabla developers
UPDATE video_games AS vg
SET developer_key = d.developer_key
FROM developers AS d
WHERE vg.developer = d.developer;

-- Paso 3: Agregar la restricción de clave foránea
ALTER TABLE video_games
ADD CONSTRAINT fk_developer_key
FOREIGN KEY (developer_key) REFERENCES developer_mapping(developer_key);


-- Detalles para juegos eliminar developer  y video_games eliminar developer y para developers eliminar developer_clean

ALTER TABLE juegos
DROP COLUMN developer;

ALTER TABLE video_games
DROP COLUMN developer;

ALTER TABLE developers
DROP COLUMN developer_clean;

ALTER TABLE developer_mapping
RENAME COLUMN developer_clean TO developer_clasificado;

/*
CREATE TABLE nueva_video_games AS
SELECT * FROM video_games;

*/

/*
UPDATE nueva_video_games AS vg
SET developer_key = dm.developer_key
FROM developers AS dm
WHERE vg.developer = dm.developer;
*/

SELECT DISTINCT company
FROM console_sales;

ALTER TABLE console_sales
ADD COLUMN company_key INTEGER;

UPDATE console_sales
SET company_key = 
    CASE 
        WHEN company = 'Microsoft' THEN 16690
        WHEN company = 'Nintendo' THEN 11035
        WHEN company = 'Sony' THEN 964
    END;


ALTER TABLE console_sales
ADD CONSTRAINT fk_company_key
FOREIGN KEY (company_key) REFERENCES developer_mapping(developer_key);

-- parte etl 2 
-- Agrega una nueva columna como clave primaria
ALTER TABLE paises
ADD COLUMN idlocalidad_paises SERIAL PRIMARY KEY;

-- Actualiza los valores de la nueva columna
UPDATE paises
SET idlocalidad_paises = idlocalidad;

-- Elimina la columna original si no es necesaria
ALTER TABLE paises
DROP COLUMN idlocalidad;

-- Agrega la restricción de la clave foránea
ALTER TABLE world_indicators
ADD CONSTRAINT fk_idlocalidad_paises
FOREIGN KEY (idlocalidad) REFERENCES paises(idlocalidad_paises);

-- total coincidencias 
SELECT COUNT(*) AS coincidencias
FROM indicadores_desarrollo_humano idh
JOIN world_indicators wi ON idh.code = wi.series_code;


-- ya voy comprendiendo 

SELECT
    ih.code AS code_idh,
    wi.series_code AS series_code_wi,
    CASE WHEN ih.code = wi.series_code THEN 'Coincide' ELSE 'No Coincide' END AS coincidencia_status
FROM indicadores_desarrollo_humano ih
LEFT JOIN world_indicators wi ON ih.code = wi.series_code;


CREATE TABLE coincidencias_tabla (
    id SERIAL PRIMARY KEY,
    code_idh VARCHAR(255),
    series_code_wi VARCHAR(255),
    coincidencia_status VARCHAR(50)
);

INSERT INTO coincidencias_tabla (code_idh, series_code_wi, coincidencia_status)
SELECT
    ih.code AS code_idh,
    wi.series_code AS series_code_wi,
    CASE WHEN ih.code = wi.series_code THEN 'Coincide' ELSE 'No Coincide' END AS coincidencia_status
FROM indicadores_desarrollo_humano ih
LEFT JOIN world_indicators wi ON ih.code = wi.series_code;

-- Crear la tabla para desarrolladores normalizados
CREATE TABLE coders (
    code_names VARCHAR(255)
);


-- Insertar desarrolladores únicos de video_games
INSERT INTO coders(code_names)
SELECT DISTINCT code FROM indicadores_desarrollo_humano;
-- solmente copio 

-- Insertar desarrolladores únicos de juegos
INSERT INTO coders(code_names)
SELECT DISTINCT series_code FROM world_indicators;
-- solmente copio 
ALTER TABLE coders ADD COLUMN coders_clean TEXT;

UPDATE coders
SET coders_clean = (
  SELECT string_agg(distinct d, ',' order by d)
  FROM (
    SELECT unnest(string_to_array(code_names, ',' )) as d
  ) s
);

SELECT 
    code_names,
    regexp_split_to_table(code_names, E'\\s*[,;]\\s*') as word
FROM coders
ORDER BY code_names;

--

CREATE TABLE coders_mapping (
  coders_key SERIAL PRIMARY KEY,
  coders_clean VARCHAR(255) UNIQUE NOT NULL
);

INSERT INTO coders_mapping (coders_clean)
SELECT DISTINCT coders_clean
FROM coders
WHERE coders_clean IS NOT NULL;


-- coders es la tabla intermedia
ALTER TABLE coders
ADD COLUMN coders_key INTEGER;

ALTER TABLE coders
ADD CONSTRAINT fk_coders_key 
FOREIGN KEY (coders_key) REFERENCES coders_mapping(coders_key);

UPDATE coders
SET coders_key = coders_mapping.coders_key
FROM coders_mapping
WHERE coders.coders_clean = coders_mapping.coders_clean;

DELETE FROM coders WHERE coders_key IS NULL;


ALTER TABLE world_indicators
ADD COLUMN coders_key INTEGER;
---previo hay que validar si hay registros vacios en la columna series_name
/*
SELECT COUNT(*) 
FROM world_indicators 
WHERE series_code IS NULL OR series_code = '';
*/
---


UPDATE world_indicators AS j
SET coders_key = d.coders_key
FROM coders AS d
WHERE j.series_code = d.code_names;


ALTER TABLE world_indicators
ADD CONSTRAINT fk_coders_key
FOREIGN KEY (coders_key) REFERENCES coders_mapping(coders_key);

-- realiza el proceso siguiente pero para la tabla indicadores_desarrollo_humano y su columna code

ALTER TABLE indicadores_desarrollo_humano
ADD COLUMN coders_key INTEGER;

-- Actualizar la columna coders_key con valores normalizados
UPDATE indicadores_desarrollo_humano AS ih
SET coders_key = d.coders_key
FROM coders AS d
WHERE ih.code = d.code_names;

-- Añadir restricción de clave foránea
ALTER TABLE indicadores_desarrollo_humano
ADD CONSTRAINT fk_coders_key
FOREIGN KEY (coders_key) REFERENCES coders_mapping(coders_key);
-- tabla calendario

SELECT c.fecha, j.name, j.release_date
FROM calendario c 
INNER JOIN juegos j 
    ON DATE(j.release_date) = c.fecha;

DROP TABLE IF EXISTS calendario;

-- Crear la tabla calendario
CREATE TABLE calendario (
    fecha DATE PRIMARY KEY,
    anio INTEGER,
    mes INTEGER,
    dia INTEGER,
    anio_mes VARCHAR(7),
    trimestre INTEGER,
    semestre INTEGER,
    dia_semana INTEGER
);

-- Insertar datos en la tabla calendario
-- Insertar datos en la tabla calendario evitando duplicados
INSERT INTO calendario (fecha, anio, mes, dia, anio_mes, trimestre, semestre, dia_semana)
SELECT
    dates::date,
    EXTRACT(YEAR FROM dates),
    EXTRACT(MONTH FROM dates),
    EXTRACT(DAY FROM dates),
    TO_CHAR(dates, 'YYYY-MM'),
    EXTRACT(QUARTER FROM dates),
    CASE WHEN EXTRACT(MONTH FROM dates) <= 6 THEN 1 ELSE 2 END,
    EXTRACT(ISODOW FROM dates)
FROM generate_series('1997-01-01'::date, '2025-12-31'::date, '1 day'::interval) AS dates
WHERE NOT EXISTS (
    SELECT 1 FROM calendario WHERE fecha = dates::date
);


-- Agrega la restricción de clave foránea
ALTER TABLE juegos
ADD CONSTRAINT fk_release_date
FOREIGN KEY (release_date) REFERENCES calendario(fecha);

-- Validar llaves primarias

SELECT table_name, column_name, constraint_name
FROM information_schema.key_column_usage
WHERE constraint_name LIKE '%_pkey%';

-- validar llaves foraneas

SELECT conname AS foreign_key_name,
       conrelid::regclass AS table_name,
       a.attname AS column_name,
       confrelid::regclass AS referenced_table_name,
       af.attname AS referenced_column_name
FROM pg_constraint c
JOIN pg_attribute a ON a.attnum = ANY(c.conkey)
JOIN pg_attribute af ON af.attnum = ANY(c.confkey)
WHERE contype = 'f';

-- manejamos como una vista los años para wold_indicators
CREATE VIEW world_years_unpivoted AS
SELECT series_name, series_code, '2000' AS year, yr_2000 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2001' AS year, yr_2001 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2002' AS year, yr_2002 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2003' AS year, yr_2003 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2004' AS year, yr_2004 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2005' AS year, yr_2005 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2006' AS year, yr_2006 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2007' AS year, yr_2007 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2008' AS year, yr_2008 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2009' AS year, yr_2009 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2010' AS year, yr_2010 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2011' AS year, yr_2011 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2012' AS year, yr_2012 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2013' AS year, yr_2013 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2014' AS year, yr_2014 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2015' AS year, yr_2015 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2016' AS year, yr_2016 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2017' AS year, yr_2017 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2018' AS year, yr_2018 AS value FROM world_indicators
UNION ALL
SELECT series_name, series_code, '2019' AS year, yr_2019 AS value FROM world_indicators;

UPDATE video_games
SET na_sales = COALESCE(na_sales, 0),
    eu_sales = COALESCE(eu_sales, 0),
    jp_sales = COALESCE(jp_sales, 0),
    other_sales = COALESCE(other_sales, 0),
    global_sales = COALESCE(global_sales, 0);

-- Agregar la nueva columna
ALTER TABLE video_games
ADD COLUMN total_global NUMERIC;

-- Actualizar la columna total_global con la condición especificada
UPDATE video_games
SET total_global = CASE
                    WHEN global_sales IS NOT NULL THEN global_sales
                    ELSE COALESCE(na_sales, 0) + COALESCE(eu_sales, 0) + COALESCE(jp_sales, 0) + COALESCE(other_sales, 0)
                  END;


--- graficca 
SELECT
    wi.series_name,
    wi.series_code,
    c.fecha,
    wi.value
FROM world_years_unpivoted wi
JOIN calendario c ON wi.year::int = c.anio;


SELECT * 
FROM information_schema.tables
WHERE table_schema = 'public';

SELECT 
   t.table_name,
   c.column_name
FROM information_schema.tables AS t
INNER JOIN information_schema.columns AS c
    ON t.table_name = c.table_name
WHERE t.table_schema = 'public'  
ORDER BY t.table_name, c.ordinal_position;

SELECT * FROM world_years_unpivoted LIMIT 5;

SELECT * FROM world_indicators LIMIT 5;

SELECT * FROM paises LIMIT 5;