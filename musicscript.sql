USE [master]
GO
/****** Object:  Database [MusicDatabaseFirstMVC]    Script Date: 3/15/2018 11:58:02 AM ******/
CREATE DATABASE [MusicDatabaseFirstMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicDatabaseFirstMVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MusicDatabaseFirstMVC.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MusicDatabaseFirstMVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MusicDatabaseFirstMVC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicDatabaseFirstMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET  MULTI_USER 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MusicDatabaseFirstMVC]
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 3/15/2018 11:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albums](
	[AlbumID] [int] IDENTITY(1,1) NOT NULL,
	[AlbumName] [nvarchar](50) NOT NULL,
	[ReleaseDate] [datetime] NOT NULL,
	[Label] [nvarchar](50) NOT NULL,
	[WonGrammy] [bit] NOT NULL,
	[ArtistID] [int] NOT NULL,
	[Photo] [nvarchar](200) NULL,
 CONSTRAINT [PK_Albums] PRIMARY KEY CLUSTERED 
(
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Artists]    Script Date: 3/15/2018 11:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artists](
	[ArtistID] [int] IDENTITY(1,1) NOT NULL,
	[ArtistName] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](200) NULL,
 CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Albums] ON 

INSERT [dbo].[Albums] ([AlbumID], [AlbumName], [ReleaseDate], [Label], [WonGrammy], [ArtistID], [Photo]) VALUES (1, N'24K Magic', CAST(N'2016-11-08 00:00:00.000' AS DateTime), N'Atlantic', 1, 3, N'/content/images/2IMG.png')
INSERT [dbo].[Albums] ([AlbumID], [AlbumName], [ReleaseDate], [Label], [WonGrammy], [ArtistID], [Photo]) VALUES (2, N'Purpose', CAST(N'2015-11-13 00:00:00.000' AS DateTime), N'Def Jam Recordings', 0, 4, N'/content/images/4img.jpg')
INSERT [dbo].[Albums] ([AlbumID], [AlbumName], [ReleaseDate], [Label], [WonGrammy], [ArtistID], [Photo]) VALUES (3, N'Awaken My Love', CAST(N'2016-12-12 00:00:00.000' AS DateTime), N'no label', 0, 5, N'/content/images/6img.png')
SET IDENTITY_INSERT [dbo].[Albums] OFF
SET IDENTITY_INSERT [dbo].[Artists] ON 

INSERT [dbo].[Artists] ([ArtistID], [ArtistName], [Photo]) VALUES (3, N'Bruno Mars', N'/Content/images/1img.jpg')
INSERT [dbo].[Artists] ([ArtistID], [ArtistName], [Photo]) VALUES (4, N'Justin Bieber', N'/content/images/3img.jpg')
INSERT [dbo].[Artists] ([ArtistID], [ArtistName], [Photo]) VALUES (5, N'Donald Glover', N'/content/images/5img.jpg')
SET IDENTITY_INSERT [dbo].[Artists] OFF
ALTER TABLE [dbo].[Albums]  WITH CHECK ADD  CONSTRAINT [FK_Albums_Artists] FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artists] ([ArtistID])
GO
ALTER TABLE [dbo].[Albums] CHECK CONSTRAINT [FK_Albums_Artists]
GO
USE [master]
GO
ALTER DATABASE [MusicDatabaseFirstMVC] SET  READ_WRITE 
GO
