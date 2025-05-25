use event_management;
SELECT 
		e.title as event_name
FROM
	    Events e
JOIN 
        Registrations r ON e.event_id=r.event_id
LEFT JOIN
        feedback f ON f.event_id=e.event_id
WHERE
        f.feedback_id IS NULL
GROUP BY
		e.event_id; 
        