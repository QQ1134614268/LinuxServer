drop database if exists blog_d;
create database blog_d;
use blog_d;
drop table if exists student_t;
CREATE TABLE student_t(
id  int ,
student_name varchar(20)
);
insert INTO  student_t ( id, student_name ) VALUES ( 1, "张"),(2,"李");
select * from student_t;
