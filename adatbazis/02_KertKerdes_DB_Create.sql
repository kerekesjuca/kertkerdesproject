USE [master]
GO
/****** Object:  Database [KertKerdesDb]    Script Date: 2026. 04. 25. 18:12:47 ******/
CREATE DATABASE [KertKerdesDb]
GO
USE [KertKerdesDb]
GO
ALTER DATABASE [KertKerdesDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KertKerdesDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KertKerdesDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KertKerdesDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KertKerdesDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KertKerdesDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KertKerdesDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [KertKerdesDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KertKerdesDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KertKerdesDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KertKerdesDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KertKerdesDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KertKerdesDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KertKerdesDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KertKerdesDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KertKerdesDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KertKerdesDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KertKerdesDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KertKerdesDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KertKerdesDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KertKerdesDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KertKerdesDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KertKerdesDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KertKerdesDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KertKerdesDb] SET RECOVERY FULL 
GO
ALTER DATABASE [KertKerdesDb] SET  MULTI_USER 
GO
ALTER DATABASE [KertKerdesDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KertKerdesDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KertKerdesDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KertKerdesDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KertKerdesDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KertKerdesDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KertKerdesDb', N'ON'
GO
ALTER DATABASE [KertKerdesDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [KertKerdesDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KertKerdesDb]
GO
/****** Object:  User [kertkerdes]    Script Date: 2026. 04. 25. 18:12:47 ******/
CREATE USER [kertkerdes] FOR LOGIN [kertkerdes] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [kertkerdes]
GO
/****** Object:  Table [dbo].[Cimkek]    Script Date: 2026. 04. 25. 18:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cimkek](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nev] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Felhasznalok]    Script Date: 2026. 04. 25. 18:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Felhasznalok](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Felhasznalonev] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[JelszoHash] [nvarchar](500) NOT NULL,
	[Szerepkor] [nvarchar](50) NOT NULL,
	[RegisztracioDatuma] [datetime] NOT NULL,
	[ModeratorJovahagyva] [bit] NOT NULL,
	[ModeratorElutasitva] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KerdesCimkek]    Script Date: 2026. 04. 25. 18:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KerdesCimkek](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KerdesId] [int] NOT NULL,
	[CimkeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kerdesek]    Script Date: 2026. 04. 25. 18:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kerdesek](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cim] [nvarchar](200) NOT NULL,
	[Leiras] [nvarchar](max) NOT NULL,
	[FelhasznaloId] [int] NOT NULL,
	[TemakorId] [int] NOT NULL,
	[Datum] [datetime] NOT NULL,
	[Jovahagyva] [bit] NOT NULL,
	[Szavazat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Szavazatok]    Script Date: 2026. 04. 25. 18:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Szavazatok](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FelhasznaloId] [int] NOT NULL,
	[KerdesId] [int] NULL,
	[ValaszId] [int] NULL,
	[Ertek] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temakorok]    Script Date: 2026. 04. 25. 18:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temakorok](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nev] [nvarchar](150) NOT NULL,
	[Leiras] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Valaszok]    Script Date: 2026. 04. 25. 18:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valaszok](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KerdesId] [int] NOT NULL,
	[FelhasznaloId] [int] NOT NULL,
	[Szoveg] [nvarchar](max) NOT NULL,
	[Datum] [datetime] NOT NULL,
	[Jovahagyva] [bit] NOT NULL,
	[Elfogadott] [bit] NOT NULL,
	[Szavazat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cimkek] ON 

INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (28, N'átültetés')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (23, N'balkon')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (19, N'csepegtető öntözés')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (12, N'fagyvédelem')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (8, N'gombabetegség')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (26, N'gumónövény')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (13, N'karácsonyi kaktusz')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (17, N'komposzt')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (30, N'levél')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (21, N'levéltetű')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (6, N'magaságyás')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (16, N'mulcs')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (9, N'növényvédelem')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (27, N'orchidea')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (5, N'öntözés')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (3, N'palánta')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (11, N'palántázás')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (10, N'paprika')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (1, N'paradicsom')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (24, N'retek')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (7, N'rózsa')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (31, N'száradt')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (29, N'száraz')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (15, N'szobanövény')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (18, N'talajtakarás')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (2, N'tápanyaghiány')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (22, N'természetes védekezés')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (25, N'termesztés')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (4, N'uborka')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (14, N'virágzás')
INSERT [dbo].[Cimkek] ([Id], [Nev]) VALUES (20, N'vízgazdálkodás')
SET IDENTITY_INSERT [dbo].[Cimkek] OFF
GO
SET IDENTITY_INSERT [dbo].[Felhasznalok] ON 

INSERT [dbo].[Felhasznalok] ([Id], [Felhasznalonev], [Email], [JelszoHash], [Szerepkor], [RegisztracioDatuma], [ModeratorJovahagyva], [ModeratorElutasitva]) VALUES (1, N'admin', N'admin@kertkerdes.hu', N'240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', N'Admin', CAST(N'2026-04-24T11:30:27.383' AS DateTime), 1, 0)
INSERT [dbo].[Felhasznalok] ([Id], [Felhasznalonev], [Email], [JelszoHash], [Szerepkor], [RegisztracioDatuma], [ModeratorJovahagyva], [ModeratorElutasitva]) VALUES (2, N'judit', N'judit@kertkerdes.hu', N'f009644dfbbb062c2d95a5ad63fdf2faf2bd5b400b3f70defed8ca148805cbee', N'Moderator', CAST(N'2026-04-24T12:55:27.553' AS DateTime), 1, 0)
INSERT [dbo].[Felhasznalok] ([Id], [Felhasznalonev], [Email], [JelszoHash], [Szerepkor], [RegisztracioDatuma], [ModeratorJovahagyva], [ModeratorElutasitva]) VALUES (3, N'vendeg', N'vendeg@kertkerdes.hu', N'f009644dfbbb062c2d95a5ad63fdf2faf2bd5b400b3f70defed8ca148805cbee', N'Altalanos', CAST(N'2026-04-24T13:42:58.310' AS DateTime), 1, 0)
INSERT [dbo].[Felhasznalok] ([Id], [Felhasznalonev], [Email], [JelszoHash], [Szerepkor], [RegisztracioDatuma], [ModeratorJovahagyva], [ModeratorElutasitva]) VALUES (4, N'ferenc', N'ferenc@email.hu', N'f009644dfbbb062c2d95a5ad63fdf2faf2bd5b400b3f70defed8ca148805cbee', N'Moderator', CAST(N'2026-04-24T16:17:24.567' AS DateTime), 1, 0)
INSERT [dbo].[Felhasznalok] ([Id], [Felhasznalonev], [Email], [JelszoHash], [Szerepkor], [RegisztracioDatuma], [ModeratorJovahagyva], [ModeratorElutasitva]) VALUES (5, N'laura', N'laura@email.hu', N'f009644dfbbb062c2d95a5ad63fdf2faf2bd5b400b3f70defed8ca148805cbee', N'Altalanos', CAST(N'2026-04-24T16:19:41.313' AS DateTime), 1, 0)
INSERT [dbo].[Felhasznalok] ([Id], [Felhasznalonev], [Email], [JelszoHash], [Szerepkor], [RegisztracioDatuma], [ModeratorJovahagyva], [ModeratorElutasitva]) VALUES (6, N'mate', N'mate@email.hu', N'f009644dfbbb062c2d95a5ad63fdf2faf2bd5b400b3f70defed8ca148805cbee', N'Altalanos', CAST(N'2026-04-25T16:46:52.627' AS DateTime), 1, 0)
INSERT [dbo].[Felhasznalok] ([Id], [Felhasznalonev], [Email], [JelszoHash], [Szerepkor], [RegisztracioDatuma], [ModeratorJovahagyva], [ModeratorElutasitva]) VALUES (7, N'kende', N'kende@kertkerdes.hu', N'f009644dfbbb062c2d95a5ad63fdf2faf2bd5b400b3f70defed8ca148805cbee', N'Moderator', CAST(N'2026-04-25T17:29:41.910' AS DateTime), 1, 0)
INSERT [dbo].[Felhasznalok] ([Id], [Felhasznalonev], [Email], [JelszoHash], [Szerepkor], [RegisztracioDatuma], [ModeratorJovahagyva], [ModeratorElutasitva]) VALUES (8, N'juca', N'juca@email.hu', N'f009644dfbbb062c2d95a5ad63fdf2faf2bd5b400b3f70defed8ca148805cbee', N'Altalanos', CAST(N'2026-04-25T17:30:32.410' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Felhasznalok] OFF
GO
SET IDENTITY_INSERT [dbo].[KerdesCimkek] ON 

INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (1, 1, 1)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (2, 1, 2)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (3, 1, 3)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (4, 2, 4)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (5, 2, 5)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (6, 2, 6)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (7, 3, 7)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (8, 3, 8)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (9, 3, 9)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (10, 4, 10)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (11, 4, 11)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (12, 4, 12)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (13, 5, 13)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (14, 5, 14)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (15, 5, 15)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (16, 6, 16)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (17, 6, 17)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (18, 6, 18)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (19, 7, 19)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (20, 7, 1)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (21, 7, 20)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (22, 8, 21)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (23, 8, 22)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (24, 8, 23)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (25, 9, 24)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (26, 9, 25)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (27, 9, 26)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (28, 10, 27)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (29, 10, 28)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (30, 10, 14)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (31, 11, 29)
INSERT [dbo].[KerdesCimkek] ([Id], [KerdesId], [CimkeId]) VALUES (32, 11, 30)
SET IDENTITY_INSERT [dbo].[KerdesCimkek] OFF
GO
SET IDENTITY_INSERT [dbo].[Kerdesek] ON 

INSERT [dbo].[Kerdesek] ([Id], [Cim], [Leiras], [FelhasznaloId], [TemakorId], [Datum], [Jovahagyva], [Szavazat]) VALUES (1, N'Miért sárgulnak a paradicsom palántáim levelei friss virágföld használata mellett?', N'Sárgulnak a paradicsom palántáim levelei friss virágföld használata mellett.', 1, 1, CAST(N'2026-04-24T12:56:45.983' AS DateTime), 1, 0)
INSERT [dbo].[Kerdesek] ([Id], [Cim], [Leiras], [FelhasznaloId], [TemakorId], [Datum], [Jovahagyva], [Szavazat]) VALUES (2, N'Milyen gyakran kell locsolni a magaságyásban nevelt uborkát nyári melegben?', N'Gyakran kell locsolni a magaságyásban nevelt uborkát nyári melegben?', 1, 2, CAST(N'2026-04-24T12:57:43.427' AS DateTime), 1, 0)
INSERT [dbo].[Kerdesek] ([Id], [Cim], [Leiras], [FelhasznaloId], [TemakorId], [Datum], [Jovahagyva], [Szavazat]) VALUES (3, N'Mi okozhatja, hogy a rózsa levelein fekete foltok jelennek meg?', N'A rózsa levelein fekete foltok jelennek meg.', 1, 3, CAST(N'2026-04-24T12:58:24.263' AS DateTime), 1, 0)
INSERT [dbo].[Kerdesek] ([Id], [Cim], [Leiras], [FelhasznaloId], [TemakorId], [Datum], [Jovahagyva], [Szavazat]) VALUES (4, N'Mikor érdemes kiültetni a paprikapalántákat szabadföldbe?', N'Ki kell ültetni a paprikapalántákat szabadföldbe.', 1, 4, CAST(N'2026-04-24T12:59:21.327' AS DateTime), 1, 0)
INSERT [dbo].[Kerdesek] ([Id], [Cim], [Leiras], [FelhasznaloId], [TemakorId], [Datum], [Jovahagyva], [Szavazat]) VALUES (5, N'Miért nem virágzik évek óta a karácsonyi kaktuszom?', N'Nem virágzik évek óta a karácsonyi kaktuszom.', 1, 5, CAST(N'2026-04-24T13:00:05.597' AS DateTime), 1, 0)
INSERT [dbo].[Kerdesek] ([Id], [Cim], [Leiras], [FelhasznaloId], [TemakorId], [Datum], [Jovahagyva], [Szavazat]) VALUES (6, N'Használható-e friss fűnyesedék mulcsként veteményesben?', N'Friss fűnyesedék mulcsként veteményesben.', 1, 1, CAST(N'2026-04-24T13:00:46.333' AS DateTime), 1, 0)
INSERT [dbo].[Kerdesek] ([Id], [Cim], [Leiras], [FelhasznaloId], [TemakorId], [Datum], [Jovahagyva], [Szavazat]) VALUES (7, N'Csepegtető öntözésnél mennyi ideig célszerű locsolni a paradicsomot naponta?', N'Csepegtető öntözés ideje a kérdés.', 1, 2, CAST(N'2026-04-24T13:01:38.183' AS DateTime), 1, 1)
INSERT [dbo].[Kerdesek] ([Id], [Cim], [Leiras], [FelhasznaloId], [TemakorId], [Datum], [Jovahagyva], [Szavazat]) VALUES (8, N'Levéltetű ellen milyen természetes módszer működik jól balkonon?', N'Levéltetű ellen természetes módon.', 1, 3, CAST(N'2026-04-24T13:02:20.353' AS DateTime), 1, 0)
INSERT [dbo].[Kerdesek] ([Id], [Cim], [Leiras], [FelhasznaloId], [TemakorId], [Datum], [Jovahagyva], [Szavazat]) VALUES (9, N'Miért reped meg a retek gumója a földben?', N'Reped a retek gumója a földben.', 1, 4, CAST(N'2026-04-24T13:03:02.067' AS DateTime), 1, 0)
INSERT [dbo].[Kerdesek] ([Id], [Cim], [Leiras], [FelhasznaloId], [TemakorId], [Datum], [Jovahagyva], [Szavazat]) VALUES (10, N'Át kell ültetni az orchideát virágzás után vagy inkább tavasszal?', N'Át kell ültetni az orchideát.', 1, 5, CAST(N'2026-04-24T13:03:38.423' AS DateTime), 1, 1)
INSERT [dbo].[Kerdesek] ([Id], [Cim], [Leiras], [FelhasznaloId], [TemakorId], [Datum], [Jovahagyva], [Szavazat]) VALUES (11, N'Miért szárad a orchidea leveleinek a széle?', N'Szárad a orchidea leveleinek a széle.', 5, 5, CAST(N'2026-04-24T16:21:23.613' AS DateTime), 1, -1)
SET IDENTITY_INSERT [dbo].[Kerdesek] OFF
GO
SET IDENTITY_INSERT [dbo].[Szavazatok] ON 

INSERT [dbo].[Szavazatok] ([Id], [FelhasznaloId], [KerdesId], [ValaszId], [Ertek]) VALUES (1, 2, NULL, 3, 1)
INSERT [dbo].[Szavazatok] ([Id], [FelhasznaloId], [KerdesId], [ValaszId], [Ertek]) VALUES (2, 2, NULL, 4, 1)
INSERT [dbo].[Szavazatok] ([Id], [FelhasznaloId], [KerdesId], [ValaszId], [Ertek]) VALUES (3, 1, NULL, 19, 1)
INSERT [dbo].[Szavazatok] ([Id], [FelhasznaloId], [KerdesId], [ValaszId], [Ertek]) VALUES (4, 2, 10, NULL, 1)
INSERT [dbo].[Szavazatok] ([Id], [FelhasznaloId], [KerdesId], [ValaszId], [Ertek]) VALUES (5, 2, 11, NULL, -1)
INSERT [dbo].[Szavazatok] ([Id], [FelhasznaloId], [KerdesId], [ValaszId], [Ertek]) VALUES (6, 2, 7, NULL, 1)
INSERT [dbo].[Szavazatok] ([Id], [FelhasznaloId], [KerdesId], [ValaszId], [Ertek]) VALUES (7, 2, NULL, 11, 1)
INSERT [dbo].[Szavazatok] ([Id], [FelhasznaloId], [KerdesId], [ValaszId], [Ertek]) VALUES (8, 2, NULL, 6, 1)
SET IDENTITY_INSERT [dbo].[Szavazatok] OFF
GO
SET IDENTITY_INSERT [dbo].[Temakorok] ON 

INSERT [dbo].[Temakorok] ([Id], [Nev], [Leiras]) VALUES (1, N'Talaj és tápanyagellátás', N'Talaj típusa, pH, trágyázás')
INSERT [dbo].[Temakorok] ([Id], [Nev], [Leiras]) VALUES (2, N'Öntözés és vízgazdálkodás', N'Öntözési kérdések')
INSERT [dbo].[Temakorok] ([Id], [Nev], [Leiras]) VALUES (3, N'Növényvédelem és betegségek', N'Kártevők és betegségek')
INSERT [dbo].[Temakorok] ([Id], [Nev], [Leiras]) VALUES (4, N'Kerti növények', N'Zöldségek és gyümölcsök')
INSERT [dbo].[Temakorok] ([Id], [Nev], [Leiras]) VALUES (5, N'Szobanövények', N'Lakásban tartott növények')
SET IDENTITY_INSERT [dbo].[Temakorok] OFF
GO
SET IDENTITY_INSERT [dbo].[Valaszok] ON 

INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (1, 1, 2, N'A sárgulás gyakran nitrogénhiányra utal, főleg ha az alsó levelek kezdenek el fakulni.', CAST(N'2026-04-24T13:13:52.637' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (2, 1, 3, N'Előfordulhat túlöntözés is, ilyenkor a gyökere nem kap elég levegőt.', CAST(N'2026-04-24T13:43:46.737' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (3, 1, 3, N'Ha hideg helyen vannak a palánták, a gyökere tápanyagfelvétele lelassulhat.', CAST(N'2026-04-24T13:44:17.753' AS DateTime), 1, 1, 1)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (4, 1, 5, N'Kevés napfényt kap.', CAST(N'2026-04-24T16:21:49.363' AS DateTime), 1, 0, 1)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (6, 2, 6, N'A sárgulás gyakran nitrogénhiányra utal, főleg ha az alsó levelek kezdenek el fakulni.', CAST(N'2026-04-25T17:00:23.157' AS DateTime), 1, 0, 1)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (7, 3, 6, N'Nagy melegben akár naponta egyszer is szükséges lehet az öntözés.', CAST(N'2026-04-25T17:00:56.390' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (8, 3, 6, N'Ez gyakran fekete levélfoltosság nevű gombabetegség.', CAST(N'2026-04-25T17:01:16.780' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (9, 4, 6, N'Csak akkor ültesd ki, ha az éjszakai fagyveszély már elmúlt.', CAST(N'2026-04-25T17:01:36.577' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (10, 6, 6, N'Igen, de csak vékony rétegben, különben befülled.', CAST(N'2026-04-25T17:01:55.893' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (11, 2, 5, N'Érdemes reggel locsolni, mert akkor kevésbé párolog el a víz.', CAST(N'2026-04-25T17:02:25.803' AS DateTime), 1, 0, 1)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (12, 3, 5, N'A fertőzött leveleket érdemes leszedni és megsemmisíteni.', CAST(N'2026-04-25T17:02:44.667' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (13, 4, 5, N'A talajnak legalább 15 fokosnak kell lennie.', CAST(N'2026-04-25T17:03:01.613' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (14, 10, 5, N'Ha a közeg lebomlott, ne várj sokat.', CAST(N'2026-04-25T17:04:23.260' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (15, 9, 5, N'Ha túl sokáig marad bent, megöregszik.', CAST(N'2026-04-25T17:05:20.147' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (16, 6, 2, N'Paradicsom körül jól tartja a nedvességet.', CAST(N'2026-04-25T17:15:46.873' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (17, 9, 2, N'Egyenetlen öntözés okozhatja.', CAST(N'2026-04-25T17:16:14.470' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (18, 5, 2, N'Virágzáshoz rövidebb nappalok és hűvösebb időszak szükséges.', CAST(N'2026-04-25T17:16:43.153' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (19, 8, 2, N'A csalánlé sok esetben hatásos.', CAST(N'2026-04-25T17:17:06.753' AS DateTime), 1, 1, 1)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (20, 7, 2, N'Általában 20–30 perc elegendő.', CAST(N'2026-04-25T17:17:33.847' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (21, 6, 5, N'Homokos talajban hosszabb öntözés kellhet.', CAST(N'2026-04-25T17:22:06.343' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (22, 11, 2, N'Átlátszó cserép segíti a gyökerek megfigyelését.', CAST(N'2026-04-25T17:27:28.963' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (23, 7, 8, N'Homokos talajban hosszabb öntözés kellhet.', CAST(N'2026-04-25T17:31:24.377' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (24, 8, 8, N'A fertőzött hajtásokat érdemes visszavágni.', CAST(N'2026-04-25T17:32:05.590' AS DateTime), 1, 0, 0)
INSERT [dbo].[Valaszok] ([Id], [KerdesId], [FelhasznaloId], [Szoveg], [Datum], [Jovahagyva], [Elfogadott], [Szavazat]) VALUES (25, 4, 8, N'Kiültetés előtt pár napig érdemes edzeni a palántákat.', CAST(N'2026-04-25T17:32:40.680' AS DateTime), 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Valaszok] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Cimkek__C7D0355DE829938F]    Script Date: 2026. 04. 25. 18:12:48 ******/
ALTER TABLE [dbo].[Cimkek] ADD UNIQUE NONCLUSTERED 
(
	[Nev] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Felhaszn__A9D10534627CEEB3]    Script Date: 2026. 04. 25. 18:12:48 ******/
ALTER TABLE [dbo].[Felhasznalok] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Szavazatok_FelhasznaloId_KerdesId]    Script Date: 2026. 04. 25. 18:12:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Szavazatok_FelhasznaloId_KerdesId] ON [dbo].[Szavazatok]
(
	[FelhasznaloId] ASC,
	[KerdesId] ASC
)
WHERE ([KerdesId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Szavazatok_FelhasznaloId_ValaszId]    Script Date: 2026. 04. 25. 18:12:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Szavazatok_FelhasznaloId_ValaszId] ON [dbo].[Szavazatok]
(
	[FelhasznaloId] ASC,
	[ValaszId] ASC
)
WHERE ([ValaszId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Felhasznalok] ADD  DEFAULT ('Felhasznalo') FOR [Szerepkor]
GO
ALTER TABLE [dbo].[Felhasznalok] ADD  DEFAULT (getdate()) FOR [RegisztracioDatuma]
GO
ALTER TABLE [dbo].[Felhasznalok] ADD  DEFAULT ((0)) FOR [ModeratorJovahagyva]
GO
ALTER TABLE [dbo].[Felhasznalok] ADD  DEFAULT ((0)) FOR [ModeratorElutasitva]
GO
ALTER TABLE [dbo].[Kerdesek] ADD  DEFAULT (getdate()) FOR [Datum]
GO
ALTER TABLE [dbo].[Kerdesek] ADD  DEFAULT ((0)) FOR [Jovahagyva]
GO
ALTER TABLE [dbo].[Kerdesek] ADD  DEFAULT ((0)) FOR [Szavazat]
GO
ALTER TABLE [dbo].[Valaszok] ADD  DEFAULT (getdate()) FOR [Datum]
GO
ALTER TABLE [dbo].[Valaszok] ADD  DEFAULT ((0)) FOR [Jovahagyva]
GO
ALTER TABLE [dbo].[Valaszok] ADD  DEFAULT ((0)) FOR [Elfogadott]
GO
ALTER TABLE [dbo].[Valaszok] ADD  DEFAULT ((0)) FOR [Szavazat]
GO
ALTER TABLE [dbo].[KerdesCimkek]  WITH CHECK ADD FOREIGN KEY([CimkeId])
REFERENCES [dbo].[Cimkek] ([Id])
GO
ALTER TABLE [dbo].[KerdesCimkek]  WITH CHECK ADD FOREIGN KEY([KerdesId])
REFERENCES [dbo].[Kerdesek] ([Id])
GO
ALTER TABLE [dbo].[Kerdesek]  WITH CHECK ADD FOREIGN KEY([FelhasznaloId])
REFERENCES [dbo].[Felhasznalok] ([Id])
GO
ALTER TABLE [dbo].[Kerdesek]  WITH CHECK ADD FOREIGN KEY([TemakorId])
REFERENCES [dbo].[Temakorok] ([Id])
GO
ALTER TABLE [dbo].[Szavazatok]  WITH CHECK ADD FOREIGN KEY([FelhasznaloId])
REFERENCES [dbo].[Felhasznalok] ([Id])
GO
ALTER TABLE [dbo].[Szavazatok]  WITH CHECK ADD FOREIGN KEY([KerdesId])
REFERENCES [dbo].[Kerdesek] ([Id])
GO
ALTER TABLE [dbo].[Szavazatok]  WITH CHECK ADD FOREIGN KEY([ValaszId])
REFERENCES [dbo].[Valaszok] ([Id])
GO
ALTER TABLE [dbo].[Valaszok]  WITH CHECK ADD FOREIGN KEY([FelhasznaloId])
REFERENCES [dbo].[Felhasznalok] ([Id])
GO
ALTER TABLE [dbo].[Valaszok]  WITH CHECK ADD FOREIGN KEY([KerdesId])
REFERENCES [dbo].[Kerdesek] ([Id])
GO
ALTER TABLE [dbo].[Szavazatok]  WITH CHECK ADD CHECK  (([Ertek]=(1) OR [Ertek]=(-1)))
GO
USE [master]
GO
ALTER DATABASE [KertKerdesDb] SET  READ_WRITE 
GO