USE [master]
GO
/****** Object:  Database [TiendaTRIGANE]    Script Date: 07/07/2022 1:12:12 ******/
CREATE DATABASE [TiendaTRIGANE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TiendaTRIGANE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TiendaTRIGANE.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TiendaTRIGANE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TiendaTRIGANE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TiendaTRIGANE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TiendaTRIGANE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TiendaTRIGANE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET ARITHABORT OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TiendaTRIGANE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TiendaTRIGANE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TiendaTRIGANE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TiendaTRIGANE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET RECOVERY FULL 
GO
ALTER DATABASE [TiendaTRIGANE] SET  MULTI_USER 
GO
ALTER DATABASE [TiendaTRIGANE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TiendaTRIGANE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TiendaTRIGANE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TiendaTRIGANE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TiendaTRIGANE] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TiendaTRIGANE', N'ON'
GO
ALTER DATABASE [TiendaTRIGANE] SET QUERY_STORE = OFF
GO
USE [TiendaTRIGANE]
GO
/****** Object:  Table [dbo].[EMPLEADOS]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADOS](
	[DNI] [int] NOT NULL,
	[idRol] [int] NOT NULL,
	[password] [binary](32) NOT NULL,
	[salt] [binary](32) NOT NULL,
	[idIdioma] [int] NULL,
	[Activo] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IDIOMAS]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDIOMAS](
	[idIdioma] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Default] [bit] NOT NULL,
	[Habilitado] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PALABRAS]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PALABRAS](
	[NombrePalabra] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERMISOS]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISOS](
	[NombrePermiso] [varchar](50) NOT NULL,
	[esCompuesto] [bit] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_PERMISOS] PRIMARY KEY CLUSTERED 
(
	[NombrePermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERMISOS_PERMISOS]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISOS_PERMISOS](
	[NombrePermisoPadre] [varchar](50) NOT NULL,
	[NombrePermisoHijo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PERMISOS_PERMISOS] PRIMARY KEY CLUSTERED 
(
	[NombrePermisoPadre] ASC,
	[NombrePermisoHijo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERMISOS_ROL]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISOS_ROL](
	[NombrePermiso] [varchar](50) NOT NULL,
	[idRol] [int] NOT NULL,
 CONSTRAINT [PK_PERMISOS_ROL] PRIMARY KEY CLUSTERED 
(
	[NombrePermiso] ASC,
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONAS]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONAS](
	[DNI] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLES]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLES](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](50) NULL,
	[ACTIVO] [bit] NOT NULL,
	[AdministradorDelSistema] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRADUCCIONES]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRADUCCIONES](
	[idIdioma] [int] NOT NULL,
	[NombrePalabra] [nvarchar](100) NOT NULL,
	[TextoTraducido] [nvarchar](1000) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (1, 1, 0x4C0044C41E75343CA0AADE4465B82A01A5B8EA98A9C98FFAF9A655C32A7E870A, 0x7C846D599458A56ED02D16F2FEC0800FD3E6768280B52F8AEFFF57FE1BC83BB9, 5, 1)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (2, 2, 0x82215C7BEFA81A1F12EBB7B08C4163BAC033D6C7C92E10930A8062D8EAC8BB79, 0x75C385FD8B8953E19838DC938C5B1353ECE1563DEC7964028BF955DDDFFF0D83, NULL, 1)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (3, 3, 0xF168330F1BC6350936830F7E8A16D3C96CED358D9A4E77A26A5FC6A669A01701, 0xC9DDB4B59E1F9BAA2093FB2806CC50438784183492FA569903D7370BAC094C42, NULL, 1)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (4, 4, 0xB4CC0766A734F4701263F478D20745463B6895C969353519CF023025154A6973, 0x604B90DA34E1D221CB62390E0D044FAAA2DA2C747A82F055F1B117E90400C8CA, NULL, 1)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (5, 5, 0x8E1037D5A9667B8CAC5C7DBF945DDAEF3744ADAB9D2376134E7BB7EA5721FC86, 0x9AE5545A2AF7B0F1E6B36AC84ACC2C3F5A246950BA3A284B8BE861D6358039CA, 5, 1)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (55, 5, 0x6BF857261DB7D6E5082ED66C8AD95575CA6E3838EC6F1FD4A048D6737627AD19, 0xAE72870CBA9848D66407A574694A73225A0370AA991E2E7B0D740A22DCCB5CFA, 5, 1)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (5444, 5, 0xB44B53A3ADBC966A9B360597EC4AC047B0A80F4422C29A7027EBB0188FF1E55D, 0x61E9BB3D82011CD8109842B8EDC7D4E500420BC215B3AE9B6C5D271CF9365B1A, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (12312331, 1, 0x1C86AB0B4641CFCBEA3A22038681EA4DAC7BD41AC9EA7AB16D7846A21FED1FA2, 0x6A38A731239DA92BCAFE1CCB5AC21C00DAD8F8E0486024B9C97575B17CF7F5A6, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (12431054, 6, 0x39698714DA01CE6EBA23CCB823DB8A97B0D70ECA63444BA4D6A0E0F04B9F0596, 0x4AE58B862BE344F284A1384EFF17CCFDF9CA598C011703916C683ED59BD2AC55, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (13386987, 6, 0x2B997FF958C3866B5AB8E5AA3549170C4ACE6B58DFAC7A4623CF79637385E13D, 0x6309FD8EEF64B6AED38076727893268FB3306F09CBF3377F350345AEB60F99FA, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (14302826, 6, 0xA744AEC273E954D09907E1DF8E310091ECEEDCCC3792D8CC7F32F141A941C7A4, 0xF63D451866F08DC53270C950872C5FE38461338D64C2D13C2433164B7265F0B2, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (14669497, 6, 0x1D061DE1EEDD9E9BDB76665DB86F5654FD2993140F4246F86121CF34BF571288, 0x696CFFEFE7A73ADF063848B7E9A799226B3A9D499348A9D347EAF19AE659EA3D, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (14751817, 6, 0x76920671D1D210A9A7CDD96D4BE62B666EAC0151B47A246F0B7BD3C803F22C6D, 0x18C7474045A28C21CD580C40D9A6DF31B9F5528EA428A5B6011AF51A479888A3, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (17345470, 6, 0xD6EC0DB6745DBD579ADE8D9C72BDDC50E16474CFDCCB22C2B9179324484991B2, 0x428FD459FA4C1CD5784CB6D7916012A4BE6F90DD2BF074E68AEC64A83C5F13EF, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (17513186, 6, 0xB112CA4109A464ADD8DBCB7B93EAC4FD091C2093642B4890B0B718DA32D53859, 0x425ACCCE3C71EF764FFBDCCE0D45B3B0AF1A10A8EDF15091BD263D57F43A7D86, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (18824055, 6, 0x7AF62DE24AA57D9B7A3859177216532F75D48823151B3C9CCDA3280066D01459, 0xE137CD11F053702D91576D11EDFF8EC8688068F7E8D685D3F710E3A5BC866DF2, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (19571038, 6, 0x49B4491556593871E87B2F5D16EC8BD35D7F32BCEA6E8906FA3E660995590AE8, 0x245BD26FB01F101A761859DD1454C620B7A241C566CE3A876DAF9E1E3339B833, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (21529784, 6, 0x6CF9A87AF8672519EFD7442A0AD4C1C068C4545F19F09942EDAFD078609F029D, 0x79F17AF48CF7E30827CE3798416DF91EE953E47B2C45FA3623F01BA3B342E4A0, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (23741070, 6, 0x1779DAF4919C22CA225F3F323217EE0E65AC7258CADAFEF572EBF6C32B4D6301, 0x4613E696E2032B9FDCEB5C01BBD291C720728E46C5E1C329727EFAA73FF4BAB0, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (25052101, 6, 0x574167D7B34DECDAF8D41D628F331AC0A24C36B0812F3E29060ECCD3C837661B, 0xEDA57FBFC6C4ABF8A3B08C7EC924BBBC07C85A519F8530D69B39C990A303F5B0, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (28107732, 6, 0x946E05034F5FF0D3A7ACAC1919BBC6E51A9FC0665D49BA644FCF77E7CB46BFC4, 0x1141720D9825524B76BF6E3037E109FFBC50D90DB365B50F501ECC64FC87E4BF, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (28887586, 6, 0xE141E5C39C4DDD90464AEBCFA1E677C43BDA2BF37CBFDC335248658C061966FE, 0x0D4CAAF3D7BB88A0D8B411785EC6A0DE50D0279A6A0C46B59D24AEC536371F14, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (30756642, 6, 0xBC4E5553D0E00D1D38F29838EF2CBB75409FF01DA3052746A4D6A784473F5981, 0xADA468F97B8A77208EB86743270B77226FEA11339E354D6C174770A947BEB18A, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (31230686, 6, 0x20625737E5CE34DAA2830EF530E4430E65E425C1EFA071B09D32AB6E43DBADFD, 0xA7AA1EF25F4DDC50C7293B8B6CD74148826C8096353CCE2137AEFFC4F0FFB50A, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (31240777, 6, 0xE1977F2104B982EC439F1B5450DA07C9794C0FAC51E9938706B741166D057296, 0x9467C2EE23327319F39588ABEFC21EC01507FACF68633F2B365AFDDA38131A21, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (32635005, 6, 0x4B239CEE7CC085EFCE96A5FDE6D3DF1CE9984A50E4CDC5A03D350ED04D66F5AD, 0x77B7B36A70712A42FE2CB87BDE6F4692C06CCD61E824F319AE77DE795DCB9D6F, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (34896159, 6, 0xE234B62F69C6F40579D6F0021BB6A0B781EDF49CD502F1BFA359938A36F90CF2, 0x19E46B008EDCACB88F9B0648FB0739885F567AE4836AD8272E51D2826261FC76, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (36317887, 6, 0xC699FBF9E07E93CA9EBF58366AEAF0121A01D07786A0DFFDC9C90DE00CB7A4BB, 0xCB9A653773213C2498AF2B9FBC16571BB74236985768CD836DC9496BF8201930, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (37951796, 6, 0xDDC7116E58A3A889011482830C9F928CBE740A74809E9929839CF140E25CF722, 0x99D29739E843ED90979194D7FEE65EC09D25D20649FAB7CB27EB4E00B0F87DFD, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (42592720, 6, 0x911C56108482B9295374929245A854D25C461C24DDD37A9581B703953404F7A2, 0x0F13A45877B01525AEA79A6CDA504B3DB649876F78016895C93FA2421CBC6C90, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (42885742, 6, 0x96F6B4638D8E82C6E3A687D6E9F7DDA1DA15948E9AC4E8AEFE01EE81AD03B632, 0x4AEF7B6342896336B5FF82AB670569A0038585A1037F5588F9B15D75A94C5AA2, 5, 1)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (42986842, 6, 0x0666C06BA910B006B63A575DACE2FCAF5E7E4CEBC1F34F52962EA5756A7B4C96, 0x5E9A75BF0CDFB709A4EB49A75537AA80B7226EC9FF8BA5ED90B94AB2B28460C4, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (43244297, 1, 0x84B754BE16480AA6BDFD900E70F1F0760CC334B205CA16215CDF6A856FC0D196, 0xB78AC600E5596B02591762F490386403E4ACE0B18167EB5579E22B913866622F, NULL, 1)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (48326430, 6, 0xCEB73ED51E73333813B85AED59A2F3A26AF9A6EECD9A4D87552C59CBD0FDA8EA, 0xD1AFDBE03EFE8EFE231A3C64699B958B42147D3A11606CC9EA4134CA75B904B1, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (48769898, 6, 0x5C243293824A60A22C51037492134EFDDB07AF8E719F679CDECA1EC3BDF57E52, 0x584211B843195877177DC001923C3DC00951EB1D08D8ABEE3436AB2E52B3397D, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (49679923, 6, 0xB07BEC1582B2137412BCCFEF05C2765529059742E29E73D20EE5B4B0A8271A26, 0xDB6A4D1CA739C12B72C6AC3A2FB14B4BF7E6B4D8D7DE190513CDE533CEF0750F, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (52769239, 6, 0x3D560021521AA7F7A4104F9B418CFB3A0D00DE0C384BB16A83B2405CF0E98626, 0x6AD1DE9FFBBE365045CEB72A61FE9E21EF02B8EA5D80516BF37E707DD31B0A48, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (55508895, 6, 0x326038F1B6844B36FA265FBB71B5F56C75AAA531F4508E93BCA488E298CB2C0C, 0x909A54BF616441E7BFE2EC27385E1A13F40960822CD9C5539A5A7777A043F339, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (56048381, 6, 0x6401E532A565CFA9B2D2CDB6C7A9A28780BC771EEB26A4CB9185327AF47FBA5D, 0xE96ABDF6D2E6E9C3010AE8F28F67230CAC5B022634B043923882F4CA459BE49C, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (57655067, 6, 0x4A3D91646364D40C674DEA7C32FE840B18DCD9F35667974120411E4F5B297311, 0x487E715DFB4E1726D69AA41C3058E825B73016E77BCF55D7BAD33B4E72998DD1, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (58987643, 6, 0x10A36F45A1D1D19444016DCB65E4918667472E9378807A69072FB4EC4695490D, 0xF09663A7EF1461CDB78553E86C9A61F51EF5BC28AA56827D84C3E93D3DADF7F8, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (60407747, 6, 0x5915F995F6AC355DA7B3CF2B3CE558ACCD5B1F844779B5A07D5FAEECE3C73B3B, 0xF50F19355904D2A8C1382665542263F0950984B55EB1AF771F86396C79347389, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (62407929, 6, 0xF088B96C88CF83C57EF2A9F9775A06F037E789AA9B3C8EDA3B975AD5B2D6ED1C, 0xCE98475E74888A78018960D74A507D3A6496777E989C4E12D2AE18B21B2166E3, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (67510762, 6, 0x634FFB4FA9699B97BD39578036DEABF38E40D29DBF176A53F4E70A4C701FD46F, 0x1F6166C2139205E8008A1BA63B57B36826C56454AC28E1E52A68E9939BEF71CF, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (70736171, 6, 0xDD0CB7DBAB428C6116E8597595B99EBE39A1B7901ED7A55036F53B51DD988C9F, 0x248E26E6B481B55D8FE1C3DC290DF9F5794F856D8B277A802DB1F4B8EB569834, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (71537520, 6, 0x71EA90EFF5A3E6933EBB3D3C40C131722F575B58EBF9B40D2CF427D6A3EE1E63, 0xB6F22EA91CB4CE80C46F10EE44B444024496AE6425AB0089C500D37AE10F68F8, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (73042803, 6, 0xC8976E4BFA43565E8B40496873F7346D2294E2C890AAE1470DDDA3AA39ED6680, 0xA08A4553C52F2A581883DE00279052F7C2AFB47460E7338529B283A3BC9BB6E9, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (78070362, 6, 0xDD22FFF1C3CEFFD9C5528103AF03C360EBDD07436C5185F16148BB78BC6D8120, 0x09C8478B21CDBE6708A92BFF49BEDD3516054D6CD9D0C9220F5D220381957FCB, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (79666226, 6, 0x7E79D0504BA2EF3C134DDB79FB57C03E81BC884B32B93B86378AABC8571AD871, 0x8AFB0707F86037A09A1A4FB94E60D335B267FD3F59BF4F2FB54A77260A53ABB1, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (81514360, 6, 0xBAF71676D6E68F0169AB9FA6E93EEB498140CE713261425DCEFD6A99D9232EFB, 0x949B918A0C4D7E7A318FC92104455CE88D00A69A1C82A94AD5869DEE3829DA05, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (82475289, 6, 0x59E0F33F08C5DE222A4F72724C7131AF4D2F6A85673550115AA58AA2CF8AA46F, 0x2AAB32FDDDC9CBE434CABE8266D73E428965A5400DBB2C314BFA639EA971219C, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (83245512, 6, 0xB86AEBEF571C524EDA52917C526F8146B8EECBF7DBEE43B6692A298F7BE5981A, 0xF7C1E54DC96B3D06A60605D072C3D953CCB357EECF5A9B66D4866A0588993EA0, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (86625429, 6, 0x03C70CAF0936D2B01508BC1D3E70E8EC395E91592D18F148895B8F3075511FDC, 0x2FB338D4E079F1B93A8C5095DBB75F81A13EE3577B7BCC5670320330939C4195, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (87065384, 6, 0x04F5C28D812075E7DB6BB9D5490CF24462610EDE1E78F13617853D694FE13833, 0xE3304EC55AD7379622CAB6E40468A2D56C94B573383BEEFC5ADC64ECCF063EA0, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (88764278, 6, 0xB6443E115A02C69B0CD91A1ECAD72A8375735CB41234DEB4426622833DF21AF2, 0x0652BF4B5DD8417EEC72D01AC3C7C2FB204CB853745F3B7A8CFD265524C3B892, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (97745392, 6, 0xB47D020A0AD1FB57DFF65BE36DC37C924C648964CD047F95091906D648F62C95, 0xD21A9F17A3F3032B9EFA0AEBCE382E9297AE0C5D1805CF266C6B8E8069C22198, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (98130661, 6, 0xAF465BEFA1A2B19D2F5A62E457D683064730BD66DFBF2E380EB8F0FFA71B02DD, 0xEBD1E0534F03DEBC792175BA487410D3F75EEBE9953A41616FE0085044E72DCD, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (98467396, 6, 0xC3F5A6A482319DEFC500806054FA5E078E7B6DCAAD9EC8E4924B6E76B7ED4847, 0x9621BB96D16F396CE7AE0840EEEB1B20902C09588848E6382F38399725A54B8E, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (98788158, 6, 0xB6D181D6378B1F52E4864E8DEB288077880D57D34633B3D4C4CAAC02719A3294, 0x0BC2C3D8EF93E4574937E19CE0FC896CF9A56AE4165493985B50CE8E36ACA7FD, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (99933728, 6, 0xB7D26FA74841D9B574F21A6847ED73D8DCF813EEE1E44B943D73DCFA8CC46E4E, 0x36A767E79B302BC08DC47EE9F7446EF6E9DEDDDB75AF96A4D281E797D53AA072, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (41283123, 1, 0xFF60A930326DE816AFD812C3270AB36EB13430B8C0918B4C085281A8C784F3F7, 0x64D6CD20D4A0A65CE04D6EDE7021A32C4425CF89DE5E37AA371A739704AC8967, NULL, 1)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (123123213, 5, 0x417001A21B7F5E2C432F87DDDF614C1B0F977A0A5214E810270DAFD624C5B6CC, 0x9F8C0EB47C2897F482A92369DCACA49231AD7FD6BEE389B86C9B7B5F2F911851, 5, 1)
GO
INSERT [dbo].[IDIOMAS] ([idIdioma], [Nombre], [Default], [Habilitado]) VALUES (5, N'spanish', 0, 1)
INSERT [dbo].[IDIOMAS] ([idIdioma], [Nombre], [Default], [Habilitado]) VALUES (6, N'english', 0, 1)
INSERT [dbo].[IDIOMAS] ([idIdioma], [Nombre], [Default], [Habilitado]) VALUES (1007, N'portugues', 1, 1)
INSERT [dbo].[IDIOMAS] ([idIdioma], [Nombre], [Default], [Habilitado]) VALUES (1008, N'japones', 0, 0)
GO
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'accept_supplies_delivery')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'accepted')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'action_not_allowed')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'activity')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'add')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'add_products_to_list')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'addition')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'agreed_time_of_delivery')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'applied_discount')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'assign_permission')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'backup')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'backup_not_found')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'backups')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'birth_date')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'cancel_sale')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'cancelled')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'cancelled_by')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'cancelSale_Confirmation')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'cannot_delete_the_sysadmin_role')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'cannot_disable_the_only_enabled_language')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'categories')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'category')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'change_date')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'change_employee')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'change_language')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'change_password')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'change_type')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'changes')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'comment')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'comment_of_the_delivery')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'comment_of_the_request')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'completed')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'correct_login')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'create')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'create_new_language')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'create_replenishment_request')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'current_password_not_correct')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'customer')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'customers')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'data_restored_from_a_backup')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'database_unknown_error_occurred')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'date')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'default')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'default_language_changed')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'delete')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'deletion')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'disable')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'discount')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'dni')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'dvh')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'dvv')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'dvv_entry_not_found')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'email')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'employee')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'employee_who_received_the_delivery')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'employees')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'enable')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'enabled')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'end_request')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'english')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'enter_a_supplier_first')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'enter_product_categories_first')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'entity')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'error')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'error_connecting_to_the_database_occurred')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'export')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'field_cannot_be_empty')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'filter_by_category')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'filter_by_customer')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'filter_by_employee')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'filter_by_seller')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'filter_by_severity')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'finished')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'full_name')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'incorrect_login')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'information')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'input_currentpassword')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'input_newpassword')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'input_password')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'input_repeatpassword')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'integrity_check_failed_unauthorized_addition_or_deletion_longversion')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'integrity_check_failed_unauthorized_addition_or_deletion_shortversion')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'integrity_check_failed_unauthorized_update_longversion')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'integrity_check_failed_unauthorized_update_shortversion')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'intro_explanation')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'invalid_input')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'is_perishable')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'item_alreadyexists')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'japones')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'language')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'language_active_status_updated')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'language_created')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'languages')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'logged_out')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'login')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'logout')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'low_stock_warning_for_this_product')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'low_stock_warning_updated')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'make_backup')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'make_sale')
GO
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'makeSale_Confirmation')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'manage_backupsPERMISSION')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'modify')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'name')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'new_language')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'no')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'number_of_purchases')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'only_sysadmins_can_manage_sysadmins')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'password')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'password_for_employees_note')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'password_has_been_changed')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'passwords_dont_match')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'pending')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'pending_replenishment_requests')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'percentage')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'perishable')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_base')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_categoriesREAD')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_customersREAD')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_delete')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_discountsSTART')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_employeesCREATE')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_employeesREAD')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_languagesMANAGE')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_languagesREAD')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_permissionsCHANGE')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_permissionsREAD')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_productsREAD')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_replenishmentEND_REQUEST')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_replenishmentREAD')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_replenishmentREQUEST')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_roleREAD')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_salesRecordsEXPORT')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_salesRecordsREAD')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_suppliersREAD')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_systemlogsREAD')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_translationsMANAGE')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_translationsREAD')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_update')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permission_view')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'permissions')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'phone_number')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'portugues')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'price')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'price_to_pay')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'product')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'products')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'products_suppliers_and_pending_replenishment_requests_will_be_deleted_warning')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'quantity')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'quantity_in_shelves')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'quantity_in_warehouses')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'quantity_restocked')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'quantityToGet')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'quantityToPay')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'real_time_of_delivery')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'registered_customer')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'registered_products_count')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'registration_date')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'reject_supplies_delivery')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'rejected')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'related_info')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'remove_permission')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'remove_products_from_list')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'repeat_password')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'replenished_products')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'replenishment')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'replenishment_delivery_details')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'replenishment_reports')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'replenishment_request_details')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'replenishment_request_ended')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'replenishment_requested')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'request')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'request_to_a_supplier')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'requested_products')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'requesting_employee')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'restock_shelves')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'restocked_shelves')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'restore_from_backup')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'restore_from_backup_confirmation')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'role')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'roles')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'sale_details')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'sale_has_been_cancelled')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'sale_has_been_made')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'sales')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'sales_records')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'select_one_from_the_list')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'seller')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'severity')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'show_by_default')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'signup')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'spanish')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'start')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'started')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'state')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'stop')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'successful_addition')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'successful_deletion')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'successful_update')
GO
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'supermarket')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'supplier')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'suppliers')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'supplies_delivery_reports')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'surname')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'system_logs')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'The_PDF_report_has_been_saved_to_the_downloads_folder')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'the_text_will_be_used_as_an_identifier')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'there_are_no_products')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'there_are_no_products_from_this_category')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'there_are_no_products_in_shelves')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'there_are_no_products_in_warehouses')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'there_has_to_be_at_least_one_sysadmin')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'theres_still_employees_with_this_role')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'theres_still_products_left_to_sell')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'time_of_request')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'translation')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'translations')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'unit_price')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'update')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'updation')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'view_changes')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'view_replenishment_delivery_details')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'view_replenishment_request_details')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'view_sale_details')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'view_translations')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'warning')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'wont_modify_existing_DNIs')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'words')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'yes')
GO
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'base', 1, N'permission_base')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'cancelSale', 0, N'cancel_sale')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'categoriesCREATE', 0, N'create')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'categoriesDELETE', 0, N'permission_delete')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'categoriesREAD', 1, N'permission_categoriesREAD')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'categoriesUPDATE', 0, N'permission_update')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'customersCREATE', 0, N'create')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'customersDELETE', 0, N'permission_delete')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'customersREAD', 1, N'permission_customersREAD')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'customersUPDATE', 0, N'permission_update')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'discountsMODIFY', 0, N'permission_discountsSTART')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'employeesCREATE', 0, N'create')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'employeesDELETE', 0, N'permission_delete')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'employeesREAD', 1, N'permission_employeesREAD')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'employeesUPDATE', 0, N'permission_update')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'languagesMANAGE', 0, N'permission_languagesMANAGE')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'languagesREAD', 1, N'permission_languagesREAD')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'makeSale', 0, N'make_sale')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'permissions', 1, N'permission_permissionsREAD')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'permissionsCHANGE', 0, N'permission_permissionsCHANGE')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'productsCREATE', 0, N'create')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'productsDELETE', 0, N'permission_delete')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'productsREAD', 1, N'permission_productsREAD')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'productsREPLENISH', 0, N'restock_shelves')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'productsUPDATE', 0, N'permission_update')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'replenishmentEND_REQUEST', 0, N'permission_replenishmentEND_REQUEST')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'replenishmentREAD', 1, N'permission_replenishmentREAD')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'replenishmentREQUEST', 0, N'permission_replenishmentREQUEST')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'roleCREATE', 0, N'create')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'roleDELETE', 0, N'permission_delete')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'roleREAD', 1, N'permission_roleREAD')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'roleUPDATE', 0, N'permission_update')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'sales', 1, N'sales')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'salesRecordEXPORT', 0, N'permission_salesRecordsEXPORT')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'salesRecordREAD', 1, N'permission_salesRecordsREAD')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'suppliersCREATE', 0, N'create')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'suppliersDELETE', 0, N'permission_delete')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'suppliersREAD', 1, N'permission_suppliersREAD')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'suppliersUPDATE', 0, N'permission_update')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'translationsMANAGE', 0, N'permission_translationsMANAGE')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'translationsREAD', 1, N'permission_translationsREAD')
GO
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'base', N'categoriesREAD')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'base', N'customersREAD')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'base', N'employeesREAD')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'base', N'languagesREAD')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'base', N'permissions')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'base', N'productsREAD')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'base', N'replenishmentREAD')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'base', N'roleREAD')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'base', N'sales')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'base', N'suppliersREAD')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'base', N'translationsREAD')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'categoriesREAD', N'categoriesCREATE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'categoriesREAD', N'categoriesDELETE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'categoriesREAD', N'categoriesUPDATE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'categoriesREAD', N'discountsMODIFY')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'customersREAD', N'customersCREATE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'customersREAD', N'customersDELETE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'customersREAD', N'customersUPDATE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'employeesREAD', N'employeesCREATE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'employeesREAD', N'employeesDELETE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'employeesREAD', N'employeesUPDATE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'languagesREAD', N'languagesMANAGE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'permissions', N'permissionsCHANGE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'productsREAD', N'productsCREATE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'productsREAD', N'productsDELETE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'productsREAD', N'productsREPLENISH')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'productsREAD', N'productsUPDATE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'replenishmentREAD', N'replenishmentEND_REQUEST')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'replenishmentREAD', N'replenishmentREQUEST')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'roleREAD', N'roleCREATE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'roleREAD', N'roleDELETE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'roleREAD', N'roleUPDATE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'sales', N'makeSale')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'sales', N'salesRecordREAD')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'salesRecordREAD', N'cancelSale')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'salesRecordREAD', N'salesRecordEXPORT')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'suppliersREAD', N'suppliersCREATE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'suppliersREAD', N'suppliersDELETE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'suppliersREAD', N'suppliersUPDATE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'translationsREAD', N'translationsMANAGE')
GO
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 3)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 4)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 7)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 8)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 12)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 13)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 14)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 1014)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'cancelSale', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'cancelSale', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'cancelSale', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesCREATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesCREATE', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesCREATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesDELETE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesDELETE', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesDELETE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesREAD', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesREAD', 3)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesREAD', 4)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesREAD', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesREAD', 14)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesUPDATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesUPDATE', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesUPDATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'customersCREATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'customersCREATE', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'customersCREATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'customersDELETE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'customersDELETE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'customersREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'customersREAD', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'customersREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'customersUPDATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'customersUPDATE', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'customersUPDATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'discountsMODIFY', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'discountsMODIFY', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'discountsMODIFY', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesCREATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesCREATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesDELETE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesUPDATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'languagesMANAGE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'languagesMANAGE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'languagesREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'languagesREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'makeSale', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'makeSale', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'makeSale', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'permissions', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'permissions', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'permissionsCHANGE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'permissionsCHANGE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsCREATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsCREATE', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsCREATE', 3)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsCREATE', 4)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsCREATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsDELETE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsDELETE', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsDELETE', 3)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsDELETE', 4)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsDELETE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREAD', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREAD', 3)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREAD', 4)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREAD', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREPLENISH', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREPLENISH', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREPLENISH', 3)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREPLENISH', 4)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREPLENISH', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsUPDATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsUPDATE', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsUPDATE', 3)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsUPDATE', 4)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsUPDATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'replenishmentEND_REQUEST', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'replenishmentEND_REQUEST', 3)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'replenishmentEND_REQUEST', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'replenishmentREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'replenishmentREAD', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'replenishmentREAD', 3)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'replenishmentREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'replenishmentREQUEST', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'replenishmentREQUEST', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'replenishmentREQUEST', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleCREATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleCREATE', 4)
GO
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleCREATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleDELETE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleDELETE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleREAD', 4)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleUPDATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleUPDATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'sales', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'sales', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'sales', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'sales', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'salesRecordEXPORT', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'salesRecordEXPORT', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'salesRecordREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'salesRecordREAD', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'salesRecordREAD', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'salesRecordREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersCREATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersCREATE', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersCREATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersDELETE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersDELETE', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersDELETE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersREAD', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersREAD', 3)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersUPDATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersUPDATE', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersUPDATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsMANAGE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsMANAGE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsREAD', 6)
GO
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (12312, N't', N'tt', CAST(N'2022-05-26' AS Date), N't')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (18280518, N'a', N'a', CAST(N'2022-05-26' AS Date), N'a')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (41283123, N'franco', N'volante', CAST(N'2022-06-21' AS Date), N'aodnsoqiw')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (42151212, N'toti', N'erbin', CAST(N'2022-05-26' AS Date), N'toti')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (42885741, N't', N't', CAST(N'2022-05-26' AS Date), N't')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (42885742, N't', N't', CAST(N'2022-05-26' AS Date), N't')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (123123213, N't', N'tt', CAST(N'2022-06-29' AS Date), N't')
GO
SET IDENTITY_INSERT [dbo].[ROLES] ON 

INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (1, N'Gerente', 1, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (2, N'Jefe comercial', 1, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (3, N'Receptor compras', 1, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (4, N'Repositor', 1, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (5, N'Cajero', 1, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (6, N'Administrador del Sistema', 1, 1)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (7, N'prueba', 0, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (8, N'prueba1', 0, 0)
SET IDENTITY_INSERT [dbo].[ROLES] OFF
GO
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'accept_supplies_delivery', N'Aceptar entrega de productos')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'accepted', N'Aceptado')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'action_not_allowed', N'Acción no permitida. Tu rol de empleado no tiene el permiso para realizar esta acción. Si crees que esto es un error, comuníquese con un administrador del sistema.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'activity', N'Actividad')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'add', N'Agregar')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'add_products_to_list', N'Añadir productos a la lista')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'addition', N'Adición')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'agreed_time_of_delivery', N'Fecha de entrega acordada')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'applied_discount', N'Descuento aplicado')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'assign_permission', N'Asignar permiso al rol')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'backup', N'Backup')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'backup_not_found', N'El archivo de backup no ha sido encontrado en el sistema. Por favor, elija otro backup para restaurar o comuníquese con un administrador del sistema.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'backups', N'Backups')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'birth_date', N'Fecha de nacimiento')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'cancel_sale', N'Cancelar venta')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'cancelled', N'Cancelada')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'cancelled_by', N'Cancelada por')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'cancelSale_Confirmation', N'¿Está seguro de querer cancelar la venta?')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'cannot_delete_the_sysadmin_role', N'No se puede eliminar este rol.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'cannot_disable_the_only_enabled_language', N'No se puede deshabilitar el único idioma habilitado.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'categories', N'Categorias')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'category', N'Categoría')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'change_date', N'Fecha de cambio')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'change_employee', N'Empleado que realizó el cambio')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'change_language', N'Cambiar Idioma')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'change_password', N'Cambiar Contraseña')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'change_type', N'Tipo de cambio')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'changes', N'Cambios')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'comment', N'Comentario')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'comment_of_the_delivery', N'Comentario de la entrega')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'comment_of_the_request', N'Comentario de la solicitud')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'completed', N'Completada')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'correct_login', N'Inicio de sesión correcto.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'create', N'Crear')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'create_new_language', N'Crear un idioma')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'create_replenishment_request', N'Generar solicitud de reabastecimiento')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'current_password_not_correct', N'La contraseña actual no es correcta.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'customer', N'Cliente')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'customers', N'Clientes')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'data_restored_from_a_backup', N'Los datos han sido restaurados de un backup.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'database_unknown_error_occurred', N'Un error desconocido ha ocurrido al conectarse con la base de datos. Si esto sigue ocurriendo, por favor comuníquese con un administrador del sistema.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'date', N'Fecha')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'default', N'Por defecto')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'default_language_changed', N'Idioma por defecto cambiado.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'delete', N'Eliminar')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'deletion', N'Eliminación')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'disable', N'Deshabilitar')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'discount', N'Descuento')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'dni', N'DNI')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'dvh', N'DVH')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'dvv', N'DVV')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'dvv_entry_not_found', N'No se ha encontrado el registro digito verificador vertical.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'email', N'Email')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'employee', N'Empleado')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'employee_who_received_the_delivery', N'Empleado que recibió la entrega')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'employees', N'Empleados')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'enable', N'Habilitar')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'enabled', N'Habilitado')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'end_request', N'Terminar solicitud')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'english', N'Inglés')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'enter_a_supplier_first', N'Primero ingresa a un proveedor al sistema.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'enter_product_categories_first', N'Primero ingresa una categoría de producto.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'entity', N'Entidad')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'error', N'Error')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'error_connecting_to_the_database_occurred', N'Ocurrió un error al conectarse con la base de datos. Compruebe su conexión a internet o comuníquese con un administrador del sistema.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'export', N'Exportar')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'field_cannot_be_empty', N'El campo no puede estar vacío.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'filter_by_category', N'Filtrar por categoria')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'filter_by_customer', N'Filtrar por cliente')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'filter_by_employee', N'Filtrar por empleado')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'filter_by_seller', N'Filtrar por vendedor')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'filter_by_severity', N'Filtrar por severidad')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'finished', N'Terminada')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'full_name', N'Nombre completo')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'incorrect_login', N'Inicio de sesión incorrecto.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'information', N'Información')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'input_currentpassword', N'Ingrese su contraseña actual')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'input_newpassword', N'Ingrese la contraseña nueva')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'input_password', N'Ingrese una contraseña')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'input_repeatpassword', N'Repita la contraseña nueva')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'integrity_check_failed_unauthorized_addition_or_deletion_longversion', N'La verificación de la integridad de los datos ha fallado. Se ha añadido o eliminado información de forma externa al sistema. Se recomienda restaurar los datos de un backup.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'integrity_check_failed_unauthorized_addition_or_deletion_shortversion', N'La verificación de la integridad de los datos ha fallado. Se ha añadido o eliminado información de forma externa al sistema.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'integrity_check_failed_unauthorized_update_longversion', N'La verificación de la integridad de los datos ha fallado. Se ha modificado información de forma externa al sistema. Se recomienda restaurar los datos de un backup.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'integrity_check_failed_unauthorized_update_shortversion', N'La verificación de la integridad de los datos ha fallado. Se ha modificado información de forma externa al sistema.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'intro_explanation', N'Para empezar a utilizar el programa, ingresá tu información. Serás el primer 
gerente en ser cargado al sistema y tendrás los permisos para gestionar 
toda la empresa. No te preocupes, podrás cargar más empleados una vez que
hayas iniciado sesión.
')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'invalid_input', N'El texto ingresado no está en un formato correcto.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'is_perishable', N'Perecedero')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'item_alreadyexists', N'El item ya existe.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'language', N'Idioma')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'language_active_status_updated', N'Se modificó el estado Habilitado de un idioma.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'language_created', N'Idioma creado.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'languages', N'Idiomas')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'logged_out', N'Cerró sesión')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'login', N'Iniciar Sesion')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'logout', N'Cerrar Sesión')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'low_stock_warning_for_this_product', N'Advertencia de bajo stock para este producto')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'low_stock_warning_updated', N'Advertencia de bajo stock actualizada')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'make_backup', N'Realizar backup')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'make_sale', N'Realizar Venta')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'makeSale_Confirmation', N'¿Está seguro de querer realizar la venta?')
GO
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'manage_backupsPERMISSION', N'Administrar backups')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'modify', N'Modificar')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'name', N'Nombre')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'new_language', N'Nuevo idioma')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'no', N'No')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'number_of_purchases', N'Cantidad de compras')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'only_sysadmins_can_manage_sysadmins', N'Sólo empleados con un rol Administrador del Sistema pueden manejar el estado de Administrador del Sistema de los empleados.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'password', N'Contraseña')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'password_for_employees_note', N'El campo de Contraseña se usará sólo cuando se agregan nuevos empleados. 
Se recomienda que el nuevo empleado cambie su contraseña de inicio de sesión
la próxima vez que utilice el sistema.
')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'password_has_been_changed', N'La contraseña se ha cambiado.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'passwords_dont_match', N'Las contraseñas no coinciden.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'pending', N'Pendiente')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'pending_replenishment_requests', N'Solicitudes de Reabastecimiento pendientes')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'percentage', N'Porcentaje')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'perishable', N'Perecedero')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission', N'Permiso')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_base', N'Permiso base')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_categoriesREAD', N'Ver Categorías')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_customersREAD', N'Ver Clientes')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_delete', N'Eliminar registros')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_discountsSTART', N'Modificar descuento')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_employeesCREATE', N'Crear empleados')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_employeesREAD', N'Ver Empleados')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_languagesMANAGE', N'Administrar idiomas')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_languagesREAD', N'Ver idiomas')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_permissionsCHANGE', N'Cambiar permisos')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_permissionsREAD', N'Ver Permisos')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_productsREAD', N'Ver Productos')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_replenishmentEND_REQUEST', N'Terminar solicitudes')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_replenishmentREAD', N'Ver Informes de Reabastecimiento')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_replenishmentREQUEST', N'Solicitar Reabastecimiento')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_roleREAD', N'Ver Roles')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_salesRecordsEXPORT', N'Exportar registros')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_salesRecordsREAD', N'Ver registros de ventas')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_suppliersREAD', N'Ver Proveedores')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_systemlogsREAD', N'Ver Bitácora')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_translationsMANAGE', N'Administrar traducciones')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_translationsREAD', N'Ver traducciones')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_update', N'Actualizar información')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_view', N'Ver información')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permissions', N'Permisos')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'phone_number', N'Teléfono')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'price', N'Importe')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'price_to_pay', N'Importe a pagar')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'product', N'Producto')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'products', N'Productos')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'products_suppliers_and_pending_replenishment_requests_will_be_deleted_warning', N'Los productos, los proveedores y los informes de reabastecimiento pendientes asociados a esta categoría se van a eliminar. ¿Está seguro de continuar?')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'quantity', N'Cantidad')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'quantity_in_shelves', N'Cantidad en góndolas')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'quantity_in_warehouses', N'Cantidad en almacenes')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'quantity_restocked', N'Cantidad repuesta')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'quantityToGet', N'Cantidad a llevar')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'quantityToPay', N'Cantidad a Pagar')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'real_time_of_delivery', N'Fecha de entrega real')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'registered_customer', N'Cliente registrado')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'registered_products_count', N'Cantidad de Productos')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'registration_date', N'Fecha de registro')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'reject_supplies_delivery', N'Rechazar entrega de productos')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'rejected', N'Rechazado')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'related_info', N'Información asociada')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'remove_permission', N'Remover permiso del rol')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'remove_products_from_list', N'Remover productos de la lista')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'repeat_password', N'Repita la contraseña')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'replenished_products', N'Productos reabastecidos')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'replenishment', N'Reabastecimiento')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'replenishment_delivery_details', N'Detalles de la entrega de reabastecimiento')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'replenishment_reports', N'Informes de Reabastecimiento')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'replenishment_request_details', N'Detalles de la solicitud de reabastecimiento')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'replenishment_request_ended', N'Se terminó una petición de reabastecimiento.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'replenishment_requested', N'Se solicitó reabastecimiento.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'request', N'Solicitar')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'request_to_a_supplier', N'Solicitar productos a un proveedor')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'requested_products', N'Productos solicitados')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'requesting_employee', N'Empleado solicitante')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'restock_shelves', N'Reponer góndolas')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'restocked_shelves', N'Góndolas reabastecidas')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'restore_from_backup', N'Restaurar de un backup')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'restore_from_backup_confirmation', N'¿Está seguro de querer restaurar los datos? Los datos no incluidos en este backup se van a perder. Se cerrará su sesión actual.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'role', N'Rol')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'roles', N'Roles')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'sale_details', N'Detalles de venta')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'sale_has_been_cancelled', N'La venta se ha cancelado.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'sale_has_been_made', N'Se ha realizado la venta.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'sales', N'Ventas')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'sales_records', N'Registros de Ventas')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'select_one_from_the_list', N'Primero selecciona a uno de la lista.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'seller', N'Vendedor')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'severity', N'Severidad')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'show_by_default', N'Mostrar por defecto')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'signup', N'Registrarse')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'spanish', N'Español')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'start', N'Iniciar')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'started', N'Iniciado')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'state', N'Estado')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'stop', N'Cancelar')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'successful_addition', N'Se añadio correctamente.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'successful_deletion', N'Se ha eliminado correctamente.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'successful_update', N'Se ha modificado correctamente.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'supermarket', N'Supermercado')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'supplier', N'Proveedor')
GO
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'suppliers', N'Proveedores')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'supplies_delivery_reports', N'Informes de Entrega')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'surname', N'Apellido')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'system_logs', N'Bitácora')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'The_PDF_report_has_been_saved_to_the_downloads_folder', N'El reporte en PDF ha sido guardado en la carpeta de descargas.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'the_text_will_be_used_as_an_identifier', N'El texto va a ser utilizado como el nombre identificador del nuevo idioma.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'there_are_no_products', N'No hay productos registrados. Primero registrelos y después genere el informe.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'there_are_no_products_from_this_category', N'No hay productos registrados de esta categoría. Primero registrelos y después genere el informe de entrega.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'there_are_no_products_in_shelves', N'No hay productos en góndolas, por lo que no se puede realizar una venta.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'there_are_no_products_in_warehouses', N'No hay productos en almacenes, por lo que no se puede reponer en góndolas.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'there_has_to_be_at_least_one_sysadmin', N'Tiene que haber un minimo de un Administrador del Sistema.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'theres_still_employees_with_this_role', N'Todavía hay empleados con este rol asignado.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'theres_still_products_left_to_sell', N'Todavía hay productos que no se han vendido.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'time_of_request', N'Fecha de solicitud')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'translation', N'Traduccion')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'translations', N'Traducciones')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'unit_price', N'Precio unitario')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'update', N'Actualizar')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'updation', N'Modificación')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'view_changes', N'Ver cambios')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'view_replenishment_delivery_details', N'Ver los detalles de la entrega')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'view_replenishment_request_details', N'Ver los detalles de la solicitud')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'view_sale_details', N'Ver detalles de la venta')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'view_translations', N'Ver traducciones')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'warning', N'Advertencia')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'wont_modify_existing_DNIs', N'No se modificarán DNIs ya ingresados.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'words', N'Palabras')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'yes', N'Sí')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'accept_supplies_delivery', N'Accept supply delivery')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'accepted', N'Accepted')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'action_not_allowed', N'Action not allowed. Your role as an employee doesn''t have permission to do this. Let a System Administrator know if you think this is an error.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'activity', N'Activity')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'add', N'Add')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'add_products_to_list', N'Add products to the list')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'addition', N'Addition')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'agreed_time_of_delivery', N'Agreed time of delivery')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'applied_discount', N'Applied discount')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'assign_permission', N'Assign permission to this role')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'backup', N'Backup')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'backup_not_found', N'The backup file has not been found. Please, choose another backup to restore or notify a System Administrator.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'backups', N'Backups')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'birth_date', N'Birth date')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'cancel_sale', N'Cancel sale')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'cancelled', N'Cancelled')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'cancelled_by', N'Cancelled by')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'cancelSale_Confirmation', N'Are you sure you want to cancel the sale?')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'cannot_delete_the_sysadmin_role', N'This role cannot be deleted.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'cannot_disable_the_only_enabled_language', N'Cannot disable the only enabled language.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'categories', N'Categories')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'category', N'Category')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'change_date', N'Change date')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'change_employee', N'Employee who made the change')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'change_language', N'Change Language')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'change_password', N'Change Password')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'change_type', N'Change type')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'changes', N'Changes')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'comment', N'Comment')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'comment_of_the_delivery', N'Comment of the delivery')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'comment_of_the_request', N'Comment of the request')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'completed', N'Completed')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'correct_login', N'Correct login.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'create', N'Create')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'create_new_language', N'Create new language')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'create_replenishment_request', N'Create supplies replenishment request')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'current_password_not_correct', N'The current password is not correct.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'customer', N'Customer')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'customers', N'Customers')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'data_restored_from_a_backup', N'Data has been restored from a backup.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'database_unknown_error_occurred', N'An unknown error has occurred when talking to the database. If this keeps happening, ask a system administrator for help.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'date', N'Date')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'default', N'Default')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'default_language_changed', N'Default language changed.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'delete', N'Delete')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'deletion', N'Deletion')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'disable', N'Disable')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'discount', N'Discount')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'dni', N'DNI')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'dvh', N'DVH')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'dvv', N'DVV')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'dvv_entry_not_found', N'The dvv entry has not been found.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'email', N'Email')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'employee', N'Employee')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'employee_who_received_the_delivery', N'Employee who received the delivery')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'employees', N'Employees')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'enable', N'Enable')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'enabled', N'Enabled')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'end_request', N'End request')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'english', N'English')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'enter_a_supplier_first', N'Enter a supplier first.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'enter_product_categories_first', N'Enter a product category first.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'entity', N'Entity')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'error', N'Error')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'error_connecting_to_the_database_occurred', N'There''s been an error connecting to the database. Check your internet connection or ask a system administrator for help.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'export', N'Export')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'field_cannot_be_empty', N'This field cannot be empty.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'filter_by_category', N'Filter by category')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'filter_by_customer', N'Filter by customer')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'filter_by_employee', N'Filter by employee')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'filter_by_seller', N'Filter by seller')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'filter_by_severity', N'Filter by severity')
GO
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'finished', N'Finished')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'full_name', N'Full name')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'incorrect_login', N'Incorrect login credentials.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'information', N'Information')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'input_currentpassword', N'Enter your current password')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'input_newpassword', N'Enter your new password')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'input_password', N'Enter a password')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'input_repeatpassword', N'Repeat your new password')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'integrity_check_failed_unauthorized_addition_or_deletion_longversion', N'The integrity check of the data has failed. Information has been added or deleted externally from the system. It is recommended to restore the data from a backup.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'integrity_check_failed_unauthorized_addition_or_deletion_shortversion', N'The integrity check of the data has failed. Information has been added or deleted externally from the system.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'integrity_check_failed_unauthorized_update_longversion', N'The integrity check of the data has failed. Information has been modified externally from the system. It is recommended to restore the data from a backup.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'integrity_check_failed_unauthorized_update_shortversion', N'The integrity check of the data has failed. Information has been modified externally from the system.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'intro_explanation', N'Enter your information to start using this software. You will be the first manager in the system and you will be able to manage this software. Don''t worry, you will be able to create more employees once you have logged in.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'invalid_input', N'The input is not in a valid format.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'is_perishable', N'Perishable')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'item_alreadyexists', N'This item already exists.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'language', N'Language')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'language_active_status_updated', N'A language active status has been updated.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'language_created', N'Language created.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'languages', N'Languages')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'logged_out', N'Logged out')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'login', N'Log in')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'logout', N'Log out')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'low_stock_warning_for_this_product', N'Low-stock warning for this product')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'low_stock_warning_updated', N'Low-stock warning updated')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'make_backup', N'Make backup')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'make_sale', N'Make a Sale')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'makeSale_Confirmation', N'Are you sure you want to make the sale?')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'manage_backupsPERMISSION', N'Manage backups')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'modify', N'Modify')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'name', N'Name')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'new_language', N'New language')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'no', N'No')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'number_of_purchases', N'Number of purchases')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'only_sysadmins_can_manage_sysadmins', N'Only employees with a System Administrator role can manage the System Administrator status of the employees.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'password', N'Password')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'password_for_employees_note', N'The password field is only used when creating new employees. It''s recommended for the new employee to change the assigned password the first time he/she logs in.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'password_has_been_changed', N'The password has been changed.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'passwords_dont_match', N'The passwords don''t match.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'pending', N'Pending')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'pending_replenishment_requests', N'Pending Replenishment Requests')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'percentage', N'Percentage')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'perishable', N'Perishable')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission', N'Permission')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_base', N'Base permission')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_categoriesREAD', N'View Categories')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_customersREAD', N'View Customers')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_delete', N'Delete records')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_discountsSTART', N'Modify discount')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_employeesCREATE', N'Create employees')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_employeesREAD', N'View Employees')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_languagesMANAGE', N'Manage languages')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_languagesREAD', N'View languages')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_permissionsCHANGE', N'Change permissions')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_permissionsREAD', N'View Permissions')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_productsREAD', N'View Products')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_replenishmentEND_REQUEST', N'End requests')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_replenishmentREAD', N'View Replenishment Reports')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_replenishmentREQUEST', N'Request Supplies Replenishment')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_roleREAD', N'View Roles')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_salesRecordsEXPORT', N'Export records')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_salesRecordsREAD', N'View sales records')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_suppliersREAD', N'View Suppliers')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_systemlogsREAD', N'View System Logs')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_translationsMANAGE', N'Manage translations')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_translationsREAD', N'View translations')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_update', N'Update information')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permission_view', N'View information')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'permissions', N'Permissions')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'phone_number', N'Phone number')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'price', N'Price')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'price_to_pay', N'Price to pay')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'product', N'Product')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'products', N'Products')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'products_suppliers_and_pending_replenishment_requests_will_be_deleted_warning', N'The products, the suppliers and the pending replenishment requests of this category will be deleted. Are you sure you want to continue?')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'quantity', N'Quantity')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'quantity_in_shelves', N'Quantity in shelves')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'quantity_in_warehouses', N'Quantity in warehouses')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'quantity_restocked', N'Quantity restocked')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'quantityToGet', N'Quantity to get')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'quantityToPay', N'Quantity to pay')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'real_time_of_delivery', N'Real time of delivery')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'registered_customer', N'Registered customer')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'registered_products_count', N'Registered products')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'registration_date', N'Registration date')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'reject_supplies_delivery', N'Reject supply delivery')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'rejected', N'Rejected')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'related_info', N'Related information')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'remove_permission', N'Remove permission from this role')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'remove_products_from_list', N'Remove products from the list')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'repeat_password', N'Repeat the password')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'replenished_products', N'Replenished products')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'replenishment', N'Replenishment')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'replenishment_delivery_details', N'Replenishment delivery details')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'replenishment_reports', N'Replenishment Reports')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'replenishment_request_details', N'Replenishment request details')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'replenishment_request_ended', N'A replenishment request has been finished.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'replenishment_requested', N'Replenishment requested.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'request', N'Request')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'request_to_a_supplier', N'Request to a supplier')
GO
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'requested_products', N'Requested products')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'requesting_employee', N'Requesting employee')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'restock_shelves', N'Restock Shelves')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'restocked_shelves', N'Restocked shelves')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'restore_from_backup', N'Restore from backup')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'restore_from_backup_confirmation', N'Are you sure you want to restore from a backup? Data that isn''t included in the backup will be lost. You will be logged out of the system. ')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'role', N'Role')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'roles', N'Roles')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'sale_details', N'Sale details')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'sale_has_been_cancelled', N'The sale has been cancelled.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'sale_has_been_made', N'The sale has been made.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'sales', N'Sales')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'sales_records', N'Sales Records')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'select_one_from_the_list', N'Select one from the list.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'seller', N'Seller')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'severity', N'Severity')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'show_by_default', N'Show by default')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'signup', N'Sign Up')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'spanish', N'Spanish')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'start', N'Start')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'started', N'Started')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'state', N'State')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'stop', N'Stop')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'successful_addition', N'Successful addition.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'successful_deletion', N'Successful deletion.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'successful_update', N'Successful update.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'supermarket', N'Supermarket')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'supplier', N'Supplier')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'suppliers', N'Suppliers')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'supplies_delivery_reports', N'Supplies delivery reports')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'surname', N'Surname')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'system_logs', N'System logs')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'The_PDF_report_has_been_saved_to_the_downloads_folder', N'The PDF report has been saved to the downloads folder')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'the_text_will_be_used_as_an_identifier', N'The text will be used as an identifier for the new language.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'there_are_no_products', N'There are no products. First add them in the Products section and then create the replenishment report.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'there_are_no_products_from_this_category', N'There are no products from this category. First add them in the Products section and then create the supplies delivery report.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'there_are_no_products_in_shelves', N'There are no products in shelves, so making a sale is not possible.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'there_are_no_products_in_warehouses', N'There are no products in the warehouses, so restocking shelves is not possible.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'there_has_to_be_at_least_one_sysadmin', N'There has to be at least one System Administrator.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'theres_still_employees_with_this_role', N'There''s still employees with this role.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'theres_still_products_left_to_sell', N'There''s still products left to sell.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'time_of_request', N'Time of request')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'translation', N'Translation')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'translations', N'Translations')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'unit_price', N'Unit price')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'update', N'Update')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'updation', N'Updation')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'view_changes', N'View changes')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'view_replenishment_delivery_details', N'View the delivery details')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'view_replenishment_request_details', N'View the request details')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'view_sale_details', N'View the sale details')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'view_translations', N'View translations')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'warning', N'Warning')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'wont_modify_existing_DNIs', N'It''s not possible to modify DNIs.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'words', N'Words')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'yes', N'Yes')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1007, N'accept_supplies_delivery', N'Aceitar a entrega de produtos')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1007, N'accepted', N'açeptao')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1007, N'action_not_allowed', N'aa')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1007, N'birth_date', N'Fecha de nacimientooooooo')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1007, N'cancelled', N'')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1007, N'employees', N'Empleaçao')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1007, N'yes', N'')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1007, N'activity', N'activitat')
GO
ALTER TABLE [dbo].[PERMISOS_PERMISOS]  WITH CHECK ADD  CONSTRAINT [FK_PERMISOS_PERMISOS_PERMISOS] FOREIGN KEY([NombrePermisoHijo])
REFERENCES [dbo].[PERMISOS] ([NombrePermiso])
GO
ALTER TABLE [dbo].[PERMISOS_PERMISOS] CHECK CONSTRAINT [FK_PERMISOS_PERMISOS_PERMISOS]
GO
ALTER TABLE [dbo].[PERMISOS_PERMISOS]  WITH CHECK ADD  CONSTRAINT [FK_PERMISOS_PERMISOS_PERMISOS1] FOREIGN KEY([NombrePermisoPadre])
REFERENCES [dbo].[PERMISOS] ([NombrePermiso])
GO
ALTER TABLE [dbo].[PERMISOS_PERMISOS] CHECK CONSTRAINT [FK_PERMISOS_PERMISOS_PERMISOS1]
GO
ALTER TABLE [dbo].[PERMISOS_ROL]  WITH CHECK ADD  CONSTRAINT [FK_PERMISOS_ROL_PERMISOS] FOREIGN KEY([NombrePermiso])
REFERENCES [dbo].[PERMISOS] ([NombrePermiso])
GO
ALTER TABLE [dbo].[PERMISOS_ROL] CHECK CONSTRAINT [FK_PERMISOS_ROL_PERMISOS]
GO
/****** Object:  StoredProcedure [dbo].[EMPLEADO_CREATE]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EMPLEADO_CREATE]
(@NOMBRE NVARCHAR(50), @APELLIDO NVARCHAR(50), @DNI INT, @PASSWORD BINARY(32), @SALT BINARY(32), @FECHANACIMIENTO DATETIME, @EMAIL NVARCHAR(100), @IDROL INT)
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			EXEC PERSONA_SAVE @NOMBRE, @APELLIDO, @DNI, @FECHANACIMIENTO, @EMAIL
			IF NOT EXISTS(SELECT * FROM EMPLEADOS WHERE DNI = @DNI AND ACTIVO = 0)
			BEGIN
				INSERT INTO EMPLEADOS
				(DNI, IDROL, [PASSWORD], SALT, ACTIVO)
				VALUES
				(@DNI, @IDROL, @PASSWORD, @SALT, 1)
			END
			ELSE
			BEGIN
				UPDATE EMPLEADOS SET ACTIVO = 1,IDROL = @IDROL, [PASSWORD] = @PASSWORD,
				SALT = @SALT WHERE DNI = @DNI
			END
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[EMPLEADO_DELETE]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EMPLEADO_DELETE]
@DNI int 
AS
begin try
	begin tran
		begin
			update Empleados set Activo = 0 where DNI = @DNI
		end
	commit
end try
begin catch
	rollback;
	THROW;
end catch
GO
/****** Object:  StoredProcedure [dbo].[EMPLEADO_GET_ALL]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EMPLEADO_GET_ALL]
AS
BEGIN
	SELECT EMPLEADOS.DNI, EMPLEADOS.IDROL, EMPLEADOS.IDIDIOMA,
	PERSONAS.*,
	ROLES.NOMBRE 'ROL_NOMBRE',
	ROLES.ADMINISTRADORDELSISTEMA 'ROL_ADMINISTRADORDELSISTEMA',
	IDIOMAS.NOMBRE 'IDIOMA_NOMBRE',
	IDIOMAS.[DEFAULT] 'IDIOMA_DEFAULT',
	IDIOMAS.HABILITADO 'IDIOMA_HABILITADO'
	FROM EMPLEADOS
	JOIN PERSONAS ON EMPLEADOS.DNI = PERSONAS.DNI 
	JOIN ROLES ON EMPLEADOS.IDROL = ROLES.IDROL
	LEFT JOIN IDIOMAS ON IDIOMAS.IDIDIOMA = EMPLEADOS.IDIDIOMA
	WHERE EMPLEADOS.ACTIVO = 1
END
GO
/****** Object:  StoredProcedure [dbo].[EMPLEADO_GET_COUNT]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EMPLEADO_GET_COUNT]
as
begin
SELECT COUNT(*) AS EMPLEADOSCOUNT 
FROM EMPLEADOS E
end
GO
/****** Object:  StoredProcedure [dbo].[EMPLEADO_GET_WITHLOGININFO]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EMPLEADO_GET_WITHLOGININFO]
@DNI INT
AS
BEGIN 
	SELECT EMPLEADOS.*, PERSONAS.*,
	ROLES.NOMBRE 'ROL_NOMBRE',
	ROLES.ADMINISTRADORDELSISTEMA 'ROL_ADMINISTRADORDELSISTEMA',
	IDIOMAS.NOMBRE 'IDIOMA_NOMBRE',
	IDIOMAS.[DEFAULT] 'IDIOMA_DEFAULT',
	IDIOMAS.HABILITADO 'IDIOMA_HABILITADO'
	FROM EMPLEADOS
	JOIN PERSONAS ON PERSONAS.DNI = EMPLEADOS.DNI 
	JOIN ROLES ON EMPLEADOS.IDROL = ROLES.IDROL
	LEFT JOIN IDIOMAS ON IDIOMAS.IDIDIOMA = EMPLEADOS.IDIDIOMA
	WHERE EMPLEADOS.DNI = @DNI 
END
GO
/****** Object:  StoredProcedure [dbo].[EMPLEADO_RESET_PWD]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EMPLEADO_RESET_PWD]
@DNI int, @NewPwd binary(32), @salt binary(32)
as

begin try
	begin tran
		begin
			update Empleados set password = @NewPwd, salt = @salt where DNI = @DNI
		end
	commit
end try
begin catch
	rollback;
	throw;
end catch
GO
/****** Object:  StoredProcedure [dbo].[EMPLEADO_UPDATE]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EMPLEADO_UPDATE]
(@NOMBRE NVARCHAR(50), @APELLIDO NVARCHAR(50), @DNI INT, @FECHANACIMIENTO DATETIME, @EMAIL NVARCHAR(100), @IDROL INT , @IDIDIOMA INT = NULL)
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			EXEC PERSONA_SAVE @NOMBRE, @APELLIDO, @DNI, @FECHANACIMIENTO, @EMAIL
			UPDATE EMPLEADOS SET IDROL = @IDROL, IDIDIOMA = @IDIDIOMA WHERE DNI = @DNI
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[IDIOMA_CREATE]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IDIOMA_CREATE]
(@Nombre nvarchar(100), @Habilitado bit, @Default bit)
as
begin try
	begin tran
		begin
			insert into Palabras (NombrePalabra) values (@Nombre)
			insert into Idiomas (Nombre, Habilitado, [Default]) values (@Nombre, @Habilitado, @Default)
		end
	commit
end try
begin catch
	rollback;
	THROW;
end catch
GO
/****** Object:  StoredProcedure [dbo].[IDIOMA_GET_ALL]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IDIOMA_GET_ALL]
as
begin
	select * from Idiomas
end
GO
/****** Object:  StoredProcedure [dbo].[IDIOMA_GET_ALL_HABILITADOS]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IDIOMA_GET_ALL_HABILITADOS]
as
begin
	select * from Idiomas where Habilitado = 1
end
GO
/****** Object:  StoredProcedure [dbo].[IDIOMA_GET_DEFAULT]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IDIOMA_GET_DEFAULT]
as
begin
	select TOP(1) * from Idiomas where [Default] = 1
end
GO
/****** Object:  StoredProcedure [dbo].[IDIOMA_UPDATE]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IDIOMA_UPDATE]
@idIdioma int, @Habilitado bit, @Default bit
as
begin try
	begin tran
		begin
			update Idiomas set Habilitado = @Habilitado, [Default] = @Default where idIdioma = @idIdioma
		end
	commit
end try
begin catch
	rollback;
	THROW;
end catch
GO
/****** Object:  StoredProcedure [dbo].[IDIOMA_UPDATE_DEFAULT]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IDIOMA_UPDATE_DEFAULT]
@idIdioma int
as
begin try
	begin tran
		begin
			update Idiomas set [Default] = 0 where idIdioma = (select TOP(1) idIdioma from Idiomas where [Default] = 1) 
			update Idiomas set [Default] = 1 where idIdioma = @idIdioma
		end
	commit
end try
begin catch
	rollback;
	THROW;
end catch
GO
/****** Object:  StoredProcedure [dbo].[IDIOMA_UPDATE_HABILITADO]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IDIOMA_UPDATE_HABILITADO]
@idIdioma int, @Habilitado bit, @Default bit
as
begin try
	begin tran
		begin
			update Idiomas set Habilitado = @Habilitado, [Default] = @Default where idIdioma = @idIdioma
		end
	commit
end try
begin catch
	rollback;
	THROW;
end catch

GO
/****** Object:  StoredProcedure [dbo].[PALABRA_GET_ALL]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PALABRA_GET_ALL]
as
begin
	select * from Palabras
end
GO
/****** Object:  StoredProcedure [dbo].[PALABRA_GET_NOT_TRANSLATED]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PALABRA_GET_NOT_TRANSLATED]
@idIdioma int
as
begin
	select * from Palabras WHERE NombrePalabra not in (select NombrePalabra from Traducciones where idIdioma = @idIdioma)
end
GO
/****** Object:  StoredProcedure [dbo].[PERMISO_ASIGNAR]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PERMISO_ASIGNAR]
@idRol int, @NombrePermiso nvarchar(100)
as
begin try
	begin tran
		begin
			if(select NombrePermiso from Permisos_Rol where idRol = @idRol and NombrePermiso = @NombrePermiso) IS NULL --si el rol no tiene asignado el permiso
			begin
				insert into Permisos_Rol (idRol, NombrePermiso) values (@idRol, @NombrePermiso)

				--si es un permiso hijo Y si el permiso padre no lo tiene asignado el rol deseado
				if(select NombrePermisoHijo from Permisos_Permisos where NombrePermisoHijo = @NombrePermiso) is not null 
				and 
				(select NombrePermiso from Permisos_Rol where idRol = @idRol and NombrePermiso = (select NombrePermisoPadre from Permisos_Permisos where NombrePermisoHijo = @NombrePermiso)) is null
				begin
				declare @NombrePermisoPadre nvarchar(100) = (select Top(1) NombrePermisoPadre from Permisos_Permisos where NombrePermisoHijo = @NombrePermiso)
					exec PERMISO_ASIGNAR @idRol, @NombrePermisoPadre
				end
			end
		end
	commit
end try
begin catch
	rollback;
	THROW;
end catch
GO
/****** Object:  StoredProcedure [dbo].[PERMISO_GET]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PERMISO_GET]
@NOMBREPERMISO NVARCHAR(100) = 'BASE'
AS
BEGIN
	SELECT TOP(1) PERMISOS.NOMBREPERMISO, PERMISOS.ESCOMPUESTO, PALABRAS.NOMBREPALABRA FROM PERMISOS JOIN PALABRAS ON PERMISOS.DESCRIPCION = PALABRAS.NOMBREPALABRA WHERE PERMISOS.NOMBREPERMISO = @NOMBREPERMISO
END
GO
/****** Object:  StoredProcedure [dbo].[PERMISO_GET_BYROLE]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PERMISO_GET_BYROLE] 
@idRol int, @NombrePermiso nvarchar(100) = 'base'
as
begin
	if EXISTS(select TOP(1) NombrePermiso from Permisos_Rol WHERE NombrePermiso = @NombrePermiso and idRol = @idRol)
	begin
		select Permisos.NombrePermiso, Permisos.esCompuesto, Palabras.NombrePalabra from Permisos join Palabras on Permisos.Descripcion = Palabras.NombrePalabra where Permisos.NombrePermiso = @NombrePermiso
	end
end
GO
/****** Object:  StoredProcedure [dbo].[PERMISO_GET_HIJOS]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PERMISO_GET_HIJOS]
@NombrePermisoPadre nvarchar(100) = 'base'
as
begin
	select NombrePermisoHijo from Permisos_Permisos where NombrePermisoPadre = @NombrePermisoPadre
end
GO
/****** Object:  StoredProcedure [dbo].[PERMISO_GET_HIJOS_BYROLE]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PERMISO_GET_HIJOS_BYROLE] 
@idRol int, @NombrePermisoPadre nvarchar(100) = 'base'
as
begin
	select NombrePermisoHijo from Permisos_Permisos where NombrePermisoPadre = @NombrePermisoPadre AND
	@NombrePermisoPadre in (select NombrePermiso from Permisos_Rol where idRol = @idRol and NombrePermiso = @NombrePermisoPadre)
end
GO
/****** Object:  StoredProcedure [dbo].[PERSONA_SAVE]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PERSONA_SAVE]
(@NOMBRE NVARCHAR(50), @APELLIDO NVARCHAR(50), @DNI INT, @FECHANACIMIENTO DATETIME, @EMAIL NVARCHAR(100))
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			IF NOT EXISTS(SELECT * FROM PERSONAS WHERE DNI = @DNI)
			BEGIN
				INSERT INTO PERSONAS (DNI, NOMBRE, APELLIDO, FECHANACIMIENTO, EMAIL)
				VALUES (@DNI, @NOMBRE, @APELLIDO, @FECHANACIMIENTO, @EMAIL)
			END
			ELSE
			BEGIN
				UPDATE PERSONAS SET NOMBRE = @NOMBRE, APELLIDO = @APELLIDO, FECHANACIMIENTO = @FECHANACIMIENTO, 
				EMAIL = @EMAIL WHERE DNI = @DNI
			END
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[ROL_CREATE]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ROL_CREATE]
(@Nombre nvarchar(50), @AdministradorDelSistema bit, @Activo bit)
as
begin try
	begin tran
		begin
			insert into Roles (Nombre, AdministradorDelSistema, Activo) values (@Nombre, @AdministradorDelSistema, @Activo)
			declare @idRol int = scope_identity()
			insert into Permisos_Rol (idRol, NombrePermiso) values (@idRol, 'base')
		end
	commit
end try
begin catch
	rollback;
	THROW;
end catch
GO
/****** Object:  StoredProcedure [dbo].[ROL_DELETE]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ROL_DELETE]
(@idRol int)
as
begin try
	begin tran
		begin
			update Roles set Activo = 0 where idRol = @idRol 
		end
	commit
end try
begin catch
	rollback;
	THROW;
end catch
GO
/****** Object:  StoredProcedure [dbo].[ROL_GET_ALL]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ROL_GET_ALL]
AS
begin
	select * from Roles where Activo = 1
end
GO
/****** Object:  StoredProcedure [dbo].[ROL_UPDATE]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ROL_UPDATE]
(@idRol int, @Nombre nvarchar(50), @AdministradorDelSistema bit)
as
begin try
	begin tran
		begin
			update Roles set Nombre = @Nombre, AdministradorDelSistema = @AdministradorDelSistema where idRol = @idRol
		end
	commit
end try
begin catch
	rollback;
	THROW;
end catch
GO
/****** Object:  StoredProcedure [dbo].[TRADUCCION_GET]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TRADUCCION_GET]
@idIdioma int = null
as
begin
	if(@idIdioma is not null)
		select Palabras.NombrePalabra, Traducciones.TextoTraducido from Traducciones inner join Palabras on Traducciones.NombrePalabra = Palabras.NombrePalabra where idIdioma = @idIdioma
	else
		select Palabras.NombrePalabra, Traducciones.TextoTraducido from Traducciones inner join Palabras on Traducciones.NombrePalabra = Palabras.NombrePalabra where idIdioma = (select TOP(1) idIdioma from Idiomas where [Default] = 1)
end
GO
/****** Object:  StoredProcedure [dbo].[TRADUCCION_GET_ALL]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TRADUCCION_GET_ALL]
as
begin
	select Traducciones.idIdioma, Palabras.NombrePalabra, Traducciones.TextoTraducido from Traducciones inner join Palabras on Traducciones.NombrePalabra = Palabras.NombrePalabra
end
GO
/****** Object:  StoredProcedure [dbo].[TRADUCCION_UPDATE]    Script Date: 07/07/2022 1:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TRADUCCION_UPDATE]
@idIdioma int, @NombrePalabra nvarchar(100), @TextoTraducido nvarchar(1000)
as
begin try
	begin tran
		begin
		if exists (SELECT * FROM Traducciones WHERE idIdioma = @idIdioma and NombrePalabra = @NombrePalabra) 
			update Traducciones set TextoTraducido = @TextoTraducido where idIdioma = @idIdioma and NombrePalabra = @NombrePalabra
		else
			insert into Traducciones (idIdioma, NombrePalabra, TextoTraducido) values (@idIdioma, @NombrePalabra, @TextoTraducido)
		end
	commit
end try
begin catch
	rollback;
	THROW;
end catch
GO
USE [master]
GO
ALTER DATABASE [TiendaTRIGANE] SET  READ_WRITE 
GO
