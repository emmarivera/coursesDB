CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int8,
  "role_id" int
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text,
  "teacher_id" uuid NOT NULL,
  "level_id" int
);

CREATE TABLE "users_courses" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid,
  "course_id" uuid
);

CREATE TABLE "course_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "video_url" varchar NOT NULL,
  "course_id" uuid
);

CREATE TABLE "levels" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "course_categories" (
  "id" uuid PRIMARY KEY,
  "category_id" int,
  "course_id" uuid
);

CREATE TABLE "teachers" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar DEFAULT 'student'
);

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "teachers" ("id");

insert into roles( 
	name
) values (
	'teacher'
), ( 
	'student'
), ( 
	'admin'
);

select * from roles;


insert into categories( 
	name
) values (
	'Fundaments'
), ( 
	' FrontEnd Development'
), ( 
	'Backend Development'
);

select * from categories;


insert into levels( 
	name
) values (
	'Begginer'
), ( 
	'Intermediate'
), ( 
	'Advanced'
);

select * from levels;


insert into teachers( 
	id,
	name
) values (
	'87d0e2c6-eabe-4890-a453-bd2ed3cebbe8',
	'Benjamin'
), ( 
	'258f8403-8a4e-4f11-a4ed-919533df9533',
	'Sahid'
);

select * from teachers;


insert into courses( 
	id,
	title,
	description,
	teacher_id,
	level_id
) values (
	'1e30edc4-7383-427f-a50c-3ecc1578568f',
	'Introduction to JavaScript',
	'learn the basics of javascript',
	'87d0e2c6-eabe-4890-a453-bd2ed3cebbe8',
	1
),  ( 
	'bdf3a201-2f0c-43df-9d1b-c85ada02d457',
	'Nodejs',
	'from zero to hero',
	'258f8403-8a4e-4f11-a4ed-919533df9533',
	3
);

select * from courses;


insert into users(
	id,
	first_name,
	last_name,
	email,
	"password", 
	age,
	role_id
) values(  
	'4639198d-fea7-4d34-96b3-03b8564aa7ed',
	'Cinthya',
	'Ramirez',
	'cinthya2@example.com',
	'root',
	28,
	1
), (
	'06b86663-3f40-47bd-9707-2d9c040aab6c',
	'Alberto',
	'Martinez',
	'albert2@example.com',
	'root',
	50,
	2
);

select * from users;


insert into course_videos(
	id,
	title,
	video_url,
	course_id 
) values ( 
	'fb5fbb9f-aeb2-4fba-8228-64c29dc94b96',
	'Data types in  javascript',
	'https://www.academlo.com/datatypejs',
	'1e30edc4-7383-427f-a50c-3ecc1578568f'
), (
	'33c63c06-233f-421c-a839-61618c5bd1b0',
	'SQL commands',
	'https://www.academlo.com/sqlcommands',
	'bdf3a201-2f0c-43df-9d1b-c85ada02d457'
);

select * from course_videos;



insert into course_categories(
	id,
	category_id,
	course_id
) values (
	'806494bf-5802-47d3-8818-19ed3ba77e84',
	1,
	'1e30edc4-7383-427f-a50c-3ecc1578568f'
), (
	'fc88dee1-5254-4e06-b33c-569c3f61de9e',
	3,
	'bdf3a201-2f0c-43df-9d1b-c85ada02d457'
);

select * from course_categories;


insert into users_courses (
	id,
	user_id,
	course_id 
) values (
	'd4d7e4d5-0053-4a2c-9979-5f2747b22ce8',
	'4639198d-fea7-4d34-96b3-03b8564aa7ed',
	'1e30edc4-7383-427f-a50c-3ecc1578568f'
), (
	'fc56cafe-a39c-4d89-bab7-fd07b6ddb02c',
	'4639198d-fea7-4d34-96b3-03b8564aa7ed',
	'bdf3a201-2f0c-43df-9d1b-c85ada02d457'
);

select * from users_courses;

select * from users as u inner join roles as r on u.role_id = r.id;

select * from courses inner join levels on courses.level_id = levels.id;

