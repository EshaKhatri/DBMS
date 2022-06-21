create database esha046;
use esha046;
CREATE TABLE person (
    driver_id VARCHAR(30),
    name1 VARCHAR(30),
    address VARCHAR(100),
    primary key(driver_id)
);
CREATE TABLE car (
    regno VARCHAR(20),
    model VARCHAR(20),
    year1 INT,
    PRIMARY KEY (regno)
);
CREATE TABLE accident (
    report_number INT,
    date1 DATE,
    location VARCHAR(100),
    PRIMARY KEY (report_number)
);
CREATE TABLE owns (
    driver_id VARCHAR(30),
    regno VARCHAR(20),
    PRIMARY KEY (driver_id , regno),
    FOREIGN KEY (driver_id)
        REFERENCES person (driver_id),
    FOREIGN KEY (regno)
        REFERENCES car (regno)
);
CREATE TABLE participated (
    driver_id VARCHAR(30),
    regno VARCHAR(20),
    report_no INT,
    damage_amount INT,
    FOREIGN KEY (driver_id)
        REFERENCES person (driver_id),
    FOREIGN KEY (regno)
        REFERENCES car (regno)
);

insert into person
values('A01','Richard','Srinivas nagar'),
('A02','Pradeep','Rajajinagar'),
('A03','Smith','Ashokanagar'),
('A04','Venu','N.R.Colony'),
('A05','John','Hanumanth Nagar');
commit;
select * from person;

insert into car
values('KA052250','Indica',1990),
('KA031181','Lancer',1957),
('KA095477','Toyota',1998),
('KA053408','Honda',2008),
('KA041702','Audi',2005);
commit;
select * from car;

insert into accident
values(11,'01-01-03','Mysore Road'),
(12,'02-02-04','Southend Circle'),
(13,'21-01-03','Bulltemple Road'),
(14,'17-02-08','Mysore Road'),
(15,'04-03-05','Kanakpura Road');
commit;
select * from accident;

insert into owns
values('A01','KA052250'),
('A02','KA053408'),
('A03','KA031181'),
('A04','KA095477'),
('A05','KA041702');
commit;
select * from owns;

insert into participated 
values('A01','KA052250',11,10000),
('A02','KA053408',12,50000),
('A03','KA095477',13,25000),
('A04','KA031181',14,3000),
('A05','KA041702',15,4000);
commit;
select * from participated;

UPDATE participated 
SET damage_amount = 25000
WHERE regno = 'KA053408' AND report_no = 12;
commit;
select * from participated;

insert into accident values(16,'15-03-08','Dolmur');
select * from accident;

select count(distinct driver_id) CNT from participated a, accident b where
a.report_no=b.REPORT_NUMBER and b.date1 like '%04';

select COUNT(report_no)CNT from car c, participated p where c.REGNO=p.regno and model='Lancer';

