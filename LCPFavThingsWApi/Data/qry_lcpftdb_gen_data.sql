USE [LCPFavThingsDB]
GO

IF NOT EXISTS 
    (SELECT name  
     FROM master.sys.server_principals
     WHERE name = 'lcpftuser')
BEGIN
    CREATE USER [lcpftuser] WITH PASSWORD = N'1234';
    CREATE USER [lcpftuser] FOR LOGIN [lcpftuser] WITH DEFAULT_SCHEMA=[dbo];
    ALTER ROLE [db_owner] ADD MEMBER [lcpftuser];
END

GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Games')
BEGIN
	DROP TABLE [dbo].[Games];
END

GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Movies')
BEGIN
	DROP TABLE [dbo].[Movies];
END

GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TVSeries')
BEGIN
	DROP TABLE [dbo].[TVSeries];
END

GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Users')
BEGIN
	DROP TABLE [dbo].[Users];
END

GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserAuth')
BEGIN
	DROP TABLE [dbo].[UserAuth];
END

GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserToken')
BEGIN
	DROP TABLE [dbo].[UserToken];
END

GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Games')
BEGIN
	CREATE TABLE [dbo].[Games](
		[GameID] [int] IDENTITY(1,1) NOT NULL,
		[Title] [varchar](100) NOT NULL,
		[DescT] [varchar](1024) NOT NULL,
		[Genre] [varchar](20) NOT NULL,
		[Category] [varchar](255) NOT NULL,
		[Cover] [varchar](100) NOT NULL,
		[Company] [varchar](255) NOT NULL,
		[Publisher] [varchar](255) NOT NULL,
		[LangT] [varchar](20) NOT NULL,
		[DateRelease] [varchar](255) NOT NULL,
		[Rating] [decimal](2, 1) NOT NULL,
	 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
	(
		[GameID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END

GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Movies')
BEGIN
	CREATE TABLE [dbo].[Movies](
		[MovieID] [int] IDENTITY(1,1) NOT NULL,
		[Title] [varchar](100) NOT NULL,
		[DescT] [varchar](1024) NOT NULL,
		[Genre] [varchar](20) NOT NULL,
		[Category] [varchar](255) NOT NULL,
		[Cover] [varchar](100) NOT NULL,
		[Company] [varchar](255) NOT NULL,
		[LangT] [varchar](20) NOT NULL,
		[Duration] [int] NOT NULL,
		[Rating] [decimal](2, 1) NOT NULL,
	 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
	(
		[MovieID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END

GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TVSeries')
BEGIN
	CREATE TABLE [dbo].[TVSeries](
		[TVSerieID] [int] IDENTITY(1,1) NOT NULL,
		[Title] [varchar](100) NOT NULL,
		[DescT] [varchar](1024) NOT NULL,
		[Genre] [varchar](20) NOT NULL,
		[Category] [varchar](255) NOT NULL,
		[Cover] [varchar](100) NOT NULL,
		[Company] [varchar](255) NOT NULL,
		[LangT] [varchar](20) NOT NULL,
		[TotalSeasons] [int] NOT NULL,
		[Duration] [int] NOT NULL,
		[Rating] [decimal](2, 1) NOT NULL,
	 CONSTRAINT [PK_TVSeries] PRIMARY KEY CLUSTERED 
	(
		[TVSerieID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END

GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Users')
BEGIN
	CREATE TABLE [dbo].[Users](
		[UserID] [int] IDENTITY(1,1) NOT NULL,
		[Username] [varchar](255) NOT NULL,
		[PasswordT] [varchar](255) NOT NULL,
		[Email] [varchar](255) NULL,
		[Pin] [int] NULL,
		[FirstName] [varchar](255) NULL,
		[LastName] [varchar](255) NULL,
		[DateBirthday] [datetime] NULL,
		[Avatar] [varchar](255) NULL,
		[Cover] [varchar](255) NULL,
		[About] [varchar](255) NULL,
		[DateAccountCreated] [datetime] NULL,
		[RoleT] [int] NULL,
		CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
	(
		[UserID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END

GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserAuth')
BEGIN
	CREATE TABLE [dbo].[UserAuth](
		[UserAuthID] [int] IDENTITY(1,1) NOT NULL,
		[Username] [varchar](255) NOT NULL,
		[PasswordT] [varchar](255) NOT NULL,
		[UserID] [int] NULL,
		[Avatar] [varchar](255) NULL,
		[TokenInfo] [text] NULL,
		CONSTRAINT [PK_UserAuth] PRIMARY KEY CLUSTERED 
	(
		[UserAuthID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END

GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserToken')
BEGIN
	CREATE TABLE [dbo].[UserToken](
		[TokenId] [int] IDENTITY(1,1) NOT NULL,
		[Authenticated] [bit] NULL,
		[Created] [varchar](255) NULL,
		[Expiration] [varchar](255) NULL,
		[AccessToken] [varchar](255) NULL,
		[Message] [varchar](255) NULL,
		[UserId] [int] NULL,
		CONSTRAINT [PK_UserToken] PRIMARY KEY CLUSTERED 
	(
		[TokenId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END

GO

DELETE FROM dbo.Games;
DELETE FROM dbo.Movies;
DELETE FROM dbo.TVSeries;
DELETE FROM dbo.Users;
DELETE FROM dbo.UserAuth;
DELETE FROM dbo.UserToken;

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
INSERT [dbo].[Users] ([UserID], [Username], [PasswordT], [Email], [Pin], [FirstName], [LastName], [DateBirthday], [Avatar], [Cover], [About], [DateAccountCreated], [RoleT]) VALUES (2, N'admin', N'admin1234', N'admin@localhost.loc', N'1234', N'Admin', N'Admin', N'1996-06-04', N'theflash.jpg', N'theflash.jpg', N'Admin is cool guy!', N'2022-07-08 15:26:00', 3);
SET IDENTITY_INSERT [dbo].[Users] OFF

GO

SET IDENTITY_INSERT [dbo].[UserAuth] ON 
INSERT [dbo].[UserAuth] ([UserAuthID], [Username], [PasswordT], [UserID], [Avatar], [TokenInfo]) VALUES (1, N'guest', N'guest1234', 1, N'guest.jpg', N'');
INSERT [dbo].[UserAuth] ([UserAuthID], [Username], [PasswordT], [UserID], [Avatar], [TokenInfo]) VALUES (2, N'admin', N'admin1234', 2, N'theflash.jpg', N'');
SET IDENTITY_INSERT [dbo].[UserAuth] OFF

GO