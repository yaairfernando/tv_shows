SELECT 
  rev.id,
  rev.tv_show_id,
  rev.description,
  rev.title,
  rev.status,
  rev.scheduled_date,
  rev.votes, 
  rev.revenue,
  usr.name as user_name,
  usr.email as user_email,
  tms.name as team_name,
  gps.name as group_name,
  (rev.revenue / rev.votes) revenue_per_vote,
  CONCAT(gps.id, '-', rev.id) as uid
FROM reviews as rev
INNER JOIN users as usr ON usr.id = rev.user_id
INNER JOIN teams as tms ON tms.id = usr.team_id
INNER JOIN groups as gps ON gps.id = tms.group_id
INNER JOIN review_types as rev_tp ON rev_tp.id = rev.review_type_id
WHERE (usr.status = 0) AND (tms.status IN (0,1))
AND (rev.status IN (0,1)) AND (rev.scheduled_date <= NOW())
GROUP BY rev.id, usr.name, usr.email, tms.name, gps.name, gps.created_at, gps.id
ORDER BY rev.created_at ASC, gps.created_at ASC