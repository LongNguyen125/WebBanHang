
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/16/2019 12:22:55
-- Generated from EDMX file: C:\Users\new\Documents\Project Github\WebBanHang\WebBanHang\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [WebBanHang];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_MatHang_LoaiMH]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MatHang] DROP CONSTRAINT [FK_MatHang_LoaiMH];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[LoaiMH]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LoaiMH];
GO
IF OBJECT_ID(N'[dbo].[MatHang]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MatHang];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'LoaiMHs'
CREATE TABLE [dbo].[LoaiMHs] (
    [MaLoai] int IDENTITY(1,1) NOT NULL,
    [TenLoai] nvarchar(50)  NULL
);
GO

-- Creating table 'MatHangs'
CREATE TABLE [dbo].[MatHangs] (
    [TenMatHang] nvarchar(max)  NULL,
    [Gia] float  NULL,
    [NgayThem] datetime  NULL,
    [HinhAnh] nvarchar(max)  NULL,
    [SoLuong] int  NULL,
    [MaMH] int IDENTITY(1,1) NOT NULL,
    [MaLoai] int  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MaLoai] in table 'LoaiMHs'
ALTER TABLE [dbo].[LoaiMHs]
ADD CONSTRAINT [PK_LoaiMHs]
    PRIMARY KEY CLUSTERED ([MaLoai] ASC);
GO

-- Creating primary key on [MaMH] in table 'MatHangs'
ALTER TABLE [dbo].[MatHangs]
ADD CONSTRAINT [PK_MatHangs]
    PRIMARY KEY CLUSTERED ([MaMH] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MaLoai] in table 'MatHangs'
ALTER TABLE [dbo].[MatHangs]
ADD CONSTRAINT [FK_MatHang_LoaiMH]
    FOREIGN KEY ([MaLoai])
    REFERENCES [dbo].[LoaiMHs]
        ([MaLoai])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MatHang_LoaiMH'
CREATE INDEX [IX_FK_MatHang_LoaiMH]
ON [dbo].[MatHangs]
    ([MaLoai]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------