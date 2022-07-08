DROP DATABASE IF EXISTS LCPFavThingsDBMySQL;
CREATE DATABASE LCPFavThingsDBMySQL;
DROP USER 'lcpftuser'@'localhost';
CREATE USER 'lcpftuser'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON LCPFavThingsDBMySQL.* TO 'lcpftuser'@'localhost';
FLUSH PRIVILEGES;
USE LCPFavThingsDBMySQL;

CREATE TABLE IF NOT EXISTS Games (
   GameId int not null auto_increment,
   Title varchar(255) null,
   DescT text null,
   Genre varchar(255) null,
   Category varchar(255) null,
   Cover varchar(255) null,
   Company varchar(255) null,
   Publisher varchar(255) null,
   LangT varchar(255) null,
   DateRelease varchar(255) null,
   Rating decimal(2,1) null,
   PRIMARY KEY(GameId)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Movies (
   MovieId int not null auto_increment,
   Title varchar(255) null,
   DescT text null,
   Genre varchar(255) null,
   Category varchar(255) null,
   Cover varchar(255) null,
   Company varchar(255) null,
   LangT varchar(255) null,
   Duration int null,
   Rating decimal(2,1) null,
   PRIMARY KEY(MovieId)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS TVSeries (
   TVSerieId int not null auto_increment,
   Title varchar(255) null,
   DescT text null,
   Genre varchar(255) null,
   Category varchar(255) null,
   Cover varchar(255) null,
   Company varchar(255) null,
   LangT varchar(255) null,
   TotalSeasons int null,
   Duration int null,
   Rating decimal(2,1) null,
   PRIMARY KEY(TVSerieId)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Users (
   UserId int not null auto_increment,
   Username varchar(255) not null,
   PasswordT varchar(255) not null,
   Email varchar(255) null,
   Pin int null,
   FirstName varchar(255) null,
   LastName varchar(255) null,
   DateBirthday datetime null,
   Avatar varchar(255) null,
   Cover varchar(255) null,
   About text null,
   DateAccountCreated datetime null,
   RoleT varchar(255) null,
   PRIMARY KEY(UserId)
) ENGINE=InnoDB;

INSERT Games (Title,DescT,Genre,Category,Cover,Company,Publisher,LangT,DateRelease,Rating) 
VALUES ('GTA IV','Grand Theft Auto IV (2008)','Action,Adventure','Games','gtaiv.jpg','Rockstar North','Rockstar Games','English','2008-04-29T00:00:00',9);

INSERT Movies (Title,DescT,Genre,Category,Cover,Company,LangT,Duration,Rating) 
VALUES ('The Fate of the Furious (FF8)','Fast and Furious 8 (2017)','Action,Adventure','Movies','ff8.jpg','Universal Pictures','English',136,8.3);

INSERT TVSeries (Title,DescT,Genre,Category,Cover,Company,LangT,TotalSeasons,Duration,Rating) 
VALUES ('Fear of The Walking Dead','Fear of The Walking Dead (2015)','Action,Adventure','TV Series','ftwd.jpg','Fox,AMC','English,Spanish',8,45,9), 
	   ('The Flash','The Flash (2014)','Action,Adventure','TV Series','theflash.jpg','CW','English',8,45,9.5);
       
INSERT Users (Username,PasswordT,Email,Pin,FirstName,LastName,DateBirthday,Avatar,Cover,About,DateAccountCreated,RoleT) 
VALUES ('guest','guest1234','guest@localhost.loc',1234,'Guest','Convidado','1994-01-01','guest.jpg','c_guest.jpg','Guest is cool guy!','2022-06-30 16:37:00',1);

INSERT Users (Username,PasswordT,Email,Pin,FirstName,LastName,DateBirthday,Avatar,Cover,About,DateAccountCreated,RoleT) 
VALUES ('admin','admin1234','admin@localhost.loc',1234,'Admin','Admin','1996-06-04','theflash.jpg','theflash.jpg','Admin is cool guy!','2022-07-08 15:26:00',3);
