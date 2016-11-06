
drop view if exists duoshouji.v_user;

create view duoshouji.v_user as
select c.mobile, c.user_name, c.password, c.avatar_url, c.avatar_width, c.avatar_height, c.gender,
  a.balance, a.note_number, a.order_number, a.follow_number, a.followed_number
from duoshouji.user c, duoshouji.user_extend a
where c.mobile = a.user_id
;



drop view if exists duoshouji.v_square_notes;

create view duoshouji.v_square_notes as
select c.note_id, c.content, c.price, c.district_id, c.brand_id, c.category_id, c.title, c.product_name, coalesce(c.rating, 0) owner_rating, coalesce(a2.rating_sum, 0) comment_rating, c.main_image_url, c.main_image_width, c.main_image_height, c.create_time
  , coalesce(a2.comment_number, 0) comment_number, coalesce(a2.like_number, 0) like_number, coalesce(a2.order_number, 0) order_number,
  u.user_id, u.user_name, u.avatar_url, u.avatar_width, u.avatar_height, u.gender
from duoshouji.note c left join
  duoshouji.note_extend a2 on c.note_id = a2.note_id left join
  duoshouji.user u on c.user_id = u.user_id
