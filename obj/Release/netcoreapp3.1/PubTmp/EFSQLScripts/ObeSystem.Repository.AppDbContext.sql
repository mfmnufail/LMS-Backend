IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [DisplayName] nvarchar(max) NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [Grades] (
        [Id] uniqueidentifier NOT NULL,
        [AplusMarks] int NOT NULL,
        [AMarks] int NOT NULL,
        [AminMarks] int NOT NULL,
        [BpluseMarks] int NOT NULL,
        [BMarks] int NOT NULL,
        [BminMarks] int NOT NULL,
        [CpluseMarks] int NOT NULL,
        [CMarks] int NOT NULL,
        [CminMarks] int NOT NULL,
        [EMarks] int NOT NULL,
        [Grade_type] nvarchar(max) NULL,
        [Gpa] real NOT NULL,
        CONSTRAINT [PK_Grades] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [Students] (
        [Id] uniqueidentifier NOT NULL,
        [Name] nvarchar(max) NULL,
        [Registration_number] nvarchar(max) NULL,
        [Student_marks] real NOT NULL,
        [Batch] int NOT NULL,
        CONSTRAINT [PK_Students] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [Thresholds] (
        [Id] uniqueidentifier NOT NULL,
        [End_marks] int NOT NULL,
        [Ca_marks] int NOT NULL,
        [Min_end_marks] real NOT NULL,
        [Min_ca_marks] real NOT NULL,
        [Min_total_marks] real NOT NULL,
        [Min_po_marks] real NOT NULL,
        [Min_lo_marks] real NOT NULL,
        [Min_attendance] real NOT NULL,
        CONSTRAINT [PK_Thresholds] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [Modules] (
        [Id] uniqueidentifier NOT NULL,
        [Module_name] nvarchar(max) NULL,
        [Module_code] nvarchar(max) NULL,
        [Semester] int NOT NULL,
        [Lecturer] nvarchar(max) NULL,
        [Date] datetime2 NOT NULL,
        [ThresholdId] uniqueidentifier NULL,
        [GradeId] uniqueidentifier NULL,
        CONSTRAINT [PK_Modules] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Modules_Grades_GradeId] FOREIGN KEY ([GradeId]) REFERENCES [Grades] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Modules_Thresholds_ThresholdId] FOREIGN KEY ([ThresholdId]) REFERENCES [Thresholds] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [Assessments] (
        [Id] uniqueidentifier NOT NULL,
        [Assessment_name] nvarchar(max) NULL,
        [Assessment_type] nvarchar(max) NULL,
        [Marks] int NOT NULL,
        [Student_marks] int NOT NULL,
        [ModuleId] uniqueidentifier NULL,
        CONSTRAINT [PK_Assessments] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Assessments_Modules_ModuleId] FOREIGN KEY ([ModuleId]) REFERENCES [Modules] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [Lolists] (
        [Id] uniqueidentifier NOT NULL,
        [Lo_name] nvarchar(max) NULL,
        [Lo_code] nvarchar(max) NULL,
        [Description] nvarchar(max) NULL,
        [Weight] float NOT NULL,
        [ModuleId] uniqueidentifier NULL,
        CONSTRAINT [PK_Lolists] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Lolists_Modules_ModuleId] FOREIGN KEY ([ModuleId]) REFERENCES [Modules] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [Polists] (
        [Id] uniqueidentifier NOT NULL,
        [Po_name] nvarchar(max) NULL,
        [Po_code] nvarchar(max) NULL,
        [Description] nvarchar(max) NULL,
        [Weight] float NOT NULL,
        [ModuleId] uniqueidentifier NULL,
        CONSTRAINT [PK_Polists] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Polists_Modules_ModuleId] FOREIGN KEY ([ModuleId]) REFERENCES [Modules] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [AssessmentStudents] (
        [StudentId] uniqueidentifier NOT NULL,
        [AssessmentId] uniqueidentifier NOT NULL,
        [Assessment_marks] real NOT NULL,
        CONSTRAINT [PK_AssessmentStudents] PRIMARY KEY ([AssessmentId], [StudentId]),
        CONSTRAINT [FK_AssessmentStudents_Assessments_AssessmentId] FOREIGN KEY ([AssessmentId]) REFERENCES [Assessments] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AssessmentStudents_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [AssessmentLos] (
        [LolistId] uniqueidentifier NOT NULL,
        [AssessmentId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_AssessmentLos] PRIMARY KEY ([LolistId], [AssessmentId]),
        CONSTRAINT [FK_AssessmentLos_Assessments_AssessmentId] FOREIGN KEY ([AssessmentId]) REFERENCES [Assessments] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AssessmentLos_Lolists_LolistId] FOREIGN KEY ([LolistId]) REFERENCES [Lolists] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [StudentLolists] (
        [LolistId] uniqueidentifier NOT NULL,
        [StudentId] uniqueidentifier NOT NULL,
        [Lo_marks] real NOT NULL,
        CONSTRAINT [PK_StudentLolists] PRIMARY KEY ([StudentId], [LolistId]),
        CONSTRAINT [FK_StudentLolists_Lolists_LolistId] FOREIGN KEY ([LolistId]) REFERENCES [Lolists] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_StudentLolists_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE TABLE [LolistPos] (
        [LolistId] uniqueidentifier NOT NULL,
        [PolistId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_LolistPos] PRIMARY KEY ([LolistId], [PolistId]),
        CONSTRAINT [FK_LolistPos_Lolists_LolistId] FOREIGN KEY ([LolistId]) REFERENCES [Lolists] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_LolistPos_Polists_PolistId] FOREIGN KEY ([PolistId]) REFERENCES [Polists] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE INDEX [IX_AssessmentLos_AssessmentId] ON [AssessmentLos] ([AssessmentId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE INDEX [IX_Assessments_ModuleId] ON [Assessments] ([ModuleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE INDEX [IX_AssessmentStudents_StudentId] ON [AssessmentStudents] ([StudentId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE INDEX [IX_LolistPos_PolistId] ON [LolistPos] ([PolistId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE INDEX [IX_Lolists_ModuleId] ON [Lolists] ([ModuleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE INDEX [IX_Modules_GradeId] ON [Modules] ([GradeId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE INDEX [IX_Modules_ThresholdId] ON [Modules] ([ThresholdId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE INDEX [IX_Polists_ModuleId] ON [Polists] ([ModuleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    CREATE INDEX [IX_StudentLolists_LolistId] ON [StudentLolists] ([LolistId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210608155933_initial')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20210608155933_initial', N'5.0.1');
END;
GO

COMMIT;
GO

