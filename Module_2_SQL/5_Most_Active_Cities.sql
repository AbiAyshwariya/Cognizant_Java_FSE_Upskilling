use event_management;
SELECT 
    city,
    COUNT(DISTINCT user_id) AS registered_users
FROM 
    Users
WHERE 
    user_id IN (SELECT DISTINCT user_id FROM Registrations)
GROUP BY 
    city
ORDER BY 
    registered_users DESC
LIMIT 5;