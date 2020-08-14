SELECT * FROM trips;
SELECT * FROM riders;
SELECT * FROM cars;

/*
Pkey of trips --> trips.id
Pkey of riders --> riders.id
Pkey of cars --> cars.id
*/

--not useful
SELECT * FROM riders
CROSS JOIN cars;

--Every trip, with riders that have/haven't driven
SELECT * FROM trips
LEFT JOIN riders
ON trips.rider_id = riders.id;

--Every car that has been on a trip
SELECT cars.model AS 'Cars',
cars.OS AS 'OS',
trips.date AS 'Date', 
trips.pickup AS 'Pick-up time',
trips.dropoff AS 'Drop-off time',
trips.cost AS 'Cost'
FROM trips
JOIN cars
ON trips.car_id = cars.id;

--Reassinging the new table with a name // currently not used
WITH all_riders AS (
  SELECT * FROM riders
  UNION
  SELECT * FROM riders2
)

--Average cost of trips
SELECT ROUND(AVG(cost), 2) AS 'Average cost of trips' FROM trips;

--Riders whose total trips are less than 500
SELECT first,last,username FROM riders
WHERE total_trips < 500
UNION
SELECT riders2.first,riders2.last,riders2.username FROM riders2
WHERE total_trips < 500;

SELECT
COUNT(*) AS '# of active cars'
FROM cars
WHERE status = 'active';

SELECT id AS 'Car ID', 
trips_completed AS 'Trips completed'
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;

