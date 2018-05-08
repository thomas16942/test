DROP TABLE board PURGE;

CREATE TABLE board(
  num     NUMBER(7)      NOT NULL,  -- 글 일련 번호, -9999999 ~ +9999999 
  name    VARCHAR(20)    NOT NULL,  -- 닉네임/아이디
  title    VARCHAR(100)  NOT NULL,  -- 제목(*) 
  title2   VARCHAR(100)  NOT NULL,  -- 목록에 비쳐주는 소제목
  content  VARCHAR(4000) NOT NULL,  -- 글 내용 
  tag      VARCHAR(100)  NOT NULL,  -- 방문국가,이용한 항공사의 국적마크
  date2    VARCHAR(100)  NOT NULL,
  passwd  VARCHAR(15)    NOT NULL,  -- 비밀 번호 // 구연만 해놓자.
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, 기본값 사용 //히든.
  wdate   DATE          NOT NULL,  -- 등록 날짜, sysdate 
  fname    VARCHAR(50)  DEFAULT 'member.jpg',  -- 회원 사진
  grpno   NUMBER(7)     DEFAULT 0, -- 부모글 번호 
  indent  NUMBER(2)     DEFAULT 0, -- 답변여부,답변의 깊이
  ansnum  NUMBER(5)     DEFAULT 0, -- 답변 순서 
  PRIMARY KEY (num)  
);                      

alter table board
add(fname varchar default 'member.jpg');

alter table board
add(refnum number default 0);

select * from board;

delete from board
where indent > 0;

select count(refnum)  from board
where refnum = 1


--레코드 갯수 확인 
select count(*) from board;
where name like '%왕%'

--create

SELECT NVL(MAX(num), 0)+1 as max FROM board;
INSERT INTO board( num, name, title, title2, content, tag, date2, passwd, wdate,fname, grpno)
VALUES((SELECT NVL(MAX(num), 0)+1 as num FROM board),
'tommy','Im goitng to TAIPEI','with you','너무 신난다','Taiwan','2018.03.09-03.12','1234',sysdate, 'man.jpg',
(select nvl(max(grpno),0)+1 from board)
);

delete from board
where indent>0

--조회수 증가
UPDATE board
SET viewcnt = viewcnt +1
WHERE num =1;

--read(select 하나의 레코드) 
select *from board
where num= 1;
select * from board;

--비번 검증 count는 bbsno가 몇개 있는지 찾음. cnt의 이름을 바꿔줌 
SELECT COUNT(num) as cnt
FROM board
WHERE num = 1 AND passwd='1234';

--list 

SELECT  num, name, title, title2, content, tag, date2, passwd, viewcnt, wdate, grpno, indent, ansnum, r	
from(
	SELECT  num, name, title, title2, content, tag, date2, passwd, viewcnt, wdate, grpno, indent, ansnum, rownum r
	from(
		SELECT  num, name, title, title2, content, tag, date2, passwd, viewcnt, wdate, grpno, indent, ansnum
			FROM board  
					--검색(if)
					ORDER BY grpno DESC, ansnum 
)
)
where r >= 5 and r <= 10


