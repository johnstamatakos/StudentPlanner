
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/21/2015 17:23:59
-- Generated from EDMX file: C:\Users\jstam397\Desktop\StudentPlanner\StudentPlanner\Models\Entity.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-StudentPlanner-20150322024747];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[Courses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Courses];
GO
IF OBJECT_ID(N'[dbo].[Exams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Exams];
GO
IF OBJECT_ID(N'[dbo].[Homeworks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Homeworks];
GO
IF OBJECT_ID(N'[dbo].[Projects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Projects];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'C__MigrationHistory'
CREATE TABLE [dbo].[C__MigrationHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ContextKey] nvarchar(300)  NOT NULL,
    [Model] varbinary(max)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL,
    [ProfilePicture] varchar(max)  NULL
);
GO

-- Creating table 'Courses'
CREATE TABLE [dbo].[Courses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CourseName] varchar(50)  NULL,
    [Days] varchar(50)  NULL,
    [Time] time  NULL,
    [Professor] varchar(50)  NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'Homeworks'
CREATE TABLE [dbo].[Homeworks] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [HomeworkName] varchar(50)  NULL,
    [Description] varchar(50)  NULL,
    [DueDate] datetime  NULL,
    [CourseId] int  NOT NULL
);
GO

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ProjectName] varchar(50)  NULL,
    [DueDate] datetime  NULL,
    [CourseId] int  NOT NULL,
    [Description] varchar(50)  NULL
);
GO

-- Creating table 'Generals'
CREATE TABLE [dbo].[Generals] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ItemName] varchar(50)  NULL,
    [ItemNotes] varchar(50)  NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'Exams'
CREATE TABLE [dbo].[Exams] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ExamName] varchar(50)  NULL,
    [CourseId] int  NOT NULL,
    [DueDate] datetime  NULL,
    [Description] varchar(50)  NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles1'
CREATE TABLE [dbo].[AspNetUserRoles1] (
    [AspNetRoles1_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers1_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles2'
CREATE TABLE [dbo].[AspNetUserRoles2] (
    [AspNetRoles2_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers2_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles3'
CREATE TABLE [dbo].[AspNetUserRoles3] (
    [AspNetRoles3_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers3_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles4'
CREATE TABLE [dbo].[AspNetUserRoles4] (
    [AspNetRoles4_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers4_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles5'
CREATE TABLE [dbo].[AspNetUserRoles5] (
    [AspNetRoles5_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers5_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles6'
CREATE TABLE [dbo].[AspNetUserRoles6] (
    [AspNetRoles6_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers6_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles7'
CREATE TABLE [dbo].[AspNetUserRoles7] (
    [AspNetRoles7_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers7_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles8'
CREATE TABLE [dbo].[AspNetUserRoles8] (
    [AspNetRoles8_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers8_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles9'
CREATE TABLE [dbo].[AspNetUserRoles9] (
    [AspNetRoles9_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers9_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles10'
CREATE TABLE [dbo].[AspNetUserRoles10] (
    [AspNetRoles10_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers10_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles11'
CREATE TABLE [dbo].[AspNetUserRoles11] (
    [AspNetRoles11_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers11_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles12'
CREATE TABLE [dbo].[AspNetUserRoles12] (
    [AspNetRoles12_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers12_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles13'
CREATE TABLE [dbo].[AspNetUserRoles13] (
    [AspNetRoles13_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers13_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles14'
CREATE TABLE [dbo].[AspNetUserRoles14] (
    [AspNetRoles14_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers14_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles15'
CREATE TABLE [dbo].[AspNetUserRoles15] (
    [AspNetRoles15_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers15_Id] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MigrationId], [ContextKey] in table 'C__MigrationHistory'
ALTER TABLE [dbo].[C__MigrationHistory]
ADD CONSTRAINT [PK_C__MigrationHistory]
    PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Homeworks'
ALTER TABLE [dbo].[Homeworks]
ADD CONSTRAINT [PK_Homeworks]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Generals'
ALTER TABLE [dbo].[Generals]
ADD CONSTRAINT [PK_Generals]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Exams'
ALTER TABLE [dbo].[Exams]
ADD CONSTRAINT [PK_Exams]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- Creating primary key on [AspNetRoles1_Id], [AspNetUsers1_Id] in table 'AspNetUserRoles1'
ALTER TABLE [dbo].[AspNetUserRoles1]
ADD CONSTRAINT [PK_AspNetUserRoles1]
    PRIMARY KEY CLUSTERED ([AspNetRoles1_Id], [AspNetUsers1_Id] ASC);
GO

-- Creating primary key on [AspNetRoles2_Id], [AspNetUsers2_Id] in table 'AspNetUserRoles2'
ALTER TABLE [dbo].[AspNetUserRoles2]
ADD CONSTRAINT [PK_AspNetUserRoles2]
    PRIMARY KEY CLUSTERED ([AspNetRoles2_Id], [AspNetUsers2_Id] ASC);
GO

-- Creating primary key on [AspNetRoles3_Id], [AspNetUsers3_Id] in table 'AspNetUserRoles3'
ALTER TABLE [dbo].[AspNetUserRoles3]
ADD CONSTRAINT [PK_AspNetUserRoles3]
    PRIMARY KEY CLUSTERED ([AspNetRoles3_Id], [AspNetUsers3_Id] ASC);
GO

-- Creating primary key on [AspNetRoles4_Id], [AspNetUsers4_Id] in table 'AspNetUserRoles4'
ALTER TABLE [dbo].[AspNetUserRoles4]
ADD CONSTRAINT [PK_AspNetUserRoles4]
    PRIMARY KEY CLUSTERED ([AspNetRoles4_Id], [AspNetUsers4_Id] ASC);
GO

-- Creating primary key on [AspNetRoles5_Id], [AspNetUsers5_Id] in table 'AspNetUserRoles5'
ALTER TABLE [dbo].[AspNetUserRoles5]
ADD CONSTRAINT [PK_AspNetUserRoles5]
    PRIMARY KEY CLUSTERED ([AspNetRoles5_Id], [AspNetUsers5_Id] ASC);
GO

-- Creating primary key on [AspNetRoles6_Id], [AspNetUsers6_Id] in table 'AspNetUserRoles6'
ALTER TABLE [dbo].[AspNetUserRoles6]
ADD CONSTRAINT [PK_AspNetUserRoles6]
    PRIMARY KEY CLUSTERED ([AspNetRoles6_Id], [AspNetUsers6_Id] ASC);
GO

-- Creating primary key on [AspNetRoles7_Id], [AspNetUsers7_Id] in table 'AspNetUserRoles7'
ALTER TABLE [dbo].[AspNetUserRoles7]
ADD CONSTRAINT [PK_AspNetUserRoles7]
    PRIMARY KEY CLUSTERED ([AspNetRoles7_Id], [AspNetUsers7_Id] ASC);
GO

-- Creating primary key on [AspNetRoles8_Id], [AspNetUsers8_Id] in table 'AspNetUserRoles8'
ALTER TABLE [dbo].[AspNetUserRoles8]
ADD CONSTRAINT [PK_AspNetUserRoles8]
    PRIMARY KEY CLUSTERED ([AspNetRoles8_Id], [AspNetUsers8_Id] ASC);
GO

-- Creating primary key on [AspNetRoles9_Id], [AspNetUsers9_Id] in table 'AspNetUserRoles9'
ALTER TABLE [dbo].[AspNetUserRoles9]
ADD CONSTRAINT [PK_AspNetUserRoles9]
    PRIMARY KEY CLUSTERED ([AspNetRoles9_Id], [AspNetUsers9_Id] ASC);
GO

-- Creating primary key on [AspNetRoles10_Id], [AspNetUsers10_Id] in table 'AspNetUserRoles10'
ALTER TABLE [dbo].[AspNetUserRoles10]
ADD CONSTRAINT [PK_AspNetUserRoles10]
    PRIMARY KEY CLUSTERED ([AspNetRoles10_Id], [AspNetUsers10_Id] ASC);
GO

-- Creating primary key on [AspNetRoles11_Id], [AspNetUsers11_Id] in table 'AspNetUserRoles11'
ALTER TABLE [dbo].[AspNetUserRoles11]
ADD CONSTRAINT [PK_AspNetUserRoles11]
    PRIMARY KEY CLUSTERED ([AspNetRoles11_Id], [AspNetUsers11_Id] ASC);
GO

-- Creating primary key on [AspNetRoles12_Id], [AspNetUsers12_Id] in table 'AspNetUserRoles12'
ALTER TABLE [dbo].[AspNetUserRoles12]
ADD CONSTRAINT [PK_AspNetUserRoles12]
    PRIMARY KEY CLUSTERED ([AspNetRoles12_Id], [AspNetUsers12_Id] ASC);
GO

-- Creating primary key on [AspNetRoles13_Id], [AspNetUsers13_Id] in table 'AspNetUserRoles13'
ALTER TABLE [dbo].[AspNetUserRoles13]
ADD CONSTRAINT [PK_AspNetUserRoles13]
    PRIMARY KEY CLUSTERED ([AspNetRoles13_Id], [AspNetUsers13_Id] ASC);
GO

-- Creating primary key on [AspNetRoles14_Id], [AspNetUsers14_Id] in table 'AspNetUserRoles14'
ALTER TABLE [dbo].[AspNetUserRoles14]
ADD CONSTRAINT [PK_AspNetUserRoles14]
    PRIMARY KEY CLUSTERED ([AspNetRoles14_Id], [AspNetUsers14_Id] ASC);
GO

-- Creating primary key on [AspNetRoles15_Id], [AspNetUsers15_Id] in table 'AspNetUserRoles15'
ALTER TABLE [dbo].[AspNetUserRoles15]
ADD CONSTRAINT [PK_AspNetUserRoles15]
    PRIMARY KEY CLUSTERED ([AspNetRoles15_Id], [AspNetUsers15_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUsers'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUsers]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- Creating foreign key on [CourseId] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [FK_CoursProject]
    FOREIGN KEY ([CourseId])
    REFERENCES [dbo].[Courses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CoursProject'
CREATE INDEX [IX_FK_CoursProject]
ON [dbo].[Projects]
    ([CourseId]);
GO

-- Creating foreign key on [CourseId] in table 'Homeworks'
ALTER TABLE [dbo].[Homeworks]
ADD CONSTRAINT [FK_CoursHomework]
    FOREIGN KEY ([CourseId])
    REFERENCES [dbo].[Courses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CoursHomework'
CREATE INDEX [IX_FK_CoursHomework]
ON [dbo].[Homeworks]
    ([CourseId]);
GO

-- Creating foreign key on [AspNetRoles1_Id] in table 'AspNetUserRoles1'
ALTER TABLE [dbo].[AspNetUserRoles1]
ADD CONSTRAINT [FK_AspNetUserRoles1_AspNetRole]
    FOREIGN KEY ([AspNetRoles1_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers1_Id] in table 'AspNetUserRoles1'
ALTER TABLE [dbo].[AspNetUserRoles1]
ADD CONSTRAINT [FK_AspNetUserRoles1_AspNetUser]
    FOREIGN KEY ([AspNetUsers1_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles1_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles1_AspNetUser]
ON [dbo].[AspNetUserRoles1]
    ([AspNetUsers1_Id]);
GO

-- Creating foreign key on [AspNetRoles2_Id] in table 'AspNetUserRoles2'
ALTER TABLE [dbo].[AspNetUserRoles2]
ADD CONSTRAINT [FK_AspNetUserRoles2_AspNetRole]
    FOREIGN KEY ([AspNetRoles2_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers2_Id] in table 'AspNetUserRoles2'
ALTER TABLE [dbo].[AspNetUserRoles2]
ADD CONSTRAINT [FK_AspNetUserRoles2_AspNetUser]
    FOREIGN KEY ([AspNetUsers2_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles2_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles2_AspNetUser]
ON [dbo].[AspNetUserRoles2]
    ([AspNetUsers2_Id]);
GO

-- Creating foreign key on [AspNetRoles3_Id] in table 'AspNetUserRoles3'
ALTER TABLE [dbo].[AspNetUserRoles3]
ADD CONSTRAINT [FK_AspNetUserRoles3_AspNetRole]
    FOREIGN KEY ([AspNetRoles3_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers3_Id] in table 'AspNetUserRoles3'
ALTER TABLE [dbo].[AspNetUserRoles3]
ADD CONSTRAINT [FK_AspNetUserRoles3_AspNetUser]
    FOREIGN KEY ([AspNetUsers3_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles3_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles3_AspNetUser]
ON [dbo].[AspNetUserRoles3]
    ([AspNetUsers3_Id]);
GO

-- Creating foreign key on [AspNetRoles4_Id] in table 'AspNetUserRoles4'
ALTER TABLE [dbo].[AspNetUserRoles4]
ADD CONSTRAINT [FK_AspNetUserRoles4_AspNetRole]
    FOREIGN KEY ([AspNetRoles4_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers4_Id] in table 'AspNetUserRoles4'
ALTER TABLE [dbo].[AspNetUserRoles4]
ADD CONSTRAINT [FK_AspNetUserRoles4_AspNetUser]
    FOREIGN KEY ([AspNetUsers4_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles4_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles4_AspNetUser]
ON [dbo].[AspNetUserRoles4]
    ([AspNetUsers4_Id]);
GO

-- Creating foreign key on [UserId] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [FK_AspNetUserCours]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserCours'
CREATE INDEX [IX_FK_AspNetUserCours]
ON [dbo].[Courses]
    ([UserId]);
GO

-- Creating foreign key on [AspNetRoles5_Id] in table 'AspNetUserRoles5'
ALTER TABLE [dbo].[AspNetUserRoles5]
ADD CONSTRAINT [FK_AspNetUserRoles5_AspNetRole]
    FOREIGN KEY ([AspNetRoles5_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers5_Id] in table 'AspNetUserRoles5'
ALTER TABLE [dbo].[AspNetUserRoles5]
ADD CONSTRAINT [FK_AspNetUserRoles5_AspNetUser]
    FOREIGN KEY ([AspNetUsers5_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles5_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles5_AspNetUser]
ON [dbo].[AspNetUserRoles5]
    ([AspNetUsers5_Id]);
GO

-- Creating foreign key on [AspNetRoles6_Id] in table 'AspNetUserRoles6'
ALTER TABLE [dbo].[AspNetUserRoles6]
ADD CONSTRAINT [FK_AspNetUserRoles6_AspNetRole]
    FOREIGN KEY ([AspNetRoles6_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers6_Id] in table 'AspNetUserRoles6'
ALTER TABLE [dbo].[AspNetUserRoles6]
ADD CONSTRAINT [FK_AspNetUserRoles6_AspNetUser]
    FOREIGN KEY ([AspNetUsers6_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles6_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles6_AspNetUser]
ON [dbo].[AspNetUserRoles6]
    ([AspNetUsers6_Id]);
GO

-- Creating foreign key on [AspNetRoles7_Id] in table 'AspNetUserRoles7'
ALTER TABLE [dbo].[AspNetUserRoles7]
ADD CONSTRAINT [FK_AspNetUserRoles7_AspNetRole]
    FOREIGN KEY ([AspNetRoles7_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers7_Id] in table 'AspNetUserRoles7'
ALTER TABLE [dbo].[AspNetUserRoles7]
ADD CONSTRAINT [FK_AspNetUserRoles7_AspNetUser]
    FOREIGN KEY ([AspNetUsers7_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles7_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles7_AspNetUser]
ON [dbo].[AspNetUserRoles7]
    ([AspNetUsers7_Id]);
GO

-- Creating foreign key on [AspNetRoles8_Id] in table 'AspNetUserRoles8'
ALTER TABLE [dbo].[AspNetUserRoles8]
ADD CONSTRAINT [FK_AspNetUserRoles8_AspNetRole]
    FOREIGN KEY ([AspNetRoles8_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers8_Id] in table 'AspNetUserRoles8'
ALTER TABLE [dbo].[AspNetUserRoles8]
ADD CONSTRAINT [FK_AspNetUserRoles8_AspNetUser]
    FOREIGN KEY ([AspNetUsers8_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles8_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles8_AspNetUser]
ON [dbo].[AspNetUserRoles8]
    ([AspNetUsers8_Id]);
GO

-- Creating foreign key on [AspNetRoles9_Id] in table 'AspNetUserRoles9'
ALTER TABLE [dbo].[AspNetUserRoles9]
ADD CONSTRAINT [FK_AspNetUserRoles9_AspNetRole]
    FOREIGN KEY ([AspNetRoles9_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers9_Id] in table 'AspNetUserRoles9'
ALTER TABLE [dbo].[AspNetUserRoles9]
ADD CONSTRAINT [FK_AspNetUserRoles9_AspNetUser]
    FOREIGN KEY ([AspNetUsers9_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles9_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles9_AspNetUser]
ON [dbo].[AspNetUserRoles9]
    ([AspNetUsers9_Id]);
GO

-- Creating foreign key on [AspNetRoles10_Id] in table 'AspNetUserRoles10'
ALTER TABLE [dbo].[AspNetUserRoles10]
ADD CONSTRAINT [FK_AspNetUserRoles10_AspNetRole]
    FOREIGN KEY ([AspNetRoles10_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers10_Id] in table 'AspNetUserRoles10'
ALTER TABLE [dbo].[AspNetUserRoles10]
ADD CONSTRAINT [FK_AspNetUserRoles10_AspNetUser]
    FOREIGN KEY ([AspNetUsers10_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles10_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles10_AspNetUser]
ON [dbo].[AspNetUserRoles10]
    ([AspNetUsers10_Id]);
GO

-- Creating foreign key on [UserId] in table 'Generals'
ALTER TABLE [dbo].[Generals]
ADD CONSTRAINT [FK_AspNetUserGeneral]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserGeneral'
CREATE INDEX [IX_FK_AspNetUserGeneral]
ON [dbo].[Generals]
    ([UserId]);
GO

-- Creating foreign key on [AspNetRoles11_Id] in table 'AspNetUserRoles11'
ALTER TABLE [dbo].[AspNetUserRoles11]
ADD CONSTRAINT [FK_AspNetUserRoles11_AspNetRole]
    FOREIGN KEY ([AspNetRoles11_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers11_Id] in table 'AspNetUserRoles11'
ALTER TABLE [dbo].[AspNetUserRoles11]
ADD CONSTRAINT [FK_AspNetUserRoles11_AspNetUser]
    FOREIGN KEY ([AspNetUsers11_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles11_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles11_AspNetUser]
ON [dbo].[AspNetUserRoles11]
    ([AspNetUsers11_Id]);
GO

-- Creating foreign key on [AspNetRoles12_Id] in table 'AspNetUserRoles12'
ALTER TABLE [dbo].[AspNetUserRoles12]
ADD CONSTRAINT [FK_AspNetUserRoles12_AspNetRole]
    FOREIGN KEY ([AspNetRoles12_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers12_Id] in table 'AspNetUserRoles12'
ALTER TABLE [dbo].[AspNetUserRoles12]
ADD CONSTRAINT [FK_AspNetUserRoles12_AspNetUser]
    FOREIGN KEY ([AspNetUsers12_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles12_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles12_AspNetUser]
ON [dbo].[AspNetUserRoles12]
    ([AspNetUsers12_Id]);
GO

-- Creating foreign key on [AspNetRoles13_Id] in table 'AspNetUserRoles13'
ALTER TABLE [dbo].[AspNetUserRoles13]
ADD CONSTRAINT [FK_AspNetUserRoles13_AspNetRole]
    FOREIGN KEY ([AspNetRoles13_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers13_Id] in table 'AspNetUserRoles13'
ALTER TABLE [dbo].[AspNetUserRoles13]
ADD CONSTRAINT [FK_AspNetUserRoles13_AspNetUser]
    FOREIGN KEY ([AspNetUsers13_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles13_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles13_AspNetUser]
ON [dbo].[AspNetUserRoles13]
    ([AspNetUsers13_Id]);
GO

-- Creating foreign key on [AspNetRoles14_Id] in table 'AspNetUserRoles14'
ALTER TABLE [dbo].[AspNetUserRoles14]
ADD CONSTRAINT [FK_AspNetUserRoles14_AspNetRole]
    FOREIGN KEY ([AspNetRoles14_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers14_Id] in table 'AspNetUserRoles14'
ALTER TABLE [dbo].[AspNetUserRoles14]
ADD CONSTRAINT [FK_AspNetUserRoles14_AspNetUser]
    FOREIGN KEY ([AspNetUsers14_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles14_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles14_AspNetUser]
ON [dbo].[AspNetUserRoles14]
    ([AspNetUsers14_Id]);
GO

-- Creating foreign key on [CourseId] in table 'Exams'
ALTER TABLE [dbo].[Exams]
ADD CONSTRAINT [FK_CoursExam]
    FOREIGN KEY ([CourseId])
    REFERENCES [dbo].[Courses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CoursExam'
CREATE INDEX [IX_FK_CoursExam]
ON [dbo].[Exams]
    ([CourseId]);
GO

-- Creating foreign key on [AspNetRoles15_Id] in table 'AspNetUserRoles15'
ALTER TABLE [dbo].[AspNetUserRoles15]
ADD CONSTRAINT [FK_AspNetUserRoles15_AspNetRole]
    FOREIGN KEY ([AspNetRoles15_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers15_Id] in table 'AspNetUserRoles15'
ALTER TABLE [dbo].[AspNetUserRoles15]
ADD CONSTRAINT [FK_AspNetUserRoles15_AspNetUser]
    FOREIGN KEY ([AspNetUsers15_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles15_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles15_AspNetUser]
ON [dbo].[AspNetUserRoles15]
    ([AspNetUsers15_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------