create table board (
idx number not null primary key,
title varchar2(100) not null,
userid varchar2(50) not null,
memo varchar2(300) not null,
post_date date default sysdate
);

  select idx, title, userid, memo 
  ,to_char(post_date,'yyyy-mm-dd hh24:mi:ss') post_date
   from board
   order by idx desc;
   
 <insert id="insertboard" parameterType="board.dto.BoardDTO">
   insert into board ( idx, title, userid, memo ) values 
   ( (select nvl( max(idx)+1, 1) from board), #{title}, #{userid}, #{memo})

commit;