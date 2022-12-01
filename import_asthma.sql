-- PM25

CREATE TABLE IF NOT EXISTS ap.pm25 (
  year INT,
  date DATE,
  state_fips TEXT,
  county_fips TEXT,
  max_pred_pm25 NUMERIC,
  min_pred_pm25 NUMERIC,
  mean_pred_pm25 NUMERIC,
  pop_pred_pm25 NUMERIC
);
  
-- COPY ap.pm25 FROM '/Users/seanbergan/Documents/DS/sql_mgmt/asthma/pm2016.csv'
-- CSV HEADER;

SELECT COUNT(*) FROM ap.pm25;
-- 1137894 entries

ALTER TABLE ap.pm25
	DROP COLUMN year;

-- OZONE

CREATE TABLE IF NOT EXISTS ap.ozone (
  year INT,
  month TEXT,
  day INT,
  state_fips TEXT,
  county_fips TEXT,
  max_pred_pm25 NUMERIC,
  min_pred_pm25 NUMERIC,
  mean_pred_pm25 NUMERIC,
  pop_pred_pm25 NUMERIC
);
  
-- COPY ap.ozone FROM '/Users/seanbergan/Documents/DS/sql_mgmt/asthma/ozone2016.csv'
-- CSV HEADER;

SELECT COUNT(*) FROM ap.ozone;
-- 1137894 entries

SELECT (day || month || year)::date FROM ap.ozone;

ALTER TABLE ap.ozone
ADD COLUMN date date;

UPDATE ap.ozone
SET date = (day || month || year)::date;


ALTER TABLE ap.ozone
DROP COLUMN year,
DROP COLUMN day,
DROP COLUMN month;

-- ASTHMA

CREATE TABLE ap.asthma (
  state_abbr TEXT,
  state_desc TEXT,
  county_name TEXT,
  county_fips TEXT,
  total_population INT,
  crude_prevalence NUMERIC,
  ci_crude_prevalence TEXT,
  adj_prevalence NUMERIC,
  ci_adj_prevalence TEXT,
  geo_point TEXT
);

-- COPY ap.asthma FROM '/Users/seanbergan/Documents/DS/sql_mgmt/asthma/asthma2020.csv'
-- CSV HEADER;

