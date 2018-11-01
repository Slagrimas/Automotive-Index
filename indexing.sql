--Enable timing queries in Postgres by toggling the `\timing` command in the psql shell.

-- 1. Run a query to get a list of all `make_title` values from the `car_models` table where the `make_code` is `'LAM'`, without any duplicate rows, and note the time somewhere. (should have 1 result) //14 ms
SELECT DISTINCT make_title FROM car_models WHERE make_code = 'LAM';

-- 1. Run a query to list all `model_title` values where the `make_code` is `'NISSAN'`, and the `model_code` is `'GT-R'` without any duplicate rows, and note the time somewhere. (should have 1 result) //19 ms
SELECT DISTINCT model_title FROM car_models WHERE make_code = 'NISSAN' AND model_code = 'GT-R'; 

-- 1. Run a query to list all `make_code`, `model_code`, `model_title`, and year from `car_models` where the `make_code` is `'LAM'`, and note the time somewhere. (should have 1360 rows) //18ms
SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code = 'LAM';

-- 1. Run a query to list all fields from all `car_models` in years between `2010` and `2015`, and note the time somewhere (should have 78840 rows) //1s
SELECT * FROM car_models WHERE year BETWEEN 2010 AND 2015;

-- 1. Run a query to list all fields from all `car_models` in the year of `2010`, and note the time somewhere (should have 13140 rows)
SELECT * FROM car_models WHERE year = 2010;

--------INDEXING------------
--Create a query to get a list of all make_title values from the car_models table where the make_code is 'LAM', without any duplicate rows, and note the time somewhere. (should have 1 result)
--(3ms)
CREATE INDEX indexMakeCode
	ON car_models (make_code) WHERE make_code = 'LAM';
	
SELECT DISTINCT make_title FROM car_models WHERE make_code = 'LAM';

--Create a query to list all model_title values where the make_code is 'NISSAN', and the model_code is 'GT-R'without any duplicate rows, and note the time somewhere. (should have 1 result)
--(3ms)
CREATE INDEX indexMakeCodeModelCode
	ON car_models (make_code, model_code) WHERE make_code = 'NISSAN' AND model_code = 'GT-R';
	
SELECT DISTINCT model_title FROM car_models WHERE make_code = 'NISSAN' AND model_code = 'GT-R';

--Create a query to list all make_code, model_code, model_title, and year from car_models where the make_code is 'LAM', and note the time somewhere. (should have 1360 rows)
--(11ms)
CREATE INDEX indexMakeCodeModelCodeModelTitleYear
	ON car_models (make_code, model_code, model_title, year) WHERE make_code = 'LAM';

SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code = 'LAM';

