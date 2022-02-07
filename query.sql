drop table St_Member cascade constraints;
drop table feed cascade constraints;
drop table feed_comment cascade constraints;
drop table feed_cocomment cascade constraints;
drop table feed_like cascade constraints;


create table St_Member(
	id varchar2(20),
	pw varchar2(15) not null,
constraint stmember_id_pk primary key (id)
);

CREATE table feed(
	feedno INT not null,
	id VARCHAR2(20) not null,
	content VARCHAR2(2000),
	tag VARCHAR2(245) not null,
	constraint feed_feedno_pk primary key(feedno),
	constraint feed_id_fk foreign key(id) references St_member(id)
);


CREATE table feed_comment(
	fcno INT not null,
	feedno INT not null,
	id VARCHAR2(20) not null,
	content VARCHAR2(500) not null,
	constraint feed_comment_fcno_pk primary key(fcno),
	constraint feed_comment_feedno_fk foreign key(feedno) references feed(feedno),
	constraint feed_comment_id_fk foreign key(id) references St_member(id)
);

CREATE table feed_cocomment(
	cono INT not null,
	fcno INT not null,
	id VARCHAR2(20) not null,
	content VARCHAR2(500) not null,
	constraint fcomment_cono_pk primary key(cono),
	constraint fcomment_fcno_fk foreign key(fcno) references feed_comment(fcno),
	constraint fcomment_id_fk foreign key(id) references St_member(id)
);

CREATE table feed_like(
	feedno INT not null,
	id VARCHAR2(20) not null,
	constraint feed_like_pk primary key(feedno, id),
	constraint feed_like_feedno_fk foreign key(feedno) references feed(feedno),
	constraint feed_like_id_fk foreign key(id) references st_member(id)
);
	

-- sample data °¢ 1 °³¾¿

insert into st_member values('1','1');
insert into feed values(1,'1','11111','#11111');
insert into feed_comment values(1,'1','1','2!');
insert into feed_cocomment values(1, 1, '1', '3!');
insert into feed_like values(1,'1');

delete from feed_like where id ='2';
select * from feed_like;
select * from FEED_COMMENT;
select * from FEED_coCOMMENT;
