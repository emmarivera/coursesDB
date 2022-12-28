CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int8 NOT NULL,
  "role_id" int
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text,
  "teacher" varchar NOT NULL,
  "user_id" uuid,
  "level_id" int
);

CREATE TABLE "users_courses" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid,
  "course_id" uuid
);

CREATE TABLE "video_courses" (
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

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "video_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

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

