create database esha046_02;
use esha046_02;

create table branch(
branchname varchar(30),
branchcity varchar(30),
assests real,
primary key(branchname)
);

create table bankaccount(
accno int,
branchname varchar(30),
balance real,
primary key(accno),
foreign key (branchname) references branch(branchname)
);

create table depositer(
customername varchar(30),
accno int,
foreign key (accno) references bankaccount(accno),
foreign key (customername) references bankcustomer(customername),
primary key(customername,accno)
);

create table bankcustomer(
customername varchar(30),
customerstreet varchar(30),
customercity varchar(30),
foreign key (customername) references depositer(customername),
primary key(customername)
);

create table loan(
loannumber int,
branchname varchar(30),
amount real,
foreign key(branchname) references branch (branchname),
primary key (loannumber)
);

insert into branch values('SBI_Chamrajpet','Bangalore',50000)
,('SBI_ResidencyRoad','Bangalore',10000)
,('SBI_ShivajiRoad','Bombay',20000)
,('SBI_ParliamentRoad','Delhi',10000)
,('SBI_Jantarmantar','Delhi',20000);

select * from branch;

insert into bankaccount values
(1,'SBI_Chamrajpet',2000),
(2,'SBI_ResidencyRoad',5000),
(3,'SBI_ShivajiRoad',6000),
(4,'SBI_ParliamentRoad',9000),
(5,'SBI_Jantarmantar',8000),
(6,'SBI_ShivajiRoad',4000),
(8,'SBI_ResidencyRoad',4000),
(9,'SBI_ParliamentRoad',3000),
(10,'SBI_ResidencyRoad',5000),
(11,'SBI_Jantarmantar',2000);

select * from bankaccount;

drop table bankcustomer;
drop table depositer;

create table bankcustomer(
customername varchar(30),
customerstreet varchar(30),
customercity varchar(30),
primary key(customername)
);

create table depositer(
customername varchar(30),
accno int,
foreign key (accno) references bankaccount(accno),
foreign key (customername) references bankcustomer(customername),
primary key(customername,accno)
);

insert into bankcustomer values
('Avinash','Bull_temple_road','Bangalore'),
('Dinesh','Bannergatta_road','Bangalore'),
('mohan','Nationalcollege_road','Bangalore'),
('Nikhil','Akbar_road','Delhi'),
('Ravi','Prithviraj_road','Delhi');

select * from bankcustomer;

insert into depositer values
('Avinash',1),
('Dinesh',2),
('Nikhil',4),
('Ravi',5),
('Avinash',8),
('Nikhil',9),
('Dinesh',10),
('Nikhil',11);

select * from depositer;

insert into loan values
(1,'SBI_Chamrajpet',1000),
(2,'SBI_ResidencyRoad',2000),
(3,'SBI_ShivajiRoad',3000),
(4,'SBI_ParliamentRoad',4000),
(5,'SBI_Jantarmantar',5000);
select * from loan;



