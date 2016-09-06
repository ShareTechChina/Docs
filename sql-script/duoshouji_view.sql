
drop view if exists duoshouji.v_user;

create view duoshouji.v_user as
select mobile, user_name, password, avatar_url, avatar_width, avatar_height, gender
from duoshouji.user
;



drop view if exists duoshouji.v_square_notes;

create view duoshouji.v_square_notes as
select c.id, c.title, a1.rank, c.image1, c.image1_width, c.image1_height, c.create_time, a2.comment_number, a2.like_number, a2.order_number,
  u.mobile, u.user_name, u.avatar_url, u.avatar_width, u.avatar_height, u.gender,
  tag_id1,
  tag_id2,
  tag_id3,
  tag_id4,
  tag_id5,
  tag_id6,
  tag_id7,
  tag_id8,
  tag_id9
from duoshouji.note c left join
  (select note_id, avg(value) rank from duoshouji.rating group by note_id) a1 on c.id = a1.note_id left join
  duoshouji.note_extend a2 on c.id = a2.note_id left join
  duoshouji.user u on c.user_id = u.id
