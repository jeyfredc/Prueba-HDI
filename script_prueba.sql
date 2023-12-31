USE [db_prueba]
GO
/****** Object:  StoredProcedure [dbo].[consultaScore]    Script Date: 30/11/2023 5:39:03 p. m. ******/
DROP PROCEDURE [dbo].[consultaScore]
GO
ALTER TABLE [dbo].[Riesgos] DROP CONSTRAINT [FK__Riesgos__Persona__3D5E1FD2]
GO
ALTER TABLE [dbo].[Informacion] DROP CONSTRAINT [FK__Informaci__Score__45F365D3]
GO
ALTER TABLE [dbo].[Informacion] DROP CONSTRAINT [FK__Informaci__Riesg__46E78A0C]
GO
ALTER TABLE [dbo].[Informacion] DROP CONSTRAINT [FK__Informaci__Categ__47DBAE45]
GO
/****** Object:  Table [dbo].[VariablesScr]    Script Date: 30/11/2023 5:39:03 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VariablesScr]') AND type in (N'U'))
DROP TABLE [dbo].[VariablesScr]
GO
/****** Object:  Table [dbo].[VariablesRes]    Script Date: 30/11/2023 5:39:03 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VariablesRes]') AND type in (N'U'))
DROP TABLE [dbo].[VariablesRes]
GO
/****** Object:  Table [dbo].[Scores]    Script Date: 30/11/2023 5:39:03 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Scores]') AND type in (N'U'))
DROP TABLE [dbo].[Scores]
GO
/****** Object:  Table [dbo].[Riesgos]    Script Date: 30/11/2023 5:39:03 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Riesgos]') AND type in (N'U'))
DROP TABLE [dbo].[Riesgos]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 30/11/2023 5:39:03 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Personas]') AND type in (N'U'))
DROP TABLE [dbo].[Personas]
GO
/****** Object:  Table [dbo].[Informacion]    Script Date: 30/11/2023 5:39:03 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Informacion]') AND type in (N'U'))
DROP TABLE [dbo].[Informacion]
GO
/****** Object:  Table [dbo].[Identificaciones]    Script Date: 30/11/2023 5:39:03 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Identificaciones]') AND type in (N'U'))
DROP TABLE [dbo].[Identificaciones]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 30/11/2023 5:39:03 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categorias]') AND type in (N'U'))
DROP TABLE [dbo].[Categorias]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 30/11/2023 5:39:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[CategoriaId] [int] IDENTITY(1,1) NOT NULL,
	[Vin] [varchar](50) NULL,
	[TipoDocumento] [varchar](50) NULL,
	[NumeroDocumento] [varchar](50) NULL,
	[FechaUltimaCarga] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Identificaciones]    Script Date: 30/11/2023 5:39:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Identificaciones](
	[IdentificacionId] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [varchar](50) NULL,
	[Tipo] [varchar](50) NULL,
	[Estadi] [varchar](50) NULL,
	[Ciudad] [varchar](50) NULL,
	[Departamento] [varchar](50) NULL,
	[Genero] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdentificacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Informacion]    Script Date: 30/11/2023 5:39:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Informacion](
	[InformacionId] [int] IDENTITY(1,1) NOT NULL,
	[ScoreId] [int] NULL,
	[RiesgoId] [int] NULL,
	[CategoriaId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InformacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 30/11/2023 5:39:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[PersonaId] [int] IDENTITY(1,1) NOT NULL,
	[EdadMin] [varchar](50) NULL,
	[EdadMax] [varchar](50) NULL,
	[Nombres] [varchar](100) NULL,
	[PrimerApellido] [varchar](100) NULL,
	[SegundoApellido] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Riesgos]    Script Date: 30/11/2023 5:39:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Riesgos](
	[RiesgoId] [int] IDENTITY(1,1) NOT NULL,
	[FechaConsulta] [datetime] NULL,
	[Secuencia] [int] NULL,
	[CodigoRespuesta] [varchar](50) NULL,
	[PersonaId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RiesgoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Scores]    Script Date: 30/11/2023 5:39:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scores](
	[ScoreId] [int] IDENTITY(1,1) NOT NULL,
	[Score] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ScoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VariablesRes]    Script Date: 30/11/2023 5:39:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VariablesRes](
	[VariableResId] [int] IDENTITY(1,1) NOT NULL,
	[NombreVariable] [varchar](100) NULL,
	[ScoreVariable] [varchar](100) NULL,
	[Descripcion] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[VariableResId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VariablesScr]    Script Date: 30/11/2023 5:39:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VariablesScr](
	[VariableScrId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Valor] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[VariableScrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([CategoriaId], [Vin], [TipoDocumento], [NumeroDocumento], [FechaUltimaCarga]) VALUES (1, NULL, N'C', N'12345678', CAST(N'2023-09-10T00:10:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Identificaciones] ON 

INSERT [dbo].[Identificaciones] ([IdentificacionId], [Numero], [Tipo], [Estadi], [Ciudad], [Departamento], [Genero]) VALUES (1, N'12345678', N'1', N'', N'', N'', N'4')
SET IDENTITY_INSERT [dbo].[Identificaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Informacion] ON 

INSERT [dbo].[Informacion] ([InformacionId], [ScoreId], [RiesgoId], [CategoriaId]) VALUES (1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Informacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Personas] ON 

INSERT [dbo].[Personas] ([PersonaId], [EdadMin], [EdadMax], [Nombres], [PrimerApellido], [SegundoApellido]) VALUES (1, N'46', N'55', N'CLIENTE', N'PRUEBA', N'TEST')
SET IDENTITY_INSERT [dbo].[Personas] OFF
GO
SET IDENTITY_INSERT [dbo].[Riesgos] ON 

INSERT [dbo].[Riesgos] ([RiesgoId], [FechaConsulta], [Secuencia], [CodigoRespuesta], [PersonaId]) VALUES (1, CAST(N'2023-10-26T09:04:17.000' AS DateTime), 24909, N'13', 1)
SET IDENTITY_INSERT [dbo].[Riesgos] OFF
GO
SET IDENTITY_INSERT [dbo].[Scores] ON 

INSERT [dbo].[Scores] ([ScoreId], [Score]) VALUES (1, N'222')
SET IDENTITY_INSERT [dbo].[Scores] OFF
GO
SET IDENTITY_INSERT [dbo].[VariablesRes] ON 

INSERT [dbo].[VariablesRes] ([VariableResId], [NombreVariable], [ScoreVariable], [Descripcion]) VALUES (1, N'Género', N'HOMBRE', NULL)
INSERT [dbo].[VariablesRes] ([VariableResId], [NombreVariable], [ScoreVariable], [Descripcion]) VALUES (2, N'Fecha de Nacimiento', N'1972-08-09', N'Fecha de Nacimiento del ciudadano')
INSERT [dbo].[VariablesRes] ([VariableResId], [NombreVariable], [ScoreVariable], [Descripcion]) VALUES (3, N'PRIMER NOMBRE', N'CLIENTE', N'PRIMER NOMBRE')
INSERT [dbo].[VariablesRes] ([VariableResId], [NombreVariable], [ScoreVariable], [Descripcion]) VALUES (4, N'SEGUNDO NOMBRE', N'', N'SEGUNDO NOMBRE')
INSERT [dbo].[VariablesRes] ([VariableResId], [NombreVariable], [ScoreVariable], [Descripcion]) VALUES (5, N'PRIMER APELLIDO', N'PRUEBA', N'PRIMER APELLIDO')
INSERT [dbo].[VariablesRes] ([VariableResId], [NombreVariable], [ScoreVariable], [Descripcion]) VALUES (6, N'SEGUNDO APELLIDO', N'TEST', N'SEGUNDO APELLIDO')
SET IDENTITY_INSERT [dbo].[VariablesRes] OFF
GO
ALTER TABLE [dbo].[Informacion]  WITH CHECK ADD FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categorias] ([CategoriaId])
GO
ALTER TABLE [dbo].[Informacion]  WITH CHECK ADD FOREIGN KEY([RiesgoId])
REFERENCES [dbo].[Riesgos] ([RiesgoId])
GO
ALTER TABLE [dbo].[Informacion]  WITH CHECK ADD FOREIGN KEY([ScoreId])
REFERENCES [dbo].[Scores] ([ScoreId])
GO
ALTER TABLE [dbo].[Riesgos]  WITH CHECK ADD FOREIGN KEY([PersonaId])
REFERENCES [dbo].[Personas] ([PersonaId])
GO
/****** Object:  StoredProcedure [dbo].[consultaScore]    Script Date: 30/11/2023 5:39:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultaScore]
@score VARCHAR(55)
AS
BEGIN
select s.Score, r.FechaConsulta, r.Secuencia, r.CodigoRespuesta, c.NumeroDocumento, id.Tipo, id.Estadi, id.Ciudad, id.Departamento,
id.Genero, p.EdadMin, p.EdadMax, p.Nombres, p.PrimerApellido, p.SegundoApellido,
c.Vin, c.TipoDocumento, c.FechaUltimaCarga
from Scores s inner join Informacion i 
on s.ScoreId = i.InformacionId 
inner join Categorias c on c.CategoriaId = i.CategoriaId
inner join Riesgos r on r.RiesgoId= i.RiesgoId
inner join Personas p on p.PersonaId = r.PersonaId
inner join Identificaciones id on id.Numero = c.NumeroDocumento
where s.Score = @score

END
GO
