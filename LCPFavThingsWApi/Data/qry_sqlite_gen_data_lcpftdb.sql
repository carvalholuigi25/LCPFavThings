/*open "C:\Users\Luis\Documents\Visual Studio 2022\Projects\LCPFTMain\LCPFavThingsWApi\Data\SQLite\lcpfavthingsdb.db";*/

DROP TABLE IF EXISTS "Games";
DROP TABLE IF EXISTS "Movies";
DROP TABLE IF EXISTS "TVSeries";
DROP TABLE IF EXISTS "Token";
DROP TABLE IF EXISTS "UserAuth";
DROP TABLE IF EXISTS "UserToken";
DROP TABLE IF EXISTS "Users";

CREATE TABLE IF NOT EXISTS "Games" (
    "GameId" INTEGER NOT NULL CONSTRAINT "PK_Games" PRIMARY KEY AUTOINCREMENT,
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
    "MovieId" INTEGER NOT NULL CONSTRAINT "PK_Movies" PRIMARY KEY AUTOINCREMENT,
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
    "TVSerieId" INTEGER NOT NULL CONSTRAINT "PK_TVSeries" PRIMARY KEY AUTOINCREMENT,
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
    "UserId" INTEGER NOT NULL CONSTRAINT "PK_Users" PRIMARY KEY AUTOINCREMENT,
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

CREATE TABLE IF NOT EXISTS "UserAuth" (
    "UserAuthId" INTEGER NOT NULL CONSTRAINT "PK_UserAuth" PRIMARY KEY AUTOINCREMENT,
    "Username" TEXT NOT NULL,
    "Password" TEXT NOT NULL,
    "RoleT" INTEGER NULL,
    "UserId" INTEGER NULL,
    "Avatar" TEXT NULL,
    "TokenInfo" TEXT NULL
);

CREATE TABLE IF NOT EXISTS "UserToken" (
    "TokenId" INTEGER NOT NULL CONSTRAINT "PK_UserToken" PRIMARY KEY AUTOINCREMENT,
    "Authenticated" BIT NULL,
    "Created" TEXT NULL,
    "Expiration" TEXT NULL,
    "AccessToken" TEXT NULL,
    "Message" TEXT NULL,
    "UserId" INTEGER NULL
);

DELETE FROM Games;
DELETE FROM Movies;
DELETE FROM TVSeries;
DELETE FROM Users;
DELETE FROM UserAuth;
DELETE FROM UserToken;

INSERT INTO Games (GameId, Title, DescT, Genre, Category, Cover, Company, Publisher, LangT, DateRelease, Rating) 
VALUES (1, 'GTA IV', 'Grand Theft Auto IV (2008)', 'Action,Adventure', 'Games', 'gtaiv.jpg', 'Rockstar North', 'Rockstar Games', 'English', '2008-04-29T00:00:00', CAST(8.0 AS Decimal(2, 1)));

INSERT INTO Movies (MovieId, Title, DescT, Genre, Category, Cover, Company, LangT, Duration, Rating) 
VALUES (1, 'The Fate of the Furious (FF8)', 'Fast and Furious 8 (2017)', 'Action,Adventure', 'Movies', 'ff8.jpg', 'Universal Pictures', 'English', 136, CAST(8.3 AS Decimal(2, 1)));

INSERT INTO TVSeries (TVSerieId, Title, DescT, Genre, Category, Cover, Company, LangT, TotalSeasons, Duration, Rating) 
VALUES (1, 'Fear of The Walking Dead', 'Fear of The Walking Dead (2015)', 'Action,Adventure', 'TV Series', 'ftwd.jpg', 'Fox,AMC', 'English,Spanish', 8, 45, CAST(9.0 AS Decimal(2, 1)));

INSERT INTO TVSeries (TVSerieId, Title, DescT, Genre, Category, Cover, Company, LangT, TotalSeasons, Duration, Rating) 
VALUES (2, 'The Flash', 'The Flash (2014)', 'Action,Adventure', 'TV Series', 'theflash.jpg', 'CW', 'English', 8, 45, CAST(9.5 AS Decimal(2, 1)));

INSERT INTO Users (UserId, Username, PasswordT, Email, Pin, FirstName, LastName, DateBirthday, Avatar, Cover, About, DateAccountCreated, RoleT) 
VALUES (1, 'guest', 'guest1234', 'guest@localhost.loc', '1234', 'Guest', 'ConvIdado', '1994-01-01', 'guest.jpg', 'c_guest.jpg', 'Guest is cool guy!', '2022-06-30 16:37:00', 1);

INSERT INTO Users (UserId, Username, PasswordT, Email, Pin, FirstName, LastName, DateBirthday, Avatar, Cover, About, DateAccountCreated, RoleT) 
VALUES (2, 'admin', 'admin1234', 'admin@localhost.loc', '1234', 'Admin', 'Admin', '1996-06-04', 'theflash.jpg', 'theflash.jpg', 'Admin is cool guy!', '2022-07-08 15:26:00', 3);

INSERT INTO UserAuth (UserAuthId, Username, Password, RoleT, UserId, Avatar, TokenInfo) 
VALUES (1, 'guest', 'guest1234', 0, 1, 'guest.jpg', '');

INSERT INTO UserAuth (UserAuthId, Username, Password, RoleT, UserId, Avatar, TokenInfo) 
VALUES (2, 'admin', 'admin1234', 3, 2, 'theflash.jpg', '');

INSERT INTO UserToken (TokenId, Authenticated, Created, Expiration, AccessToken, Message, UserId)
VALUES(1, 1, '2022-07-11', '2022-08-11', 'eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ', 'OK', 1);
