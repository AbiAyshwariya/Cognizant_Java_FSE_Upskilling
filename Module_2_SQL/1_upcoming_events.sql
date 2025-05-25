USE Event_Management;

SELECT 
	u.full_name,
    e.title as event_title,
    e.city,
    e.start_date
FROM
	Users u
JOIN 
    Registrations r ON u.user_id=r.user_id
JOIN
    Events e on r.event_id=e.event_id
WHERE
    e.status='upcoming' AND
    u.city=e.city
ORDER BY
    e.start_date;
    