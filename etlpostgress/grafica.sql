
-- Vistas para graficas
CREATE VIEW colmunstables_view AS
SELECT 
   t.table_name,
   c.column_name
FROM information_schema.tables AS t
INNER JOIN information_schema.columns AS c
    ON t.table_name = c.table_name
WHERE t.table_schema = 'public'  
ORDER BY t.table_name, c.ordinal_position;


-- 1. Ventas por periodo de tienpo 

SELECT
  year,
  SUM(sales) AS "Total Sales"
FROM
  console_sales
GROUP BY
  year
ORDER BY
  year;

-- 2. Desarrolladores con mayor número de juegos: 

CREATE VIEW juegos_por_desarrollador AS
SELECT
  developers.developer,
  COUNT(juegos.appid) AS num_juegos
FROM developers
JOIN juegos ON developers.developer_key = juegos.developer_key
GROUP BY developers.developer;

SELECT *
FROM juegos_por_desarrollador
ORDER BY num_juegos DESC
LIMIT 10;


-- Total de ventas globales por año y los tres juegos principales
WITH TopGamePerYear AS (
  SELECT
    year_of_release,
    name,
    total_global,
    RANK() OVER (PARTITION BY year_of_release ORDER BY total_global DESC) AS ranking
  FROM video_games
)
SELECT
  year_of_release,
  ARRAY_AGG(name) AS top_games,
  ARRAY_AGG(total_global) AS top_games_total_global,
  SUM(total_global) AS total_global_for_year
FROM TopGamePerYear
WHERE ranking <= 3
GROUP BY year_of_release;

CREATE VIEW TopGamesPerYearView AS
WITH TopGamePerYear AS (
  SELECT
    year_of_release,
    name,
    total_global,
    RANK() OVER (PARTITION BY year_of_release ORDER BY total_global DESC) AS ranking
  FROM video_games
)
SELECT
  year_of_release,
  ARRAY_AGG(name) AS top_games,
  ARRAY_AGG(total_global) AS top_games_total_global,
  SUM(total_global) AS total_global_for_year
FROM TopGamePerYear
WHERE ranking <= 3
GROUP BY year_of_release;

-- REPRESENTACION GRAFANA EN TABLA INFO


---
SELECT
  j.name,
  j.owners,
  j.tier
FROM juegos j
WHERE j.tier IN ('tier_1', 'tier_2', 'tier_3','tier_4')
ORDER BY tier;

SELECT
  j.name AS juego_nombre,
  j.owners AS cantidad_propietarios,
  j.tier,
  dm.developer_clasificado
FROM
  juegos j
JOIN
  developer_mapping dm ON j.developer_key = dm.developer_key
WHERE
  j.tier IN ('tier_1', 'tier_2', 'tier_3', 'tier_4')
ORDER BY
  j.tier;

CREATE VIEW juegos_propietarios_separados AS
SELECT
  j.name AS juego_nombre,
  CAST(SPLIT_PART(j.owners, '-', 1) AS INT) AS cantidad_propietarios_inicio,
  CAST(SPLIT_PART(j.owners, '-', 2) AS INT) AS cantidad_propietarios_fin,
  j.tier,
  dm.developer_clasificado
FROM
  juegos j
JOIN
  developer_mapping dm ON j.developer_key = dm.developer_key
WHERE
  j.tier IN ('tier_1', 'tier_2', 'tier_3', 'tier_4', 'tier_5');



-- crear un visualizacion para juegos video_games y 

--- 

-- Promedio de los indicadores socioeconómicos por país y año
SELECT
  p.country_name,
  wi.series_name,
  wy.year,
  AVG(wy.value) AS avg_value
FROM
  paises p
LEFT JOIN
  world_indicators wi
ON
  p.idlocalidad_paises = wi.idlocalidad
LEFT JOIN
  world_years_unpivoted wy
ON
  wi.series_name = wy.series_name
GROUP BY
  p.country_name,
  wi.series_name,
  wy.year
ORDER BY
  p.country_name,
  wi.series_name,
  wy.year;


CREATE VIEW indicadores_promedio_paises AS
SELECT
  p.country_name,
  wi.series_name,
  CAST(wy.year AS INTEGER) AS numeric_year,
  AVG(wy.value) AS avg_value
FROM
  paises p
LEFT JOIN
  world_indicators wi
ON
  p.idlocalidad_paises = wi.idlocalidad
LEFT JOIN
  world_years_unpivoted wy
ON
  wi.series_name = wy.series_name
GROUP BY
  p.country_name,
  wi.series_name,
  numeric_year
ORDER BY
  p.country_name,
  wi.series_name,
  numeric_year;


SELECT
  CAST(p.numeric_year AS INTEGER) AS year,
  p.country_name,
  SUM(avg_value) AS total_pib
FROM
  indicadores_promedio_paises p
WHERE
  series_name = 'PIB (US$ a precios actuales)' and country_name='Estados Unidos' AND  numeric_year=2018
GROUP BY
  1, 2
ORDER BY
  1;




SELECT d.developer, AVG(vg.critic_score) AS avg_critic_score
FROM developers d
LEFT JOIN video_games vg ON d.developer_key = vg.developer_key
GROUP BY d.developer
ORDER BY avg_critic_score DESC;
-- Ventas Totales por País y Juego:
SELECT p.country_name, vg.name, SUM(vg.global_sales) AS ventas_totales
FROM paises p
JOIN video_games vg ON p.country_code = vg.country_code
GROUP BY p.country_name, vg.name
ORDER BY ventas_totales DESC;

-- Ventas Totales por País y Juego:
SELECT
  p.country_name,
  vg.name,
  SUM(vg.global_sales) AS ventas_totales
FROM
  paises p
JOIN
  video_games vg ON p.country_code = vg.country_code
GROUP BY
  p.country_name,
  vg.name
ORDER BY
  ventas_totales DESC;

--- periodo de calendario fecha

SELECT
  c.fecha AS release_date,
  COALESCE(SUM(j.positive_ratings), 0) AS total_positive_ratings,
  COALESCE(SUM(j.negative_ratings), 0) AS total_negative_ratings,
  (COALESCE(SUM(j.positive_ratings), 0) - COALESCE(SUM(j.negative_ratings), 0)) AS net_ratings
FROM calendario c
LEFT JOIN juegos j ON c.fecha = j.release_date
GROUP BY c.fecha
ORDER BY c.fecha;



SELECT
  c.fecha AS release_date,
  COALESCE(SUM(j.positive_ratings), 0) AS total_positive_ratings,
  COALESCE(SUM(j.negative_ratings), 0) AS total_negative_ratings,
  (COALESCE(SUM(j.positive_ratings), 0) - COALESCE(SUM(j.negative_ratings), 0)) AS net_ratings,
  ARRAY_AGG(DISTINCT j.categories) AS unique_categories
FROM calendario c
LEFT JOIN juegos j ON c.fecha = j.release_date
WHERE j.positive_ratings IS NOT NULL OR j.negative_ratings IS NOT NULL
GROUP BY c.fecha
ORDER BY c.fecha;
--
CREATE VIEW juegos_time_series AS
SELECT
  c.fecha AS release_date,
  COALESCE(SUM(j.positive_ratings), 0) AS total_positive_ratings,
  COALESCE(SUM(j.negative_ratings), 0) AS total_negative_ratings,
  (COALESCE(SUM(j.positive_ratings), 0) - COALESCE(SUM(j.negative_ratings), 0)) AS net_ratings,
  ARRAY_AGG(DISTINCT j.categories) AS unique_categories,
  c.trimestre
FROM calendario c
LEFT JOIN juegos j ON c.fecha = j.release_date
WHERE j.positive_ratings IS NOT NULL OR j.negative_ratings IS NOT NULL
GROUP BY c.fecha, c.trimestre
ORDER BY c.fecha;
---

CREATE VIEW juegos_time_series AS
SELECT
  c.fecha AS release_date,
  COALESCE(SUM(j.positive_ratings), 0) AS total_positive_ratings,
  COALESCE(SUM(j.negative_ratings), 0) AS total_negative_ratings,
  (COALESCE(AVG(j.positive_ratings), 0) - COALESCE(SUM(j.negative_ratings), 0)) AS net_ratings,
  COALESCE(SUM(j.average_playtime), 0) AS total_average_playtime,
  ARRAY_AGG(DISTINCT j.categories) AS unique_categories,
  c.trimestre
FROM calendario c
LEFT JOIN juegos j ON c.fecha = j.release_date
WHERE j.positive_ratings IS NOT NULL OR j.negative_ratings IS NOT NULL
GROUP BY c.fecha, c.trimestre
ORDER BY c.fecha;


-- 
CREATE VIEW juegos_time_series AS
SELECT
  c.fecha AS release_date,
  COALESCE(SUM(j.positive_ratings), 0) AS total_positive_ratings,
  COALESCE(SUM(j.negative_ratings), 0) AS total_negative_ratings,
  (COALESCE(SUM(j.positive_ratings), 0) - COALESCE(SUM(j.negative_ratings), 0)) AS net_ratings,
  ARRAY_AGG(DISTINCT j.categories) AS unique_categories,
  c.trimestre
FROM calendario c
LEFT JOIN juegos j ON c.fecha = j.release_date
WHERE j.positive_ratings IS NOT NULL OR j.negative_ratings IS NOT NULL
GROUP BY c.fecha, c.trimestre
ORDER BY c.fecha;

SELECT release_date, AVG(net_ratings) AS avg_net_ratings
FROM juegos_time_series
WHERE EXTRACT(YEAR FROM release_date) BETWEEN 2020 AND 2023
GROUP BY release_date
ORDER BY release_date;

SELECT
  release_date,
  AVG(net_ratings) AS avg_net_ratings
FROM juegos_time_series
WHERE EXTRACT(YEAR FROM release_date) BETWEEN 2020 AND 2023
GROUP BY release_date
ORDER BY release_date;


SELECT year_of_release, top_games, top_games_total_global, total_global_for_year 
FROM topgamesperyearview LIMIT 50;
