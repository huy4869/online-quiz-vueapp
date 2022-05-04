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

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504123113_Init')
BEGIN
    CREATE TABLE [Questions] (
        [ID] int NOT NULL IDENTITY,
        [questionContent] nvarchar(max) NOT NULL,
        [createdAt] datetime NULL DEFAULT ((getdate())),
        CONSTRAINT [PK_Questions] PRIMARY KEY ([ID])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504123113_Init')
BEGIN
    CREATE TABLE [Users] (
        [ID] int NOT NULL IDENTITY,
        [userName] nvarchar(50) NOT NULL,
        [password] nvarchar(50) NOT NULL,
        [role] int NOT NULL,
        [email] varchar(100) NOT NULL,
        CONSTRAINT [PK_Users] PRIMARY KEY ([ID])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504123113_Init')
BEGIN
    CREATE TABLE [Options] (
        [Id] int NOT NULL,
        [questionID] int NOT NULL,
        [content] nvarchar(max) NOT NULL,
        [isRight] bit NOT NULL,
        CONSTRAINT [PK__Answer__34BBBF1BABF478B9] PRIMARY KEY ([questionID], [Id]),
        CONSTRAINT [FK_Options_Questions_questionID] FOREIGN KEY ([questionID]) REFERENCES [Questions] ([ID]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504123113_Init')
BEGIN
    CREATE TABLE [Result] (
        [ID] int NOT NULL IDENTITY,
        [userID] int NULL,
        [finishTime] datetime NULL DEFAULT ((getdate())),
        [score] float NOT NULL,
        CONSTRAINT [PK_Result] PRIMARY KEY ([ID]),
        CONSTRAINT [FK__Result__userID__2D27B809] FOREIGN KEY ([userID]) REFERENCES [Users] ([ID]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504123113_Init')
BEGIN
    CREATE INDEX [IX_Result_userID] ON [Result] ([userID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220504123113_Init')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220504123113_Init', N'5.0.16');
END;
GO

COMMIT;
GO

