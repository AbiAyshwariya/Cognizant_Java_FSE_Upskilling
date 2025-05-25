use event_management;
SELECT
     u.full_name,
     count(f.feedback_id) as total_feedback
FROM 
	Users u
JOin 
	feedback f On f.user_id=u.user_id
GROUP BY u.user_id
ORDER BY total_feedback DESC Limit 5;