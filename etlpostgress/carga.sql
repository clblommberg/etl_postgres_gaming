CREATE SCHEMA IF NOT EXISTS gamingdb;

DROP TABLE IF EXISTS indicadores_desarrollo_humano;

CREATE TABLE indicadores_desarrollo_humano (
    code  VARCHAR(255),
    license_type  VARCHAR(255),
    indicator_name  VARCHAR(255),
    short_definition TEXT,
    long_definition TEXT,
    source TEXT,
    topic TEXT,
    dataset TEXT,
    periodicity TEXT,
    base_period TEXT,
    aggregation_method TEXT,
    statistical_concept_and_methodology TEXT,
    development_relevance TEXT,
    limitations_and_exceptions TEXT,
    general_comments TEXT,
    other_notes TEXT,
    license_url TEXT
);

COPY indicadores_desarrollo_humano
FROM '/data/postgres/iseriesdata.csv'
WITH CSV HEADER DELIMITER ',' QUOTE '"';


-- Drop the table if it already exists
DROP TABLE IF EXISTS console_sales;

-- Create the new table
CREATE TABLE console_sales (
    Year INTEGER,
    Dato VARCHAR(20),
    Console VARCHAR(50),
    Company VARCHAR(50),
    Sales VARCHAR(50)
);

-- Load data from CSV

COPY console_sales (Year, Dato, Console, Company, Sales)
FROM '/data/postgres/iconsolesales.csv'
WITH CSV HEADER DELIMITER ',' QUOTE '"';

DROP TABLE IF EXISTS world_indicators;
CREATE TABLE world_indicators (
    "Series Name" VARCHAR(500),
    "Series Code" VARCHAR(255),
    "Country Name" VARCHAR(255),
    "Country Code" VARCHAR(100),
    "2000 [YR2000]" VARCHAR(200),
    "2001 [YR2001]" VARCHAR(200),
    "2002 [YR2002]" VARCHAR(200),
    "2003 [YR2003]" VARCHAR(200),
    "2004 [YR2004]" VARCHAR(200),
    "2005 [YR2005]" VARCHAR(200),
    "2006 [YR2006]" VARCHAR(200),
    "2007 [YR2007]" VARCHAR(200),
    "2008 [YR2008]" VARCHAR(200),
    "2009 [YR2009]" VARCHAR(200),
    "2010 [YR2010]" VARCHAR(200),
    "2011 [YR2011]" VARCHAR(200),
    "2012 [YR2012]" VARCHAR(200),
    "2013 [YR2013]" VARCHAR(200),
    "2014 [YR2014]" VARCHAR(200),
    "2015 [YR2015]" VARCHAR(200),
    "2016 [YR2016]" VARCHAR(200),
    "2017 [YR2017]" VARCHAR(200),
    "2018 [YR2018]" VARCHAR(200),
    "2019 [YR2019]" VARCHAR(50)
);

-- Load data from CSV
COPY world_indicators
FROM '/data/postgres/indicadores.csv'
WITH CSV HEADER DELIMITER ',' QUOTE '"';



DROP TABLE IF EXISTS juegos;
CREATE TABLE juegos(
    appid INT,
    name VARCHAR(500),
    release_date DATE,
    english INT,
    developer VARCHAR(500),
    publisher VARCHAR(500),
    platforms VARCHAR(500),
    required_age INT,
    categories VARCHAR(500),
    genres VARCHAR(500),
    steamspy_tags VARCHAR(500),
    achievements INT,
    positive_ratings INT,
    negative_ratings INT,
    average_playtime INT,
    median_playtime INT,
    owners VARCHAR(500),
    price NUMERIC(8, 2)
);

COPY juegos
FROM '/data/postgres/iiijuegosteam.csv'
WITH CSV HEADER DELIMITER ',' QUOTE '"';

DROP TABLE IF EXISTS video_games;

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
FROM '/data/postgres/ivideosgame.csv'
WITH CSV HEADER DELIMITER ',' QUOTE '"';