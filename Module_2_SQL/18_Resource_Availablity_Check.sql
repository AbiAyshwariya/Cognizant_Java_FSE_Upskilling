use event_management;
SELECT 
     e.title
FROM
    Events e 
Left Join 
    Resources r On e.event_id=r.event_id
WHERE
   r.resource_id IS NULL;