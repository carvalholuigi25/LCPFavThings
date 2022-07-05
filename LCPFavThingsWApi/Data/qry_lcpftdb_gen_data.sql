USE [LCPFavThingsDB]
GO

IF NOT EXISTS 
    (SELECT name  
     FROM master.sys.server_principals
     WHERE name = 'lcpftuser')
BEGIN
    CREATE USER [lcpftuser] FOR LOGIN [lcpftuser] WITH DEFAULT_SCHEMA=[dbo]
    ALTER ROLE [db_owner] ADD MEMBER [lcpftuser]
END

GO

DELETE FROM dbo.Games;
DELETE FROM dbo.Movies;
DELETE FROM dbo.TVSeries;
DELETE FROM dbo.Users;

GO

SET IDENTITY_INSERT [dbo].[Games] ON 
INSERT [dbo].[Games] ([GameID], [Title], [DescT], [Genre], [Category], [Cover], [Company], [Publisher], [LangT], [DateRelease], [Rating]) VALUES (1, N'GTA IV', N'Grand Theft Auto IV (2008)', N'Action,Adventure', N'Games', N'gtaiv.jpg', N'Rockstar North', N'Rockstar Games', N'English', N'2008-04-29T00:00:00.0000000', CAST(8.0 AS Decimal(2, 1)))
SET IDENTITY_INSERT [dbo].[Games] OFF

GO

SET IDENTITY_INSERT [dbo].[Movies] ON 
INSERT [dbo].[Movies] ([MovieID], [Title], [DescT], [Genre], [Category], [Cover], [Company], [LangT], [Duration], [Rating]) VALUES (1, N'The Fate of the Furious (FF8)', N'Fast and Furious 8 (2017)', N'Action,Adventure', N'Movies', N'ff8.jpg', N'Universal Pictures', N'English', 136, CAST(8.3 AS Decimal(2, 1)))
SET IDENTITY_INSERT [dbo].[Movies] OFF

GO

SET IDENTITY_INSERT [dbo].[TVSeries] ON 
INSERT [dbo].[TVSeries] ([TVSerieID], [Title], [DescT], [Genre], [Category], [Cover], [Company], [LangT], [TotalSeasons], [Duration], [Rating]) VALUES (1, N'Fear of The Walking Dead', N'Fear of The Walking Dead (2015)', N'Action,Adventure', N'TV Series', N'ftwd.jpg', N'Fox,AMC', N'English,Spanish', 8, 45, CAST(9.0 AS Decimal(2, 1)));
INSERT [dbo].[TVSeries] ([TVSerieID], [Title], [DescT], [Genre], [Category], [Cover], [Company], [LangT], [TotalSeasons], [Duration], [Rating]) VALUES (2, N'The Flash', N'The Flash (2014)', N'Action,Adventure', N'TV Series', N'theflash.jpg', N'CW', N'English', 8, 45, CAST(9.5 AS Decimal(2, 1)));
SET IDENTITY_INSERT [dbo].[TVSeries] OFF

GO

SET IDENTITY_INSERT [dbo].[Users] ON 
INSERT [dbo].[Users] ([UserID], [Username], [PasswordT], [Email], [Pin], [FirstName], [LastName], [DateBirthday], [Avatar], [Cover], [About], [DateAccountCreated], [RoleT]) VALUES (1, N'guest', N'guest1234', N'guest@localhost.loc', N'1234', N'Guest', N'Convidado', N'1994-01-01', N'guest.jpg', N'c_guest.jpg', N'Guest is cool guy!', N'2022-06-30 16:37:00', 1);
SET IDENTITY_INSERT [dbo].[Users] OFF

GO