-- Active: 1683856497522@@127.0.0.1@3306@dbestacionamento

drop database dbestacionamento;


create database dbestacionamento;

use dbestacionamento;

create table tbClientes(
codCli int auto_increment,
nomeCli varchar(50) not null,
telefoneCli varchar(20),
emailCli varchar(50) not null unique,
primary key (codCli));

create table tbVeiculos(
codVeic int not null auto_increment,
modeloVeic varchar(50)not null,
placaVeic varchar(8) not null unique,
catVeic varchar(1) not null,
corVeic varchar(15)not null,
primary key (codVeic));

create table tbFuncionarios(
codFunc int not null auto_increment,
nomeFunc varchar(50) not null,
emailFunc varchar(256) not null unique,
senhaFunc varchar(30) not null unique,
primary key (codFunc));

create table tbVagas(
codVag int not null auto_increment,
Vagas varchar(3) not null,
statusVag varchar (10) default 'Disponível' check(statusVag in('Disponível','Ocupado')),
primary key (codVag));

create table tbCupons(
codCup int not null auto_increment,
codCli int not null,
codVeic int not null,
codFunc int not null,
codVag int not null,
dataEntrada datetime,
dataSaida datetime,
periodoEstimado time,
periodoTotal time,
valorEstimado decimal (9,2),
Foreign Key (codCli) REFERENCES tbClientes (codCli),
Foreign Key (codVeic) REFERENCES tbVeiculos (codVeic),
Foreign Key (codFunc) REFERENCES tbFuncionarios (codFunc),
Foreign Key (codVag) REFERENCES tbVagas (codVag),
primary key (codCup)
);

desc tbveiculos;

insert into tbfuncionarios(nomeFunc,emailFunc,senhaFunc) values ('Felipe','felipe.gomessan@gmail.com','Felps12222');

insert into tbclientes(nomeCli,telefoneCli,emailCli) values ('agnaldo','94680-4218','agnaldo.012@gmail.com');

insert into tbveiculos(modeloVeic,placaVeic,catVeic,corVeic) values ('Volkswagen Polo','CMG-3164','B','Vermelho');

insert into tbVagas(Vagas) values ('A1');

select * from tbClientes;

select * from tbCupons;

desc tbCupons;