use event_management;
SELECT 
		u.full_name,
        r.registration_id
FROM
     Users u
LEFT JOIN Registrations r On u.user_id=r.user_id
Where
   r.registration_id>=curdate()-Interval 30 day
   AND r.user_id IS NULL;