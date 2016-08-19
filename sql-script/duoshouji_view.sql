create view squer_notes AS
select
  c.id note_id
	, c.title
	, u.id owner_id
	, u.avatar_url portrait
	, c.image1 image
	, c.image1_width image_width
	, c.image1_height image_height
	, a1.like_number like_count
	, a1.comment_number comment_count
	, a2.avg_rank rank
  , c.create_time created_time
from note c, note_extend a1, (select note_id, avg(value) avg_rank from rating group by note_id) a2, user u
where c.id = a1.note_id and c.id = a2.note_id and c.user_id = u.id
