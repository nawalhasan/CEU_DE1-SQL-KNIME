USE birdstrikes;


-- EX 1: Do the same with speed. If speed is NULL or speed < 100 create a “LOW SPEED” category, otherwise, mark as “HIGH SPEED”. Use IF instead of CASE!
SELECT aircraft, airline, speed,
	IF  (speed < 100 OR SPEED IS NULL, 'LOW SPEED', 'HIGH SPEED') AS speed_category
		FROM birdstrikes
			ORDER BY speed_category;


-- EX 2: How many distinct ‘aircraft’ we have in the database?
SELECT COUNT(DISTINCT aircraft) 
	FROM birdstrikes;
-- Answer: 3


-- EX 3: What was the lowest speed of aircrafts starting with ‘H’?
SELECT MIN(speed)
	FROM birdstrikes
		WHERE aircraft LIKE 'H%';
-- Answer: 9
      
      
-- EX 4: Which phase_of_flight has the least of incidents?
SELECT COUNT(*) AS min_damage , phase_of_flight
	FROM birdstrikes
       GROUP BY phase_of_flight
			ORDER BY min_damage 
            LIMIT 1;
-- Answer: Taxi


-- EX 5: What is the rounded highest average cost by phase_of_flight?
SELECT phase_of_flight, round(AVG(cost)) AS avg_cost 
	FROM birdstrikes 
		GROUP BY phase_of_flight 
			ORDER BY avg_cost DESC
				LIMIT 1;
-- Climb, 54673

-- EX 6: What the highest AVG speed of the states with names less than 5 characters?
SELECT (AVG(speed)) AS avg_speed, state 
	FROM birdstrikes 
			GROUP BY state 
				HAVING LENGTH (state) < 5
					ORDER BY avg_speed DESC
						LIMIT 1;
-- Answer: 2862.5000








