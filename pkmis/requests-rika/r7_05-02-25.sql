select * from health_facility

ALTER TABLE health_facility
ALTER COLUMN phone_number TYPE varchar(255);

UPDATE health_facility
SET  phone_number = '+855 23 987 701, +855 11 811 132, +855 12 224 471, +855 92 516 282, +855 11 926 975'
WHERE id = 2;