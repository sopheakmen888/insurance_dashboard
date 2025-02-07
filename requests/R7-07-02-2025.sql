CREATE TABLE phone_number_hf (
    id SERIAL PRIMARY KEY,
    health_facility_id INT NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

ALTER TABLE health_facility
DROP COLUMN phone_number;


INSERT INTO public.phone_number_hf(
	id, health_facility_id, phone_number)
	VALUES (1, 1, '+855 23 218 875'),
	(2, 2, '+855 23 987 701'),
	(3, 2, '+855 11 811 132'),
	(4, 2, '+855 12 224 471'),
	(5, 2, '+855 92 516 282'),
	(6, 2, '+855 11 926 975'),
	(7, 3, '+855 12 927 052'),
	(8, 4, '+855 12 551 254'),
	(9, 5, '+855 12 847 675'),
	(10, 5, '+855 92 814 536'),
	(11, 5, '+855 12 921 223'),
	(12, 5, '+855 16 850 176');
	

