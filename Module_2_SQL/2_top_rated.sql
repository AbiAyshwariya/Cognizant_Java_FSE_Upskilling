Use event_management;

SELECT 
     e.title,
     AVG(f.rating) as avg_rating,
     COUNT(f.feedback_id) as feedback_count
FROM 
	Events e 
JOIN
    feedback f ON e.event_id=f.event_id
GROUP BY 
	f.event_id
HAVING
	COUNT(f.feedback_id)>=10
Order by 
    avg_rating desc;


