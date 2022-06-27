# book-store

drop table member;
create table member(
member_id varchar2(20) primary key check(regexp_like(member_id, '^[a-z][a-z0-9]{7,19}$')),
member_pw varchar2(16) not null 
check(regexp_like(member_pw, '[a-z]+') and regexp_like(member_pw, '[A-Z]+')
			and regexp_like(member_pw, '[0-9]+') and regexp_like(member_pw, '[!@#$]+')),
member_nick varchar2(30) not null unique check(regexp_like(member_nick, '^[ㄱ-ㅎ가-힣0-9]{1,10}$')),
member_phone char(11) not null check(regexp_like(member_phone, '^010[1-9][0-9]{7}$')),
member_email varchar2(100),
member_birth char(10) not null,
member_post varchar2(6),
member_basic_address varchar2(300),
member_detail_address varchar2(300),
member_point number default 0 not null check(member_point >= 0),
member_grade varchar2(15) default '일반회원' not null check(member_grade in ('일반회원', '도서관리자', '관리자')),
member_joindate date default sysdate not null,
member_logindate date
);


//도서 테이블(book)
create table book(
book_no number primary key,
book_title varchar2(150),
book_isbn number,
book_image varchar2(150),
book_auth varchar2(100),
book_publ varchar2(100),
book_pub date,
book_description varchar2(150),
book_type number
);
