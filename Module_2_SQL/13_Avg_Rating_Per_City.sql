use event_management;

SELECT 
		e.city,
        avg(f.rating) AS avg_rating 
FROM 
		events e
JOIN
		feedback f ON e.event_id=f.event_id
group by city;