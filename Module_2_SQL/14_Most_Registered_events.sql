use event_management;
SELECT
		e.title,
        COUNT(r.registration_id) as total_registrations
FROM 
		Events e
JOIN
        registrations r on e.event_id=r.event_id
GROUP BY 
       e.event_id
ORDER BY 
		total_registrations DESC
LIMIT 3;