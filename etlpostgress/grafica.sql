

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

SELECT * FROM world_years_unpivoted LIMIT 5;

SELECT
  year,
  SUM(sales) AS "Total Sales"
FROM
  console_sales
GROUP BY
  year
ORDER BY
  year;
--1

SELECT
  date_part('year', release_date) AS "Año de Lanzamiento",
  COUNT(*) AS "Cantidad de Juegos"
FROM
  juegos
GROUP BY
  date_part('year', release_date)
ORDER BY
  date_part('year', release_date);

-- 3
SELECT
  developer,
  COUNT(*) AS "Cantidad de Juegos"
FROM
  video_games
GROUP BY
  developer
ORDER BY
  COUNT(*) DESC
LIMIT 10;
--4
SELECT
  wu.year,
  AVG(wu.value) AS "Valor Promedio"
FROM
  world_years_unpivoted wu
WHERE
  wu.series_code = 'TuCódigoDeIndicador'
GROUP BY
  wu.year
ORDER BY
  wu.year;
--5
SELECT
  console,
  SUM(sales) AS "Ventas Totales"
FROM
  console_sales
GROUP BY
  console
ORDER BY
  SUM(sales) DESC
LIMIT 10;