USE LCPFavThingsDB;

CREATE TABLE IF NOT EXISTS "Games" (
    "GameID" INTEGER NOT NULL CONSTRAINT "PK_Games" PRIMARY KEY AUTOINCREMENT,
    "Title" TEXT NOT NULL,
    "DescT" TEXT NOT NULL,
    "Genre" TEXT NOT NULL,
    "Category" TEXT NOT NULL,
    "Cover" TEXT NOT NULL,
    "Company" TEXT NOT NULL,
    "Publisher" TEXT NOT NULL,
    "LangT" TEXT NOT NULL,
    "DateRelease" TEXT NOT NULL,
    "Rating" decimal(2, 1) NOT NULL
);

CREATE TABLE IF NOT EXISTS "Movies" (
    "MovieID" INTEGER NOT NULL CONSTRAINT "PK_Movies" PRIMARY KEY AUTOINCREMENT,
    "Title" TEXT NOT NULL,
    "DescT" TEXT NOT NULL,
    "Genre" TEXT NOT NULL,
    "Category" TEXT NOT NULL,
    "Cover" TEXT NOT NULL,
    "Company" TEXT NOT NULL,
    "LangT" TEXT NOT NULL,
    "Duration" int NOT NULL,
    "Rating" decimal(2, 1) NOT NULL
);

CREATE TABLE IF NOT EXISTS "TVSeries" (
    "TVSerieID" INTEGER NOT NULL CONSTRAINT "PK_TVSeries" PRIMARY KEY AUTOINCREMENT,
    "Title" TEXT NOT NULL,
    "DescT" TEXT NOT NULL,
    "Genre" TEXT NOT NULL,
    "Category" TEXT NOT NULL,
    "Cover" TEXT NOT NULL,
    "Company" TEXT NOT NULL,
    "LangT" TEXT NOT NULL,
    "TotalSeasons" int NOT NULL,
    "Duration" int NOT NULL,
    "Rating" decimal(2, 1) NOT NULL
);

CREATE TABLE IF NOT EXISTS "Users" (
    "UserID" INTEGER NOT NULL CONSTRAINT "PK_Users" PRIMARY KEY AUTOINCREMENT,
    "Username" TEXT NOT NULL,
    "PasswordT" TEXT NOT NULL,
    "Email" TEXT NULL,
    "Pin" int NULL,
    "FirstName" TEXT NULL,
    "LastName" TEXT NULL,
    "DateBirthday" datetime NULL,
    "Avatar" TEXT NULL,
    "Cover" TEXT NULL,
    "About" TEXT NULL,
    "DateAccountCreated" datetime NULL,
    "RoleT" INTEGER NULL
);

DELETE FROM Games;
DELETE FROM Movies;
DELETE FROM TVSeries;
DELETE FROM Users;

INSERT INTO Games (GameID, Title, DescT, Genre, Category, Cover, Company, Publisher, LangT, DateRelease, Rating) 
VALUES (1, 'GTA IV', 'Grand Theft Auto IV (2008)', 'Action,Adventure', 'Games', 'gtaiv.jpg', 'Rockstar North', 'Rockstar Games', 'English', '2008-04-29T00:00:00', CAST(8.0 AS Decimal(2, 1)));

INSERT INTO Movies (MovieID, Title, DescT, Genre, Category, Cover, Company, LangT, Duration, Rating) 
VALUES (1, 'The Fate of the Furious (FF8)', 'Fast and Furious 8 (2017)', 'Action,Adventure', 'Movies', 'ff8.jpg', 'Universal Pictures', 'English', 136, CAST(8.3 AS Decimal(2, 1)));

INSERT INTO TVSeries (TVSerieID, Title, DescT, Genre, Category, Cover, Company, LangT, TotalSeasons, Duration, Rating) 
VALUES (1, 'Fear of The Walking Dead', 'Fear of The Walking Dead (2015)', 'Action,Adventure', 'TV Series', 'ftwd.jpg', 'Fox,AMC', 'English,Spanish', 8, 45, CAST(9.0 AS Decimal(2, 1)));

INSERT INTO TVSeries (TVSerieID, Title, DescT, Genre, Category, Cover, Company, LangT, TotalSeasons, Duration, Rating) 
VALUES (2, 'The Flash', 'The Flash (2014)', 'Action,Adventure', 'TV Series', 'theflash.jpg', 'CW', 'English', 8, 45, CAST(9.5 AS Decimal(2, 1)));

INSERT INTO Users (UserID, Username, PasswordT, Email, Pin, FirstName, LastName, DateBirthday, Avatar, Cover, About, DateAccountCreated, RoleT) 
VALUES (1, 'guest', 'guest1234', 'guest@localhost.loc', '1234', 'Guest', 'Convidado', '1994-01-01', 'guest.jpg', 'c_guest.jpg', 'Guest is cool guy!', '2022-06-30 16:37:00', 1);

INSERT INTO Users (UserID, Username, PasswordT, Email, Pin, FirstName, LastName, DateBirthday, Avatar, Cover, About, DateAccountCreated, RoleT) 
VALUES (2, 'admin', 'admin1234', 'admin@localhost.loc', '1234', 'Admin', 'Admin', '1996-06-04', 'theflash.jpg', 'theflash.jpg', 'Admin is cool guy!', '2022-07-08 15:26:00', 3);
