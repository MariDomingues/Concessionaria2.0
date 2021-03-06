USE [master]
GO
/****** Object:  Database [ConcessionariaII]    Script Date: 26/05/2019 16:02:39 ******/
CREATE DATABASE [ConcessionariaII]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConcessionariaII', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER1\MSSQL\DATA\ConcessionariaII.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ConcessionariaII_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER1\MSSQL\DATA\ConcessionariaII_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ConcessionariaII] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConcessionariaII].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConcessionariaII] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConcessionariaII] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConcessionariaII] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConcessionariaII] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConcessionariaII] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConcessionariaII] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConcessionariaII] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConcessionariaII] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConcessionariaII] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConcessionariaII] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConcessionariaII] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConcessionariaII] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConcessionariaII] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConcessionariaII] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConcessionariaII] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ConcessionariaII] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConcessionariaII] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConcessionariaII] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConcessionariaII] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConcessionariaII] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConcessionariaII] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConcessionariaII] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConcessionariaII] SET RECOVERY FULL 
GO
ALTER DATABASE [ConcessionariaII] SET  MULTI_USER 
GO
ALTER DATABASE [ConcessionariaII] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConcessionariaII] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConcessionariaII] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConcessionariaII] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ConcessionariaII] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ConcessionariaII', N'ON'
GO
ALTER DATABASE [ConcessionariaII] SET QUERY_STORE = OFF
GO
USE [ConcessionariaII]
GO
/****** Object:  Table [dbo].[Ano]    Script Date: 26/05/2019 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ano](
	[DtAno] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DtAno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 26/05/2019 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NOT NULL,
	[SalBase] [decimal](9, 2) NOT NULL,
	[Status] [char](1) NULL,
	[Obs] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 26/05/2019 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](150) NOT NULL,
	[CPF] [varchar](14) NOT NULL,
	[CNH] [varchar](11) NOT NULL,
	[Endereco] [varchar](100) NOT NULL,
	[Cidade] [varchar](50) NOT NULL,
	[Bairro] [varchar](50) NOT NULL,
	[CEP] [varchar](9) NOT NULL,
	[Telefone] [varchar](14) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[NroConta] [varchar](12) NOT NULL,
	[Status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Combustivel]    Script Date: 26/05/2019 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combustivel](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](200) NOT NULL,
	[Status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fabricante]    Script Date: 26/05/2019 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fabricante](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[RazaoSocial] [varchar](150) NOT NULL,
	[NomeFantasia] [varchar](150) NOT NULL,
	[CNPJ] [varchar](18) NOT NULL,
	[Pais] [varchar](50) NOT NULL,
	[Endereco] [varchar](100) NOT NULL,
	[Cidade] [varchar](50) NOT NULL,
	[Bairro] [varchar](50) NOT NULL,
	[CEP] [varchar](9) NOT NULL,
	[Telefone] [varchar](14) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[NroConta] [varchar](12) NOT NULL,
	[Status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcionario]    Script Date: 26/05/2019 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionario](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](150) NOT NULL,
	[CPF] [varchar](14) NOT NULL,
	[Endereco] [varchar](100) NOT NULL,
	[Cidade] [varchar](50) NOT NULL,
	[Bairro] [varchar](50) NOT NULL,
	[CEP] [varchar](9) NOT NULL,
	[Telefone] [varchar](14) NOT NULL,
	[NroConta] [varchar](12) NOT NULL,
	[Cargo] [int] NOT NULL,
	[Status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 26/05/2019 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Senha] [varchar](15) NOT NULL,
	[Funcionario] [int] NULL,
	[Status] [char](1) NULL,
	[Perfil] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 26/05/2019 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelo](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](200) NOT NULL,
	[Obs] [varchar](150) NULL,
	[Status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 26/05/2019 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NULL,
	[Ocultar] [char](1) NULL,
	[Usuario] [char](1) NULL,
	[UsuarioI] [char](1) NULL,
	[UsuarioA] [char](1) NULL,
	[UsuarioE] [char](1) NULL,
	[Perfil] [char](1) NULL,
	[PerfilI] [char](1) NULL,
	[PerfilA] [char](1) NULL,
	[PerfilE] [char](1) NULL,
	[Venda] [char](1) NULL,
	[VendaI] [char](1) NULL,
	[VendaA] [char](1) NULL,
	[VendaE] [char](1) NULL,
	[Status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Veiculo]    Script Date: 26/05/2019 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Veiculo](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Cliente] [int] NULL,
	[Fabricante] [int] NOT NULL,
	[Modelo] [int] NOT NULL,
	[Combustivel] [int] NOT NULL,
	[Valor] [decimal](9, 2) NOT NULL,
	[Cor] [varchar](25) NOT NULL,
	[Km] [decimal](9, 3) NOT NULL,
	[Status] [char](1) NULL,
	[Placa] [varchar](8) NOT NULL,
	[Ano] [int] NOT NULL,
	[TpVei] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venda]    Script Date: 26/05/2019 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venda](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Cliente] [int] NULL,
	[Funcionario] [int] NULL,
	[DtVen] [datetime] NULL,
	[ValTotal] [decimal](9, 2) NULL,
	[QtdParcela] [int] NULL,
	[Status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venda_Itens]    Script Date: 26/05/2019 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venda_Itens](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Venda] [int] NOT NULL,
	[Veiculo] [int] NOT NULL,
	[ValTotVei] [decimal](9, 2) NULL,
	[DescUnit] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD FOREIGN KEY([Cargo])
REFERENCES [dbo].[Cargo] ([Codigo])
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD FOREIGN KEY([Funcionario])
REFERENCES [dbo].[Funcionario] ([Codigo])
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD FOREIGN KEY([Perfil])
REFERENCES [dbo].[Perfil] ([Codigo])
GO
ALTER TABLE [dbo].[Veiculo]  WITH CHECK ADD FOREIGN KEY([Cliente])
REFERENCES [dbo].[Cliente] ([Codigo])
GO
ALTER TABLE [dbo].[Veiculo]  WITH CHECK ADD FOREIGN KEY([Combustivel])
REFERENCES [dbo].[Combustivel] ([Codigo])
GO
ALTER TABLE [dbo].[Veiculo]  WITH CHECK ADD FOREIGN KEY([Fabricante])
REFERENCES [dbo].[Fabricante] ([Codigo])
GO
ALTER TABLE [dbo].[Veiculo]  WITH CHECK ADD FOREIGN KEY([Modelo])
REFERENCES [dbo].[Modelo] ([Codigo])
GO
ALTER TABLE [dbo].[Venda_Itens]  WITH CHECK ADD FOREIGN KEY([Veiculo])
REFERENCES [dbo].[Veiculo] ([Codigo])
GO
ALTER TABLE [dbo].[Venda_Itens]  WITH CHECK ADD FOREIGN KEY([Veiculo])
REFERENCES [dbo].[Veiculo] ([Codigo])
GO
ALTER TABLE [dbo].[Venda_Itens]  WITH CHECK ADD FOREIGN KEY([Venda])
REFERENCES [dbo].[Venda] ([Codigo])
GO
USE [master]
GO
ALTER DATABASE [ConcessionariaII] SET  READ_WRITE 
GO
