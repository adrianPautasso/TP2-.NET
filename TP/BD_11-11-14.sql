USE [master]
GO
/****** Object:  Database [academia]    Script Date: 11/11/2014 08:56:36 ******/
CREATE DATABASE [academia] ON  PRIMARY 
( NAME = N'tp2_net', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\academia.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'tp2_net_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\academia.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [academia] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [academia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [academia] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [academia] SET ANSI_NULLS OFF
GO
ALTER DATABASE [academia] SET ANSI_PADDING OFF
GO
ALTER DATABASE [academia] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [academia] SET ARITHABORT OFF
GO
ALTER DATABASE [academia] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [academia] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [academia] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [academia] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [academia] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [academia] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [academia] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [academia] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [academia] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [academia] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [academia] SET  DISABLE_BROKER
GO
ALTER DATABASE [academia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [academia] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [academia] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [academia] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [academia] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [academia] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [academia] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [academia] SET  READ_WRITE
GO
ALTER DATABASE [academia] SET RECOVERY SIMPLE
GO
ALTER DATABASE [academia] SET  MULTI_USER
GO
ALTER DATABASE [academia] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [academia] SET DB_CHAINING OFF
GO
USE [academia]
GO
/****** Object:  Table [dbo].[especialidades]    Script Date: 11/11/2014 08:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[especialidades](
	[id_especialidad] [int] IDENTITY(1,1) NOT NULL,
	[desc_especialidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_especialidades] PRIMARY KEY CLUSTERED 
(
	[id_especialidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[modulos]    Script Date: 11/11/2014 08:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[modulos](
	[id_modulo] [int] IDENTITY(1,1) NOT NULL,
	[desc_modulo] [varchar](50) NULL,
	[ejecuta] [varchar](50) NULL,
 CONSTRAINT [PK_modulos] PRIMARY KEY CLUSTERED 
(
	[id_modulo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipos_personas]    Script Date: 11/11/2014 08:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipos_personas](
	[id_tipo_persona] [int] IDENTITY(1,1) NOT NULL,
	[desc_tipo_persona] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipos_personas] PRIMARY KEY CLUSTERED 
(
	[id_tipo_persona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[planes]    Script Date: 11/11/2014 08:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[planes](
	[id_plan] [int] IDENTITY(1,1) NOT NULL,
	[desc_plan] [varchar](50) NOT NULL,
	[id_especialidad] [int] NOT NULL,
 CONSTRAINT [PK_planes] PRIMARY KEY CLUSTERED 
(
	[id_plan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[personas]    Script Date: 11/11/2014 08:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[personas](
	[id_persona] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[fecha_nac] [datetime] NOT NULL,
	[legajo] [int] NULL,
	[id_plan] [int] NOT NULL,
	[id_tipo_persona] [int] NOT NULL,
 CONSTRAINT [PK_personas] PRIMARY KEY CLUSTERED 
(
	[id_persona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[materias]    Script Date: 11/11/2014 08:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[materias](
	[id_materia] [int] IDENTITY(1,1) NOT NULL,
	[desc_materia] [varchar](50) NOT NULL,
	[hs_semanales] [int] NOT NULL,
	[hs_totales] [int] NOT NULL,
	[id_plan] [int] NOT NULL,
 CONSTRAINT [PK_materias] PRIMARY KEY CLUSTERED 
(
	[id_materia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[comisiones]    Script Date: 11/11/2014 08:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comisiones](
	[id_comision] [int] IDENTITY(1,1) NOT NULL,
	[desc_comision] [varchar](50) NOT NULL,
	[anio_especialidad] [int] NOT NULL,
	[id_plan] [int] NOT NULL,
 CONSTRAINT [PK_comisiones] PRIMARY KEY CLUSTERED 
(
	[id_comision] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cursos]    Script Date: 11/11/2014 08:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cursos](
	[id_curso] [int] IDENTITY(1,1) NOT NULL,
	[id_materia] [int] NOT NULL,
	[id_comision] [int] NOT NULL,
	[anio_calendario] [int] NOT NULL,
	[cupo] [int] NOT NULL,
 CONSTRAINT [PK_cursos] PRIMARY KEY CLUSTERED 
(
	[id_curso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 11/11/2014 08:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre_usuario] [varchar](50) NOT NULL,
	[clave] [varchar](50) NOT NULL,
	[habilitado] [bit] NOT NULL,
	[cambia_clave] [bit] NULL,
	[id_persona] [int] NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docentes_cursos]    Script Date: 11/11/2014 08:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[docentes_cursos](
	[id_dictado] [int] IDENTITY(1,1) NOT NULL,
	[id_curso] [int] NOT NULL,
	[id_docente] [int] NOT NULL,
	[cargo] [int] NOT NULL,
 CONSTRAINT [PK_docentes_cursos] PRIMARY KEY CLUSTERED 
(
	[id_dictado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modulos_usuarios]    Script Date: 11/11/2014 08:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modulos_usuarios](
	[id_modulo_usuario] [int] IDENTITY(1,1) NOT NULL,
	[id_modulo] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[alta] [bit] NULL,
	[baja] [bit] NULL,
	[modificacion] [bit] NULL,
	[consulta] [bit] NULL,
 CONSTRAINT [PK_modulos_usuarios] PRIMARY KEY CLUSTERED 
(
	[id_modulo_usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[alumnos_inscripciones]    Script Date: 11/11/2014 08:56:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[alumnos_inscripciones](
	[id_inscripcion] [int] IDENTITY(1,1) NOT NULL,
	[id_alumno] [int] NOT NULL,
	[id_curso] [int] NOT NULL,
	[condicion] [varchar](50) NOT NULL,
	[nota] [int] NULL,
 CONSTRAINT [PK_alumnos_inscripciones] PRIMARY KEY CLUSTERED 
(
	[id_inscripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_planes_especialidades]    Script Date: 11/11/2014 08:56:38 ******/
ALTER TABLE [dbo].[planes]  WITH CHECK ADD  CONSTRAINT [FK_planes_especialidades] FOREIGN KEY([id_especialidad])
REFERENCES [dbo].[especialidades] ([id_especialidad])
GO
ALTER TABLE [dbo].[planes] CHECK CONSTRAINT [FK_planes_especialidades]
GO
/****** Object:  ForeignKey [FK_personas_planes]    Script Date: 11/11/2014 08:56:38 ******/
ALTER TABLE [dbo].[personas]  WITH CHECK ADD  CONSTRAINT [FK_personas_planes] FOREIGN KEY([id_plan])
REFERENCES [dbo].[planes] ([id_plan])
GO
ALTER TABLE [dbo].[personas] CHECK CONSTRAINT [FK_personas_planes]
GO
/****** Object:  ForeignKey [FK_personas_tipos]    Script Date: 11/11/2014 08:56:38 ******/
ALTER TABLE [dbo].[personas]  WITH CHECK ADD  CONSTRAINT [FK_personas_tipos] FOREIGN KEY([id_tipo_persona])
REFERENCES [dbo].[tipos_personas] ([id_tipo_persona])
GO
ALTER TABLE [dbo].[personas] CHECK CONSTRAINT [FK_personas_tipos]
GO
/****** Object:  ForeignKey [FK_materias_planes]    Script Date: 11/11/2014 08:56:38 ******/
ALTER TABLE [dbo].[materias]  WITH CHECK ADD  CONSTRAINT [FK_materias_planes] FOREIGN KEY([id_plan])
REFERENCES [dbo].[planes] ([id_plan])
GO
ALTER TABLE [dbo].[materias] CHECK CONSTRAINT [FK_materias_planes]
GO
/****** Object:  ForeignKey [FK_comisiones_planes]    Script Date: 11/11/2014 08:56:38 ******/
ALTER TABLE [dbo].[comisiones]  WITH CHECK ADD  CONSTRAINT [FK_comisiones_planes] FOREIGN KEY([id_plan])
REFERENCES [dbo].[planes] ([id_plan])
GO
ALTER TABLE [dbo].[comisiones] CHECK CONSTRAINT [FK_comisiones_planes]
GO
/****** Object:  ForeignKey [FK_cursos_comisiones]    Script Date: 11/11/2014 08:56:38 ******/
ALTER TABLE [dbo].[cursos]  WITH CHECK ADD  CONSTRAINT [FK_cursos_comisiones] FOREIGN KEY([id_comision])
REFERENCES [dbo].[comisiones] ([id_comision])
GO
ALTER TABLE [dbo].[cursos] CHECK CONSTRAINT [FK_cursos_comisiones]
GO
/****** Object:  ForeignKey [FK_cursos_materias]    Script Date: 11/11/2014 08:56:38 ******/
ALTER TABLE [dbo].[cursos]  WITH CHECK ADD  CONSTRAINT [FK_cursos_materias] FOREIGN KEY([id_materia])
REFERENCES [dbo].[materias] ([id_materia])
GO
ALTER TABLE [dbo].[cursos] CHECK CONSTRAINT [FK_cursos_materias]
GO
/****** Object:  ForeignKey [FK_usuarios_personas]    Script Date: 11/11/2014 08:56:38 ******/
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_personas] FOREIGN KEY([id_persona])
REFERENCES [dbo].[personas] ([id_persona])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_personas]
GO
/****** Object:  ForeignKey [FK_docentes_cursos_cursos]    Script Date: 11/11/2014 08:56:38 ******/
ALTER TABLE [dbo].[docentes_cursos]  WITH CHECK ADD  CONSTRAINT [FK_docentes_cursos_cursos] FOREIGN KEY([id_curso])
REFERENCES [dbo].[cursos] ([id_curso])
GO
ALTER TABLE [dbo].[docentes_cursos] CHECK CONSTRAINT [FK_docentes_cursos_cursos]
GO
/****** Object:  ForeignKey [FK_docentes_cursos_personas]    Script Date: 11/11/2014 08:56:38 ******/
ALTER TABLE [dbo].[docentes_cursos]  WITH CHECK ADD  CONSTRAINT [FK_docentes_cursos_personas] FOREIGN KEY([id_docente])
REFERENCES [dbo].[personas] ([id_persona])
GO
ALTER TABLE [dbo].[docentes_cursos] CHECK CONSTRAINT [FK_docentes_cursos_personas]
GO
/****** Object:  ForeignKey [FK_modulos_usuarios_modulos]    Script Date: 11/11/2014 08:56:38 ******/
ALTER TABLE [dbo].[modulos_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_modulos_usuarios_modulos] FOREIGN KEY([id_modulo])
REFERENCES [dbo].[modulos] ([id_modulo])
GO
ALTER TABLE [dbo].[modulos_usuarios] CHECK CONSTRAINT [FK_modulos_usuarios_modulos]
GO
/****** Object:  ForeignKey [FK_modulos_usuarios_usuarios]    Script Date: 11/11/2014 08:56:38 ******/
ALTER TABLE [dbo].[modulos_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_modulos_usuarios_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[modulos_usuarios] CHECK CONSTRAINT [FK_modulos_usuarios_usuarios]
GO
/****** Object:  ForeignKey [FK_alumnos_inscripciones_cursos]    Script Date: 11/11/2014 08:56:38 ******/
ALTER TABLE [dbo].[alumnos_inscripciones]  WITH CHECK ADD  CONSTRAINT [FK_alumnos_inscripciones_cursos] FOREIGN KEY([id_curso])
REFERENCES [dbo].[cursos] ([id_curso])
GO
ALTER TABLE [dbo].[alumnos_inscripciones] CHECK CONSTRAINT [FK_alumnos_inscripciones_cursos]
GO
/****** Object:  ForeignKey [FK_alumnos_inscripciones_personas]    Script Date: 11/11/2014 08:56:38 ******/
ALTER TABLE [dbo].[alumnos_inscripciones]  WITH CHECK ADD  CONSTRAINT [FK_alumnos_inscripciones_personas] FOREIGN KEY([id_alumno])
REFERENCES [dbo].[personas] ([id_persona])
GO
ALTER TABLE [dbo].[alumnos_inscripciones] CHECK CONSTRAINT [FK_alumnos_inscripciones_personas]
GO
