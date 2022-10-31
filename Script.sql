USE [master]
GO
/****** Object:  Database [TiendaTRIGANE]    Script Date: 31/10/2022 0:45:50 ******/
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
/****** Object:  Table [dbo].[BACKUPS]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BACKUPS](
	[idBackup] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[DNI_Empleado] [int] NOT NULL,
	[SystemPath] [nvarchar](260) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIAS]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIAS](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIAS_HISTORIALCAMBIOS]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIAS_HISTORIALCAMBIOS](
	[idCambioCategoria] [int] IDENTITY(1,1) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[DNIEmpleadoCambio] [int] NOT NULL,
	[TipoCambio] [nvarchar](100) NOT NULL,
	[FechaCambio] [datetime] NOT NULL,
 CONSTRAINT [PK_CATEGORIAS_HISTORIALCAMBIOS] PRIMARY KEY CLUSTERED 
(
	[idCambioCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLESENTREGAREABASTECIMIENTO]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLESENTREGAREABASTECIMIENTO](
	[idInformeReabastecimiento] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[CANTIDAD] [int] NOT NULL,
 CONSTRAINT [PK__DETALLES__75FB05F14A6166A4] PRIMARY KEY CLUSTERED 
(
	[idInformeReabastecimiento] ASC,
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLESSOLICITUDREABASTECIMIENTO]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLESSOLICITUDREABASTECIMIENTO](
	[idInformeReabastecimiento] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[CANTIDAD] [int] NOT NULL,
 CONSTRAINT [PK__DETALLES__75FB05F14972BC34] PRIMARY KEY CLUSTERED 
(
	[idInformeReabastecimiento] ASC,
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLESVENTA]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLESVENTA](
	[idVenta] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[CANTIDAD] [int] NOT NULL,
	[IMPORTE] [float] NOT NULL,
 CONSTRAINT [PK__DETALLES__077D5614717AD206] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC,
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIGITOSVERIFICADORESVERTICALES]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIGITOSVERIFICADORESVERTICALES](
	[TABLA] [nvarchar](50) NOT NULL,
	[DVV] [binary](32) NOT NULL,
 CONSTRAINT [PK_DIGITOSVERIFICADORESVERTICALES] PRIMARY KEY CLUSTERED 
(
	[TABLA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADOS]    Script Date: 31/10/2022 0:45:50 ******/
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
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_EMPLEADOS] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EVENTOSBITACORA]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVENTOSBITACORA](
	[idEventoBitacora] [int] IDENTITY(1,1) NOT NULL,
	[SEVERIDAD] [nvarchar](100) NOT NULL,
	[DNIEMPLEADO] [int] NOT NULL,
	[FECHA] [datetime] NOT NULL,
	[ACTIVIDAD] [nvarchar](100) NOT NULL,
	[TIPOENTIDAD] [nvarchar](100) NULL,
	[INFOASOCIADA] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__EVENTOSB__6FE019B564335F80] PRIMARY KEY CLUSTERED 
(
	[idEventoBitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAMILIA]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAMILIA](
	[NOMBRE] [nvarchar](100) NOT NULL,
	[DESCRIPCION] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_FAMILIA] PRIMARY KEY CLUSTERED 
(
	[NOMBRE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAMILIA_FAMILIA]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAMILIA_FAMILIA](
	[NombreFamiliaMadre] [nvarchar](100) NOT NULL,
	[NombreFamiliaHija] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAMILIA_PERMISO]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAMILIA_PERMISO](
	[idFamilia] [int] NOT NULL,
	[nombrePermiso] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__FAMILIA___CC8AA31404312EBC] PRIMARY KEY CLUSTERED 
(
	[idFamilia] ASC,
	[nombrePermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAMILIA_ROL]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAMILIA_ROL](
	[idFamilia] [int] NOT NULL,
	[idRol] [int] NOT NULL,
 CONSTRAINT [PK__FAMILIA___CC8AA314E6F53B1A] PRIMARY KEY CLUSTERED 
(
	[idFamilia] ASC,
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IDIOMAS]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDIOMAS](
	[idIdioma] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Default] [bit] NOT NULL,
	[Habilitado] [bit] NOT NULL,
 CONSTRAINT [PK_IDIOMAS] PRIMARY KEY CLUSTERED 
(
	[idIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INFORMESREABASTECIMIENTO]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INFORMESREABASTECIMIENTO](
	[idInformeReabastecimiento] [int] IDENTITY(1,1) NOT NULL,
	[DNI_PROVEEDOR] [int] NOT NULL,
	[DNI_EMPLEADOSOLICITANTE] [int] NOT NULL,
	[DNI_EMPLEADORECEPTOR] [int] NULL,
	[FECHASOLICITUD] [datetime] NOT NULL,
	[FechaEntregaAcordada] [datetime] NOT NULL,
	[FechaEntregaReal] [datetime] NULL,
	[ComentarioSolicitud] [nvarchar](240) NOT NULL,
	[ComentarioEntrega] [nvarchar](240) NULL,
	[SolicitudTerminada] [bit] NOT NULL,
	[EntregaAceptada] [bit] NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK__INFORMES__75FB05F198F4A6B0] PRIMARY KEY CLUSTERED 
(
	[idInformeReabastecimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PALABRAS]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PALABRAS](
	[NombrePalabra] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PALABRAS] PRIMARY KEY CLUSTERED 
(
	[NombrePalabra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERMISOS]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISOS](
	[NombrePermiso] [nvarchar](50) NOT NULL,
	[esCompuesto] [bit] NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PERMISOS] PRIMARY KEY CLUSTERED 
(
	[NombrePermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERMISOS_PERMISOS]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISOS_PERMISOS](
	[NombrePermisoPadre] [nvarchar](50) NOT NULL,
	[NombrePermisoHijo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PERMISOS_PERMISOS] PRIMARY KEY CLUSTERED 
(
	[NombrePermisoPadre] ASC,
	[NombrePermisoHijo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERMISOS_ROL]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISOS_ROL](
	[NombrePermiso] [nvarchar](50) NOT NULL,
	[idRol] [int] NOT NULL,
 CONSTRAINT [PK_PERMISOS_ROL] PRIMARY KEY CLUSTERED 
(
	[NombrePermiso] ASC,
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONAS]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONAS](
	[DNI] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PERSONAS] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[idProducto] [int] NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
	[PrecioUnitario] [float] NOT NULL,
	[idCategoria] [int] NOT NULL,
	[CantidadDepositos] [int] NOT NULL,
	[CantidadExhibidores] [int] NOT NULL,
	[AdvertenciaBajoStock] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[dv] [binary](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTOS_HISTORIALCAMBIOS]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS_HISTORIALCAMBIOS](
	[idCambioProducto] [int] IDENTITY(1,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[PrecioUnitario] [float] NOT NULL,
	[idCategoria] [int] NOT NULL,
	[AdvertenciaBajoStock] [int] NOT NULL,
	[DniEmpleadoCambio] [int] NOT NULL,
	[TipoCambio] [nvarchar](100) NOT NULL,
	[FechaCambio] [datetime] NOT NULL,
 CONSTRAINT [PK_PRODUCTOS_HISTORIALCAMBIOS] PRIMARY KEY CLUSTERED 
(
	[idCambioProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDORES]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDORES](
	[DNI] [int] NOT NULL,
	[idCategoria] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_PROVEEDORES] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLES]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLES](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
	[ACTIVO] [bit] NOT NULL,
	[AdministradorDelSistema] [bit] NOT NULL,
 CONSTRAINT [PK__ROLES__3C872F76D2457375] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEVERIDAD]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEVERIDAD](
	[SEVERIDAD] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SEVERIDAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPOSCAMBIOS]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPOSCAMBIOS](
	[CAMBIO] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TIPOSCAMBIOS] PRIMARY KEY CLUSTERED 
(
	[CAMBIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRADUCCIONES]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRADUCCIONES](
	[idIdioma] [int] NOT NULL,
	[NombrePalabra] [nvarchar](100) NOT NULL,
	[TextoTraducido] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_TRADUCCIONES] PRIMARY KEY CLUSTERED 
(
	[idIdioma] ASC,
	[NombrePalabra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTAS]    Script Date: 31/10/2022 0:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTAS](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[FECHA] [datetime] NOT NULL,
	[EFECTUADA] [bit] NOT NULL,
	[DNI_EMPLEADO_VENDEDOR] [int] NOT NULL,
	[DNI_EMPLEADO_CANCELACION] [int] NULL,
	[ACTIVO] [bit] NOT NULL,
 CONSTRAINT [PK__VENTAS__077D561411600ECD] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BACKUPS] ([idBackup], [Fecha], [DNI_Empleado], [SystemPath]) VALUES (1, CAST(N'2022-10-19T20:55:45.580' AS DateTime), 42885742, N'D:\TiendaTRIGANE backups\1')
INSERT [dbo].[BACKUPS] ([idBackup], [Fecha], [DNI_Empleado], [SystemPath]) VALUES (2, CAST(N'2022-10-19T21:00:42.733' AS DateTime), 42885742, N'D:\TiendaTRIGANE backups\2')
GO
SET IDENTITY_INSERT [dbo].[CATEGORIAS] ON 

INSERT [dbo].[CATEGORIAS] ([idCategoria], [Nombre], [Activo]) VALUES (11, N'running', 1)
INSERT [dbo].[CATEGORIAS] ([idCategoria], [Nombre], [Activo]) VALUES (12, N'futbol', 1)
INSERT [dbo].[CATEGORIAS] ([idCategoria], [Nombre], [Activo]) VALUES (13, N'Gimnasia', 1)
INSERT [dbo].[CATEGORIAS] ([idCategoria], [Nombre], [Activo]) VALUES (14, N'accesorios', 1)
INSERT [dbo].[CATEGORIAS] ([idCategoria], [Nombre], [Activo]) VALUES (15, N'tenis', 1)
INSERT [dbo].[CATEGORIAS] ([idCategoria], [Nombre], [Activo]) VALUES (16, N'test', 1)
SET IDENTITY_INSERT [dbo].[CATEGORIAS] OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORIAS_HISTORIALCAMBIOS] ON 

INSERT [dbo].[CATEGORIAS_HISTORIALCAMBIOS] ([idCambioCategoria], [idCategoria], [Nombre], [DNIEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (13, 11, N'running', 42885742, N'addition', CAST(N'2022-07-14T22:12:10.430' AS DateTime))
INSERT [dbo].[CATEGORIAS_HISTORIALCAMBIOS] ([idCambioCategoria], [idCategoria], [Nombre], [DNIEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (14, 12, N'futbol', 42885742, N'addition', CAST(N'2022-07-18T14:00:42.587' AS DateTime))
INSERT [dbo].[CATEGORIAS_HISTORIALCAMBIOS] ([idCambioCategoria], [idCategoria], [Nombre], [DNIEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (15, 13, N'Gimnasia', 42885742, N'addition', CAST(N'2022-07-21T17:44:24.600' AS DateTime))
INSERT [dbo].[CATEGORIAS_HISTORIALCAMBIOS] ([idCambioCategoria], [idCategoria], [Nombre], [DNIEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (16, 14, N'accesorios', 42885742, N'addition', CAST(N'2022-07-21T17:45:15.770' AS DateTime))
INSERT [dbo].[CATEGORIAS_HISTORIALCAMBIOS] ([idCambioCategoria], [idCategoria], [Nombre], [DNIEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (17, 15, N'tenis', 42885742, N'addition', CAST(N'2022-07-21T17:45:27.533' AS DateTime))
INSERT [dbo].[CATEGORIAS_HISTORIALCAMBIOS] ([idCambioCategoria], [idCategoria], [Nombre], [DNIEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (18, 16, N'test', 42885742, N'addition', CAST(N'2022-08-24T21:17:43.740' AS DateTime))
SET IDENTITY_INSERT [dbo].[CATEGORIAS_HISTORIALCAMBIOS] OFF
GO
INSERT [dbo].[DIGITOSVERIFICADORESVERTICALES] ([TABLA], [DVV]) VALUES (N'PRODUCTOS', 0x04CFAD2BC607F8A5FB4039A90563A9789BDCEC7ABF38852D9369F820E949A678)
GO
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (4444, 1, 0x9990CD1E23316A5D9ED94D871B88A5E7134987D4160537E9448900413DCC95BE, 0x9FCD47C40E14505A435733912509B8C528FB965F60F93CE529ABF3210762A466, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (444444, 1, 0x93997B55BE6BE1B14EB3275317CDA8294A7C1B2149790C5B4948AF3DEF6B4C86, 0x043977C3956A8E7A1BE5BAD29FA326656F8F5CF4ADFEA2EF1C23A1F435AA997B, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (42885740, 10, 0x81BB0754D263DA1592134AA5B5D67A6C27CE5E5B059D5A4FD77A7CBF9692B7D3, 0xE58BDB62AC26501E5251DA5984D4F58DBF35BA7643701DCF07D9E11EC13C007E, NULL, 0)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (42885741, 1, 0x0D71457FF00964F842AE696F2D600EB4C5986D6298AEAC7641619542A3BD95C9, 0x13E5707E2FD33FA5B22E55E8C96A8684AFAA5905AFC619191DCC4652528475FB, 5, 1)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (42885742, 6, 0xC4696239014D75D557AA4C409F9305A202F2782D2D0368EE6010E41A423A184E, 0x46C0DD2F444E13D6308081278D1006CC0AE007C1ABBEDA932FB264DAF0E9F939, 5, 1)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (42885743, 2, 0xF7A8F6C6E3BCD9688C08E73D35402B36CA17578774033D402CD85CE382CA02EE, 0xB1309CF4F81071DB65094BEC09C94EEB9AF96B499F2B424DE9D2A1FA16C9DC8C, NULL, 1)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (42885745, 1, 0x69235D075E83C6FC94E2AAFED09D8AC4F460FED720DC6F858542927210E511C0, 0x345171FCBBF2598A0B1F98B258664BAD1275B348962C0723DCDEB5C5E2F5C4A1, NULL, 1)
INSERT [dbo].[EMPLEADOS] ([DNI], [idRol], [password], [salt], [idIdioma], [Activo]) VALUES (49281212, 5, 0xA81649C6B24BDF50BF36ED499A40D47928EBB9BC0992A7F728A4C1967AA51680, 0x6E45A6B4F5D2A0F638F6492373773A1C76EACCF076D5BE26862176294887BEBB, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[EVENTOSBITACORA] ON 

INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (3, N'information', 42885742, CAST(N'2022-08-16T23:55:29.007' AS DateTime), N'logged_out', N'employee', N'(DNI 42885742) anti ramirez')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (4, N'information', 42885741, CAST(N'2022-08-16T23:55:59.113' AS DateTime), N'successful_addition', N'employee', N'(DNI 444444) test test')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (5, N'information', 42885741, CAST(N'2022-08-16T23:56:32.157' AS DateTime), N'successful_deletion', N'employee', N'(DNI 444444) test test')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (6, N'information', 42885742, CAST(N'2022-08-24T21:12:49.500' AS DateTime), N'sale_has_been_made', N'sales', N'')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (7, N'information', 42885742, CAST(N'2022-08-24T21:13:26.603' AS DateTime), N'low_stock_warning_updated', N'product', N'pelota mundial: 0 -> 5')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (8, N'information', 42885742, CAST(N'2022-08-24T21:14:10.293' AS DateTime), N'restocked_shelves', N'product', N'pelota mundial: 4 (2 -> 6)')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (9, N'information', 42885742, CAST(N'2022-08-24T21:14:33.760' AS DateTime), N'sale_has_been_made', N'sales', N'')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (10, N'information', 42885742, CAST(N'2022-08-24T21:16:40.443' AS DateTime), N'logged_out', N'employee', N'(DNI 42885742) anti ramirez')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (11, N'information', 42885742, CAST(N'2022-08-24T21:17:43.747' AS DateTime), N'successful_addition', N'category', N'test')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (12, N'information', 42885742, CAST(N'2022-08-24T21:20:44.590' AS DateTime), N'replenishment_requested', N'replenishment', N'')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (13, N'information', 42885742, CAST(N'2022-08-24T21:23:01.657' AS DateTime), N'restocked_shelves', N'product', N'zapatillas adidas: 2 (3 -> 5)')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (14, N'error', 42885742, CAST(N'2022-08-30T22:09:04.013' AS DateTime), N'error', N'product', N'   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   en System.Data.SqlClient.SqlCommand.CompleteAsyncExecuteReader(Boolean isInternal, Boolean forDescribeParameterEncryption)
   en System.Data.SqlClient.SqlCommand.InternalEndExecuteNonQuery(IAsyncResult asyncResult, String endMethod, Boolean isInternal)
   en System.Data.SqlClient.SqlCommand.EndExecuteNonQueryInternal(IAsyncResult asyncResult)
   en System.Data.SqlClient.SqlCommand.EndExecuteNonQueryAsync(IAsyncResult asyncResult)
   en System.Threading.Tasks.TaskFactory`1.FromAsyncCoreLogic(IAsyncResult iar, Func`2 endFunction, Action`1 endAction, Task`1 promise, Boolean requiresSynchronization)
--- Fin del seguimiento de la pila de la ubicación anterior donde se produjo la excepción ---
   en System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   en DAL.ConexionDAL.<WriteStoredProcedure>d__2.MoveNext() en D:\3er año\Trabajo de Campo\TrabajoFinalCampo-main\TiendaTRIGANE\DAL\ConexionDAL.cs:línea 31
--- Fin del seguimiento de la pila de la ubicación anterior donde se produjo la excepción ---
   en System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   en DAL.Producto.<CreateSnapshot>d__7.MoveNext() en D:\3er año\Trabajo de Campo\TrabajoFinalCampo-main\TiendaTRIGANE\DAL\ProductoDAL.cs:línea 131')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (15, N'error', 42885742, CAST(N'2022-08-30T22:09:11.580' AS DateTime), N'error', N'product', N'   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   en System.Data.SqlClient.SqlCommand.CompleteAsyncExecuteReader(Boolean isInternal, Boolean forDescribeParameterEncryption)
   en System.Data.SqlClient.SqlCommand.InternalEndExecuteNonQuery(IAsyncResult asyncResult, String endMethod, Boolean isInternal)
   en System.Data.SqlClient.SqlCommand.EndExecuteNonQueryInternal(IAsyncResult asyncResult)
   en System.Data.SqlClient.SqlCommand.EndExecuteNonQueryAsync(IAsyncResult asyncResult)
   en System.Threading.Tasks.TaskFactory`1.FromAsyncCoreLogic(IAsyncResult iar, Func`2 endFunction, Action`1 endAction, Task`1 promise, Boolean requiresSynchronization)
--- Fin del seguimiento de la pila de la ubicación anterior donde se produjo la excepción ---
   en System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   en DAL.ConexionDAL.<WriteStoredProcedure>d__2.MoveNext() en D:\3er año\Trabajo de Campo\TrabajoFinalCampo-main\TiendaTRIGANE\DAL\ConexionDAL.cs:línea 31
--- Fin del seguimiento de la pila de la ubicación anterior donde se produjo la excepción ---
   en System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   en DAL.Producto.<CreateSnapshot>d__7.MoveNext() en D:\3er año\Trabajo de Campo\TrabajoFinalCampo-main\TiendaTRIGANE\DAL\ProductoDAL.cs:línea 131')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (16, N'error', 42885742, CAST(N'2022-08-30T22:10:48.303' AS DateTime), N'error', N'product', N'   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   en System.Data.SqlClient.SqlCommand.CompleteAsyncExecuteReader(Boolean isInternal, Boolean forDescribeParameterEncryption)
   en System.Data.SqlClient.SqlCommand.InternalEndExecuteNonQuery(IAsyncResult asyncResult, String endMethod, Boolean isInternal)
   en System.Data.SqlClient.SqlCommand.EndExecuteNonQueryInternal(IAsyncResult asyncResult)
   en System.Data.SqlClient.SqlCommand.EndExecuteNonQueryAsync(IAsyncResult asyncResult)
   en System.Threading.Tasks.TaskFactory`1.FromAsyncCoreLogic(IAsyncResult iar, Func`2 endFunction, Action`1 endAction, Task`1 promise, Boolean requiresSynchronization)
--- Fin del seguimiento de la pila de la ubicación anterior donde se produjo la excepción ---
   en System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   en DAL.ConexionDAL.<WriteStoredProcedure>d__2.MoveNext() en D:\3er año\Trabajo de Campo\TrabajoFinalCampo-main\TiendaTRIGANE\DAL\ConexionDAL.cs:línea 31
--- Fin del seguimiento de la pila de la ubicación anterior donde se produjo la excepción ---
   en System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   en DAL.Producto.<CreateSnapshot>d__7.MoveNext() en D:\3er año\Trabajo de Campo\TrabajoFinalCampo-main\TiendaTRIGANE\DAL\ProductoDAL.cs:línea 131')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (17, N'information', 42885742, CAST(N'2022-08-30T22:11:20.973' AS DateTime), N'successful_update', N'product', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (18, N'information', 42885742, CAST(N'2022-08-30T23:40:46.263' AS DateTime), N'successful_update', N'product', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (19, N'information', 42885742, CAST(N'2022-08-30T23:42:47.457' AS DateTime), N'successful_update', N'product', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (20, N'information', 42885742, CAST(N'2022-08-30T23:43:03.863' AS DateTime), N'successful_update', N'product', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (21, N'information', 42885742, CAST(N'2022-08-31T21:29:16.783' AS DateTime), N'successful_update', N'product', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (22, N'information', 42885742, CAST(N'2022-08-31T21:29:26.570' AS DateTime), N'logged_out', N'employee', N'(DNI 42885742) anti ramirez')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (23, N'information', 42885741, CAST(N'2022-08-31T21:29:35.847' AS DateTime), N'successful_update', N'product', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (24, N'information', 42885741, CAST(N'2022-08-31T21:29:44.617' AS DateTime), N'logged_out', N'employee', N'(DNI 42885741) t t')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (25, N'information', 42885743, CAST(N'2022-08-31T21:29:53.883' AS DateTime), N'successful_update', N'product', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (26, N'error', 42885742, CAST(N'2022-09-22T20:51:20.453' AS DateTime), N'error', N'backup', N'   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   en System.Data.SqlClient.SqlCommand.CompleteAsyncExecuteReader(Boolean isInternal, Boolean forDescribeParameterEncryption)
   en System.Data.SqlClient.SqlCommand.InternalEndExecuteNonQuery(IAsyncResult asyncResult, String endMethod, Boolean isInternal)
   en System.Data.SqlClient.SqlCommand.EndExecuteNonQueryInternal(IAsyncResult asyncResult)
   en System.Data.SqlClient.SqlCommand.EndExecuteNonQueryAsync(IAsyncResult asyncResult)
   en System.Threading.Tasks.TaskFactory`1.FromAsyncCoreLogic(IAsyncResult iar, Func`2 endFunction, Action`1 endAction, Task`1 promise, Boolean requiresSynchronization)
--- Fin del seguimiento de la pila de la ubicación anterior donde se produjo la excepción ---
   en System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   en DAL.ConexionDAL.<WriteStoredProcedure>d__2.MoveNext() en D:\3er año\Trabajo de Campo\TrabajoFinalCampo-main\TiendaTRIGANE\DAL\ConexionDAL.cs:línea 31
--- Fin del seguimiento de la pila de la ubicación anterior donde se produjo la excepción ---
   en System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   en DAL.BackupsDAL.<Create>d__4.MoveNext() en D:\3er año\Trabajo de Campo\TrabajoFinalCampo-main\TiendaTRIGANE\DAL\BackupsDAL.cs:línea 36')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (27, N'error', 42885742, CAST(N'2022-09-22T20:52:57.230' AS DateTime), N'error', N'backup', N'   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   en System.Data.SqlClient.SqlCommand.CompleteAsyncExecuteReader(Boolean isInternal, Boolean forDescribeParameterEncryption)
   en System.Data.SqlClient.SqlCommand.InternalEndExecuteNonQuery(IAsyncResult asyncResult, String endMethod, Boolean isInternal)
   en System.Data.SqlClient.SqlCommand.EndExecuteNonQueryInternal(IAsyncResult asyncResult)
   en System.Data.SqlClient.SqlCommand.EndExecuteNonQueryAsync(IAsyncResult asyncResult)
   en System.Threading.Tasks.TaskFactory`1.FromAsyncCoreLogic(IAsyncResult iar, Func`2 endFunction, Action`1 endAction, Task`1 promise, Boolean requiresSynchronization)
--- Fin del seguimiento de la pila de la ubicación anterior donde se produjo la excepción ---
   en System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   en DAL.ConexionDAL.<WriteStoredProcedure>d__2.MoveNext() en D:\3er año\Trabajo de Campo\TrabajoFinalCampo-main\TiendaTRIGANE\DAL\ConexionDAL.cs:línea 31
--- Fin del seguimiento de la pila de la ubicación anterior donde se produjo la excepción ---
   en System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   en DAL.BackupsDAL.<Create>d__4.MoveNext() en D:\3er año\Trabajo de Campo\TrabajoFinalCampo-main\TiendaTRIGANE\DAL\BackupsDAL.cs:línea 36')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (28, N'error', 42885742, CAST(N'2022-09-22T20:53:07.373' AS DateTime), N'error', N'backup', N'   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   en System.Data.SqlClient.SqlCommand.CompleteAsyncExecuteReader(Boolean isInternal, Boolean forDescribeParameterEncryption)
   en System.Data.SqlClient.SqlCommand.InternalEndExecuteNonQuery(IAsyncResult asyncResult, String endMethod, Boolean isInternal)
   en System.Data.SqlClient.SqlCommand.EndExecuteNonQueryInternal(IAsyncResult asyncResult)
   en System.Data.SqlClient.SqlCommand.EndExecuteNonQueryAsync(IAsyncResult asyncResult)
   en System.Threading.Tasks.TaskFactory`1.FromAsyncCoreLogic(IAsyncResult iar, Func`2 endFunction, Action`1 endAction, Task`1 promise, Boolean requiresSynchronization)
--- Fin del seguimiento de la pila de la ubicación anterior donde se produjo la excepción ---
   en System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   en DAL.ConexionDAL.<WriteStoredProcedure>d__2.MoveNext() en D:\3er año\Trabajo de Campo\TrabajoFinalCampo-main\TiendaTRIGANE\DAL\ConexionDAL.cs:línea 31
--- Fin del seguimiento de la pila de la ubicación anterior donde se produjo la excepción ---
   en System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   en DAL.BackupsDAL.<Create>d__4.MoveNext() en D:\3er año\Trabajo de Campo\TrabajoFinalCampo-main\TiendaTRIGANE\DAL\BackupsDAL.cs:línea 36')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (29, N'information', 42885742, CAST(N'2022-09-22T20:54:35.977' AS DateTime), N'successful_addition', N'backup', N'')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (30, N'information', 42885742, CAST(N'2022-10-19T20:15:34.657' AS DateTime), N'data_restored_from_a_backup', N'backup', N'')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (31, N'information', 42885742, CAST(N'2022-10-19T20:15:34.667' AS DateTime), N'logged_out', N'employee', N'(DNI 42885742) anti ramirez')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (32, N'error', 42885742, CAST(N'2022-10-19T20:17:10.060' AS DateTime), N'error', N'product', N'   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   en System.Data.SqlClient.SqlCommand.CompleteAsyncExecuteReader(Boolean isInternal, Boolean forDescribeParameterEncryption)
   en System.Data.SqlClient.SqlCommand.InternalEndExecuteNonQuery(IAsyncResult asyncResult, String endMethod, Boolean isInternal)
   en System.Data.SqlClient.SqlCommand.EndExecuteNonQueryInternal(IAsyncResult asyncResult)
   en System.Data.SqlClient.SqlCommand.EndExecuteNonQueryAsync(IAsyncResult asyncResult)
   en System.Threading.Tasks.TaskFactory`1.FromAsyncCoreLogic(IAsyncResult iar, Func`2 endFunction, Action`1 endAction, Task`1 promise, Boolean requiresSynchronization)
--- Fin del seguimiento de la pila de la ubicación anterior donde se produjo la excepción ---
   en System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   en DAL.ConexionDAL.<WriteStoredProcedure>d__2.MoveNext() en D:\3er año\Trabajo de Campo\TrabajoFinalCampo-main\TiendaTRIGANE\DAL\ConexionDAL.cs:línea 31
--- Fin del seguimiento de la pila de la ubicación anterior donde se produjo la excepción ---
   en System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   en System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   en DAL.Producto.<UpdateProductFromThrowback>d__8.MoveNext() en D:\3er año\Trabajo de Campo\TrabajoFinalCampo-main\TiendaTRIGANE\DAL\ProductoDAL.cs:línea 132')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (33, N'error', 42885742, CAST(N'2022-10-19T20:17:27.660' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (34, N'error', 42885742, CAST(N'2022-10-19T20:18:04.553' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (35, N'error', 42885742, CAST(N'2022-10-19T20:18:12.283' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (36, N'error', 42885742, CAST(N'2022-10-19T20:18:23.367' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (37, N'error', 42885742, CAST(N'2022-10-19T20:19:19.553' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (38, N'error', 42885742, CAST(N'2022-10-19T20:19:47.337' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (39, N'error', 42885742, CAST(N'2022-10-19T20:19:53.690' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (40, N'error', 42885742, CAST(N'2022-10-19T20:20:20.340' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (41, N'error', 42885742, CAST(N'2022-10-19T20:20:27.860' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (42, N'error', 42885742, CAST(N'2022-10-19T20:21:04.997' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (43, N'error', 42885742, CAST(N'2022-10-19T20:22:06.650' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (44, N'error', 42885742, CAST(N'2022-10-19T20:25:00.540' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (45, N'error', 42885742, CAST(N'2022-10-19T20:25:51.787' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'zapatillas adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (46, N'warning', 42885742, CAST(N'2022-10-19T20:36:22.630' AS DateTime), N'there_are_no_products', N'products', N'')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (47, N'information', 42885742, CAST(N'2022-10-19T20:36:44.267' AS DateTime), N'successful_addition', N'product', N'pelota futbol')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (48, N'information', 42885742, CAST(N'2022-10-19T20:37:53.750' AS DateTime), N'successful_update', N'product', N'pelota futbol')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (49, N'error', 42885742, CAST(N'2022-10-19T20:38:07.550' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'pelota futbol')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (50, N'error', 42885742, CAST(N'2022-10-19T20:38:41.963' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'pelota futbol')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (51, N'error', 42885742, CAST(N'2022-10-19T20:54:01.027' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'pelota futbol')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (52, N'error', 42885742, CAST(N'2022-10-19T20:54:19.003' AS DateTime), N'integrity_check_failed_unauthorized_update_shortversion', N'dvv', N'pelota futbol')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (53, N'warning', 42885742, CAST(N'2022-10-19T20:55:15.457' AS DateTime), N'there_are_no_products', N'products', N'')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (54, N'information', 42885742, CAST(N'2022-10-19T20:55:27.010' AS DateTime), N'successful_addition', N'product', N'pelota futbol')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (55, N'information', 42885742, CAST(N'2022-10-19T20:55:51.850' AS DateTime), N'data_restored_from_a_backup', N'backup', N'')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (56, N'information', 42885742, CAST(N'2022-10-19T20:55:51.863' AS DateTime), N'logged_out', N'employee', N'(DNI 42885742) anti ramirez')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (57, N'information', 42885742, CAST(N'2022-10-19T20:59:27.403' AS DateTime), N'successful_addition', N'product', N'muñequeras tenis')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (58, N'information', 42885742, CAST(N'2022-10-19T20:59:38.720' AS DateTime), N'successful_addition', N'product', N'guantes de arquero')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (59, N'information', 42885742, CAST(N'2022-10-19T20:59:50.127' AS DateTime), N'successful_addition', N'product', N'botines adidas')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (60, N'information', 42885742, CAST(N'2022-10-19T21:00:06.647' AS DateTime), N'successful_addition', N'product', N'conjunto deportivo nike')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (61, N'information', 42885742, CAST(N'2022-10-19T21:00:26.917' AS DateTime), N'successful_addition', N'product', N'zapatillas topper negras')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (62, N'information', 42885742, CAST(N'2022-10-19T21:01:38.023' AS DateTime), N'data_restored_from_a_backup', N'backup', N'')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (63, N'information', 42885742, CAST(N'2022-10-19T21:01:38.033' AS DateTime), N'logged_out', N'employee', N'(DNI 42885742) anti ramirez')
INSERT [dbo].[EVENTOSBITACORA] ([idEventoBitacora], [SEVERIDAD], [DNIEMPLEADO], [FECHA], [ACTIVIDAD], [TIPOENTIDAD], [INFOASOCIADA]) VALUES (64, N'information', 42885742, CAST(N'2022-10-19T21:02:08.070' AS DateTime), N'successful_update', N'product', N'muñequeras tenis')
SET IDENTITY_INSERT [dbo].[EVENTOSBITACORA] OFF
GO
SET IDENTITY_INSERT [dbo].[IDIOMAS] ON 

INSERT [dbo].[IDIOMAS] ([idIdioma], [Nombre], [Default], [Habilitado]) VALUES (5, N'spanish', 1, 1)
INSERT [dbo].[IDIOMAS] ([idIdioma], [Nombre], [Default], [Habilitado]) VALUES (6, N'english', 0, 1)
INSERT [dbo].[IDIOMAS] ([idIdioma], [Nombre], [Default], [Habilitado]) VALUES (1007, N'portugues', 0, 0)
INSERT [dbo].[IDIOMAS] ([idIdioma], [Nombre], [Default], [Habilitado]) VALUES (1008, N'japones', 0, 0)
INSERT [dbo].[IDIOMAS] ([idIdioma], [Nombre], [Default], [Habilitado]) VALUES (1009, N'prueba', 0, 1)
INSERT [dbo].[IDIOMAS] ([idIdioma], [Nombre], [Default], [Habilitado]) VALUES (1010, N'prueba1', 0, 0)
INSERT [dbo].[IDIOMAS] ([idIdioma], [Nombre], [Default], [Habilitado]) VALUES (1011, N'prueba2', 0, 0)
INSERT [dbo].[IDIOMAS] ([idIdioma], [Nombre], [Default], [Habilitado]) VALUES (1012, N'prueba3', 0, 1)
SET IDENTITY_INSERT [dbo].[IDIOMAS] OFF
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
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'prueba')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'prueba1')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'prueba2')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'prueba3')
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
GO
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'stop')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'successful_addition')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'successful_deletion')
INSERT [dbo].[PALABRAS] ([NombrePalabra]) VALUES (N'successful_update')
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
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'backupsMANAGE', 0, N'manage_backupsPERMISSION')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'base', 1, N'permission_base')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'cancelSale', 0, N'cancel_sale')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'categoriesCREATE', 0, N'create')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'categoriesDELETE', 0, N'permission_delete')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'categoriesREAD', 1, N'permission_categoriesREAD')
INSERT [dbo].[PERMISOS] ([NombrePermiso], [esCompuesto], [Descripcion]) VALUES (N'categoriesUPDATE', 0, N'permission_update')
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
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'base', N'backupsMANAGE')
INSERT [dbo].[PERMISOS_PERMISOS] ([NombrePermisoPadre], [NombrePermisoHijo]) VALUES (N'base', N'categoriesREAD')
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
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'backupsMANAGE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'backupsMANAGE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 3)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 4)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 7)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 8)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 9)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 10)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 11)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 12)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 13)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 14)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 15)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 16)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 18)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 19)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 20)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 21)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'base', 1014)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'cancelSale', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'cancelSale', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'cancelSale', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'cancelSale', 21)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesCREATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesCREATE', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesCREATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesCREATE', 18)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesCREATE', 19)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesCREATE', 21)
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
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesREAD', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesREAD', 18)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesREAD', 19)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesREAD', 21)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesUPDATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesUPDATE', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'categoriesUPDATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'discountsMODIFY', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'discountsMODIFY', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'discountsMODIFY', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesCREATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesCREATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesCREATE', 10)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesCREATE', 11)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesCREATE', 16)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesCREATE', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesDELETE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesDELETE', 10)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesDELETE', 11)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesDELETE', 15)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesDELETE', 16)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesDELETE', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesREAD', 10)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesREAD', 11)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesREAD', 15)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesREAD', 16)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesREAD', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesUPDATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesUPDATE', 10)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesUPDATE', 11)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesUPDATE', 15)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesUPDATE', 16)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'employeesUPDATE', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'languagesMANAGE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'languagesMANAGE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'languagesMANAGE', 21)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'languagesREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'languagesREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'languagesREAD', 21)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'makeSale', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'makeSale', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'makeSale', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'makeSale', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'makeSale', 20)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'makeSale', 21)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'permissions', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'permissions', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'permissions', 18)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'permissions', 21)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'permissionsCHANGE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'permissionsCHANGE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsCREATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsCREATE', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsCREATE', 3)
GO
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
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREAD', 18)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREAD', 19)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREAD', 21)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREPLENISH', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREPLENISH', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREPLENISH', 3)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREPLENISH', 4)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREPLENISH', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREPLENISH', 18)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREPLENISH', 19)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'productsREPLENISH', 21)
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
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleCREATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleCREATE', 10)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleCREATE', 15)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleCREATE', 16)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleCREATE', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleDELETE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleDELETE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleDELETE', 10)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleDELETE', 15)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleDELETE', 16)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleDELETE', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleREAD', 4)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleREAD', 10)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleREAD', 11)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleREAD', 15)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleREAD', 16)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleREAD', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleUPDATE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleUPDATE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'roleUPDATE', 11)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'sales', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'sales', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'sales', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'sales', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'sales', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'sales', 20)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'sales', 21)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'salesRecordEXPORT', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'salesRecordEXPORT', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'salesRecordREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'salesRecordREAD', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'salesRecordREAD', 5)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'salesRecordREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'salesRecordREAD', 21)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersDELETE', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersREAD', 2)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersREAD', 3)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'suppliersREAD', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsMANAGE', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsMANAGE', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsMANAGE', 10)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsMANAGE', 15)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsMANAGE', 16)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsMANAGE', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsMANAGE', 18)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsMANAGE', 19)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsMANAGE', 21)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsREAD', 1)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsREAD', 6)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsREAD', 10)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsREAD', 15)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsREAD', 16)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsREAD', 17)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsREAD', 18)
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsREAD', 19)
GO
INSERT [dbo].[PERMISOS_ROL] ([NombrePermiso], [idRol]) VALUES (N'translationsREAD', 21)
GO
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (4444, N'test', N'test', CAST(N'2022-08-16' AS Date), N't')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (123123, N'anti', N'ramirez', CAST(N'2022-07-14' AS Date), N'antiramirez@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (444444, N'test', N'test', CAST(N'2022-08-16' AS Date), N'y')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (1231231, N'proveedor', N'tenis', CAST(N'2022-07-21' AS Date), N'proveedortenis@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (1231232, N'anti', N'ramirez', CAST(N'2022-07-14' AS Date), N'antiramirez@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (1231823, N'patricio', N'rodriguez', CAST(N'2022-07-21' AS Date), N'patorodriguez@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (1238123, N'lucas', N'rodriguez', CAST(N'2022-07-14' AS Date), N'lucasrodriguez@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (3142312, N'proveedor', N'futbol', CAST(N'2022-07-18' AS Date), N'proveedorfutbol@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (4128312, N'anti', N'ramirez', CAST(N'2022-07-14' AS Date), N'antiramirez@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (12312312, N'prueba', N'tenis', CAST(N'2022-07-21' AS Date), N'pruebatenis@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (12312314, N'proveedor', N'gimnasia', CAST(N'2022-07-21' AS Date), N'proveedorgimnasia@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (12389213, N'anti', N'ramirez', CAST(N'2022-07-14' AS Date), N'antiramirez@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (18291213, N'anti', N'ramirez', CAST(N'2022-07-14' AS Date), N'antiramirez')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (41256712, N'prueba', N'prueba', CAST(N'2022-07-14' AS Date), N'prueba@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (42885740, N't', N't', CAST(N'2022-07-14' AS Date), N't')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (42885741, N't', N't', CAST(N'2022-07-13' AS Date), N'thiago')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (42885742, N'anti', N'ramirez', CAST(N'2022-07-18' AS Date), N'antiramirez@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (42885743, N't', N't', CAST(N'2022-07-13' AS Date), N't')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (42885745, N't', N't', CAST(N'2022-08-04' AS Date), N't')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (48291212, N'proveedor', N'accesorios', CAST(N'2022-07-21' AS Date), N'proveedoraccessorios@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (49281212, N'pruebas', N'pruebas', CAST(N'2022-07-14' AS Date), N'prueba@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (82919212, N'lucas', N'rodriguez', CAST(N'2022-07-21' AS Date), N'lucasrodriguez@gmail.com')
INSERT [dbo].[PERSONAS] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Email]) VALUES (123881231, N'anti', N'ramirez', CAST(N'2022-07-14' AS Date), N'antiramirez@gmail.com')
GO
INSERT [dbo].[PRODUCTOS] ([idProducto], [NOMBRE], [PrecioUnitario], [idCategoria], [CantidadDepositos], [CantidadExhibidores], [AdvertenciaBajoStock], [Activo], [dv]) VALUES (1, N'pelota futbol', 15000, 11, 0, 0, 0, 1, 0xF9E45DD860C7B0527C54EB69D0D2610F734369ED8F1CF10C46209B8D2963D0C1)
INSERT [dbo].[PRODUCTOS] ([idProducto], [NOMBRE], [PrecioUnitario], [idCategoria], [CantidadDepositos], [CantidadExhibidores], [AdvertenciaBajoStock], [Activo], [dv]) VALUES (2, N'muñequeras tenis', 3500, 11, 0, 0, 0, 1, 0x89D50F9507D1D40115E0598FC5133D18900ADED0C0B32D25527D4265AEC45356)
INSERT [dbo].[PRODUCTOS] ([idProducto], [NOMBRE], [PrecioUnitario], [idCategoria], [CantidadDepositos], [CantidadExhibidores], [AdvertenciaBajoStock], [Activo], [dv]) VALUES (3, N'guantes de arquero', 10000, 11, 0, 0, 0, 1, 0xF4EDC2A890254E1E642A1D3707123FCD1FA6EDDED7A0AED0C5887D6948244935)
INSERT [dbo].[PRODUCTOS] ([idProducto], [NOMBRE], [PrecioUnitario], [idCategoria], [CantidadDepositos], [CantidadExhibidores], [AdvertenciaBajoStock], [Activo], [dv]) VALUES (4, N'botines adidas', 30000, 11, 0, 0, 0, 1, 0x50F9313432AAFA01DEB457CA9B76C2910A354FF5F8C40E903196EEDB0AB4CEC9)
INSERT [dbo].[PRODUCTOS] ([idProducto], [NOMBRE], [PrecioUnitario], [idCategoria], [CantidadDepositos], [CantidadExhibidores], [AdvertenciaBajoStock], [Activo], [dv]) VALUES (5, N'conjunto deportivo nike', 27000, 11, 0, 0, 0, 1, 0x30797FD51DDF337E9011DD02EC3173C7A00BD7ADC17C17910989D6F120B74854)
INSERT [dbo].[PRODUCTOS] ([idProducto], [NOMBRE], [PrecioUnitario], [idCategoria], [CantidadDepositos], [CantidadExhibidores], [AdvertenciaBajoStock], [Activo], [dv]) VALUES (6, N'zapatillas topper negras', 12000, 11, 0, 0, 0, 1, 0x07A56590D42F0EA8362A5EA7CD3ED79202A56FE4562F14AFB3EA087FAE960157)
GO
SET IDENTITY_INSERT [dbo].[PRODUCTOS_HISTORIALCAMBIOS] ON 

INSERT [dbo].[PRODUCTOS_HISTORIALCAMBIOS] ([idCambioProducto], [idProducto], [Nombre], [PrecioUnitario], [idCategoria], [AdvertenciaBajoStock], [DniEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (13, 1, N'pelota futbol', 15000, 11, 0, 42885742, N'addition', CAST(N'2022-10-19T20:55:27.003' AS DateTime))
INSERT [dbo].[PRODUCTOS_HISTORIALCAMBIOS] ([idCambioProducto], [idProducto], [Nombre], [PrecioUnitario], [idCategoria], [AdvertenciaBajoStock], [DniEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (14, 2, N'muñequeras tenis', 3500, 11, 0, 42885742, N'addition', CAST(N'2022-10-19T20:59:27.397' AS DateTime))
INSERT [dbo].[PRODUCTOS_HISTORIALCAMBIOS] ([idCambioProducto], [idProducto], [Nombre], [PrecioUnitario], [idCategoria], [AdvertenciaBajoStock], [DniEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (15, 3, N'guantes de arquero', 10000, 11, 0, 42885742, N'addition', CAST(N'2022-10-19T20:59:38.717' AS DateTime))
INSERT [dbo].[PRODUCTOS_HISTORIALCAMBIOS] ([idCambioProducto], [idProducto], [Nombre], [PrecioUnitario], [idCategoria], [AdvertenciaBajoStock], [DniEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (16, 4, N'botines adidas', 30000, 11, 0, 42885742, N'addition', CAST(N'2022-10-19T20:59:50.123' AS DateTime))
INSERT [dbo].[PRODUCTOS_HISTORIALCAMBIOS] ([idCambioProducto], [idProducto], [Nombre], [PrecioUnitario], [idCategoria], [AdvertenciaBajoStock], [DniEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (17, 5, N'conjunto deportivo nike', 27000, 11, 0, 42885742, N'addition', CAST(N'2022-10-19T21:00:06.647' AS DateTime))
INSERT [dbo].[PRODUCTOS_HISTORIALCAMBIOS] ([idCambioProducto], [idProducto], [Nombre], [PrecioUnitario], [idCategoria], [AdvertenciaBajoStock], [DniEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (18, 6, N'zapatillas topper negras', 12000, 11, 0, 42885742, N'addition', CAST(N'2022-10-19T21:00:26.913' AS DateTime))
INSERT [dbo].[PRODUCTOS_HISTORIALCAMBIOS] ([idCambioProducto], [idProducto], [Nombre], [PrecioUnitario], [idCategoria], [AdvertenciaBajoStock], [DniEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (19, 2, N'muñequeras tenis', 4000, 11, 0, 42885742, N'updation', CAST(N'2022-10-19T21:02:08.067' AS DateTime))
INSERT [dbo].[PRODUCTOS_HISTORIALCAMBIOS] ([idCambioProducto], [idProducto], [Nombre], [PrecioUnitario], [idCategoria], [AdvertenciaBajoStock], [DniEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (20, 2, N'muñequeras tenis', 3500, 11, 0, 42885742, N'updation', CAST(N'2022-10-19T21:02:29.980' AS DateTime))
INSERT [dbo].[PRODUCTOS_HISTORIALCAMBIOS] ([idCambioProducto], [idProducto], [Nombre], [PrecioUnitario], [idCategoria], [AdvertenciaBajoStock], [DniEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (21, 2, N'muñequeras tenis', 3500, 11, 0, 42885742, N'updation', CAST(N'2022-10-19T21:03:01.377' AS DateTime))
INSERT [dbo].[PRODUCTOS_HISTORIALCAMBIOS] ([idCambioProducto], [idProducto], [Nombre], [PrecioUnitario], [idCategoria], [AdvertenciaBajoStock], [DniEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (22, 2, N'muñequeras tenis', 4000, 11, 0, 42885742, N'updation', CAST(N'2022-10-19T21:04:25.627' AS DateTime))
INSERT [dbo].[PRODUCTOS_HISTORIALCAMBIOS] ([idCambioProducto], [idProducto], [Nombre], [PrecioUnitario], [idCategoria], [AdvertenciaBajoStock], [DniEmpleadoCambio], [TipoCambio], [FechaCambio]) VALUES (23, 2, N'muñequeras tenis', 3500, 11, 0, 42885742, N'updation', CAST(N'2022-10-19T21:06:22.963' AS DateTime))
SET IDENTITY_INSERT [dbo].[PRODUCTOS_HISTORIALCAMBIOS] OFF
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
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (9, N'pruebas', 0, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (10, N'prueba', 1, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (11, N'prueba3', 0, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (15, N'prueba3', 1, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (16, N'prueba4', 1, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (17, N'prueba5', 1, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (18, N'pruebafamilia', 1, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (19, N'pruebatest', 1, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (20, N'RolAgustin', 1, 0)
INSERT [dbo].[ROLES] ([idRol], [NOMBRE], [ACTIVO], [AdministradorDelSistema]) VALUES (21, N'RolAgustin1', 1, 0)
SET IDENTITY_INSERT [dbo].[ROLES] OFF
GO
INSERT [dbo].[SEVERIDAD] ([SEVERIDAD]) VALUES (N'error')
INSERT [dbo].[SEVERIDAD] ([SEVERIDAD]) VALUES (N'information')
INSERT [dbo].[SEVERIDAD] ([SEVERIDAD]) VALUES (N'warning')
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
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'change_password', N'Cambiar Contraseña nueva')
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
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'manage_backupsPERMISSION', N'Administrar backups')
GO
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
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission', N'Permiso')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_base', N'Permiso base')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_categoriesREAD', N'Ver Categorías')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_customersREAD', N'Ver Clientes')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'permission_delete', N'Eliminar registros')
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
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'quantity_in_shelves', N'Cantidad en exhibidores')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'quantity_in_warehouses', N'Cantidad en depositos')
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
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'restock_shelves', N'Reponer exhibidores')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'restocked_shelves', N'Exhibidores reabastecidos')
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
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'supermarket', N'Tienda Ropa')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'supplier', N'Proveedor')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'suppliers', N'Proveedores')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'supplies_delivery_reports', N'Informes de Entrega')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'surname', N'Apellido')
GO
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'system_logs', N'Bitácora')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'The_PDF_report_has_been_saved_to_the_downloads_folder', N'El reporte en PDF ha sido guardado en la carpeta de descargas.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'the_text_will_be_used_as_an_identifier', N'El texto va a ser utilizado como el nombre identificador del nuevo idioma.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'there_are_no_products', N'No hay productos registrados. Primero registrelos y después genere el informe.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'there_are_no_products_from_this_category', N'No hay productos registrados de esta categoría. Primero registrelos y después genere el informe de entrega.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'there_are_no_products_in_shelves', N'No hay productos en exhibidores, por lo que no se puede realizar una venta.')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (5, N'there_are_no_products_in_warehouses', N'No hay productos en depositos, por lo que no se puede reponer en exhibidores.')
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
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'finished', N'Finished')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'full_name', N'Full name')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'incorrect_login', N'Incorrect login credentials.')
GO
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
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'requested_products', N'Requested products')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'requesting_employee', N'Requesting employee')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'restock_shelves', N'Restock Shelves')
GO
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
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (6, N'there_are_no_products_in_shelves', N'No hay productos en exhibidores, por lo que no se puede realizar una venta.')
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
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1007, N'activity', N'activitat')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1007, N'birth_date', N'Fecha de nacimientooooooo')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1007, N'cancelled', N'')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1007, N'employees', N'Empleaçao')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1007, N'yes', N'')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1009, N'change_password', N'cambiar contraseñas')
INSERT [dbo].[TRADUCCIONES] ([idIdioma], [NombrePalabra], [TextoTraducido]) VALUES (1012, N'change_password', N'cambio clave')
GO
SET IDENTITY_INSERT [dbo].[VENTAS] ON 

INSERT [dbo].[VENTAS] ([idVenta], [FECHA], [EFECTUADA], [DNI_EMPLEADO_VENDEDOR], [DNI_EMPLEADO_CANCELACION], [ACTIVO]) VALUES (5, CAST(N'2022-07-18T14:05:43.743' AS DateTime), 1, 42885742, NULL, 1)
INSERT [dbo].[VENTAS] ([idVenta], [FECHA], [EFECTUADA], [DNI_EMPLEADO_VENDEDOR], [DNI_EMPLEADO_CANCELACION], [ACTIVO]) VALUES (6, CAST(N'2022-07-18T14:08:07.000' AS DateTime), 0, 42885742, 42885742, 1)
INSERT [dbo].[VENTAS] ([idVenta], [FECHA], [EFECTUADA], [DNI_EMPLEADO_VENDEDOR], [DNI_EMPLEADO_CANCELACION], [ACTIVO]) VALUES (7, CAST(N'2022-07-21T18:06:37.720' AS DateTime), 1, 42885742, NULL, 1)
INSERT [dbo].[VENTAS] ([idVenta], [FECHA], [EFECTUADA], [DNI_EMPLEADO_VENDEDOR], [DNI_EMPLEADO_CANCELACION], [ACTIVO]) VALUES (8, CAST(N'2022-08-04T18:18:20.157' AS DateTime), 1, 42885742, NULL, 1)
INSERT [dbo].[VENTAS] ([idVenta], [FECHA], [EFECTUADA], [DNI_EMPLEADO_VENDEDOR], [DNI_EMPLEADO_CANCELACION], [ACTIVO]) VALUES (1008, CAST(N'2022-08-24T21:12:49.440' AS DateTime), 1, 42885742, NULL, 1)
INSERT [dbo].[VENTAS] ([idVenta], [FECHA], [EFECTUADA], [DNI_EMPLEADO_VENDEDOR], [DNI_EMPLEADO_CANCELACION], [ACTIVO]) VALUES (1009, CAST(N'2022-08-24T21:14:33.723' AS DateTime), 1, 42885742, NULL, 1)
SET IDENTITY_INSERT [dbo].[VENTAS] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_FAMILIA_FAMILIA]    Script Date: 31/10/2022 0:45:51 ******/
ALTER TABLE [dbo].[FAMILIA_FAMILIA] ADD  CONSTRAINT [PK_FAMILIA_FAMILIA] PRIMARY KEY NONCLUSTERED 
(
	[NombreFamiliaMadre] ASC,
	[NombreFamiliaHija] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Nombre_Palabras_Unique]    Script Date: 31/10/2022 0:45:51 ******/
ALTER TABLE [dbo].[PALABRAS] ADD  CONSTRAINT [Nombre_Palabras_Unique] UNIQUE NONCLUSTERED 
(
	[NombrePalabra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CATEGORIAS_HISTORIALCAMBIOS]  WITH CHECK ADD  CONSTRAINT [FK_CATEGORIAS_HISTORIALCAMBIOS_CATEGORIAS] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[CATEGORIAS] ([idCategoria])
GO
ALTER TABLE [dbo].[CATEGORIAS_HISTORIALCAMBIOS] CHECK CONSTRAINT [FK_CATEGORIAS_HISTORIALCAMBIOS_CATEGORIAS]
GO
ALTER TABLE [dbo].[CATEGORIAS_HISTORIALCAMBIOS]  WITH CHECK ADD  CONSTRAINT [FK_CATEGORIAS_HISTORIALCAMBIOS_EMPLEADOS] FOREIGN KEY([DNIEmpleadoCambio])
REFERENCES [dbo].[EMPLEADOS] ([DNI])
GO
ALTER TABLE [dbo].[CATEGORIAS_HISTORIALCAMBIOS] CHECK CONSTRAINT [FK_CATEGORIAS_HISTORIALCAMBIOS_EMPLEADOS]
GO
ALTER TABLE [dbo].[DETALLESENTREGAREABASTECIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_DETALLESENTREGAREABASTECIMIENTO_INFORMESREABASTECIMIENTO] FOREIGN KEY([idInformeReabastecimiento])
REFERENCES [dbo].[INFORMESREABASTECIMIENTO] ([idInformeReabastecimiento])
GO
ALTER TABLE [dbo].[DETALLESENTREGAREABASTECIMIENTO] CHECK CONSTRAINT [FK_DETALLESENTREGAREABASTECIMIENTO_INFORMESREABASTECIMIENTO]
GO
ALTER TABLE [dbo].[DETALLESENTREGAREABASTECIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_DETALLESENTREGAREABASTECIMIENTO_PRODUCTOS] FOREIGN KEY([idProducto])
REFERENCES [dbo].[PRODUCTOS] ([idProducto])
GO
ALTER TABLE [dbo].[DETALLESENTREGAREABASTECIMIENTO] CHECK CONSTRAINT [FK_DETALLESENTREGAREABASTECIMIENTO_PRODUCTOS]
GO
ALTER TABLE [dbo].[DETALLESSOLICITUDREABASTECIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_DETALLESSOLICITUDREABASTECIMIENTO_INFORMESREABASTECIMIENTO] FOREIGN KEY([idInformeReabastecimiento])
REFERENCES [dbo].[INFORMESREABASTECIMIENTO] ([idInformeReabastecimiento])
GO
ALTER TABLE [dbo].[DETALLESSOLICITUDREABASTECIMIENTO] CHECK CONSTRAINT [FK_DETALLESSOLICITUDREABASTECIMIENTO_INFORMESREABASTECIMIENTO]
GO
ALTER TABLE [dbo].[DETALLESSOLICITUDREABASTECIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_DETALLESSOLICITUDREABASTECIMIENTO_PRODUCTOS] FOREIGN KEY([idProducto])
REFERENCES [dbo].[PRODUCTOS] ([idProducto])
GO
ALTER TABLE [dbo].[DETALLESSOLICITUDREABASTECIMIENTO] CHECK CONSTRAINT [FK_DETALLESSOLICITUDREABASTECIMIENTO_PRODUCTOS]
GO
ALTER TABLE [dbo].[DETALLESVENTA]  WITH CHECK ADD  CONSTRAINT [FK_DETALLESVENTA_PRODUCTOS] FOREIGN KEY([idProducto])
REFERENCES [dbo].[PRODUCTOS] ([idProducto])
GO
ALTER TABLE [dbo].[DETALLESVENTA] CHECK CONSTRAINT [FK_DETALLESVENTA_PRODUCTOS]
GO
ALTER TABLE [dbo].[DETALLESVENTA]  WITH CHECK ADD  CONSTRAINT [FK_DETALLESVENTA_VENTAS] FOREIGN KEY([idVenta])
REFERENCES [dbo].[VENTAS] ([idVenta])
GO
ALTER TABLE [dbo].[DETALLESVENTA] CHECK CONSTRAINT [FK_DETALLESVENTA_VENTAS]
GO
ALTER TABLE [dbo].[EMPLEADOS]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADOS_IDIOMAS] FOREIGN KEY([idIdioma])
REFERENCES [dbo].[IDIOMAS] ([idIdioma])
GO
ALTER TABLE [dbo].[EMPLEADOS] CHECK CONSTRAINT [FK_EMPLEADOS_IDIOMAS]
GO
ALTER TABLE [dbo].[EMPLEADOS]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADOS_PERSONAS] FOREIGN KEY([DNI])
REFERENCES [dbo].[PERSONAS] ([DNI])
GO
ALTER TABLE [dbo].[EMPLEADOS] CHECK CONSTRAINT [FK_EMPLEADOS_PERSONAS]
GO
ALTER TABLE [dbo].[EMPLEADOS]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADOS_ROLES] FOREIGN KEY([idRol])
REFERENCES [dbo].[ROLES] ([idRol])
GO
ALTER TABLE [dbo].[EMPLEADOS] CHECK CONSTRAINT [FK_EMPLEADOS_ROLES]
GO
ALTER TABLE [dbo].[EVENTOSBITACORA]  WITH CHECK ADD  CONSTRAINT [FK_EVENTOSBITACORA_EMPLEADOS] FOREIGN KEY([DNIEMPLEADO])
REFERENCES [dbo].[EMPLEADOS] ([DNI])
GO
ALTER TABLE [dbo].[EVENTOSBITACORA] CHECK CONSTRAINT [FK_EVENTOSBITACORA_EMPLEADOS]
GO
ALTER TABLE [dbo].[EVENTOSBITACORA]  WITH CHECK ADD  CONSTRAINT [FK_EVENTOSBITACORA_PALABRAS] FOREIGN KEY([ACTIVIDAD])
REFERENCES [dbo].[PALABRAS] ([NombrePalabra])
GO
ALTER TABLE [dbo].[EVENTOSBITACORA] CHECK CONSTRAINT [FK_EVENTOSBITACORA_PALABRAS]
GO
ALTER TABLE [dbo].[EVENTOSBITACORA]  WITH CHECK ADD  CONSTRAINT [FK_EVENTOSBITACORA_PALABRAS1] FOREIGN KEY([TIPOENTIDAD])
REFERENCES [dbo].[PALABRAS] ([NombrePalabra])
GO
ALTER TABLE [dbo].[EVENTOSBITACORA] CHECK CONSTRAINT [FK_EVENTOSBITACORA_PALABRAS1]
GO
ALTER TABLE [dbo].[EVENTOSBITACORA]  WITH CHECK ADD  CONSTRAINT [FK_EVENTOSBITACORA_SEVERIDAD] FOREIGN KEY([SEVERIDAD])
REFERENCES [dbo].[SEVERIDAD] ([SEVERIDAD])
GO
ALTER TABLE [dbo].[EVENTOSBITACORA] CHECK CONSTRAINT [FK_EVENTOSBITACORA_SEVERIDAD]
GO
ALTER TABLE [dbo].[FAMILIA]  WITH CHECK ADD  CONSTRAINT [FK_FAMILIA_PALABRAS] FOREIGN KEY([DESCRIPCION])
REFERENCES [dbo].[PALABRAS] ([NombrePalabra])
GO
ALTER TABLE [dbo].[FAMILIA] CHECK CONSTRAINT [FK_FAMILIA_PALABRAS]
GO
ALTER TABLE [dbo].[FAMILIA_FAMILIA]  WITH CHECK ADD  CONSTRAINT [FK_FAMILIA_FAMILIA_FAMILIA] FOREIGN KEY([NombreFamiliaHija])
REFERENCES [dbo].[FAMILIA] ([NOMBRE])
GO
ALTER TABLE [dbo].[FAMILIA_FAMILIA] CHECK CONSTRAINT [FK_FAMILIA_FAMILIA_FAMILIA]
GO
ALTER TABLE [dbo].[FAMILIA_FAMILIA]  WITH CHECK ADD  CONSTRAINT [FK_FAMILIA_FAMILIA_FAMILIA1] FOREIGN KEY([NombreFamiliaMadre])
REFERENCES [dbo].[FAMILIA] ([NOMBRE])
GO
ALTER TABLE [dbo].[FAMILIA_FAMILIA] CHECK CONSTRAINT [FK_FAMILIA_FAMILIA_FAMILIA1]
GO
ALTER TABLE [dbo].[FAMILIA_PERMISO]  WITH CHECK ADD  CONSTRAINT [FK_FAMILIA_PERMISO_FAMILIA_PERMISO] FOREIGN KEY([nombrePermiso])
REFERENCES [dbo].[PERMISOS] ([NombrePermiso])
GO
ALTER TABLE [dbo].[FAMILIA_PERMISO] CHECK CONSTRAINT [FK_FAMILIA_PERMISO_FAMILIA_PERMISO]
GO
ALTER TABLE [dbo].[FAMILIA_ROL]  WITH CHECK ADD  CONSTRAINT [FK_FAMILIA_ROL_ROLES] FOREIGN KEY([idRol])
REFERENCES [dbo].[ROLES] ([idRol])
GO
ALTER TABLE [dbo].[FAMILIA_ROL] CHECK CONSTRAINT [FK_FAMILIA_ROL_ROLES]
GO
ALTER TABLE [dbo].[IDIOMAS]  WITH CHECK ADD  CONSTRAINT [FK_IDIOMAS_PALABRAS] FOREIGN KEY([Nombre])
REFERENCES [dbo].[PALABRAS] ([NombrePalabra])
GO
ALTER TABLE [dbo].[IDIOMAS] CHECK CONSTRAINT [FK_IDIOMAS_PALABRAS]
GO
ALTER TABLE [dbo].[INFORMESREABASTECIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_INFORMESREABASTECIMIENTO_EMPLEADOS] FOREIGN KEY([DNI_EMPLEADORECEPTOR])
REFERENCES [dbo].[EMPLEADOS] ([DNI])
GO
ALTER TABLE [dbo].[INFORMESREABASTECIMIENTO] CHECK CONSTRAINT [FK_INFORMESREABASTECIMIENTO_EMPLEADOS]
GO
ALTER TABLE [dbo].[INFORMESREABASTECIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_INFORMESREABASTECIMIENTO_EMPLEADOS1] FOREIGN KEY([DNI_EMPLEADOSOLICITANTE])
REFERENCES [dbo].[EMPLEADOS] ([DNI])
GO
ALTER TABLE [dbo].[INFORMESREABASTECIMIENTO] CHECK CONSTRAINT [FK_INFORMESREABASTECIMIENTO_EMPLEADOS1]
GO
ALTER TABLE [dbo].[INFORMESREABASTECIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_INFORMESREABASTECIMIENTO_PROVEEDORES] FOREIGN KEY([DNI_PROVEEDOR])
REFERENCES [dbo].[PROVEEDORES] ([DNI])
GO
ALTER TABLE [dbo].[INFORMESREABASTECIMIENTO] CHECK CONSTRAINT [FK_INFORMESREABASTECIMIENTO_PROVEEDORES]
GO
ALTER TABLE [dbo].[PERMISOS]  WITH CHECK ADD  CONSTRAINT [FK_PERMISOS_PALABRAS] FOREIGN KEY([Descripcion])
REFERENCES [dbo].[PALABRAS] ([NombrePalabra])
GO
ALTER TABLE [dbo].[PERMISOS] CHECK CONSTRAINT [FK_PERMISOS_PALABRAS]
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
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_CATEGORIAS] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[CATEGORIAS] ([idCategoria])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTOS_CATEGORIAS]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_CATEGORIAS1] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[CATEGORIAS] ([idCategoria])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTOS_CATEGORIAS1]
GO
ALTER TABLE [dbo].[PRODUCTOS_HISTORIALCAMBIOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_HISTORIALCAMBIOS_EMPLEADOS] FOREIGN KEY([DniEmpleadoCambio])
REFERENCES [dbo].[EMPLEADOS] ([DNI])
GO
ALTER TABLE [dbo].[PRODUCTOS_HISTORIALCAMBIOS] CHECK CONSTRAINT [FK_PRODUCTOS_HISTORIALCAMBIOS_EMPLEADOS]
GO
ALTER TABLE [dbo].[PRODUCTOS_HISTORIALCAMBIOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_HISTORIALCAMBIOS_PRODUCTOS] FOREIGN KEY([idProducto])
REFERENCES [dbo].[PRODUCTOS] ([idProducto])
GO
ALTER TABLE [dbo].[PRODUCTOS_HISTORIALCAMBIOS] CHECK CONSTRAINT [FK_PRODUCTOS_HISTORIALCAMBIOS_PRODUCTOS]
GO
ALTER TABLE [dbo].[PROVEEDORES]  WITH CHECK ADD  CONSTRAINT [FK_PROVEEDORES_CATEGORIAS] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[CATEGORIAS] ([idCategoria])
GO
ALTER TABLE [dbo].[PROVEEDORES] CHECK CONSTRAINT [FK_PROVEEDORES_CATEGORIAS]
GO
ALTER TABLE [dbo].[PROVEEDORES]  WITH CHECK ADD  CONSTRAINT [FK_PROVEEDORES_PERSONAS] FOREIGN KEY([DNI])
REFERENCES [dbo].[PERSONAS] ([DNI])
GO
ALTER TABLE [dbo].[PROVEEDORES] CHECK CONSTRAINT [FK_PROVEEDORES_PERSONAS]
GO
ALTER TABLE [dbo].[SEVERIDAD]  WITH CHECK ADD  CONSTRAINT [FK_SEVERIDAD_PALABRAS] FOREIGN KEY([SEVERIDAD])
REFERENCES [dbo].[PALABRAS] ([NombrePalabra])
GO
ALTER TABLE [dbo].[SEVERIDAD] CHECK CONSTRAINT [FK_SEVERIDAD_PALABRAS]
GO
ALTER TABLE [dbo].[TIPOSCAMBIOS]  WITH CHECK ADD  CONSTRAINT [FK_TIPOSCAMBIOS_PALABRAS] FOREIGN KEY([CAMBIO])
REFERENCES [dbo].[PALABRAS] ([NombrePalabra])
GO
ALTER TABLE [dbo].[TIPOSCAMBIOS] CHECK CONSTRAINT [FK_TIPOSCAMBIOS_PALABRAS]
GO
ALTER TABLE [dbo].[TRADUCCIONES]  WITH CHECK ADD  CONSTRAINT [FK_TRADUCCIONES_PALABRAS] FOREIGN KEY([NombrePalabra])
REFERENCES [dbo].[PALABRAS] ([NombrePalabra])
GO
ALTER TABLE [dbo].[TRADUCCIONES] CHECK CONSTRAINT [FK_TRADUCCIONES_PALABRAS]
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_VENTAS_EMPLEADOS_CANCELACION] FOREIGN KEY([DNI_EMPLEADO_CANCELACION])
REFERENCES [dbo].[EMPLEADOS] ([DNI])
GO
ALTER TABLE [dbo].[VENTAS] CHECK CONSTRAINT [FK_VENTAS_EMPLEADOS_CANCELACION]
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_VENTAS_EMPLEADOS_VENDEDOR] FOREIGN KEY([DNI_EMPLEADO_VENDEDOR])
REFERENCES [dbo].[EMPLEADOS] ([DNI])
GO
ALTER TABLE [dbo].[VENTAS] CHECK CONSTRAINT [FK_VENTAS_EMPLEADOS_VENDEDOR]
GO
/****** Object:  StoredProcedure [dbo].[BACKUP_CHECK_IF_IT_EXISTS]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BACKUP_CHECK_IF_IT_EXISTS]
(@idBackup int, @Existe bit output)
AS
BEGIN
declare @path nvarchar(260) = (select SystemPath from Backups where idBackup = @idBackup)
     DECLARE @result INT
     EXEC master.dbo.xp_fileexist @path, @result OUTPUT
	 set @Existe = cast(@result as bit)
     RETURN @Existe
END;
GO
/****** Object:  StoredProcedure [dbo].[BACKUP_CREATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BACKUP_CREATE]
(@idBackup int, @DNI_Empleado int, @Fecha datetime, @SystemPath nvarchar(260))
as
begin
	exec master.sys.xp_create_subdir @SystemPath --si el directorio no existe, lo crea

	set @SystemPath = convert(nvarchar(260), concat(@SystemPath, @idBackup))
	BACKUP DATABASE [TiendaTRIGANE]
	TO  DISK = @SystemPath WITH NOFORMAT, NOINIT,
	NAME = N'TiendaTRIGANE-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10

	insert into Backups (idBackup, DNI_Empleado, Fecha, SystemPath)
	values (@idBackup, @DNI_Empleado, @Fecha, @SystemPath)
end
GO
/****** Object:  StoredProcedure [dbo].[BACKUP_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BACKUP_GET_ALL]
as 
begin 
	select 
	Backups.*,
	--Empleado_Vendedor
	Personas.DNI 'Empleado_DNI',
	Personas.Nombre as 'Empleado_Nombre',
	Personas.Apellido 'Empleado_Apellido',
	Personas.FechaNacimiento 'Empleado_FechaNacimiento',
	Personas.Email 'Empleado_Email',
	--Rol del Empleado_Vendedor
	Roles.idRol 'Empleado_Rol_idRol',
	Roles.Nombre 'Empleado_Rol_Nombre',
	Roles.AdministradorDelSistema 'Empleado_Rol_AdministradorDelSistema'
	from Backups
	join Empleados on Empleados.DNI = Backups.DNI_Empleado
		join Personas  on Personas.DNI = Empleados.DNI
		join Roles on Roles.idRol = Empleados.idRol	 
		order by Fecha desc
end
GO
/****** Object:  StoredProcedure [dbo].[CATEGORIA_CREATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CATEGORIA_CREATE]
(@Nombre nvarchar(50), @Activo bit,
@idCategoria int output)
as
begin try
	begin tran
		begin
			insert into Categorias 	(Nombre, Activo)
			values	(@Nombre, @Activo)
		end
	commit
	set @idCategoria = SCOPE_IDENTITY()
	return @idCategoria
end try
begin catch
	rollback;
	THROW;
end catch








 


GO
/****** Object:  StoredProcedure [dbo].[CATEGORIA_CREATE_CHANGE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CATEGORIA_CREATE_CHANGE]
(
	@idCategoria int,
	@Nombre nvarchar(50),
	@DNIEmpleadoCambio int,
	@TipoCambio nvarchar(100),
	@FechaCambio datetime
)
as
begin try
	begin tran
		begin
			insert into Categorias_HistorialCambios 
			(idCategoria, Nombre, DNIEmpleadoCambio, TipoCambio, FechaCambio)
			values
			(@idCategoria, @Nombre, @DNIEmpleadoCambio, @TipoCambio, @FechaCambio)
		end
	commit
end try
begin catch
	rollback;
	THROW;
end catch
GO
/****** Object:  StoredProcedure [dbo].[CATEGORIA_DELETE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CATEGORIA_DELETE]
(@idCategoria int)
as
begin try
	begin tran
		begin
			update Categorias set Activo = 0 where idCategoria = @idCategoria 
		end
	commit
end try
begin catch
	rollback;
	THROW;
end catch
GO
/****** Object:  StoredProcedure [dbo].[CATEGORIA_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CATEGORIA_GET_ALL]
as
begin
	SELECT * FROM Categorias where Activo = 1
end 
GO
/****** Object:  StoredProcedure [dbo].[CATEGORIA_GET_ALL_CHANGES]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CATEGORIA_GET_ALL_CHANGES]
@idCategoria int
as
begin
	SELECT Categorias_HistorialCambios.*,
	--Empleado_Vendedor
	persona_emp_cambio_rol.DNI 'Empleado_Cambio_DNI',
	persona_emp_cambio_rol.Nombre as 'Empleado_Cambio_Nombre',
	persona_emp_cambio_rol.Apellido 'Empleado_Cambio_Apellido',
	persona_emp_cambio_rol.FechaNacimiento 'Empleado_Cambio_FechaNacimiento',
	persona_emp_cambio_rol.Email 'Empleado_Cambio_Email',
	--Rol del Empleado_Vendedor
	emp_cambio_rol.idRol 'Empleado_Cambio_Rol_idRol',
	emp_cambio_rol.Nombre 'Empleado_Cambio_Rol_Nombre',
	emp_cambio_rol.AdministradorDelSistema 'Empleado_Cambio_Rol_AdministradorDelSistema'
	FROM Categorias_HistorialCambios
	join Empleados emp_cambio on emp_cambio.DNI = Categorias_HistorialCambios.DNIEmpleadoCambio
		join Personas persona_emp_cambio_rol on persona_emp_cambio_rol.DNI = emp_cambio.DNI
		join Roles emp_cambio_rol on emp_cambio_rol.idRol = emp_cambio.idRol
	where idCategoria = @idCategoria
	order by FechaCambio desc
end
GO
/****** Object:  StoredProcedure [dbo].[CATEGORIA_UPDATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CATEGORIA_UPDATE]
(@idCategoria int, @Nombre nvarchar(50))
as
begin try
	begin tran
		begin
			update Categorias 
			set Nombre = @Nombre
			where idCategoria = @idCategoria
		end
	commit
end try
begin catch
	rollback;
	THROW;
end catch
GO
/****** Object:  StoredProcedure [dbo].[DETALLE_ENTREGA_REABASTECIMIENTO_CREATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DETALLE_ENTREGA_REABASTECIMIENTO_CREATE]
@IDINFORMEREABASTECIMIENTO INT, @IDPRODUCTO INT, @CANTIDAD INT
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			INSERT INTO DETALLESENTREGAREABASTECIMIENTO(IDINFORMEREABASTECIMIENTO, IDPRODUCTO, CANTIDAD)
			VALUES (@IDINFORMEREABASTECIMIENTO, @IDPRODUCTO, @CANTIDAD)
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[DETALLE_ENTREGA_REABASTECIMIENTO_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DETALLE_ENTREGA_REABASTECIMIENTO_GET_ALL]
@IDINFORMEREABASTECIMIENTO INT
AS 
BEGIN 
	SELECT DETALLESENTREGAREABASTECIMIENTO.*,
	PRODUCTOS.*,
	CATEGORIAS.NOMBRE 'CATEGORIA_NOMBRE'
	FROM DETALLESENTREGAREABASTECIMIENTO
	JOIN PRODUCTOS ON PRODUCTOS.IDPRODUCTO = DETALLESENTREGAREABASTECIMIENTO.IDPRODUCTO
	JOIN CATEGORIAS ON CATEGORIAS.IDCATEGORIA = PRODUCTOS.IDCATEGORIA
	WHERE IDINFORMEREABASTECIMIENTO = @IDINFORMEREABASTECIMIENTO
END
GO
/****** Object:  StoredProcedure [dbo].[DETALLE_SOLICITUD_REABASTECIMIENTO_CREATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DETALLE_SOLICITUD_REABASTECIMIENTO_CREATE]
@IDINFORMEREABASTECIMIENTO INT, @IDPRODUCTO INT, @CANTIDAD INT
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			INSERT INTO DETALLESSOLICITUDREABASTECIMIENTO(IDINFORMEREABASTECIMIENTO, IDPRODUCTO, CANTIDAD)
			VALUES (@IDINFORMEREABASTECIMIENTO, @IDPRODUCTO, @CANTIDAD)
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[DETALLE_SOLICITUD_REABASTECIMIENTO_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DETALLE_SOLICITUD_REABASTECIMIENTO_GET_ALL]
@IDINFORMEREABASTECIMIENTO INT
AS 
BEGIN 
	SELECT DETALLESSOLICITUDREABASTECIMIENTO.*,
	PRODUCTOS.*,
	CATEGORIAS.NOMBRE 'CATEGORIA_NOMBRE'
	FROM DETALLESSOLICITUDREABASTECIMIENTO
	JOIN PRODUCTOS ON PRODUCTOS.IDPRODUCTO = DETALLESSOLICITUDREABASTECIMIENTO.IDPRODUCTO
	JOIN CATEGORIAS ON CATEGORIAS.IDCATEGORIA = PRODUCTOS.IDCATEGORIA
	WHERE IDINFORMEREABASTECIMIENTO = @IDINFORMEREABASTECIMIENTO
END
GO
/****** Object:  StoredProcedure [dbo].[DETALLEVENTA_CREATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DETALLEVENTA_CREATE]
@IDVENTA INT, @IDPRODUCTO INT, @CANTIDAD INT, @IMPORTE FLOAT
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			INSERT INTO DETALLESVENTA (IDVENTA, IDPRODUCTO, CANTIDAD, IMPORTE)
			VALUES
			(@IDVENTA, @IDPRODUCTO, @CANTIDAD, @IMPORTE)
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[DETALLEVENTA_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DETALLEVENTA_GET_ALL]
@IDVENTA INT
AS 
BEGIN 
	SELECT DETALLESVENTA.*,
	PRODUCTOS.*,
	CATEGORIAS.NOMBRE 'CATEGORIA_NOMBRE'
	FROM DETALLESVENTA
	JOIN PRODUCTOS ON PRODUCTOS.IDPRODUCTO = DETALLESVENTA.IDPRODUCTO
	JOIN CATEGORIAS ON CATEGORIAS.IDCATEGORIA = PRODUCTOS.IDCATEGORIA
	WHERE IDVENTA = @IDVENTA
END
GO
/****** Object:  StoredProcedure [dbo].[DVV_GET]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DVV_GET]
@TABLA NVARCHAR(50) AS
BEGIN
	SELECT * FROM DIGITOSVERIFICADORESVERTICALES WHERE TABLA = @TABLA
END
GO
/****** Object:  StoredProcedure [dbo].[DVV_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DVV_GET_ALL]
AS
BEGIN
	SELECT * FROM DIGITOSVERIFICADORESVERTICALES
END
GO
/****** Object:  StoredProcedure [dbo].[DVV_UPDATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DVV_UPDATE]
@TABLA NVARCHAR(50), @DVV BINARY(32)
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			UPDATE DIGITOSVERIFICADORESVERTICALES SET DVV = @DVV WHERE TABLA = @TABLA
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[EMPLEADO_CREATE]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[EMPLEADO_DELETE]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[EMPLEADO_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[EMPLEADO_GET_COUNT]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[EMPLEADO_GET_WITHLOGININFO]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[EMPLEADO_RESET_PWD]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[EMPLEADO_UPDATE]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[EVENTOBITACORA_CREATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EVENTOBITACORA_CREATE]
@SEVERIDAD NVARCHAR(50), @DNIEMPLEADO INT, @FECHA DATETIME, @ACTIVIDAD NVARCHAR(100),
@TIPOENTIDAD NVARCHAR(50), @INFOASOCIADA NVARCHAR(MAX)
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			INSERT INTO EVENTOSBITACORA(SEVERIDAD, DNIEMPLEADO, FECHA, ACTIVIDAD, TIPOENTIDAD, INFOASOCIADA)
			VALUES
			(@SEVERIDAD, @DNIEMPLEADO, @FECHA, @ACTIVIDAD, @TIPOENTIDAD, @INFOASOCIADA)
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[EVENTOBITACORA_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EVENTOBITACORA_GET_ALL]
AS

SELECT EVENTOSBITACORA.*,
EMPLEADOS.*, PERSONAS.*,
	ROLES.NOMBRE 'ROL_NOMBRE',
	ROLES.ADMINISTRADORDELSISTEMA 'ROL_ADMINISTRADORDELSISTEMA',
	IDIOMAS.NOMBRE 'IDIOMA_NOMBRE',
	IDIOMAS.[DEFAULT] 'IDIOMA_DEFAULT',
	IDIOMAS.HABILITADO 'IDIOMA_HABILITADO'
	FROM EVENTOSBITACORA
	JOIN EMPLEADOS ON EVENTOSBITACORA.DNIEMPLEADO = EMPLEADOS.DNI
		JOIN PERSONAS ON PERSONAS.DNI = EMPLEADOS.DNI
			JOIN ROLES ON EMPLEADOS.IDROL = ROLES.IDROL
				LEFT JOIN IDIOMAS ON IDIOMAS.IDIDIOMA = EMPLEADOS.IDIDIOMA
	ORDER BY EVENTOSBITACORA.FECHA DESC
GO
/****** Object:  StoredProcedure [dbo].[FAMILIA_ASIGNAR_A_FAMILIA]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FAMILIA_ASIGNAR_A_FAMILIA]
@IDFAMILIAMADRE INT, @IDFAMILIAHIJA INT
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
	INSERT INTO FAMILIA_FAMILIA VALUES (@IDFAMILIAMADRE, @IDFAMILIAHIJA)
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[FAMILIA_ASIGNAR_A_ROL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FAMILIA_ASIGNAR_A_ROL]
@IDROL INT, @IDFAMILIA INT
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
	INSERT INTO FAMILIA_ROL VALUES (@IDFAMILIA, @IDROL)
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[FAMILIA_CREATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FAMILIA_CREATE]
@NOMBRE NVARCHAR(100)
AS
BEGIN
	INSERT INTO FAMILIA VALUES(@NOMBRE)
END
GO
/****** Object:  StoredProcedure [dbo].[FAMILIA_DELETE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FAMILIA_DELETE]
@IDFAMILIA INT, @NOMBRE NVARCHAR(100)
AS
BEGIN
	DELETE FROM FAMILIA WHERE idFamilia = @IDFAMILIA
END
GO
/****** Object:  StoredProcedure [dbo].[FAMILIA_GET]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FAMILIA_GET]
@NombreFamilia nvarchar(100)
as
begin
	select Top(1) FAMILIA.NOMBRE, Palabras.NombrePalabra 
	from FAMILIA 
	join Palabras on FAMILIA.Descripcion = Palabras.NombrePalabra 
	where FAMILIA.NOMBRE = @NombreFamilia
end
GO
/****** Object:  StoredProcedure [dbo].[FAMILIA_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FAMILIA_GET_ALL]
AS
BEGIN
	SELECT NOMBRE FROM FAMILIA
END
GO
/****** Object:  StoredProcedure [dbo].[FAMILIA_GET_HIJOS]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[FAMILIA_GET_HIJOS]
@NombreFamiliaMadre nvarchar(100)
AS
BEGIN
	select NombreFamiliaHija
	from FAMILIA_FAMILIA 
	where NombreFamiliaMadre = @NombreFamiliaMadre
END
GO
/****** Object:  StoredProcedure [dbo].[FAMILIA_REMOVER_DE_FAMILIA]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[FAMILIA_REMOVER_DE_FAMILIA]
@IDFAMILIAMADRE INT, @IDFAMILIAHIJA INT
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
	DELETE FROM FAMILIA_FAMILIA WHERE IDFAMILIAMADRE = @IDFAMILIAMADRE AND IDFAMILIAHIJA = @IDFAMILIAHIJA
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[FAMILIA_REMOVER_DE_ROL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FAMILIA_REMOVER_DE_ROL]
@IDROL INT, @IDFAMILIA INT
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
	DELETE FROM FAMILIA_ROL WHERE idFamilia = @IDFAMILIA AND idRol = @IDROL
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[IDIOMA_CREATE]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[IDIOMA_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[IDIOMA_GET_ALL_HABILITADOS]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[IDIOMA_GET_DEFAULT]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[IDIOMA_UPDATE]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[IDIOMA_UPDATE_DEFAULT]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[IDIOMA_UPDATE_HABILITADO]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[INFORMEREABASTECIMIENTO_CREATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INFORMEREABASTECIMIENTO_CREATE]
(@DNI_PROVEEDOR INT, @DNI_EMPLEADOSOLICITANTE INT, @FECHASOLICITUD DATETIME, @FECHAENTREGAACORDADA DATETIME,
@COMENTARIOSOLICITUD NVARCHAR(240), @SOLICITUDTERMINADA BIT)
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			INSERT INTO INFORMESREABASTECIMIENTO
			(DNI_PROVEEDOR, DNI_EMPLEADOSOLICITANTE, FECHASOLICITUD,FECHAENTREGAACORDADA ,COMENTARIOSOLICITUD, SOLICITUDTERMINADA, ACTIVO)
			VALUES
			(@DNI_PROVEEDOR,@DNI_EMPLEADOSOLICITANTE,@FECHASOLICITUD,@FECHAENTREGAACORDADA, @COMENTARIOSOLICITUD,@SOLICITUDTERMINADA,1)
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[INFORMEREABASTECIMIENTO_DELETE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INFORMEREABASTECIMIENTO_DELETE]
(@IDINFORMEREABASTECIMIENTO BIT)
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			UPDATE INFORMESREABASTECIMIENTO SET ACTIVO = 0 WHERE IDINFORMEREABASTECIMIENTO = @IDINFORMEREABASTECIMIENTO
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[INFORMEREABASTECIMIENTO_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INFORMEREABASTECIMIENTO_GET_ALL]
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			SELECT INFORMESREABASTECIMIENTO.*,
			--PROVEEDOR
			P_P.DNI 'PROVEEDOR_DNI',
			P_P.NOMBRE AS 'PROVEEDOR_NOMBRE',
			P_P.APELLIDO 'PROVEEDOR_APELLIDO',
			P_P.FECHANACIMIENTO 'PROVEEDOR_FECHANACIMIENTO',
			P_P.EMAIL 'PROVEEDOR_EMAIL',
			--CATEGORIA DEL PROVEEDOR
			CATEGORIAS.IDCATEGORIA 'PROVEEDOR_CATEGORIA_ID',
			CATEGORIAS.NOMBRE 'PROVEEDOR_CATEGORIA_NOMBRE',
			--EMPLEADOSOLICITANTE
			P_EMP_SOLI.DNI 'EMPLEADOSOLICITANTE_DNI',
			P_EMP_SOLI.NOMBRE AS 'EMPLEADOSOLICITANTE_NOMBRE',
			P_EMP_SOLI.APELLIDO 'EMPLEADOSOLICITANTE_APELLIDO',
			P_EMP_SOLI.FECHANACIMIENTO 'EMPLEADOSOLICITANTE_FECHANACIMIENTO',
			P_EMP_SOLI.EMAIL 'EMPLEADOSOLICITANTE_EMAIL',
			--ROL DEL EMPLEADOSOLICITANTE
			EMP_SOLI_ROL.IDROL 'EMPLEADOSOLICITANTE_ROL_IDROL',
			EMP_SOLI_ROL.NOMBRE 'EMPLEADOSOLICITANTE_ROL_NOMBRE',
			EMP_SOLI_ROL.ADMINISTRADORDELSISTEMA 'EMPLEADOSOLICITANTE_ROL_ADMINISTRADORDELSISTEMA',
			--EMPLEADORECEPTOR
			P_EMP_RECEPTOR.DNI 'EMPLEADORECEPTOR_DNI',
			P_EMP_RECEPTOR.NOMBRE AS 'EMPLEADORECEPTOR_NOMBRE',
			P_EMP_RECEPTOR.APELLIDO 'EMPLEADORECEPTOR_APELLIDO',
			P_EMP_RECEPTOR.FECHANACIMIENTO 'EMPLEADORECEPTOR_FECHANACIMIENTO',
			P_EMP_RECEPTOR.EMAIL 'EMPLEADORECEPTOR_EMAIL',
			--ROL DEL EMPLEADORECEPTOR
			EMP_RECEPTOR_ROL.IDROL 'EMPLEADORECEPTOR_ROL_IDROL',
			EMP_RECEPTOR_ROL.NOMBRE 'EMPLEADORECEPTOR_ROL_NOMBRE',
			EMP_RECEPTOR_ROL.ADMINISTRADORDELSISTEMA 'EMPLEADORECEPTOR_ROL_ADMINISTRADORDELSISTEMA'
			FROM INFORMESREABASTECIMIENTO
			JOIN PROVEEDORES ON INFORMESREABASTECIMIENTO.DNI_PROVEEDOR = PROVEEDORES.DNI	
				JOIN PERSONAS P_P ON P_P.DNI = PROVEEDORES.DNI
				JOIN CATEGORIAS ON CATEGORIAS.IDCATEGORIA = PROVEEDORES.IDCATEGORIA
			JOIN EMPLEADOS EMP_SOLI ON EMP_SOLI.DNI = INFORMESREABASTECIMIENTO.DNI_EMPLEADOSOLICITANTE
				JOIN PERSONAS P_EMP_SOLI ON P_EMP_SOLI.DNI = EMP_SOLI.DNI
				JOIN ROLES EMP_SOLI_ROL ON EMP_SOLI_ROL.IDROL = EMP_SOLI.IDROL
			LEFT JOIN EMPLEADOS EMP_RECEPTOR ON EMP_RECEPTOR.DNI = INFORMESREABASTECIMIENTO.DNI_EMPLEADORECEPTOR
				LEFT JOIN PERSONAS P_EMP_RECEPTOR ON P_EMP_RECEPTOR.DNI = EMP_RECEPTOR.DNI
				LEFT JOIN ROLES EMP_RECEPTOR_ROL ON EMP_RECEPTOR_ROL.IDROL = EMP_RECEPTOR.IDROL
			WHERE INFORMESREABASTECIMIENTO.ACTIVO = 1
			ORDER BY FECHASOLICITUD DESC
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[INFORMEREABASTECIMIENTO_GET_LATEST_BY_REQUESTING_EMPLOYEE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INFORMEREABASTECIMIENTO_GET_LATEST_BY_REQUESTING_EMPLOYEE]
@DNI INT
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			SELECT INFORMESREABASTECIMIENTO.*,
			--PROVEEDOR
			P_P.DNI 'PROVEEDOR_DNI',
			P_P.NOMBRE AS 'PROVEEDOR_NOMBRE',
			P_P.APELLIDO 'PROVEEDOR_APELLIDO',
			P_P.FECHANACIMIENTO 'PROVEEDOR_FECHANACIMIENTO',
			P_P.EMAIL 'PROVEEDOR_EMAIL',
			--CATEGORIA DEL PROVEEDOR
			CATEGORIAS.IDCATEGORIA 'PROVEEDOR_CATEGORIA_ID',
			CATEGORIAS.NOMBRE 'PROVEEDOR_CATEGORIA_NOMBRE',
			--EMPLEADOSOLICITANTE
			P_EMP_SOLI.DNI 'EMPLEADOSOLICITANTE_DNI',
			P_EMP_SOLI.NOMBRE AS 'EMPLEADOSOLICITANTE_NOMBRE',
			P_EMP_SOLI.APELLIDO 'EMPLEADOSOLICITANTE_APELLIDO',
			P_EMP_SOLI.FECHANACIMIENTO 'EMPLEADOSOLICITANTE_FECHANACIMIENTO',
			P_EMP_SOLI.EMAIL 'EMPLEADOSOLICITANTE_EMAIL',
			--ROL DEL EMPLEADOSOLICITANTE
			EMP_SOLI_ROL.IDROL 'EMPLEADOSOLICITANTE_ROL_IDROL',
			EMP_SOLI_ROL.NOMBRE 'EMPLEADOSOLICITANTE_ROL_NOMBRE',
			EMP_SOLI_ROL.ADMINISTRADORDELSISTEMA 'EMPLEADOSOLICITANTE_ROL_ADMINISTRADORDELSISTEMA',
			--EMPLEADORECEPTOR
			P_EMP_RECEPTOR.DNI 'EMPLEADORECEPTOR_DNI',
			P_EMP_RECEPTOR.NOMBRE AS 'EMPLEADORECEPTOR_NOMBRE',
			P_EMP_RECEPTOR.APELLIDO 'EMPLEADORECEPTOR_APELLIDO',
			P_EMP_RECEPTOR.FECHANACIMIENTO 'EMPLEADORECEPTOR_FECHANACIMIENTO',
			P_EMP_RECEPTOR.EMAIL 'EMPLEADORECEPTOR_EMAIL',
			--ROL DEL EMPLEADORECEPTOR
			EMP_RECEPTOR_ROL.IDROL 'EMPLEADORECEPTOR_ROL_IDROL',
			EMP_RECEPTOR_ROL.NOMBRE 'EMPLEADORECEPTOR_ROL_NOMBRE',
			EMP_RECEPTOR_ROL.ADMINISTRADORDELSISTEMA 'EMPLEADORECEPTOR_ROL_ADMINISTRADORDELSISTEMA'
			FROM INFORMESREABASTECIMIENTO
			JOIN PROVEEDORES ON INFORMESREABASTECIMIENTO.DNI_PROVEEDOR = PROVEEDORES.DNI	
				JOIN PERSONAS P_P ON P_P.DNI = PROVEEDORES.DNI
				JOIN CATEGORIAS ON CATEGORIAS.IDCATEGORIA = PROVEEDORES.IDCATEGORIA
			JOIN EMPLEADOS EMP_SOLI ON EMP_SOLI.DNI = INFORMESREABASTECIMIENTO.DNI_EMPLEADOSOLICITANTE AND INFORMESREABASTECIMIENTO.DNI_EMPLEADOSOLICITANTE = @DNI
				JOIN PERSONAS P_EMP_SOLI ON P_EMP_SOLI.DNI = EMP_SOLI.DNI
				JOIN ROLES EMP_SOLI_ROL ON EMP_SOLI_ROL.IDROL = EMP_SOLI.IDROL
			LEFT JOIN EMPLEADOS EMP_RECEPTOR ON EMP_RECEPTOR.DNI = INFORMESREABASTECIMIENTO.DNI_EMPLEADORECEPTOR
				LEFT JOIN PERSONAS P_EMP_RECEPTOR ON P_EMP_RECEPTOR.DNI = EMP_RECEPTOR.DNI
				LEFT JOIN ROLES EMP_RECEPTOR_ROL ON EMP_RECEPTOR_ROL.IDROL = EMP_RECEPTOR.IDROL
			WHERE INFORMESREABASTECIMIENTO.ACTIVO = 1
			ORDER BY FECHASOLICITUD DESC
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[INFORMEREABASTECIMIENTO_UPDATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INFORMEREABASTECIMIENTO_UPDATE]
(@IDINFORMEREABASTECIMIENTO INT, @DNI_PROVEEDOR INT, @DNI_EMPLEADOSOLICITANTE INT,
@DNI_EMPLEADORECEPTOR INT = NULL, @FECHASOLICITUD DATETIME, @FECHAENTREGAACORDADA DATETIME,
@FECHAENTREGAREAL DATETIME = NULL, @COMENTARIOSOLICITUD NVARCHAR(240),
@COMENTARIOENTREGA NVARCHAR(240) = NULL, @SOLICITUDTERMINADA BIT, @ENTREGAACEPTADA BIT = NULL)
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			UPDATE INFORMESREABASTECIMIENTO	SET
			DNI_PROVEEDOR = @DNI_PROVEEDOR,
			DNI_EMPLEADOSOLICITANTE = @DNI_EMPLEADOSOLICITANTE,
			DNI_EMPLEADORECEPTOR = @DNI_EMPLEADORECEPTOR,
			FECHASOLICITUD = @FECHASOLICITUD,
			FECHAENTREGAACORDADA = @FECHAENTREGAACORDADA,
			FECHAENTREGAREAL = @FECHAENTREGAREAL,
			COMENTARIOSOLICITUD = @COMENTARIOSOLICITUD,
			COMENTARIOENTREGA = @COMENTARIOENTREGA,
			SOLICITUDTERMINADA = @SOLICITUDTERMINADA,
			ENTREGAACEPTADA = @ENTREGAACEPTADA
			WHERE IDINFORMEREABASTECIMIENTO = @IDINFORMEREABASTECIMIENTO
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PALABRA_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[PALABRA_GET_NOT_TRANSLATED]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[PERMISO_ASIGNAR]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[PERMISO_ASIGNAR_A_FAMILIA]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PERMISO_ASIGNAR_A_FAMILIA]
@NombrePermiso nvarchar(50), @idFamilia int
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
	INSERT INTO FAMILIA_PERMISO VALUES (@idFamilia, @NombrePermiso)
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PERMISO_GET]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[PERMISO_GET_BYROLE]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[PERMISO_GET_HIJOS]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[PERMISO_GET_HIJOS_BYROLE]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[PERMISO_REMOVER]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PERMISO_REMOVER]
@IDROL INT, @NOMBREPERMISO NVARCHAR(100)
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			IF(SELECT NOMBREPERMISO FROM PERMISOS_ROL WHERE IDROL = @IDROL AND NOMBREPERMISO = @NOMBREPERMISO) IS NOT NULL --SI EL ROL TIENE ASIGNADO EL PERMISO
			BEGIN
				DELETE FROM PERMISOS_ROL WHERE IDROL = @IDROL AND NOMBREPERMISO = @NOMBREPERMISO

				--SI ES UN PERMISO PADRE
				IF(SELECT NOMBREPERMISOPADRE FROM PERMISOS_PERMISOS WHERE NOMBREPERMISOHIJO = @NOMBREPERMISO) IS NOT NULL
				BEGIN
					DELETE FROM PERMISOS_ROL WHERE NOMBREPERMISO IN (SELECT NOMBREPERMISOHIJO FROM PERMISOS_PERMISOS WHERE NOMBREPERMISOPADRE = @NOMBREPERMISO)
				END
			END
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PERMISO_REMOVER_DE_FAMILIA]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PERMISO_REMOVER_DE_FAMILIA]
@NOMBREPERMISO NVARCHAR(50), @IDFAMILIA INT
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
	DELETE FROM FAMILIA_PERMISO WHERE idFamilia = @IDFAMILIA and NombrePermiso = @NOMBREPERMISO
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PERSONA_SAVE]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[PRODUCTO_CREATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRODUCTO_CREATE]
@idProducto int, @Nombre nvarchar(50), @PrecioUnitario float, @idCategoria int,
@CANTIDADDEPOSITOS int, @CANTIDADEXHIBIDORES int, @AdvertenciaBajoStock int, @Activo bit, @dv binary(32)
as
begin try
	begin tran
		begin
			insert into Productos (idProducto, Nombre, PrecioUnitario, idCategoria, CANTIDADDEPOSITOS, CANTIDADEXHIBIDORES, AdvertenciaBajoStock, Activo, dv)
			values (@idProducto, @Nombre, @PrecioUnitario, @idCategoria, @CANTIDADDEPOSITOS,@CANTIDADEXHIBIDORES, @AdvertenciaBajoStock, @Activo, @dv)
		end
	commit
end try
begin catch
	rollback;
	THROW;
end catch
GO
/****** Object:  StoredProcedure [dbo].[PRODUCTO_CREATE_CHANGE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRODUCTO_CREATE_CHANGE]
@idProducto int, @Nombre nvarchar(50), @idCategoria int, @PrecioUnitario float, @DniEmpleadoCambio int, @AdvertenciaBajoStock int, @TipoCambio nvarchar(100), @FechaCambio datetime
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			INSERT INTO PRODUCTOS_HISTORIALCAMBIOS(idProducto, idCategoria, Nombre, PRECIOUNITARIO, ADVERTENCIABAJOSTOCK, DNIEmpleadoCambio, TipoCambio, FechaCambio)
			VALUES (@idProducto, @idCategoria, @Nombre, @PRECIOUNITARIO, @AdvertenciaBajoStock, @DniEmpleadoCambio, @TipoCambio, @FechaCambio)
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PRODUCTO_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRODUCTO_GET_ALL]
AS
BEGIN
	SELECT PRODUCTOS.*,
	CATEGORIAS.NOMBRE 'CATEGORIA_NOMBRE'
	FROM PRODUCTOS 
	JOIN CATEGORIAS ON PRODUCTOS.IDCATEGORIA = CATEGORIAS.IDCATEGORIA
END
GO
/****** Object:  StoredProcedure [dbo].[PRODUCTO_GET_ALL_CHANGES]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRODUCTO_GET_ALL_CHANGES]
@idProducto int
AS
BEGIN
	SELECT PHC.*,
	C.NOMBRE as 'NombreCategoria',
	--Empleado_Vendedor
	persona_emp_cambio_rol.DNI 'Empleado_Cambio_DNI',
	persona_emp_cambio_rol.Nombre as 'Empleado_Cambio_Nombre',
	persona_emp_cambio_rol.Apellido 'Empleado_Cambio_Apellido',
	persona_emp_cambio_rol.FechaNacimiento 'Empleado_Cambio_FechaNacimiento',
	persona_emp_cambio_rol.Email 'Empleado_Cambio_Email',
	--Rol del Empleado_Vendedor
	emp_cambio_rol.idRol 'Empleado_Cambio_Rol_idRol',
	emp_cambio_rol.Nombre 'Empleado_Cambio_Rol_Nombre',
	emp_cambio_rol.AdministradorDelSistema 'Empleado_Cambio_Rol_AdministradorDelSistema'
	FROM PRODUCTOS_HISTORIALCAMBIOS PHC
	join Empleados emp_cambio on emp_cambio.DNI = PHC.DNIEmpleadoCambio
		join Personas persona_emp_cambio_rol on persona_emp_cambio_rol.DNI = emp_cambio.DNI
		join Roles emp_cambio_rol on emp_cambio_rol.idRol = emp_cambio.idRol
		join CATEGORIAS C ON C.idCategoria = PHC.idCategoria
		WHERE idProducto = @idProducto
END
GO
/****** Object:  StoredProcedure [dbo].[PRODUCTO_UPDATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRODUCTO_UPDATE]
@IDPRODUCTO INT, @NOMBRE NVARCHAR(50), @PRECIOUNITARIO FLOAT,
@IDCATEGORIA INT, @CANTIDADDEPOSITOS INT, @CANTIDADEXHIBIDORES INT, @ADVERTENCIABAJOSTOCK INT, @ACTIVO BIT, @DV BINARY(32)
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			UPDATE PRODUCTOS SET NOMBRE = @NOMBRE, PRECIOUNITARIO = @PRECIOUNITARIO,
			IDCATEGORIA = @IDCATEGORIA, CANTIDADDEPOSITOS = @CANTIDADDEPOSITOS, CANTIDADEXHIBIDORES = @CANTIDADEXHIBIDORES,
			ADVERTENCIABAJOSTOCK = @ADVERTENCIABAJOSTOCK, ACTIVO = @ACTIVO, DV = @DV WHERE IDPRODUCTO = @IDPRODUCTO
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PRODUCTO_UPDATE_FOR_CHANGE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRODUCTO_UPDATE_FOR_CHANGE]
@IDPRODUCTO INT, @NOMBRE NVARCHAR(50), @PRECIOUNITARIO FLOAT,
@IDCATEGORIA INT, @ADVERTENCIABAJOSTOCK INT, @DV BINARY(32)
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			UPDATE PRODUCTOS 
			SET NOMBRE = @NOMBRE, 
			PRECIOUNITARIO = @PRECIOUNITARIO,
			IDCATEGORIA = @IDCATEGORIA, 
			ADVERTENCIABAJOSTOCK = @ADVERTENCIABAJOSTOCK, 
			DV = @DV 
			WHERE IDPRODUCTO = @IDPRODUCTO
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PROVEEDOR_CREATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROVEEDOR_CREATE]
@NOMBRE NVARCHAR(50), @APELLIDO NVARCHAR(50), @IDCATEGORIA INT, @DNI INT, @EMAIL NVARCHAR(100), @FECHANACIMIENTO DATETIME
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			EXEC PERSONA_SAVE @NOMBRE, @APELLIDO, @DNI, @FECHANACIMIENTO, @EMAIL
			IF NOT EXISTS (SELECT * FROM PROVEEDORES WHERE DNI = @DNI AND ACTIVO = 0)
			BEGIN
				INSERT INTO PROVEEDORES	(IDCATEGORIA, DNI, ACTIVO)
				VALUES (@IDCATEGORIA, @DNI, 1)
			END
			ELSE 
			BEGIN
				UPDATE PROVEEDORES SET IDCATEGORIA = @IDCATEGORIA, ACTIVO = 1 WHERE DNI = @DNI
			END
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PROVEEDOR_DELETE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROVEEDOR_DELETE]
@DNI_PROVEEDOR INT
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			UPDATE PROVEEDORES SET ACTIVO = 0 WHERE DNI = @DNI_PROVEEDOR
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PROVEEDOR_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROVEEDOR_GET_ALL]
AS
BEGIN
	SELECT PROVEEDORES.*, PERSONAS.*,
	CATEGORIAS.NOMBRE AS 'CATEGORIA_NOMBRE'
	FROM PROVEEDORES
	JOIN PERSONAS ON PERSONAS.DNI = PROVEEDORES.DNI
	JOIN CATEGORIAS ON PROVEEDORES.IDCATEGORIA = CATEGORIAS.IDCATEGORIA
	WHERE PROVEEDORES.ACTIVO = 1
END
GO
/****** Object:  StoredProcedure [dbo].[PROVEEDOR_GET_ALL_BYCATEGORY]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROVEEDOR_GET_ALL_BYCATEGORY]
@IDCATEGORIA INT AS
BEGIN
	SELECT * 
	FROM PROVEEDORES 
	JOIN PERSONAS ON PERSONAS.DNI = PROVEEDORES.DNI 
	WHERE PROVEEDORES.IDCATEGORIA = @IDCATEGORIA 
	AND PROVEEDORES.ACTIVO = 1
END
GO
/****** Object:  StoredProcedure [dbo].[PROVEEDOR_UPDATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROVEEDOR_UPDATE]
@NOMBRE NVARCHAR(50), @APELLIDO NVARCHAR(50), @IDCATEGORIA INT, @DNI INT, @EMAIL NVARCHAR(100), @FECHANACIMIENTO DATETIME
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			EXEC PERSONA_SAVE @NOMBRE, @APELLIDO, @DNI, @FECHANACIMIENTO, @EMAIL
			UPDATE PROVEEDORES SET  IDCATEGORIA = @IDCATEGORIA	WHERE DNI = @DNI
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[ROL_CREATE]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[ROL_DELETE]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[ROL_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[ROL_UPDATE]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[SEVERIDAD_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SEVERIDAD_GET_ALL]
AS
BEGIN
SELECT * FROM SEVERIDAD
END
GO
/****** Object:  StoredProcedure [dbo].[TRADUCCION_GET]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[TRADUCCION_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[TRADUCCION_UPDATE]    Script Date: 31/10/2022 0:45:51 ******/
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
/****** Object:  StoredProcedure [dbo].[VENTA_CREATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VENTA_CREATE]
(@FECHA DATETIME, @EFECTUADA BIT, @DNI_EMPLEADO_VENDEDOR INT, @DNI_EMPLEADO_CANCELACION INT = NULL)
AS
BEGIN TRY
	BEGIN TRAN
		BEGIN
			INSERT INTO VENTAS	(FECHA, EFECTUADA, DNI_EMPLEADO_VENDEDOR, DNI_EMPLEADO_CANCELACION, ACTIVO)
			VALUES
			(@FECHA, @EFECTUADA, @DNI_EMPLEADO_VENDEDOR, @DNI_EMPLEADO_CANCELACION, 1)
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[VENTA_GET_ALL]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VENTA_GET_ALL]
AS 
BEGIN 
	SELECT 
	VENTAS.*,
	--EMPLEADO_VENDEDOR
	P_EV.DNI 'EMPLEADO_VENDEDOR_DNI',
	P_EV.NOMBRE 'EMPLEADO_VENDEDOR_NOMBRE',
	P_EV.APELLIDO 'EMPLEADO_VENDEDOR_APELLIDO',
	P_EV.FECHANACIMIENTO 'EMPLEADO_VENDEDOR_FECHANACIMIENTO',
	P_EV.EMAIL 'EMPLEADO_VENDEDOR_EMAIL',
	--ROL DEL EMPLEADO_VENDEDOR
	EMP_VENDEDOR_ROL.IDROL 'EMPLEADO_VENDEDOR_ROL_IDROL',
	EMP_VENDEDOR_ROL.NOMBRE 'EMPLEADO_VENDEDOR_ROL_NOMBRE',
	EMP_VENDEDOR_ROL.ADMINISTRADORDELSISTEMA 'EMPLEADO_VENDEDOR_ROL_ADMINISTRADORDELSISTEMA',
	--EMPLEADOCANCELACION
	P_EC.DNI 'EMPLEADO_CANCELACION_DNI',
	P_EC.NOMBRE 'EMPLEADO_CANCELACION_NOMBRE',
	P_EC.APELLIDO 'EMPLEADO_CANCELACION_APELLIDO',
	P_EC.FECHANACIMIENTO 'EMPLEADO_CANCELACION_FECHANACIMIENTO',
	P_EC.EMAIL 'EMPLEADO_CANCELACION_EMAIL',
	--ROL DEL EMPLEADO_CANCELACION
	EMP_CANCELACION_ROL.IDROL 'EMPLEADO_CANCELACION_ROL_IDROL',
	EMP_CANCELACION_ROL.NOMBRE 'EMPLEADO_CANCELACION_ROL_NOMBRE',
	EMP_CANCELACION_ROL.ADMINISTRADORDELSISTEMA 'EMPLEADO_CANCELACION_ROL_ADMINISTRADORDELSISTEMA'
	FROM VENTAS
	JOIN EMPLEADOS EMP_VENDEDOR ON EMP_VENDEDOR.DNI = VENTAS.DNI_EMPLEADO_VENDEDOR
		JOIN PERSONAS P_EV ON P_EV.DNI = EMP_VENDEDOR.DNI
		JOIN ROLES EMP_VENDEDOR_ROL ON EMP_VENDEDOR_ROL.IDROL = EMP_VENDEDOR.IDROL
	LEFT JOIN EMPLEADOS EMP_CANCELACION ON EMP_CANCELACION.DNI = VENTAS.DNI_EMPLEADO_CANCELACION 
		LEFT JOIN PERSONAS P_EC ON P_EC.DNI = EMP_CANCELACION.DNI
		LEFT JOIN ROLES EMP_CANCELACION_ROL ON EMP_CANCELACION_ROL.IDROL = EMP_CANCELACION.IDROL
	WHERE VENTAS.ACTIVO = 1
	ORDER BY FECHA DESC
END
GO
/****** Object:  StoredProcedure [dbo].[VENTA_GET_COUNT_CANCELADAS]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VENTA_GET_COUNT_CANCELADAS]
AS
BEGIN
	SELECT COUNT(*) FROM VENTAS WHERE EFECTUADA = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[VENTA_GET_COUNT_EFECTUADAS]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VENTA_GET_COUNT_EFECTUADAS]
AS
BEGIN
	SELECT COUNT(*) FROM VENTAS WHERE EFECTUADA = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[VENTA_GET_LATEST_BY_SELLER_EMPLOYEE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VENTA_GET_LATEST_BY_SELLER_EMPLOYEE]
@DNI INT
AS 
BEGIN 
	SELECT 
	TOP(1) VENTAS.*,
	--EMPLEADO_VENDEDOR
	P_EV.DNI 'EMPLEADO_VENDEDOR_DNI',
	P_EV.NOMBRE AS 'EMPLEADO_VENDEDOR_NOMBRE',
	P_EV.APELLIDO 'EMPLEADO_VENDEDOR_APELLIDO',
	P_EV.FECHANACIMIENTO 'EMPLEADO_VENDEDOR_FECHANACIMIENTO',
	P_EV.EMAIL 'EMPLEADO_VENDEDOR_EMAIL',
	--ROL DEL EMPLEADO_VENDEDOR
	EMP_VENDEDOR_ROL.IDROL 'EMPLEADO_VENDEDOR_ROL_IDROL',
	EMP_VENDEDOR_ROL.NOMBRE 'EMPLEADO_VENDEDOR_ROL_NOMBRE',
	EMP_VENDEDOR_ROL.ADMINISTRADORDELSISTEMA 'EMPLEADO_VENDEDOR_ROL_ADMINISTRADORDELSISTEMA',
	--EMPLEADOCANCELACION
	P_EC.DNI 'EMPLEADO_CANCELACION_DNI',
	P_EC.NOMBRE AS 'EMPLEADO_CANCELACION_NOMBRE',
	P_EC.APELLIDO 'EMPLEADO_CANCELACION_APELLIDO',
	P_EC.FECHANACIMIENTO 'EMPLEADO_CANCELACION_FECHANACIMIENTO',
	P_EC.EMAIL 'EMPLEADO_CANCELACION_EMAIL',
	--ROL DEL EMPLEADO_CANCELACION
	EMP_CANCELACION_ROL.IDROL 'EMPLEADO_CANCELACION_ROL_IDROL',
	EMP_CANCELACION_ROL.NOMBRE 'EMPLEADO_CANCELACION_ROL_NOMBRE',
	EMP_CANCELACION_ROL.ADMINISTRADORDELSISTEMA 'EMPLEADO_CANCELACION_ROL_ADMINISTRADORDELSISTEMA'
	FROM VENTAS
	JOIN EMPLEADOS EMP_VENDEDOR ON EMP_VENDEDOR.DNI = VENTAS.DNI_EMPLEADO_VENDEDOR AND VENTAS.DNI_EMPLEADO_VENDEDOR = @DNI
		JOIN PERSONAS P_EV ON P_EV.DNI = EMP_VENDEDOR.DNI
		JOIN ROLES EMP_VENDEDOR_ROL ON EMP_VENDEDOR_ROL.IDROL = EMP_VENDEDOR.IDROL
	LEFT JOIN EMPLEADOS EMP_CANCELACION ON EMP_CANCELACION.DNI = VENTAS.DNI_EMPLEADO_CANCELACION 
		LEFT JOIN PERSONAS P_EC ON P_EC.DNI = EMP_CANCELACION.DNI
		LEFT JOIN ROLES EMP_CANCELACION_ROL ON EMP_CANCELACION_ROL.IDROL = EMP_CANCELACION.IDROL
	WHERE VENTAS.ACTIVO = 1
	ORDER BY FECHA DESC
END
GO
/****** Object:  StoredProcedure [dbo].[VENTA_UPDATE]    Script Date: 31/10/2022 0:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VENTA_UPDATE]
@IDVENTA INT, @FECHA DATETIME, @EFECTUADA BIT, @DNI_EMPLEADO_CANCELACION INT, @DNI_EMPLEADO_VENDEDOR INT = NULL, @ACTIVO BIT
AS 
BEGIN TRY
	BEGIN TRAN
		BEGIN
			UPDATE VENTAS SET FECHA = @FECHA, EFECTUADA = @EFECTUADA,
			DNI_EMPLEADO_CANCELACION = @DNI_EMPLEADO_CANCELACION , DNI_EMPLEADO_VENDEDOR= @DNI_EMPLEADO_VENDEDOR, ACTIVO = @ACTIVO WHERE IDVENTA = @IDVENTA 
		END
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
	THROW;
END CATCH
GO
USE [master]
GO
ALTER DATABASE [TiendaTRIGANE] SET  READ_WRITE 
GO
