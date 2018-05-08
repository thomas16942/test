select*from memo;
DROP TABLE memo; 

CREATE  TABLE memo(
memono  NUMBER(6)      NOT NULL,
title   VARCHAR(100)   NOT NULL,
content VARCHAR(4000) NOT NULL,
wdate   DATE          NOT NULL,
viewcnt NUMBER(5)     DEFAULT 0,
PRIMARY KEY(memono)
);

alter table memo
add(grpno   number default 0,
    indent  number default 0,
    ansnum  number default 0
    
);

alter table memo
add(refnum number default 0);

delete from memo
where indent > 0 ;

select * from memo;




DROP SEQUENCE memo_seq;

CREATE SEQUENCE memo_seq
START WITH 1
INCREMENT BY 1
MINVALUE 0
CACHE 100;

SELECT memo_seq.nextval FROM dual;

--sysdate 현재 날짜와 시간
INSERT INTO memo(memono, title, content, wdate) 
VALUES(memo_seq.nextval, '오늘의 메모', '이번주 토익 시험 준비', sysdate); 

delete from memo;
--답변 추가시 create
INSERT INTO memo(memono, title, content, wdate,grpno) 
VALUES(memo_seq.nextval, '오늘의 점심약속', '프로젝트 관련', sysdate,
(select nvl(max(grpno),0)+1 from memo)
); 

-- 답변 read(memono, grpno, indent, ansnum, title)

select memono, grpno, indent, ansnum, title
from memo
where memono =801;


-- 답변 ansnum 증가 (grpno=2 and ansnum > 0 )
update MEMO
set ansnum = ansnum + 1
where grpno=2 
and ansnum > 0 

--DESC 내림차순 // 안쓰면 ASC 오름차순

-- 답변 create
INSERT INTO memo(memono, title, content, wdate, grpno, indent, ansnum)
VALUES(memo_seq.nextval, '읽을도서','가메출판사 오라클 11g',sysdate,
2,1,1
);



--select list 자주 읽는 메모 먼저 출력

select*from memo;
select memono, title, wdate, viewcnt,grpno, indent, ansnum, r
from(
	select memono, title, wdate, viewcnt,grpno, indent, ansnum, rownum r
	from(
		select memono, title, wdate, viewcnt,grpno, indent, ansnum
		from memo
		order by grpno desc, ansnum
)
)
where r>=1 and r<=5


INSERT INTO memo(memono, title, content, wdate)
VALUES(memo_seq.nextval, '읽을도서','가메출판사 오라클 11g',sysdate);


 
INSERT INTO memo(memono, title, content, wdate) 
VALUES(memo_seq.nextval, '수업 복습', '메모 제작', sysdate); 
 
INSERT INTO memo 
VALUES(memo_seq.nextval, '도서구입', 'JSP Web Programming', sysdate, 0); 


delete from memo;
SELECT *from memo where memono=2;
select*from memo;
----------------------------------------------------------

DROP TABLE news;

CREATE TABLE new(
 newsno INT NOT NULL,
 title VARCHAR(100) NOT NULL,
 media VARCHAR(50) NOT NULL,
 author VARCHAR(30)  NOT NULL,
 rdate  DATE         NOT NULL,
 PRIMARY KEY(newsno)
);


INSERT INTO news(newsno, title, media, author, rdate)
VALUES(1, 'MS, 2016년 구형 IE 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);
 
SELECT newsno, title, media, author, rdate FROM news;

select*from memo;
deleter

