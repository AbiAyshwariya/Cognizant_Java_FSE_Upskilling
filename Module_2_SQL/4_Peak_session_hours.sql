use event_management;
SELECT
	e.title,
    COUNT(s.session_id) as session_count
from 
    Events e
JOIN 
	Sessions s ON e.event_id = s.event_id
WHERE
    TIME(s.start_date)>='10:00:00' AND
    TIME(s.end_date)<='12:00:00'
GROUP BY
    e.event_id;