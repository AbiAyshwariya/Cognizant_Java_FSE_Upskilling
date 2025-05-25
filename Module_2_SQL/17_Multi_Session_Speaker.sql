use event_management;
SELECT 
    speaker_name,
    COUNT(session_id) AS total_sessions
FROM 
    Sessions
GROUP BY 
    speaker_name
HAVING 
    total_sessions > 1;