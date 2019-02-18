
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/15/2019 12:44:11
-- Generated from EDMX file: C:\Users\Nathalie\Desktop\Laboration 2 - Nathalie\DataLayer\DatabasModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [osu1911];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AlumnUtbProgram]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Person_Alumn] DROP CONSTRAINT [FK_AlumnUtbProgram];
GO
IF OBJECT_ID(N'[dbo].[FK_AlumnAnmälan]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Anmälan] DROP CONSTRAINT [FK_AlumnAnmälan];
GO
IF OBJECT_ID(N'[dbo].[FK_AnställdAktivitet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Aktivitet] DROP CONSTRAINT [FK_AnställdAktivitet];
GO
IF OBJECT_ID(N'[dbo].[FK_AnmälanErbjudande]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Anmälan] DROP CONSTRAINT [FK_AnmälanErbjudande];
GO
IF OBJECT_ID(N'[dbo].[FK_AnmälanAktivitet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Anmälan] DROP CONSTRAINT [FK_AnmälanAktivitet];
GO
IF OBJECT_ID(N'[dbo].[FK_AktivitetÄmne]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Aktivitet] DROP CONSTRAINT [FK_AktivitetÄmne];
GO
IF OBJECT_ID(N'[dbo].[FK_ErbjudandeÄmne]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Erbjudande] DROP CONSTRAINT [FK_ErbjudandeÄmne];
GO
IF OBJECT_ID(N'[dbo].[FK_AnställdErbjudande]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Erbjudande] DROP CONSTRAINT [FK_AnställdErbjudande];
GO
IF OBJECT_ID(N'[dbo].[FK_Alumn_inherits_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Person_Alumn] DROP CONSTRAINT [FK_Alumn_inherits_Person];
GO
IF OBJECT_ID(N'[dbo].[FK_Anställd_inherits_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Person_Anställd] DROP CONSTRAINT [FK_Anställd_inherits_Person];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Person]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Person];
GO
IF OBJECT_ID(N'[dbo].[UtbProgram]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UtbProgram];
GO
IF OBJECT_ID(N'[dbo].[Anmälan]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Anmälan];
GO
IF OBJECT_ID(N'[dbo].[Aktivitet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Aktivitet];
GO
IF OBJECT_ID(N'[dbo].[Erbjudande]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Erbjudande];
GO
IF OBJECT_ID(N'[dbo].[Ämne]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ämne];
GO
IF OBJECT_ID(N'[dbo].[Person_Alumn]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Person_Alumn];
GO
IF OBJECT_ID(N'[dbo].[Person_Anställd]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Person_Anställd];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Person'
CREATE TABLE [dbo].[Person] (
    [Förnamn] nvarchar(max)  NOT NULL,
    [Efternamn] nvarchar(max)  NOT NULL,
    [PersNr] bigint  NOT NULL,
    [Adress] nvarchar(max)  NOT NULL,
    [PostNr] bigint  NOT NULL,
    [Ort] nvarchar(max)  NOT NULL,
    [TelNr] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Lösenord] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UtbProgram'
CREATE TABLE [dbo].[UtbProgram] (
    [ProgID] int IDENTITY(1,1) NOT NULL,
    [Namn] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Anmälan'
CREATE TABLE [dbo].[Anmälan] (
    [AnmId] int IDENTITY(1,1) NOT NULL,
    [Tidpunkt] datetime  NOT NULL,
    [Alumn_PersNr] bigint  NOT NULL,
    [Erbjudande_ErbjID] int  NOT NULL,
    [Aktivitet_AktID] int  NOT NULL
);
GO

-- Creating table 'Aktivitet'
CREATE TABLE [dbo].[Aktivitet] (
    [AktID] int IDENTITY(1,1) NOT NULL,
    [Namn] nvarchar(max)  NOT NULL,
    [Tillfälle] datetime  NOT NULL,
    [AntalPlatser] int  NOT NULL,
    [Anställd_PersNr] bigint  NOT NULL,
    [Ämne_ÄmnesID] int  NOT NULL
);
GO

-- Creating table 'Erbjudande'
CREATE TABLE [dbo].[Erbjudande] (
    [ErbjID] int IDENTITY(1,1) NOT NULL,
    [Namn] nvarchar(max)  NOT NULL,
    [StartDatum] datetime  NOT NULL,
    [SlutDatum] datetime  NOT NULL,
    [Ämne_ÄmnesID] int  NOT NULL,
    [Anställd_PersNr] bigint  NOT NULL
);
GO

-- Creating table 'Ämne'
CREATE TABLE [dbo].[Ämne] (
    [ÄmnesID] int IDENTITY(1,1) NOT NULL,
    [Namn] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Person_Alumn'
CREATE TABLE [dbo].[Person_Alumn] (
    [AlumnId] int IDENTITY(1,1) NOT NULL,
    [Program] nvarchar(max)  NOT NULL,
    [Aktiv] bit  NOT NULL,
    [ExamensÅr] int  NOT NULL,
    [PersNr] bigint  NOT NULL,
    [UtbProgram_ProgID] int  NOT NULL
);
GO

-- Creating table 'Person_Anställd'
CREATE TABLE [dbo].[Person_Anställd] (
    [AnstID] int IDENTITY(1,1) NOT NULL,
    [PersNr] bigint  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [PersNr] in table 'Person'
ALTER TABLE [dbo].[Person]
ADD CONSTRAINT [PK_Person]
    PRIMARY KEY CLUSTERED ([PersNr] ASC);
GO

-- Creating primary key on [ProgID] in table 'UtbProgram'
ALTER TABLE [dbo].[UtbProgram]
ADD CONSTRAINT [PK_UtbProgram]
    PRIMARY KEY CLUSTERED ([ProgID] ASC);
GO

-- Creating primary key on [AnmId] in table 'Anmälan'
ALTER TABLE [dbo].[Anmälan]
ADD CONSTRAINT [PK_Anmälan]
    PRIMARY KEY CLUSTERED ([AnmId] ASC);
GO

-- Creating primary key on [AktID] in table 'Aktivitet'
ALTER TABLE [dbo].[Aktivitet]
ADD CONSTRAINT [PK_Aktivitet]
    PRIMARY KEY CLUSTERED ([AktID] ASC);
GO

-- Creating primary key on [ErbjID] in table 'Erbjudande'
ALTER TABLE [dbo].[Erbjudande]
ADD CONSTRAINT [PK_Erbjudande]
    PRIMARY KEY CLUSTERED ([ErbjID] ASC);
GO

-- Creating primary key on [ÄmnesID] in table 'Ämne'
ALTER TABLE [dbo].[Ämne]
ADD CONSTRAINT [PK_Ämne]
    PRIMARY KEY CLUSTERED ([ÄmnesID] ASC);
GO

-- Creating primary key on [PersNr] in table 'Person_Alumn'
ALTER TABLE [dbo].[Person_Alumn]
ADD CONSTRAINT [PK_Person_Alumn]
    PRIMARY KEY CLUSTERED ([PersNr] ASC);
GO

-- Creating primary key on [PersNr] in table 'Person_Anställd'
ALTER TABLE [dbo].[Person_Anställd]
ADD CONSTRAINT [PK_Person_Anställd]
    PRIMARY KEY CLUSTERED ([PersNr] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UtbProgram_ProgID] in table 'Person_Alumn'
ALTER TABLE [dbo].[Person_Alumn]
ADD CONSTRAINT [FK_AlumnUtbProgram]
    FOREIGN KEY ([UtbProgram_ProgID])
    REFERENCES [dbo].[UtbProgram]
        ([ProgID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AlumnUtbProgram'
CREATE INDEX [IX_FK_AlumnUtbProgram]
ON [dbo].[Person_Alumn]
    ([UtbProgram_ProgID]);
GO

-- Creating foreign key on [Alumn_PersNr] in table 'Anmälan'
ALTER TABLE [dbo].[Anmälan]
ADD CONSTRAINT [FK_AlumnAnmälan]
    FOREIGN KEY ([Alumn_PersNr])
    REFERENCES [dbo].[Person_Alumn]
        ([PersNr])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AlumnAnmälan'
CREATE INDEX [IX_FK_AlumnAnmälan]
ON [dbo].[Anmälan]
    ([Alumn_PersNr]);
GO

-- Creating foreign key on [Anställd_PersNr] in table 'Aktivitet'
ALTER TABLE [dbo].[Aktivitet]
ADD CONSTRAINT [FK_AnställdAktivitet]
    FOREIGN KEY ([Anställd_PersNr])
    REFERENCES [dbo].[Person_Anställd]
        ([PersNr])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AnställdAktivitet'
CREATE INDEX [IX_FK_AnställdAktivitet]
ON [dbo].[Aktivitet]
    ([Anställd_PersNr]);
GO

-- Creating foreign key on [Erbjudande_ErbjID] in table 'Anmälan'
ALTER TABLE [dbo].[Anmälan]
ADD CONSTRAINT [FK_AnmälanErbjudande]
    FOREIGN KEY ([Erbjudande_ErbjID])
    REFERENCES [dbo].[Erbjudande]
        ([ErbjID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AnmälanErbjudande'
CREATE INDEX [IX_FK_AnmälanErbjudande]
ON [dbo].[Anmälan]
    ([Erbjudande_ErbjID]);
GO

-- Creating foreign key on [Aktivitet_AktID] in table 'Anmälan'
ALTER TABLE [dbo].[Anmälan]
ADD CONSTRAINT [FK_AnmälanAktivitet]
    FOREIGN KEY ([Aktivitet_AktID])
    REFERENCES [dbo].[Aktivitet]
        ([AktID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AnmälanAktivitet'
CREATE INDEX [IX_FK_AnmälanAktivitet]
ON [dbo].[Anmälan]
    ([Aktivitet_AktID]);
GO

-- Creating foreign key on [Ämne_ÄmnesID] in table 'Aktivitet'
ALTER TABLE [dbo].[Aktivitet]
ADD CONSTRAINT [FK_AktivitetÄmne]
    FOREIGN KEY ([Ämne_ÄmnesID])
    REFERENCES [dbo].[Ämne]
        ([ÄmnesID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AktivitetÄmne'
CREATE INDEX [IX_FK_AktivitetÄmne]
ON [dbo].[Aktivitet]
    ([Ämne_ÄmnesID]);
GO

-- Creating foreign key on [Ämne_ÄmnesID] in table 'Erbjudande'
ALTER TABLE [dbo].[Erbjudande]
ADD CONSTRAINT [FK_ErbjudandeÄmne]
    FOREIGN KEY ([Ämne_ÄmnesID])
    REFERENCES [dbo].[Ämne]
        ([ÄmnesID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ErbjudandeÄmne'
CREATE INDEX [IX_FK_ErbjudandeÄmne]
ON [dbo].[Erbjudande]
    ([Ämne_ÄmnesID]);
GO

-- Creating foreign key on [Anställd_PersNr] in table 'Erbjudande'
ALTER TABLE [dbo].[Erbjudande]
ADD CONSTRAINT [FK_AnställdErbjudande]
    FOREIGN KEY ([Anställd_PersNr])
    REFERENCES [dbo].[Person_Anställd]
        ([PersNr])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AnställdErbjudande'
CREATE INDEX [IX_FK_AnställdErbjudande]
ON [dbo].[Erbjudande]
    ([Anställd_PersNr]);
GO

-- Creating foreign key on [PersNr] in table 'Person_Alumn'
ALTER TABLE [dbo].[Person_Alumn]
ADD CONSTRAINT [FK_Alumn_inherits_Person]
    FOREIGN KEY ([PersNr])
    REFERENCES [dbo].[Person]
        ([PersNr])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PersNr] in table 'Person_Anställd'
ALTER TABLE [dbo].[Person_Anställd]
ADD CONSTRAINT [FK_Anställd_inherits_Person]
    FOREIGN KEY ([PersNr])
    REFERENCES [dbo].[Person]
        ([PersNr])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------