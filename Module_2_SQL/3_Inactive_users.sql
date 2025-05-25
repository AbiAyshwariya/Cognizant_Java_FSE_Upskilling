use event_management;
SELECT 
      u.user_id,
      u.full_name,
      MAX(r.registration_date) AS last_registered
FROM 
      Users u
LEFT JOIN
	  registrations r on u.user_id=r.user_id
GROUP BY 
	  u.user_id
HAVING 
	  last_registered IS NULL  OR last_registered < curdate() -interval 90 day;