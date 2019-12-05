create database test_mysql60;

create table degree(
	# id bigint not null auto_increment,
	id bigint not null auto_increment,
	description varchar(255) not null,
	no varchar(255) not null,
	remarks varchar(255),
	primary key(id)
);

insert into degree(description,no,remarks) values ('博士','01','酷');
insert into degree(description,no,remarks) values ('硕士','02','酷+1');
insert into degree(description,no,remarks) values ('学士','03','还行吧');
insert into degree(description,no,remarks) values ('幼儿园','04','幼儿园荣誉毕业');

create table school(
	id bigint not null auto_increment,
	description varchar(255) not null,
	no varchar(255) not null,
	remarks varchar(255),
	primary key(id)
);

insert into school(description,no,remarks) values ('宇宙大学','01','哈');
insert into school(description,no,remarks) values ('银河系大学','02','嘿');
insert into school(description,no,remarks) values ('太阳系大学','03','咧');
insert into school(description,no,remarks) values ('铁岭疙瘩大学','04','名扬四海');

create table department(
	id bigint not null auto_increment,
	description varchar(255) not null,
	no varchar(255) not null,
	remarks varchar(255),
	school_id bigint not null,
	foreign key(school_id) references school(id),
	primary key(id)
);

insert into department(description,no,remarks,school_id) values ('信息管理','0201','不当网管',1);
insert into department(description,no,remarks,school_id) values ('土地资源管理','0202','做不了地主',1);
insert into department(description,no,remarks,school_id) values ('房地产开发与管理','0203','也不做包租公',2);

create table graduateprojectcategory(
	# id bigint not null auto_increment,
	id bigint not null auto_increment,
	description varchar(255) not null,
	no varchar(255) not null,
	remarks varchar(255),
	primary key(id)
);

-- insert into graduateprojectcategory(description,no,remarks) values ('博士','01','酷');
-- insert into graduateprojectcategory(description,no,remarks) values ('硕士','02','酷+1');
-- insert into graduateprojectcategory(description,no,remarks) values ('学士','03','还行吧');
-- insert into graduateprojectcategory(description,no,remarks) values ('幼儿园','04','幼儿园荣誉毕业');


create table graduateprojectstatus(
	# id bigint not null auto_increment,
	id bigint not null auto_increment,
	description varchar(255) not null,
	no varchar(255) not null,
	remarks varchar(255),
	primary key(id)
);

-- insert into graduateprojectstatus(description,no,remarks) values ('博士','01','酷');
-- insert into graduateprojectstatus(description,no,remarks) values ('硕士','02','酷+1');
-- insert into graduateprojectstatus(description,no,remarks) values ('学士','03','还行吧');
-- insert into graduateprojectstatus(description,no,remarks) values ('幼儿园','04','幼儿园荣誉毕业');


create table graduateprojecttype(
	# id bigint not null auto_increment,
	id bigint not null auto_increment,
	description varchar(255) not null,
	no varchar(255) not null,
	remarks varchar(255),
	primary key(id)
);

-- insert into graduateprojecttype(description,no,remarks) values ('博士','01','酷');
-- insert into graduateprojecttype(description,no,remarks) values ('硕士','02','酷+1');
-- insert into graduateprojecttype(description,no,remarks) values ('学士','03','还行吧');
-- insert into graduateprojecttype(description,no,remarks) values ('幼儿园','04','幼儿园荣誉毕业');


create table graduateproject(
	id bigint not null auto_increment,
	title varchar(255) not null,
	graduateProjectCategory_id bigint not null,
	graduateProjectType_id bigint not null,
	graduateProjectStatus_id bigint not null,
	foreign key(graduateProjectCategory_id) references GraduateProjectCategory(id),
	foreign key(graduateProjectType_id) references GraduateProjectType(id),
	foreign key(graduateProjectStatus_id) references GraduateProjectStatus(id),
	primary key(id)
);

-- insert into graduateproject(description,no,remarks) values ('博士','01','酷');
-- insert into graduateproject(description,no,remarks) values ('硕士','02','酷+1');
-- insert into graduateproject(description,no,remarks) values ('学士','03','还行吧');
-- insert into graduateproject(description,no,remarks) values ('幼儿园','04','幼儿园荣誉毕业');


create table ProfTitle(
	id bigint not null auto_increment,
	description varchar(255) not null,
	no varchar(255) not null,
	remarks varchar(255),
	primary key(id)
);

insert into degree(description,no,remarks) values ('教授','01','酷');
-- insert into degree(description,no,remarks) values ('硕士','02','酷+1');
-- insert into degree(description,no,remarks) values ('学士','03','还行吧');
-- insert into degree(description,no,remarks) values ('幼儿园','04','幼儿园荣誉毕业');


create table Teacher(
	id bigint not null auto_increment,
	no varchar(255) not null,
	name varchar(255) not null,
	profTitle_id bigint,
	degree_id bigint not null,
	department_id bigint not null,
	foreign key(profTitle_id) references ProfTitle(id),
	foreign key(degree_id) references degree(id),
	foreign key(department_id) references department(id),
	primary key(id)
);

create table user(
	id bigint not null auto_increment,
	username varchar(255) not null unique,
	password varchar(255) not null,
	loginTime date not null,
	teacher_id bigint not null,
	foreign key(teacher_id) references teacher(id),
	primary key(id)
);


-- delimiter //
-- drop procedure if exists sp_addDepartment//
-- create procedure sp_addDepartment(
-- 	in description varchar(255),
-- 	no varchar(255),
-- 	remarks varchar(255),
-- 	school_id int,
-- 	out id int
-- )
-- begin 
-- 	insert into department(description,no,remarks,school_id)
-- 	values(description,no,remarks,school_id);
-- 	select last_insert_id() into id;
-- end//
-- delimiter ;


-- call sp_addDepartment("信息管理","0202","best",1,@id);

-- # ---------------------------------------------------

-- drop table School;

-- create table School(
-- 	id bigint not null auto_increment,
-- 	description varchar(255) not null,
-- 	no varchar(255) not null,
-- 	remarks varchar(255),
-- 	primary key(id) 
-- );



-- delimiter //
-- drop procedure if exists sp_addSchool//
-- create procedure sp_addSchool(
-- 	in description varchar(255),
-- 	no varchar(255),
-- 	remarks varchar(255),
-- 	out id int
-- )
-- begin 
-- 	insert into School(description,no,remarks)
-- 	values(description,no,remarks);
-- 	select last_insert_id() into id;
-- end//
-- delimiter ;

-- call sp_addDepartment("管理工程学院","02","best",2,@id);

-- show procedure status like 'sp_addS%' \G;
-- # ---------------------------------------------------

-- create table ProfTitle(
-- 	id bigint not null auto_increment,
-- 	description varchar(255) not null,
-- 	no varchar(255) not null,
-- 	remarks varchar(255),
-- 	primary key(id)
-- );

-- -- GraduateProject

-- -- GraduateProjectCategory
-- -- GraduateProjectType
-- -- GraduateProjectStatus


-- create table GraduateProjectStatus(
-- 	id bigint not null auto_increment,
-- 	description varchar(255) not null,
-- 	no varchar(255) not null,
-- 	remarks varchar(255),
-- 	primary key(id)
-- );

-- create table GraduateProject(
-- 	id bigint not null auto_increment,
-- 	title varchar(255) not null,
-- 	graduateProjectCategory_id bigint not null,
-- 	graduateProjectType_id bigint not null,
-- 	graduateProjectStatus_id bigint not null,
-- 	foreign key(graduateProjectCategory_id) references GraduateProjectCategory(id),
-- 	foreign key(graduateProjectType_id) references GraduateProjectType(id),
-- 	foreign key(graduateProjectStatus_id) references GraduateProjectStatus(id),
-- 	primary key(id)
-- );

-- alter table GraduateProjectStatus add constraint unique(no);

-- ALTER TABLE score1 ADD CONSTRAINT fk_sid FOREIGN KEY(sid) REFERENCES stu(sid)
-- 	--set...
-- create table Teacher(
-- 	id bigint not null auto_increment,
-- 	name varchar(255) not null,
-- 	profTitle_id bigint,
-- 	degree_id bigint not null,
-- 	department_id bigint not null,
-- 	primary key(id)
-- );
-- --GraduateProject(id)
-- create table TestNothing(
-- 	id bigint not null auto_increment,
-- 	projects_id in select id from GraduateProject,
-- 	primary key(id)
-- );


-- alter table department add column id bigint not null auto_increment primary key;  
-- ALTER  TABLE  department  DROP  PRIMARY  KEY;