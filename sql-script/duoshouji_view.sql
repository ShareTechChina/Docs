
drop view if exists duoshouji.v_user;

create view duoshouji.v_user as
select c.mobile, c.user_name, c.password, c.avatar_url, c.avatar_width, c.avatar_height, c.gender,
  a.balance, a.note_number, a.order_number, a.follow_number, a.followed_number
from duoshouji.user c, duoshouji.user_extend a
where c.mobile = a.user_id
;



drop view if exists duoshouji.v_square_notes;

create view duoshouji.v_square_notes as
select c.id, c.content, c.title, c.rating owner_rating, a1.rank comment_rating, c.main_image_url, c.main_image_width, c.main_image_height, c.create_time, a2.comment_number, a2.like_number, a2.order_number,
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
  (select note_id, sum(value) rank from duoshouji.rating group by note_id) a1 on c.id = a1.note_id left join
  duoshouji.note_extend a2 on c.id = a2.note_id left join
  duoshouji.user u on c.user_id = u.mobile
