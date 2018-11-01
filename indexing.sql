
CREATE USER indexed_cars_user;
CREATE DATABASE indexed_cars WITH OWNER = indexed_cars_user;

\c indexed_cars;

\i script/car_models.sql;

\i script/car_models.sql;
\i script/car_models.sql;
\i script/car_models.sql;
\i script/car_models.sql;
\i script/car_models.sql;
\i script/car_models.sql;
\i script/car_models.sql;
\i script/car_models.sql;
\i script/car_models.sql;


SELECT DISTINCT make_title FROM car_models WHERE make_code = 'LAM';


--Run a query to list all model_title values where the make_code is 'NISSAN', and the model_code is 'GT-R'without any duplicate rows, and note the time somewhere. (should have 1 result)

SELECT DISTINCT model_title FROM car_models WHERE make_code = 'NISSAN' AND model_code = 'GT-R';

--Run a query to list all make_code, model_code, model_title, and year from car_models where the make_code is 'LAM', and note the time somewhere. (should have 1360 rows)

SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code = 'LAM';

--Run a query to list all fields from all car_models in years between 2010 and 2015, and note the time somewhere (should have 78840 rows)

SELECT * FROM car_models WHERE year BETWEEN 2010 AND 2015;

--Run a query to list all fields from all car_models in the year of 2010, and note the time somewhere (should have 13140 rows)

SELECT * FROM car_models WHERE year = 2010;


--------INDEXING------------
--Create a query to get a list of all make_title values from the car_models table where the make_code is 'LAM', without any duplicate rows, and note the time somewhere. (should have 1 result)

CREATE INDEX indexMakeCode
	ON car_models (make_code) WHERE make_code = 'LAM';
	
SELECT DISTINCT make_title FROM car_models WHERE make_code = 'LAM';

--Create a query to list all model_title values where the make_code is 'NISSAN', and the model_code is 'GT-R'without any duplicate rows, and note the time somewhere. (should have 1 result)

CREATE INDEX indexMakeCodeModelCode
	ON car_models (make_code, model_code) WHERE make_code = 'NISSAN' AND model_code = 'GT-R';
	
SELECT DISTINCT model_title FROM car_models WHERE make_code = 'NISSAN' AND model_code = 'GT-R';

--Create a query to list all make_code, model_code, model_title, and year from car_models where the make_code is 'LAM', and note the time somewhere. (should have 1360 rows)

CREATE INDEX indexMakeCodeModelCodeModelTitleYear
	ON car_models (make_code, model_code, model_title, year) WHERE make_code = 'LAM';

SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code = 'LAM';


--Create a query to list all fields from all car_models in years between 2010 and 2015, and note the time somewhere (should have 78840 rows)

CREATE INDEX indexAllFields
	ON car_models (make_code, make_title, model_code, model_title, year) WHERE year BETWEEN 2010 AND 2015;
	

--Create a query to list all fields from all car_models in the year of 2010, and note the time somewhere (should have 13140 rows)

CREATE INDEX indexAllFields2010
	ON car_models (make_code, make_title, model_code, model_title, year) WHERE year = 2010;
SELECT * FROM car_models WHERE year = 2010;
