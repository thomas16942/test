CREATE TABLE member ( 
    id       VARCHAR(10)  NOT NULL, -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼  
    passwd   VARCHAR(20)  NOT NULL, -- 패스워드, 영숫자 조합 
    mname    VARCHAR(20)  NOT NULL, -- 성명, 한글 10자 저장 가능 
    tel      VARCHAR(14)      NULL, -- 전화번호 
    email    VARCHAR(50)  NOT NULL UNIQUE, -- 전자우편 주소, 중복 안됨 
    zipcode  VARCHAR(7)       NULL, -- 우편번호, 101-101 
    address1 VARCHAR(150)     NULL, -- 주소 1 
    address2 VARCHAR(50)      NULL, -- 주소 2 
    job      VARCHAR(20)  NOT NULL, -- 직업 
    mdate    DATE         NOT NULL, -- 가입일     
    fname    VARCHAR(50)  DEFAULT 'member.jpg', -- 회원 사진
    grade    CHAR(1)      DEFAULT 'H', -- 일반회원: H, 정지: Y, 손님:Z 
    PRIMARY KEY (id)               -- 한번 등록된 id는 중복 안됨 
); 

DELETE FROM member; 

select*from member;

SELECT COUNT(id) as cnt 
FROM member 
WHERE id = 'user1' AND passwd = '1234';  


--create 
INSERT INTO member(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('user1', '1234', '개발자1', '123-1234', 'email1@mail.com',  
'123-123','인천시', '남동구' ,'A01', sysdate, 'man.jpg', 'H'); 

INSERT INTO member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
VALUES('user2', '1234', '개발자2', '123-4441', 'email2@mail.com',
'123-111', '인천시', '부평구', 'B01', sysdate, 'man.jpg', 'H');

INSERT INTO member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
VALUES('user3', '1234', '개발자3', '123-4441', 'email32@mail.com',
'123-111', '서울시', '용산구', 'C01', sysdate, 'man.jpg', 'H');

SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mdate, fname, grade 
FROM member 
ORDER BY id ASC; --ASC 오름차순 DESC 내림차순

-- 중복 아이디 검사 관련 SQL 
 -- 0: 중복 아님, 1: 중복  

SELECT COUNT(id)  
FROM member  
WHERE id='user1'; 

SELECT COUNT(id) as cnt
FROM member
where id='user1';

--이메일 중복 확인
select count(email) as cnt
from member
where email='user1';

--user1 회원의 정보 보기
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mdate, fname, grade 
FROM member 
where id='user1';

 --회원 이미지 수정
 update member
 set fname=''
 where id='user1';
 
 --패스워드 변경
 update member
 set passwd='1234'
 where id='';
 
 --회원정보수정
 update member
 set passwd='test',
     tel = '123-123',
     email = 'email10',
     zipcode = 'test',
     
     address1= '수원',
     address2= '팔당구',
     job = 'test'
 where id = 'user3';
 
 --user 3회원 삭제
 DELETE FROM member where id='user3';
 
 --로그인 관련  sql
 select count(id) as cnt
 from member
 where id = 'user1' and passwd = '1234';     
 
 --list
  select id, mname, tel, email, zipcode, address1, address2, fname, r 
	 FROM(
		 select id, mname, tel, email, zipcode, address1, address2, fname, rownum r
		 FROM(
			 select id, mname, tel, email, zipcode, address1, address2, fname
			 from member
			 where mname like '%홍%'
			 order by mdate DESC 
	          )
	      ) where r >= 1 and r <= 5
	 