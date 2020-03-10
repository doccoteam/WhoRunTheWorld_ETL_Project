-- Drop table if exists
DROP TABLE wars;

-- Create new table
CREATE TABLE wars (
	unique_ID INT,
	war_ID VARCHAR,
	war_name VARCHAR,
	country VARCHAR,
	startyear INT,
	 endyear INT
);


-- View table columns and datatypes
SELECT * FROM wars;

-- Create new table
CREATE TABLE olympics(
	year INT,
	Country VARCHAR,
	Medal VARCHAR,
	City VARCHAR,
	Sport VARCHAR,
	Discipline VARCHAR,
	Athlete VARCHAR
	
);

--Script to return desire story of country during year and war. Realized this is not the desire outcome.
--Did not want COUNTRIES AT WAR DURING OLYMPIC YEAR AND COUNT OF WARS THEY WERE IN!!! 
select olympics.country, olympics.year, count(wars.war_name) as war_count
from olympics inner join wars on olympics.country = wars.country
where olympics.year >= wars.startyear and olympics.year <= wars.endyear
group by olympics.year, olympics.country order by olympics.country, olympics.year;

--Script to return desire story of country during year and war.
--COUNTRIES AT WAR DURING OLYMPIC YEAR AND EARNED OLYMPIC MEDALS WHILE AT WAR!!!!! Final code!!
select wars.country, olympics.year, count(olympics.medal) as medal_count
from wars, olympics where olympics.country = wars.country
and olympics.year >= wars.startyear and olympics.year <= wars.endyear
group by olympics.year, wars.country order by wars.country, olympics.year;

create view war_olympicsresults as 
select wars.country, olympics.year, count(olympics.medal) as medal_count
from wars, olympics where olympics.country = wars.country
and olympics.year >= wars.startyear and olympics.year <= wars.endyear
group by olympics.year, wars.country order by wars.country, olympics.year;



