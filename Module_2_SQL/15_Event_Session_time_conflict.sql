use event_management;

SELECT 
	 s1.event_id,
     s1.title as session_1,
     s2.title as session_2
from
	 sessions s1
Join 
	 sessions s2
     ON
	 s1.event_id=s2.event_id AND 
     s1.session_id<s2.session_id
 WHERE s1.end_date > s2.start_date       
    AND s1.start_date < s2.end_date;
