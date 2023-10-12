
drop database dogspace;
create database dogspace;
use dogspace;

create table animal(
id int not null auto_increment primary key,
nome varchar(40) not null,
raca varchar(40) not null,
idade int not null,
peso double not null,
sexo varchar(5) not null
);

