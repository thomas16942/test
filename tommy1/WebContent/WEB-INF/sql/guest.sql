DROP TABLE guest PURGE;

CREATE table guest(
	num number not null,
	name varchar(20) not null,
	created date default sysdate,
	content varchar(4000) not null,
	primary key(num)

)
drop table guest

select * from guest

  <!-- Oracle : Sequence 객체 생성 -->

create sequence guestbook_seq increment by 1
start with 1
nocycle;
  
create
SELECT NVL(MAX(id), 0)+1 as max FROM guest;
INSERT INTO guest(id, regidate, name, email, pwd, subject, content)
VALUES((SELECT NVL(MAX(id), 0)+1 as id FROM guest),
sysdate,'11','2132@naver','1231','gfsdgs','12113');

select * from guest;
