CREATE DATABASE [M2i] ON  PRIMARY 
( NAME = N'M2i', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\M2i.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'M2i_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\M2i_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
GO
USE [M2i]
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](50) NOT NULL,
	[etat] [nvarchar](50) NOT NULL
) 
GO

