----------Open Secrets Data----------

--Create open_secrets table
CREATE TABLE open_secrets (
	district TEXT,
	name TEXT,	
	winner TEXT,
	loser TEXT,
	incumbent TEXT,
	challenger TEXT,
	open TEXT,
	year TEXT
);
-------------------------------------------------------------------------
----------Census Data----------

--Create census_2013 table
CREATE TABLE census_2013 (
	district TEXT,
	election_year INT,
	total_pop INT,
	male_pop_percent FLOAT,
	female_pop_percent FLOAT,
	under_five_percent FLOAT,
	five_to_nine_percent FLOAT,
	ten_to_fourteen_percent FLOAT,
	fifteen_nineteen_percent FLOAT,
	twenty_to_twentyfour_percent FLOAT,
	twentyfive_to_thirtyfour_percent FLOAT,
	thirtyfive_to_fortyfour_percent FLOAT,
	fortyfive_to_fiftyfour_percent FLOAT,
	fiftyfive_to_fiftynine_percent FLOAT,
	sixty_to_sixtyfour_percent FLOAT,
	sixtyfive_to_seventyfour_percent FLOAT,
	seventyfive_to_eightyfour_percent FLOAT,
	over_eightyfive_percent FLOAT,
	median_age FLOAT,
	eighteen_and_over_percent FLOAT,
	twentyone_and_over_percent FLOAT,
	sixtytwo_and_over_percent FLOAT,
	sixtyfive_and_over_percent FLOAT,
	eighteen_and_over_male_percent FLOAT,
	eighteen_and_over_female_percent FLOAT,
	sixtyfive_and_over_male_percent FLOAT,
	sixtyfive_and_over_female_percent FLOAT,
	white_pop_percent FLOAT,
	black_pop_percent FLOAT,
	american_indian_alaska_native_pop_percent FLOAT,
	asian_pop_percent FLOAT,
	native_hawaiian_pacific_islander_pop_percent FLOAT,
	other_race_pop_percent FLOAT,
	hispanic_pop_percent FLOAT,
	total_housing_units FLOAT
);

--Create census_2015 table
CREATE TABLE census_2015 (
	district TEXT,
	election_year INT,
	total_pop INT,
	male_pop_percent FLOAT,
	female_pop_percent FLOAT,
	under_five_percent FLOAT,
	five_to_nine_percent FLOAT,
	ten_to_fourteen_percent FLOAT,
	fifteen_nineteen_percent FLOAT,
	twenty_to_twentyfour_percent FLOAT,
	twentyfive_to_thirtyfour_percent FLOAT,
	thirtyfive_to_fortyfour_percent FLOAT,
	fortyfive_to_fiftyfour_percent FLOAT,
	fiftyfive_to_fiftynine_percent FLOAT,
	sixty_to_sixtyfour_percent FLOAT,
	sixtyfive_to_seventyfour_percent FLOAT,
	seventyfive_to_eightyfour_percent FLOAT,
	over_eightyfive_percent FLOAT,
	median_age FLOAT,
	eighteen_and_over_percent FLOAT,
	twentyone_and_over_percent FLOAT,
	sixtytwo_and_over_percent FLOAT,
	sixtyfive_and_over_percent FLOAT,
	eighteen_and_over_male_percent FLOAT,
	eighteen_and_over_female_percent FLOAT,
	sixtyfive_and_over_male_percent FLOAT,
	sixtyfive_and_over_female_percent FLOAT,
	white_pop_percent FLOAT,
	black_pop_percent FLOAT,
	american_indian_alaska_native_pop_percent FLOAT,
	asian_pop_percent FLOAT,
	native_hawaiian_pacific_islander_pop_percent FLOAT,
	other_race_pop_percent FLOAT,
	hispanic_pop_percent FLOAT,
	total_housing_units FLOAT
);

--Create census_2017 table
CREATE TABLE census_2017 (
	district TEXT,
	election_year INT,
	total_pop INT,
	male_pop_percent FLOAT,
	female_pop_percent FLOAT,
	under_five_percent FLOAT,
	five_to_nine_percent FLOAT,
	ten_to_fourteen_percent FLOAT,
	fifteen_nineteen_percent FLOAT,
	twenty_to_twentyfour_percent FLOAT,
	twentyfive_to_thirtyfour_percent FLOAT,
	thirtyfive_to_fortyfour_percent FLOAT,
	fortyfive_to_fiftyfour_percent FLOAT,
	fiftyfive_to_fiftynine_percent FLOAT,
	sixty_to_sixtyfour_percent FLOAT,
	sixtyfive_to_seventyfour_percent FLOAT,
	seventyfive_to_eightyfour_percent FLOAT,
	over_eightyfive_percent FLOAT,
	median_age FLOAT,
	eighteen_and_over_percent FLOAT,
	twentyone_and_over_percent FLOAT,
	sixtytwo_and_over_percent FLOAT,
	sixtyfive_and_over_percent FLOAT,
	eighteen_and_over_male_percent FLOAT,
	eighteen_and_over_female_percent FLOAT,
	sixtyfive_and_over_male_percent FLOAT,
	sixtyfive_and_over_female_percent FLOAT,
	white_pop_percent FLOAT,
	black_pop_percent FLOAT,
	american_indian_alaska_native_pop_percent FLOAT,
	asian_pop_percent FLOAT,
	native_hawaiian_pacific_islander_pop_percent FLOAT,
	other_race_pop_percent FLOAT,
	hispanic_pop_percent FLOAT,
	total_housing_units FLOAT
);

--Create census_data table
SELECT *
INTO census_data
FROM (
	SELECT *
	FROM census_2013
	UNION ALL
	SELECT *
	FROM census_2015
	UNION ALL
	SELECT *
	FROM census_2017
	)a
;
--------------------------------------------------------------------------------------------

----------FEC Data----------

--Create fec_2014 table
CREATE TABLE fec_2014 (
	state_district TEXT,
	election INT,
	name TEXT,
	party TEXT,
	incumbent_challenger_open TEXT,
	receipts FLOAT,
	from_individuals FLOAT,
	from_committees FLOAT,
	from_candidate FLOAT,
	disbursements FLOAT,
	cash_on_hand FLOAT,
	debts FLOAT
);

--Create fec_2016 table
CREATE TABLE fec_2016 (
	state_district TEXT,
	election INT,
	name TEXT,
	party TEXT,
	incumbent_challenger_open TEXT,
	receipts FLOAT,
	from_individuals FLOAT,
	from_committees FLOAT,
	from_candidate FLOAT,
	disbursements FLOAT,
	cash_on_hand FLOAT,
	debts FLOAT
);

--Create fec_2018 table
CREATE TABLE fec_2018 (
	state_district TEXT,
	election INT,
	name TEXT,
	party TEXT,
	incumbent_challenger_open TEXT,
	receipts FLOAT,
	from_individuals FLOAT,
	from_committees FLOAT,
	from_candidate FLOAT,
	disbursements FLOAT,
	cash_on_hand FLOAT,
	debts FLOAT
);

--Create fec_data table
SELECT *
INTO fec_data
FROM (
	SELECT *
	FROM fec_2014
	UNION ALL
	SELECT *
	FROM fec_2016
	UNION ALL
	SELECT *
	FROM fec_2018
	)a
;
-----------------------------------------------------------------------

--Join fec_data with census_data
SELECT *
INTO census_and_fec
FROM fec_data AS one
FULL OUTER JOIN census_data AS two
ON (one.state_district = two.district AND one.election = two.election_year)
;