-- brennanPopulateTable.sql
-- CSD430 - Populate states data table

USE CSD430;

INSERT INTO brennanstatesdata (state_name, capital, population, region, year_admitted)
VALUES
('Tennessee', 'Nashville', 7051339, 'South', 1796),
('California', 'Sacramento', 39237836, 'West', 1850),
('Texas', 'Austin', 30503301, 'South', 1845),
('New York', 'Albany', 19571216, 'Northeast', 1788),
('Florida', 'Tallahassee', 22610726, 'South', 1845),
('Ohio', 'Columbus', 11785935, 'Midwest', 1803),
('Georgia', 'Atlanta', 11029227, 'South', 1788),
('Colorado', 'Denver', 5877610, 'West', 1876),
('Michigan', 'Lansing', 10037261, 'Midwest', 1837),
('Virginia', 'Richmond', 8715698, 'South', 1788);