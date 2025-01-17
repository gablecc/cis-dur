USE [gameshop]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_NarudzbaDetalj_Narudzba]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_NarudzbaDetalj_Igra]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Narudzba_Operater]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Narudzba_Kupac]
GO
ALTER TABLE [dbo].[Game] DROP CONSTRAINT [FK_Igra_VrstaIgre]
GO
ALTER TABLE [dbo].[Game] DROP CONSTRAINT [FK_Igra_Kompanija1]
GO
ALTER TABLE [dbo].[Game] DROP CONSTRAINT [FK_Igra_Kompanija]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5.12.2020. 16:32:09 ******/
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5.12.2020. 16:32:09 ******/
DROP TABLE [dbo].[OrderDetail]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5.12.2020. 16:32:09 ******/
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 5.12.2020. 16:32:09 ******/
DROP TABLE [dbo].[Genre]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 5.12.2020. 16:32:09 ******/
DROP TABLE [dbo].[Game]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5.12.2020. 16:32:09 ******/
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 5.12.2020. 16:32:09 ******/
DROP TABLE [dbo].[Company]
GO
/****** Object:  Schema [appuser]    Script Date: 5.12.2020. 16:32:09 ******/
DROP SCHEMA [appuser]
GO
/****** Object:  User [appuser]    Script Date: 5.12.2020. 16:32:09 ******/


/****** Object:  Login [apiuser]    Script Date: 5.12.2020. 16:32:09 ******/
CREATE LOGIN [appuser] WITH PASSWORD=N'dbpassword', DEFAULT_DATABASE=[gameshop], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [gameshop]
GO
/****** Object:  User [appuser]    Script Date: 5.12.2020. 16:32:09 ******/
CREATE USER [appuser] FOR LOGIN [appuser] WITH DEFAULT_SCHEMA=[appuser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [appuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [appuser]
GO
/****** Object:  Schema [appuser]    Script Date: 5.12.2020. 16:32:09 ******/
CREATE SCHEMA [appuser]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 5.12.2020. 16:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Kompanija] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5.12.2020. 16:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](100) NULL,
	[password] [varchar](50) NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Operater] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 5.12.2020. 16:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[idGenre] [int] NULL,
	[idPublisher] [int] NULL,
	[price] [money] NULL,
	[idDeveloper] [int] NULL,
	[releaseDate] [datetime] NULL,
	[image] [varchar](100) NULL,
 CONSTRAINT [PK_Igra] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 5.12.2020. 16:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_VrstaIgre] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5.12.2020. 16:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NULL,
	[idEmployee] [int] NULL,
	[dateOrdered] [datetime] NULL,
	[dateSent] [datetime] NULL,
 CONSTRAINT [PK_Narudzba] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5.12.2020. 16:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idOrder] [int] NULL,
	[idGame] [int] NULL,
	[quantity] [int] NULL,
	[unitprice] [money] NULL,
 CONSTRAINT [PK_NarudzbaDetalj] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5.12.2020. 16:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[address] [varchar](200) NULL,
	[idCity] [int] NULL,
	[email] [varchar](100) NULL,
 CONSTRAINT [PK_Kupac] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([id], [name]) VALUES (1, N'Rockstar')
INSERT [dbo].[Company] ([id], [name]) VALUES (2, N'Bethesda')
INSERT [dbo].[Company] ([id], [name]) VALUES (3, N'id Software')
INSERT [dbo].[Company] ([id], [name]) VALUES (4, N'Bungie')
INSERT [dbo].[Company] ([id], [name]) VALUES (5, N'Ubisoft')
INSERT [dbo].[Company] ([id], [name]) VALUES (6, N'Capcom')
INSERT [dbo].[Company] ([id], [name]) VALUES (7, N'CD Projekt Red')
INSERT [dbo].[Company] ([id], [name]) VALUES (8, N'Sports interactive')
INSERT [dbo].[Company] ([id], [name]) VALUES (9, N'Sega')
INSERT [dbo].[Company] ([id], [name]) VALUES (10, N'Firaxis')
INSERT [dbo].[Company] ([id], [name]) VALUES (11, N'2K')
INSERT [dbo].[Company] ([id], [name]) VALUES (12, N'SCS Software')
INSERT [dbo].[Company] ([id], [name]) VALUES (13, N'Maxis')
INSERT [dbo].[Company] ([id], [name]) VALUES (14, N'EA')
INSERT [dbo].[Company] ([id], [name]) VALUES (15, N'Creative assembly')
INSERT [dbo].[Company] ([id], [name]) VALUES (16, N'Forgotten empires')
INSERT [dbo].[Company] ([id], [name]) VALUES (17, N'Xbox Game Studios')
INSERT [dbo].[Company] ([id], [name]) VALUES (18, N'Ghost Games')
INSERT [dbo].[Company] ([id], [name]) VALUES (19, N'Paradox')
INSERT [dbo].[Company] ([id], [name]) VALUES (20, N'Codemasters')
INSERT [dbo].[Company] ([id], [name]) VALUES (21, N'Kunos')
INSERT [dbo].[Company] ([id], [name]) VALUES (22, N'Visual Concepts')
INSERT [dbo].[Company] ([id], [name]) VALUES (23, N'HB Studios')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Game] ON 

INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (1, N'GTA V', 1, 1, 29.9800, 1, CAST(N'2015-04-14T00:00:00.000' AS DateTime), N'gtav.png')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (2, N'Red Dead Redemption 2', 1, 1, 60.0000, 1, CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'rdr2.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (3, N'Doom Eternal', 1, 2, 60.0000, 3, CAST(N'2020-03-20T00:00:00.000' AS DateTime), N'doom.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (4, N'Monster Hunter: World', 1, 6, 30.0000, 6, CAST(N'2018-08-09T00:00:00.000' AS DateTime), N'monster.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (5, N'Assassin''s Creed® Odyssey', 2, 5, 60.0000, 5, CAST(N'2018-10-05T00:00:00.000' AS DateTime), N'odyssey.png')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (6, N'Witcher 3', 2, 7, 30.0000, 7, CAST(N'2015-05-18T00:00:00.000' AS DateTime), N'witcher.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (7, N'The Elder Scrolls V: Skyrim Special Edition', 2, 2, 40.0000, 2, CAST(N'2016-10-28T00:00:00.000' AS DateTime), N'skyrim.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (8, N'Fallout 4: Game of the Year', 2, 2, 60.0000, 2, CAST(N'2015-11-10T00:00:00.000' AS DateTime), N'fallout4.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (9, N'Football Manager 2021', 3, 9, 55.0000, 8, CAST(N'2020-11-23T00:00:00.000' AS DateTime), N'fm2021.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (10, N'American Truck Simulator', 3, 12, 20.0000, 12, CAST(N'2016-02-02T00:00:00.000' AS DateTime), N'ats.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (11, N'Euro Truck Simulator 2', 3, 12, 20.0000, 12, CAST(N'2012-10-18T00:00:00.000' AS DateTime), N'ets.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (12, N'Sims 4', 3, 14, 40.0000, 13, CAST(N'2014-09-02T00:00:00.000' AS DateTime), N'sims4.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (13, N'CIVILIZATION VI', 6, 11, 60.0000, 10, CAST(N'2016-10-21T00:00:00.000' AS DateTime), N'civ6.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (14, N'Total War: WARHAMMER II', 6, 9, 60.0000, 15, CAST(N'2017-09-28T00:00:00.000' AS DateTime), N'warhammer2.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (15, N'Age of Empires II: Definitive Edition', 6, 17, 20.0000, 16, CAST(N'2019-09-14T00:00:00.000' AS DateTime), N'ageofempires2.png')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (16, N'Crusader Kings III', 6, 19, 50.0000, 19, CAST(N'2020-09-01T00:00:00.000' AS DateTime), N'Crusader_Kings_III.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (17, N'Need for Speed™ Heat', 4, 14, 70.0000, 18, CAST(N'2020-11-08T00:00:00.000' AS DateTime), N'need-for-speed-heat-cover.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (18, N'F1® 2020', 4, 20, 55.0000, 20, CAST(N'2020-07-09T00:00:00.000' AS DateTime), N'F1_2020_Cover.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (19, N'Assetto Corsa', 4, 21, 20.0000, 21, CAST(N'2014-12-19T00:00:00.000' AS DateTime), N'assetto-corsa-cover.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (20, N'DiRT Rally 2.0', 4, 20, 20.0000, 20, CAST(N'2019-02-26T00:00:00.000' AS DateTime), N'ps_dirtrally2_2019.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (21, N'FIFA 21', 5, 14, 60.0000, 14, CAST(N'2020-10-09T00:00:00.000' AS DateTime), N'220px-FIFA_21_Standard_Edition_Cover.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (22, N'NBA 2K21', 5, 11, 60.0000, 22, CAST(N'2020-09-04T00:00:00.000' AS DateTime), N'nba-2k21.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (23, N'PGA TOUR 2K21', 5, 11, 60.0000, 23, CAST(N'2020-08-21T00:00:00.000' AS DateTime), N'pga.jpg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (24, N'Madden NFL 21', 5, 14, 60.0000, 14, CAST(N'2020-08-28T00:00:00.000' AS DateTime), N'Madden21cover.jpeg')
INSERT [dbo].[Game] ([id], [title], [idGenre], [idPublisher], [price], [idDeveloper], [releaseDate], [image]) VALUES (1005, N'Nova igra', 2, 8, 40.0000, 5, CAST(N'2017-05-01T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Game] OFF
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([id], [name]) VALUES (1, N'Akcija')
INSERT [dbo].[Genre] ([id], [name]) VALUES (2, N'RPG')
INSERT [dbo].[Genre] ([id], [name]) VALUES (3, N'Simulacija')
INSERT [dbo].[Genre] ([id], [name]) VALUES (4, N'Utrke')
INSERT [dbo].[Genre] ([id], [name]) VALUES (5, N'Sport')
INSERT [dbo].[Genre] ([id], [name]) VALUES (6, N'Strategija')
SET IDENTITY_INSERT [dbo].[Genre] OFF
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Igra_Kompanija] FOREIGN KEY([idPublisher])
REFERENCES [dbo].[Company] ([id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Igra_Kompanija]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Igra_Kompanija1] FOREIGN KEY([idDeveloper])
REFERENCES [dbo].[Company] ([id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Igra_Kompanija1]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Igra_VrstaIgre] FOREIGN KEY([idGenre])
REFERENCES [dbo].[Genre] ([id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Igra_VrstaIgre]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Narudzba_Kupac] FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Narudzba_Kupac]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Narudzba_Operater] FOREIGN KEY([idEmployee])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Narudzba_Operater]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_NarudzbaDetalj_Igra] FOREIGN KEY([idGame])
REFERENCES [dbo].[Game] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_NarudzbaDetalj_Igra]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_NarudzbaDetalj_Narudzba] FOREIGN KEY([idOrder])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_NarudzbaDetalj_Narudzba]
GO
