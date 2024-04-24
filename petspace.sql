
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

insert into animal (nome, raca, idade, peso, sexo) values 
('Tico', 'Pinscher', 16, 6.78, 'Macho'),
('Belinha','Pug',1, 3.5,'Fêmea'),
('johnny', 'SRD (Sem Raça Definida)', 7, 11, 'Macho'),
('Brutus','Bulldog',5,8,'Macho'),
('Meg', 'Shih Tzu', 3, 4, 'Fêmea'),
('Nova York','Yorkshire',3,3.9,'Fêmea'),
('Maylow', 'Border Collie', 5, 12.8, 'Macho'),
('Lulu','Spitz Alemão',3,3.2,'Fêmea'),
('Bilu', 'Golden Retriever', 16, 23.68, 'Macho');
