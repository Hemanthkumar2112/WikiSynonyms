USE [master]
GO
/****** Object:  Database [WikipediaSynonyms]    Script Date: 8/4/2016 9:15:46 AM ******/
CREATE DATABASE [WikipediaSynonyms]
GO
ALTER DATABASE [WikipediaSynonyms] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET ARITHABORT OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WikipediaSynonyms] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WikipediaSynonyms] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WikipediaSynonyms] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WikipediaSynonyms] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WikipediaSynonyms] SET  MULTI_USER 
GO
ALTER DATABASE [WikipediaSynonyms] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WikipediaSynonyms] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WikipediaSynonyms] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WikipediaSynonyms] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WikipediaSynonyms] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WikipediaSynonyms', N'ON'
GO
ALTER DATABASE [WikipediaSynonyms] SET QUERY_STORE = OFF
GO
USE [WikipediaSynonyms]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [WikipediaSynonyms]
GO
/****** Object:  Table [dbo].[page]    Script Date: 8/4/2016 9:15:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[page](
	[page_id] [int] NOT NULL,
	[page_namespace] [int] NOT NULL,
	[page_title] [nvarchar](450) COLLATE Latin1_General_BIN2 NULL,
	[page_restrictions] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[page_counter] [bigint] NOT NULL,
	[page_is_redirect] [tinyint] NOT NULL,
	[page_is_new] [tinyint] NOT NULL,
	[page_random] [float] NOT NULL,
	[page_touched] [nvarchar](14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[page_links_updated] [nvarchar](14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[page_latest] [int] NOT NULL,
	[page_len] [int] NOT NULL,
	[page_content_model] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[page_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[page_relation]    Script Date: 8/4/2016 9:15:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[page_relation](
	[sid] [int] NOT NULL,
	[tid] [int] NOT NULL,
	[snamespace] [int] NULL,
	[tnamespace] [int] NULL,
	[stitle] [nvarchar](255) COLLATE Latin1_General_BIN2 NULL,
	[ttitle] [nvarchar](255) COLLATE Latin1_General_BIN2 NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[redirect]    Script Date: 8/4/2016 9:15:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[redirect](
	[rd_from] [int] NOT NULL,
	[rd_namespace] [int] NOT NULL,
	[rd_title] [nvarchar](255) COLLATE Latin1_General_BIN2 NOT NULL,
	[rd_interwiki] [nvarchar](32) COLLATE Latin1_General_BIN2 NULL,
	[rd_fragment] [nvarchar](255) COLLATE Latin1_General_BIN2 NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[synonyms]    Script Date: 8/4/2016 9:15:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[synonyms](
	[root] [nvarchar](255) COLLATE Latin1_General_BIN2 NOT NULL,
	[synonym] [nvarchar](255) COLLATE Latin1_General_BIN2 NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_page_page_title]    Script Date: 8/4/2016 9:15:46 AM ******/
CREATE NONCLUSTERED INDEX [idx_page_page_title] ON [dbo].[page]
(
	[page_title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_page_relation_stitle]    Script Date: 8/4/2016 9:15:47 AM ******/
CREATE NONCLUSTERED INDEX [idx_page_relation_stitle] ON [dbo].[page_relation]
(
	[stitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ind_catlink_page_relation]    Script Date: 8/4/2016 9:15:47 AM ******/
CREATE NONCLUSTERED INDEX [ind_catlink_page_relation] ON [dbo].[page_relation]
(
	[ttitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [redirect_rd_from]    Script Date: 8/4/2016 9:15:47 AM ******/
CREATE NONCLUSTERED INDEX [redirect_rd_from] ON [dbo].[redirect]
(
	[rd_from] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetSynonymnList]    Script Date: 8/4/2016 9:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetSynonymnList] @word nvarchar(255)
as
begin

with SynonymList as
(
select synonym from synonyms where root = @word
union
select synonym from synonyms where root in (
  select root from synonyms where synonym = @word
)
)
select distinct synonym from SynonymList order by synonym
end

GO
USE [master]
GO
ALTER DATABASE [WikipediaSynonyms] SET  READ_WRITE 
GO
