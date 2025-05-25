use event_management;
SELECT
		registration_date,
        Count(user_id) as new_users
FROM
		Users
WHERE
		registration_date>=curdate()-INTERVAL 7 day
GROUP BY
     registration_date;