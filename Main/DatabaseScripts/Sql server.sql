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

CREATE TABLE [Categories] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [ParentId] uniqueidentifier NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL DEFAULT (getdate()),
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Categories_Categories_ParentId] FOREIGN KEY ([ParentId]) REFERENCES [Categories] ([Id]) ON DELETE NO ACTION
);
GO

CREATE TABLE [DocumentTokens] (
    [Id] uniqueidentifier NOT NULL,
    [DocumentId] uniqueidentifier NOT NULL,
    [Token] uniqueidentifier NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    CONSTRAINT [PK_DocumentTokens] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [EmailSMTPSettings] (
    [Id] uniqueidentifier NOT NULL,
    [Host] nvarchar(max) NOT NULL,
    [UserName] nvarchar(max) NOT NULL,
    [Password] nvarchar(max) NOT NULL,
    [IsEnableSSL] bit NOT NULL,
    [Port] int NOT NULL,
    [IsDefault] bit NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL,
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_EmailSMTPSettings] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [LoginAudits] (
    [Id] uniqueidentifier NOT NULL,
    [UserName] nvarchar(max) NULL,
    [LoginTime] datetime2 NOT NULL,
    [RemoteIP] nvarchar(50) NULL,
    [Status] nvarchar(max) NULL,
    [Provider] nvarchar(max) NULL,
    [Latitude] nvarchar(50) NULL,
    [Longitude] nvarchar(50) NULL,
    CONSTRAINT [PK_LoginAudits] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [NLog] (
    [Id] uniqueidentifier NOT NULL,
    [MachineName] nvarchar(max) NULL,
    [Logged] nvarchar(max) NULL,
    [Level] nvarchar(max) NULL,
    [Message] nvarchar(max) NULL,
    [Logger] nvarchar(max) NULL,
    [Properties] nvarchar(max) NULL,
    [Callsite] nvarchar(max) NULL,
    [Exception] nvarchar(max) NULL,
    CONSTRAINT [PK_NLog] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Operations] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL DEFAULT (getdate()),
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_Operations] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Roles] (
    [Id] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    [Name] nvarchar(256) NULL,
    [NormalizedName] nvarchar(256) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Screens] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL DEFAULT (getdate()),
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_Screens] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Users] (
    [Id] uniqueidentifier NOT NULL,
    [FirstName] nvarchar(max) NULL,
    [LastName] nvarchar(max) NULL,
    [IsDeleted] bit NOT NULL,
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
    CONSTRAINT [PK_Users] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [RoleClaims] (
    [Id] int NOT NULL IDENTITY,
    [OperationId] uniqueidentifier NOT NULL,
    [ScreenId] uniqueidentifier NOT NULL,
    [RoleId] uniqueidentifier NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_RoleClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_RoleClaims_Operations_OperationId] FOREIGN KEY ([OperationId]) REFERENCES [Operations] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_RoleClaims_Screens_ScreenId] FOREIGN KEY ([ScreenId]) REFERENCES [Screens] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [ScreenOperations] (
    [Id] uniqueidentifier NOT NULL,
    [OperationId] uniqueidentifier NOT NULL,
    [ScreenId] uniqueidentifier NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL DEFAULT (getdate()),
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_ScreenOperations] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ScreenOperations_Operations_OperationId] FOREIGN KEY ([OperationId]) REFERENCES [Operations] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_ScreenOperations_Screens_ScreenId] FOREIGN KEY ([ScreenId]) REFERENCES [Screens] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [Documents] (
    [Id] uniqueidentifier NOT NULL,
    [CategoryId] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [Url] nvarchar(450) NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL DEFAULT (getdate()),
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_Documents] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Documents_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Categories] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Documents_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [UserClaims] (
    [Id] int NOT NULL IDENTITY,
    [OperationId] uniqueidentifier NOT NULL,
    [ScreenId] uniqueidentifier NOT NULL,
    [UserId] uniqueidentifier NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_UserClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_UserClaims_Operations_OperationId] FOREIGN KEY ([OperationId]) REFERENCES [Operations] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_UserClaims_Screens_ScreenId] FOREIGN KEY ([ScreenId]) REFERENCES [Screens] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_UserClaims_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [UserLogins] (
    [LoginProvider] nvarchar(450) NOT NULL,
    [ProviderKey] nvarchar(450) NOT NULL,
    [ProviderDisplayName] nvarchar(max) NULL,
    [UserId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_UserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
    CONSTRAINT [FK_UserLogins_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [UserRoles] (
    [UserId] uniqueidentifier NOT NULL,
    [RoleId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_UserRoles] PRIMARY KEY ([UserId], [RoleId]),
    CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [UserTokens] (
    [UserId] uniqueidentifier NOT NULL,
    [LoginProvider] nvarchar(450) NOT NULL,
    [Name] nvarchar(450) NOT NULL,
    [Value] nvarchar(max) NULL,
    CONSTRAINT [PK_UserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
    CONSTRAINT [FK_UserTokens_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [DocumentAuditTrails] (
    [Id] uniqueidentifier NOT NULL,
    [DocumentId] uniqueidentifier NOT NULL,
    [OperationName] int NOT NULL,
    [AssignToUserId] uniqueidentifier NULL,
    [AssignToRoleId] uniqueidentifier NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL DEFAULT (getdate()),
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_DocumentAuditTrails] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_DocumentAuditTrails_Documents_DocumentId] FOREIGN KEY ([DocumentId]) REFERENCES [Documents] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_DocumentAuditTrails_Roles_AssignToRoleId] FOREIGN KEY ([AssignToRoleId]) REFERENCES [Roles] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_DocumentAuditTrails_Users_AssignToUserId] FOREIGN KEY ([AssignToUserId]) REFERENCES [Users] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_DocumentAuditTrails_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [DocumentRolePermissions] (
    [Id] uniqueidentifier NOT NULL,
    [DocumentId] uniqueidentifier NOT NULL,
    [RoleId] uniqueidentifier NOT NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [IsTimeBound] bit NOT NULL,
    [IsAllowDownload] bit NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL,
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_DocumentRolePermissions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_DocumentRolePermissions_Documents_DocumentId] FOREIGN KEY ([DocumentId]) REFERENCES [Documents] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_DocumentRolePermissions_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_DocumentRolePermissions_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [DocumentUserPermissions] (
    [Id] uniqueidentifier NOT NULL,
    [DocumentId] uniqueidentifier NOT NULL,
    [UserId] uniqueidentifier NOT NULL,
    [StartDate] datetime2 NULL,
    [EndDate] datetime2 NULL,
    [IsTimeBound] bit NOT NULL,
    [IsAllowDownload] bit NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL,
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_DocumentUserPermissions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_DocumentUserPermissions_Documents_DocumentId] FOREIGN KEY ([DocumentId]) REFERENCES [Documents] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_DocumentUserPermissions_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [Users] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_DocumentUserPermissions_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE NO ACTION
);
GO

CREATE TABLE [Reminders] (
    [Id] uniqueidentifier NOT NULL,
    [Subject] nvarchar(max) NULL,
    [Message] nvarchar(max) NULL,
    [Frequency] int NULL,
    [StartDate] datetime2 NOT NULL,
    [EndDate] datetime2 NULL,
    [DayOfWeek] int NULL,
    [IsRepeated] bit NOT NULL,
    [IsEmailNotification] bit NOT NULL,
    [DocumentId] uniqueidentifier NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL,
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_Reminders] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Reminders_Documents_DocumentId] FOREIGN KEY ([DocumentId]) REFERENCES [Documents] ([Id]) ON DELETE NO ACTION
);
GO

CREATE TABLE [ReminderSchedulers] (
    [Id] uniqueidentifier NOT NULL,
    [Duration] datetime2 NOT NULL,
    [IsActive] bit NOT NULL,
    [Frequency] int NULL,
    [CreatedDate] datetime2 NOT NULL,
    [DocumentId] uniqueidentifier NULL,
    [UserId] uniqueidentifier NOT NULL,
    [IsRead] bit NOT NULL,
    [IsEmailNotification] bit NOT NULL,
    [Subject] nvarchar(max) NULL,
    [Message] nvarchar(max) NULL,
    CONSTRAINT [PK_ReminderSchedulers] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ReminderSchedulers_Documents_DocumentId] FOREIGN KEY ([DocumentId]) REFERENCES [Documents] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_ReminderSchedulers_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [SendEmails] (
    [Id] uniqueidentifier NOT NULL,
    [Subject] nvarchar(max) NULL,
    [Message] nvarchar(max) NULL,
    [FromEmail] nvarchar(max) NULL,
    [DocumentId] uniqueidentifier NULL,
    [IsSend] bit NOT NULL,
    [Email] nvarchar(max) NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL,
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_SendEmails] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_SendEmails_Documents_DocumentId] FOREIGN KEY ([DocumentId]) REFERENCES [Documents] ([Id]) ON DELETE NO ACTION
);
GO

CREATE TABLE [UserNotifications] (
    [Id] uniqueidentifier NOT NULL,
    [UserId] uniqueidentifier NOT NULL,
    [Message] nvarchar(max) NULL,
    [IsRead] bit NOT NULL,
    [DocumentId] uniqueidentifier NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL,
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_UserNotifications] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_UserNotifications_Documents_DocumentId] FOREIGN KEY ([DocumentId]) REFERENCES [Documents] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_UserNotifications_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [Users] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_UserNotifications_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id])
);
GO

CREATE TABLE [DailyReminders] (
    [Id] uniqueidentifier NOT NULL,
    [ReminderId] uniqueidentifier NOT NULL,
    [DayOfWeek] int NOT NULL,
    [IsActive] bit NOT NULL,
    CONSTRAINT [PK_DailyReminders] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_DailyReminders_Reminders_ReminderId] FOREIGN KEY ([ReminderId]) REFERENCES [Reminders] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [HalfYearlyReminders] (
    [Id] uniqueidentifier NOT NULL,
    [ReminderId] uniqueidentifier NOT NULL,
    [Day] int NOT NULL,
    [Month] int NOT NULL,
    [Quarter] int NOT NULL,
    CONSTRAINT [PK_HalfYearlyReminders] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_HalfYearlyReminders_Reminders_ReminderId] FOREIGN KEY ([ReminderId]) REFERENCES [Reminders] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [QuarterlyReminders] (
    [Id] uniqueidentifier NOT NULL,
    [ReminderId] uniqueidentifier NOT NULL,
    [Day] int NOT NULL,
    [Month] int NOT NULL,
    [Quarter] int NOT NULL,
    CONSTRAINT [PK_QuarterlyReminders] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_QuarterlyReminders_Reminders_ReminderId] FOREIGN KEY ([ReminderId]) REFERENCES [Reminders] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [ReminderNotifications] (
    [Id] uniqueidentifier NOT NULL,
    [ReminderId] uniqueidentifier NOT NULL,
    [Subject] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [FetchDateTime] datetime2 NOT NULL,
    [IsDeleted] bit NOT NULL,
    [IsEmailNotification] bit NOT NULL,
    CONSTRAINT [PK_ReminderNotifications] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ReminderNotifications_Reminders_ReminderId] FOREIGN KEY ([ReminderId]) REFERENCES [Reminders] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [ReminderUsers] (
    [ReminderId] uniqueidentifier NOT NULL,
    [UserId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_ReminderUsers] PRIMARY KEY ([ReminderId], [UserId]),
    CONSTRAINT [FK_ReminderUsers_Reminders_ReminderId] FOREIGN KEY ([ReminderId]) REFERENCES [Reminders] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_ReminderUsers_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id])
);
GO

CREATE INDEX [IX_Categories_ParentId] ON [Categories] ([ParentId]);
GO

CREATE INDEX [IX_DailyReminders_ReminderId] ON [DailyReminders] ([ReminderId]);
GO

CREATE INDEX [IX_DocumentAuditTrails_AssignToRoleId] ON [DocumentAuditTrails] ([AssignToRoleId]);
GO

CREATE INDEX [IX_DocumentAuditTrails_AssignToUserId] ON [DocumentAuditTrails] ([AssignToUserId]);
GO

CREATE INDEX [IX_DocumentAuditTrails_CreatedBy] ON [DocumentAuditTrails] ([CreatedBy]);
GO

CREATE INDEX [IX_DocumentAuditTrails_DocumentId] ON [DocumentAuditTrails] ([DocumentId]);
GO

CREATE INDEX [IX_DocumentRolePermissions_CreatedBy] ON [DocumentRolePermissions] ([CreatedBy]);
GO

CREATE INDEX [IX_DocumentRolePermissions_DocumentId] ON [DocumentRolePermissions] ([DocumentId]);
GO

CREATE INDEX [IX_DocumentRolePermissions_RoleId] ON [DocumentRolePermissions] ([RoleId]);
GO

CREATE INDEX [IX_Documents_CategoryId] ON [Documents] ([CategoryId]);
GO

CREATE INDEX [IX_Documents_CreatedBy] ON [Documents] ([CreatedBy]);
GO

CREATE INDEX [IX_Documents_Url] ON [Documents] ([Url]);
GO

CREATE INDEX [IX_DocumentUserPermissions_CreatedBy] ON [DocumentUserPermissions] ([CreatedBy]);
GO

CREATE INDEX [IX_DocumentUserPermissions_DocumentId] ON [DocumentUserPermissions] ([DocumentId]);
GO

CREATE INDEX [IX_DocumentUserPermissions_UserId] ON [DocumentUserPermissions] ([UserId]);
GO

CREATE INDEX [IX_HalfYearlyReminders_ReminderId] ON [HalfYearlyReminders] ([ReminderId]);
GO

CREATE INDEX [IX_QuarterlyReminders_ReminderId] ON [QuarterlyReminders] ([ReminderId]);
GO

CREATE INDEX [IX_ReminderNotifications_ReminderId] ON [ReminderNotifications] ([ReminderId]);
GO

CREATE INDEX [IX_Reminders_DocumentId] ON [Reminders] ([DocumentId]);
GO

CREATE INDEX [IX_ReminderSchedulers_DocumentId] ON [ReminderSchedulers] ([DocumentId]);
GO

CREATE INDEX [IX_ReminderSchedulers_UserId] ON [ReminderSchedulers] ([UserId]);
GO

CREATE INDEX [IX_ReminderUsers_UserId] ON [ReminderUsers] ([UserId]);
GO

CREATE INDEX [IX_RoleClaims_OperationId] ON [RoleClaims] ([OperationId]);
GO

CREATE INDEX [IX_RoleClaims_RoleId] ON [RoleClaims] ([RoleId]);
GO

CREATE INDEX [IX_RoleClaims_ScreenId] ON [RoleClaims] ([ScreenId]);
GO

CREATE UNIQUE INDEX [RoleNameIndex] ON [Roles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;
GO

CREATE INDEX [IX_ScreenOperations_OperationId] ON [ScreenOperations] ([OperationId]);
GO

CREATE INDEX [IX_ScreenOperations_ScreenId] ON [ScreenOperations] ([ScreenId]);
GO

CREATE INDEX [IX_SendEmails_DocumentId] ON [SendEmails] ([DocumentId]);
GO

CREATE INDEX [IX_UserClaims_OperationId] ON [UserClaims] ([OperationId]);
GO

CREATE INDEX [IX_UserClaims_ScreenId] ON [UserClaims] ([ScreenId]);
GO

CREATE INDEX [IX_UserClaims_UserId] ON [UserClaims] ([UserId]);
GO

CREATE INDEX [IX_UserLogins_UserId] ON [UserLogins] ([UserId]);
GO

CREATE INDEX [IX_UserNotifications_CreatedBy] ON [UserNotifications] ([CreatedBy]);
GO

CREATE INDEX [IX_UserNotifications_DocumentId] ON [UserNotifications] ([DocumentId]);
GO

CREATE INDEX [IX_UserNotifications_UserId] ON [UserNotifications] ([UserId]);
GO

CREATE INDEX [IX_UserRoles_RoleId] ON [UserRoles] ([RoleId]);
GO

CREATE INDEX [EmailIndex] ON [Users] ([NormalizedEmail]);
GO

CREATE UNIQUE INDEX [UserNameIndex] ON [Users] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211222114952_Initial', N'7.0.2');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

-- Categories
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted], [ParentId]) VALUES (N'9cc497f5-1736-4bc6-84a8-316fd983b732', N'HR Policies', NULL, CAST(N'2021-12-22T17:13:13.4469583' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:13:13.4466667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted], [ParentId]) VALUES (N'4dbbd372-6acf-4e5d-a1cf-3ca3f7cc190d', N'HR Policies 2020', N'', CAST(N'2021-12-22T17:13:38.7871646' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:13:38.7900000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, N'9cc497f5-1736-4bc6-84a8-316fd983b732')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted], [ParentId]) VALUES (N'0e628f62-c710-40f2-949d-5b38583869f2', N'HR Policies 2021', N'', CAST(N'2021-12-22T17:13:48.4922407' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:13:48.4933333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, N'9cc497f5-1736-4bc6-84a8-316fd983b732')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted], [ParentId]) VALUES (N'a465e640-4a44-44e9-9821-630cc8da4a4c', N'Confidential', NULL, CAST(N'2021-12-22T17:13:06.8971286' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:13:06.8966667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted], [ParentId]) VALUES (N'48c4c825-04d7-44c5-84c8-6d134cb9b36b', N'Logbooks', NULL, CAST(N'2021-12-22T17:12:44.7875398' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:12:44.7900000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted], [ParentId]) VALUES (N'e6bc300e-6600-442e-b452-9a13213ab980', N'Quality Assurance Document', NULL, CAST(N'2021-12-22T17:13:25.7641267' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:13:25.7633333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted], [ParentId]) VALUES (N'ad57c02a-b6cf-4aa3-aad7-9c014c41b3e6', N'SOP Production', NULL, CAST(N'2021-12-22T17:12:56.6720077' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:12:56.6700000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted], [ParentId]) VALUES (N'04226dd5-fedc-4fbd-8ba9-c0a5b72c5b39', N'Resume', NULL, CAST(N'2021-12-22T17:12:49.0555527' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:12:49.0566667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, NULL)

-- Users
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [IsDeleted], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1a5cf5b9-ead8-495c-8719-2d8be776f452', N'Shirley', N'Heitzman', 0, N'employee@gmail.com', N'EMPLOYEE@GMAIL.COM', N'employee@gmail.com', N'EMPLOYEE@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEISmz8S4E4dOhEPhhcQ6xmdJCNeez7fmWB6tXa1h2yKrwD3lO+lX+eKSeKdgPB/Mcw==', N'HFC3ZVYIMS63F5H6FHWNDUFRLRI4RDEG', N'6b2c2644-949a-4d2c-99fe-bb72411b6eb2', N'9904750722', 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [IsDeleted], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4b352b37-332a-40c6-ab05-e38fcf109719', N'David', N'Parnell', 0, N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEM60FYHL5RMKNeB+CxCOI41EC8Vsr1B3Dyrrr2BOtZrxz6doL8o6Tv/tYGDRk20t1A==', N'5D4GQ7LLLVRQJDQFNUGUU763GELSABOJ', N'dde0074a-2914-476c-bd3b-63622da1dbeb', N'1234567890', 0, 0, NULL, 1, 0)

-- Operations
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'c288b5d3-419d-4dc0-9e5a-083194016d2c', N'Edit Role', CAST(N'2021-12-22T16:19:27.0969638' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:27.0966667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'41f65d07-9023-4cfb-9c7c-0e3247a012e0', N'View SMTP Settings', CAST(N'2021-12-22T17:10:54.4083253' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:10:54.4100000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'229ad778-c7d3-4f5f-ab52-24b537c39514', N'Delete Document', CAST(N'2021-12-22T16:18:30.3499854' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:30.3533333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'752ae5b8-e34f-4b32-81f2-2cf709881663', N'Edit SMTP Setting', CAST(N'2021-12-22T16:20:21.5000620' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:21.5000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'6f2717fc-edef-4537-916d-2d527251a5c1', N'View Reminders', CAST(N'2021-12-22T17:10:31.0954098' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:10:31.0966667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'cd46a3a4-ede5-4941-a49b-3df7eaa46428', N'Edit Category', CAST(N'2021-12-22T16:19:11.9766992' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:11.9766667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'63ed1277-1db5-4cf7-8404-3e3426cb4bc5', N'View Documents', CAST(N'2021-12-22T17:08:28.5475520' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:08:28.5566667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'6bc0458e-22f5-4975-b387-4d6a4fb35201', N'Create Reminder', CAST(N'2021-12-22T16:20:01.0047984' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:01.0066667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'1c7d3e31-08ad-43cf-9cf7-4ffafdda9029', N'View Document Audit Trail', CAST(N'2021-12-22T16:19:19.6713411' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:19.6700000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'3ccaf408-8864-4815-a3e0-50632d90bcb6', N'Edit Reminder', CAST(N'2021-12-22T16:20:05.0099657' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:05.0166667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'67ae2b97-b24e-41d5-bf39-56b2834548d0', N'Create Category', CAST(N'2021-12-22T16:19:08.4886748' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:08.4900000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'595a769d-f7ef-45f3-9f9e-60c58c5e1542', N'Send Email', CAST(N'2021-12-22T16:18:38.5891523' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:38.5900000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'e506ec48-b99a-45b4-9ec9-6451bc67477b', N'Assign Permission', CAST(N'2021-12-22T16:19:48.2359350' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:48.2366667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'ab45ef6a-a8e6-47ef-a182-6b88e2a6f9aa', N'View Categories', CAST(N'2021-12-22T17:09:09.2608417' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:09:09.2600000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'd4d724fc-fd38-49c4-85bc-73937b219e20', N'Reset Password', CAST(N'2021-12-22T16:19:51.9868277' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:51.9866667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'7ba630ca-a9d3-42ee-99c8-766e2231fec1', N'View Dashboard', CAST(N'2021-12-22T16:18:17.4262057' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:17.4300000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'3da78b4d-d263-4b13-8e81-7aa164a3688c', N'Add Reminder', CAST(N'2021-12-22T16:18:42.2181455' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:42.2200000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'ab0544d7-2276-4f3b-b450-7f0fa11c3dd9', N'Create SMTP Setting', CAST(N'2021-12-22T16:20:17.6534586' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:17.6533333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'57216dcd-1a1c-4f94-a33d-83a5af2d7a46', N'View Roles', CAST(N'2021-12-22T17:09:43.8015442' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:09:43.8033333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'4f19045b-e9a8-403b-b730-8453ee72830e', N'Delete SMTP Setting', CAST(N'2021-12-22T16:20:25.5731214' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:25.5733333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'fbe77c07-3058-4dbe-9d56-8c75dc879460', N'Assign User Role', CAST(N'2021-12-22T16:19:56.3240583' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:56.3233333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'ff4b3b73-c29f-462a-afa4-94a40e6b2c4a', N'View Login Audit Logs', CAST(N'2021-12-22T16:20:13.3631949' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:13.3633333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'239035d5-cd44-475f-bbc5-9ef51768d389', N'Create Document', CAST(N'2021-12-22T16:18:22.7285627' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:22.7300000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'db8825b1-ee4e-49f6-9a08-b0210ed53fd4', N'Create Role', CAST(N'2021-12-22T16:19:23.9337990' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:23.9333333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'31cb6438-7d4a-4385-8a34-b4e8f6096a48', N'View Users', CAST(N'2021-12-22T17:10:05.7725732' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:10:05.7733333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'18a5a8f6-7cb6-4178-857d-b6a981ea3d4f', N'Delete Role', CAST(N'2021-12-22T16:19:30.9951456' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:30.9966667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'6719a065-8a4a-4350-8582-bfc41ce283fb', N'Download Document', CAST(N'2021-12-22T16:18:46.2300299' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:46.2300000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'a8dd972d-e758-4571-8d39-c6fec74b361b', N'Edit Document', CAST(N'2021-12-22T16:18:26.4671126' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:26.4666667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'86ce1382-a2b1-48ed-ae81-c9908d00cf3b', N'Create User', CAST(N'2021-12-22T16:19:35.4981545' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:35.4966667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'5ea48d56-2ed3-4239-bb90-dd4d70a1b0b2', N'Delete Reminder', CAST(N'2021-12-22T16:20:09.0773918' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:09.0800000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'0a2e19fc-d9f2-446c-8ca3-e6b8b73b5f9b', N'Edit User', CAST(N'2021-12-22T16:19:41.0135872' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:41.0166667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'2ea6ba08-eb36-4e34-92d9-f1984c908b31', N'Share Document', CAST(N'2021-12-22T16:18:34.8231442' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:34.8233333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'9c0e2186-06a4-4207-acbc-f6d8efa430b3', N'Delete Category', CAST(N'2021-12-22T16:19:15.0882259' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:15.0900000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Operations] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'374d74aa-a580-4928-848d-f7553db39914', N'Delete User', CAST(N'2021-12-22T16:19:44.4173351' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:44.4166667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)

-- Roles
INSERT [dbo].[Roles] ([Id], [IsDeleted], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'c5d235ea-81b4-4c36-9205-2077da227c0a', 0, N'Employee', N'Employee', N'47432aba-cc42-4113-a49d-cb8548e185b2')
INSERT [dbo].[Roles] ([Id], [IsDeleted], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', 0, N'Super Admin', N'Super Admin', N'870b5668-b97a-4406-bead-09022612568c')

-- Screens
INSERT [dbo].[Screens] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', N'Email', CAST(N'2021-12-22T16:18:01.0788250' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:01.0800000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Screens] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'All Documents', CAST(N'2021-12-22T16:17:23.9712198' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:23.9700000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Screens] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'42e44f15-8e33-423a-ad7f-17edc23d6dd3', N'Dashboard', CAST(N'2021-12-22T16:17:16.4668983' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:16.4733333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Screens] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', N'Reminder', CAST(N'2021-12-22T16:17:52.9795843' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:52.9800000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Screens] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'f042bbee-d15f-40fb-b79a-8368f2c2e287', N'Login Audit', CAST(N'2021-12-22T16:17:57.4457910' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:57.4466667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Screens] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'2396f81c-f8b5-49ac-88d1-94ed57333f49', N'Document Audit Trail', CAST(N'2021-12-22T16:17:38.6403958' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:38.6400000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Screens] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'User', CAST(N'2021-12-22T16:17:48.8833752' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:48.8833333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Screens] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', N'Assigned Documents', CAST(N'2021-12-24T10:15:02.1617631' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-24T10:15:02.1733333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Screens] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'090ea443-01c7-4638-a194-ad3416a5ea7a', N'Role', CAST(N'2021-12-22T16:17:44.1841942' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:44.1833333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[Screens] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'5a5f7cf8-21a6-434a-9330-db91b17d867c', N'Document Category', CAST(N'2021-12-22T16:17:33.3778925' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:33.3800000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)

-- Role Claims
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'752ae5b8-e34f-4b32-81f2-2cf709881663', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Email_Edit_SMTP_Setting', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'cd46a3a4-ede5-4941-a49b-3df7eaa46428', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Document_Category_Edit_Category', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'18a5a8f6-7cb6-4178-857d-b6a981ea3d4f', N'090ea443-01c7-4638-a194-ad3416a5ea7a', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Role_Delete_Role', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'db8825b1-ee4e-49f6-9a08-b0210ed53fd4', N'090ea443-01c7-4638-a194-ad3416a5ea7a', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Role_Create_Role', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'c288b5d3-419d-4dc0-9e5a-083194016d2c', N'090ea443-01c7-4638-a194-ad3416a5ea7a', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Role_Edit_Role', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'374d74aa-a580-4928-848d-f7553db39914', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'User_Delete_User', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'0a2e19fc-d9f2-446c-8ca3-e6b8b73b5f9b', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'User_Edit_User', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'86ce1382-a2b1-48ed-ae81-c9908d00cf3b', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'User_Create_User', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'fbe77c07-3058-4dbe-9d56-8c75dc879460', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'User_Assign_User_Role', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'd4d724fc-fd38-49c4-85bc-73937b219e20', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'User_Reset_Password', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'e506ec48-b99a-45b4-9ec9-6451bc67477b', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'User_Assign_Permission', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'1c7d3e31-08ad-43cf-9cf7-4ffafdda9029', N'2396f81c-f8b5-49ac-88d1-94ed57333f49', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Document_Audit_Trail_View_Document_Audit_Trail', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'ff4b3b73-c29f-462a-afa4-94a40e6b2c4a', N'f042bbee-d15f-40fb-b79a-8368f2c2e287', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Login_Audit_View_Login_Audit_Logs', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'67ae2b97-b24e-41d5-bf39-56b2834548d0', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Document_Category_Create_Category', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'5ea48d56-2ed3-4239-bb90-dd4d70a1b0b2', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Reminder_Delete_Reminder', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'6bc0458e-22f5-4975-b387-4d6a4fb35201', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Reminder_Create_Reminder', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'7ba630ca-a9d3-42ee-99c8-766e2231fec1', N'42e44f15-8e33-423a-ad7f-17edc23d6dd3', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Dashboard_View_Dashboard', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'2ea6ba08-eb36-4e34-92d9-f1984c908b31', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_Share_Document', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'a8dd972d-e758-4571-8d39-c6fec74b361b', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_Edit_Document', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'6719a065-8a4a-4350-8582-bfc41ce283fb', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_Download_Document', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'239035d5-cd44-475f-bbc5-9ef51768d389', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_Create_Document', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'3da78b4d-d263-4b13-8e81-7aa164a3688c', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_Add_Reminder', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'595a769d-f7ef-45f3-9f9e-60c58c5e1542', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_Send_Email', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'229ad778-c7d3-4f5f-ab52-24b537c39514', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_Delete_Document', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'4f19045b-e9a8-403b-b730-8453ee72830e', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Email_Delete_SMTP_Setting', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'ab0544d7-2276-4f3b-b450-7f0fa11c3dd9', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Email_Create_SMTP_Setting', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'3ccaf408-8864-4815-a3e0-50632d90bcb6', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Reminder_Edit_Reminder', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'9c0e2186-06a4-4207-acbc-f6d8efa430b3', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Document_Category_Delete_Category', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'ab45ef6a-a8e6-47ef-a182-6b88e2a6f9aa', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Document_Category_View_Categories', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'57216dcd-1a1c-4f94-a33d-83a5af2d7a46', N'090ea443-01c7-4638-a194-ad3416a5ea7a', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Role_View_Roles', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'31cb6438-7d4a-4385-8a34-b4e8f6096a48', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'User_View_Users', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'6f2717fc-edef-4537-916d-2d527251a5c1', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Reminder_View_Reminders', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'63ed1277-1db5-4cf7-8404-3e3426cb4bc5', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_View_Documents', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'41f65d07-9023-4cfb-9c7c-0e3247a012e0', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Email_View_SMTP_Settings', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'7ba630ca-a9d3-42ee-99c8-766e2231fec1', N'42e44f15-8e33-423a-ad7f-17edc23d6dd3', N'c5d235ea-81b4-4c36-9205-2077da227c0a', N'Dashboard_View_Dashboard', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'ab45ef6a-a8e6-47ef-a182-6b88e2a6f9aa', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', N'c5d235ea-81b4-4c36-9205-2077da227c0a', N'Document_Category_View_Categories', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'239035d5-cd44-475f-bbc5-9ef51768d389', N'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', N'c5d235ea-81b4-4c36-9205-2077da227c0a', N'Assigned_Documents_Create_Document', N'')
INSERT [dbo].[RoleClaims] ([OperationId], [ScreenId], [RoleId], [ClaimType], [ClaimValue]) VALUES (N'239035d5-cd44-475f-bbc5-9ef51768d389', N'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Assigned_Documents_Create_Document', N'')

-- ScreenOperations
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'6adf6012-0101-48b2-ad54-078d2f7fe96d', N'31cb6438-7d4a-4385-8a34-b4e8f6096a48', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', CAST(N'2021-12-22T17:10:15.7372916' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:10:15.7400000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'f54926e2-3ad3-40be-8f7e-14cab77e87bd', N'3ccaf408-8864-4815-a3e0-50632d90bcb6', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', CAST(N'2021-12-22T16:21:45.5996626' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:45.6000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'87089dd2-149a-49c4-931c-18b47e08561c', N'd4d724fc-fd38-49c4-85bc-73937b219e20', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', CAST(N'2021-12-22T16:21:35.8791295' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:35.8800000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'8e82fe1f-8ccd-4cc2-b1ca-1a84dd17a5ab', N'67ae2b97-b24e-41d5-bf39-56b2834548d0', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', CAST(N'2021-12-22T16:21:05.3807145' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:05.3800000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'6a048b38-5b3a-42b0-83fd-2c4d588d0b2f', N'6bc0458e-22f5-4975-b387-4d6a4fb35201', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', CAST(N'2021-12-22T16:21:44.7181855' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:44.7200000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'faf1cb6f-9c20-4ca3-8222-32028b44e484', N'595a769d-f7ef-45f3-9f9e-60c58c5e1542', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T16:20:43.0046514' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:43.0033333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'65dfed53-7855-46f5-ab93-3629fc68ea71', N'1c7d3e31-08ad-43cf-9cf7-4ffafdda9029', N'2396f81c-f8b5-49ac-88d1-94ed57333f49', CAST(N'2021-12-22T16:21:14.2760682' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:14.2800000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'761032d2-822a-4274-ab85-3b389f5ec252', N'2ea6ba08-eb36-4e34-92d9-f1984c908b31', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T16:20:42.2272333' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:42.2300000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'5d5e0edc-e14f-48ad-bf1d-3dfbd9ac55aa', N'db8825b1-ee4e-49f6-9a08-b0210ed53fd4', N'090ea443-01c7-4638-a194-ad3416a5ea7a', CAST(N'2021-12-22T16:21:21.0297782' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:21.0300000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'cc5d7643-e418-492f-bbbd-409a336dbce5', N'9c0e2186-06a4-4207-acbc-f6d8efa430b3', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', CAST(N'2021-12-22T16:21:06.6744709' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:06.6800000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'c9928f1f-0702-4e37-97a7-431e5c9f819c', N'374d74aa-a580-4928-848d-f7553db39914', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', CAST(N'2021-12-22T16:21:33.4580076' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:33.4600000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'e67675a7-cd03-4b28-bd2f-437a813686b0', N'cd46a3a4-ede5-4941-a49b-3df7eaa46428', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', CAST(N'2021-12-22T16:21:06.0554216' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:06.0533333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'8a90c207-7752-4277-83f6-5345ed277d7a', N'57216dcd-1a1c-4f94-a33d-83a5af2d7a46', N'090ea443-01c7-4638-a194-ad3416a5ea7a', CAST(N'2021-12-22T17:09:52.9006960' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:09:52.9000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'dcba14ed-cb99-44d4-8b4f-53d8f249ed20', N'3da78b4d-d263-4b13-8e81-7aa164a3688c', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T16:20:47.1425483' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:47.1433333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'8f065fb5-01c7-4dea-ab19-650392338688', N'752ae5b8-e34f-4b32-81f2-2cf709881663', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', CAST(N'2021-12-22T16:22:00.6107538' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:22:00.6100000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'ff092131-a214-48c0-a8e3-68a8723840e1', N'86ce1382-a2b1-48ed-ae81-c9908d00cf3b', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', CAST(N'2021-12-22T16:21:31.6462984' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:31.6466667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'd53f507b-c73c-435f-a4d0-69fe616b8d80', N'6f2717fc-edef-4537-916d-2d527251a5c1', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', CAST(N'2021-12-22T17:10:41.8229074' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:10:41.8300000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'f8863c5a-4344-41cb-b1fa-83e223d6a7df', N'6719a065-8a4a-4350-8582-bfc41ce283fb', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T16:20:48.9822259' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:48.9833333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'1a0a3737-ee82-46dc-a1b1-8bbc3aee23f6', N'ab0544d7-2276-4f3b-b450-7f0fa11c3dd9', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', CAST(N'2021-12-22T16:22:00.0004601' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:22:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'e1278d04-1e53-4885-b7f3-8dd9786ee8ba', N'fbe77c07-3058-4dbe-9d56-8c75dc879460', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', CAST(N'2021-12-22T16:21:36.6827083' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:36.6800000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'b13dc77a-32b9-4f48-96de-90539ba688fa', N'41f65d07-9023-4cfb-9c7c-0e3247a012e0', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', CAST(N'2021-12-22T17:11:05.2931233' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:11:05.2933333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'7df88485-9516-4995-9bc2-99dd7edd6bf9', N'229ad778-c7d3-4f5f-ab52-24b537c39514', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T16:20:40.0817371' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:40.0800000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'e99d8d8b-961c-47ad-85d8-a7b57c6a2f65', N'239035d5-cd44-475f-bbc5-9ef51768d389', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T16:20:37.6126421' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:37.6133333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'4de6055c-5f81-44d8-aee2-b966fc442263', N'4f19045b-e9a8-403b-b730-8453ee72830e', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', CAST(N'2021-12-22T16:22:01.1583447' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:22:01.1566667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'cb980805-4de9-45b6-a12d-bb0f91d549cb', N'e506ec48-b99a-45b4-9ec9-6451bc67477b', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', CAST(N'2021-12-22T16:21:35.0223941' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:35.0233333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'd886ffaa-e26f-4e27-b4e5-c3636f6422cf', N'ff4b3b73-c29f-462a-afa4-94a40e6b2c4a', N'f042bbee-d15f-40fb-b79a-8368f2c2e287', CAST(N'2021-12-22T16:21:54.0380761' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:54.0366667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'ecf7dc42-fc44-4d1a-b314-d1ff71878d94', N'5ea48d56-2ed3-4239-bb90-dd4d70a1b0b2', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', CAST(N'2021-12-22T16:21:46.9438819' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:46.9433333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'23ddf867-056f-425b-99ed-d298bbd2d80f', N'0a2e19fc-d9f2-446c-8ca3-e6b8b73b5f9b', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', CAST(N'2021-12-22T16:21:32.5698943' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:32.5700000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'f591c7be-4913-44f8-a74c-d2fc44dd5a3e', N'ab45ef6a-a8e6-47ef-a182-6b88e2a6f9aa', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', CAST(N'2021-12-22T17:09:28.4063740' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:09:28.4100000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'b4fc0f33-0e9b-4b22-b357-d85125ba8d49', N'a8dd972d-e758-4571-8d39-c6fec74b361b', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T16:20:39.2013274' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:39.2033333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'ded2da54-9077-46b4-8d2e-db69890bed25', N'63ed1277-1db5-4cf7-8404-3e3426cb4bc5', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T17:08:44.8152974' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:08:44.8433333' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'1a3346d9-3c8d-4ae0-9416-db9a157d20f2', N'18a5a8f6-7cb6-4178-857d-b6a981ea3d4f', N'090ea443-01c7-4638-a194-ad3416a5ea7a', CAST(N'2021-12-22T16:21:22.7469170' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:22.7466667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'b7d48f9a-c54c-4394-81ce-ea10aba9df87', N'239035d5-cd44-475f-bbc5-9ef51768d389', N'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', CAST(N'2021-12-24T10:15:31.2448701' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-24T10:15:31.2600000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'51c88956-ea5a-4934-96ba-fd09905a1b0a', N'7ba630ca-a9d3-42ee-99c8-766e2231fec1', N'42e44f15-8e33-423a-ad7f-17edc23d6dd3', CAST(N'2021-12-22T16:20:34.2980924' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:34.3066667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)
INSERT [dbo].[ScreenOperations] ([Id], [OperationId], [ScreenId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DeletedDate], [DeletedBy], [IsDeleted]) VALUES (N'044ceb92-87fc-41a5-93a7-ffaf096db766', N'c288b5d3-419d-4dc0-9e5a-083194016d2c', N'090ea443-01c7-4638-a194-ad3416a5ea7a', CAST(N'2021-12-22T16:21:21.8659673' AS DateTime2), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:21.8666667' AS DateTime2), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0)

-- UserRoles
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'1a5cf5b9-ead8-495c-8719-2d8be776f452', N'c5d235ea-81b4-4c36-9205-2077da227c0a')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'4b352b37-332a-40c6-ab05-e38fcf109719', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5')
GO

CREATE PROCEDURE [dbo].[NLog_AddEntry_p] (
  @machineName nvarchar(200),
  @logged datetime,
  @level varchar(5),
  @message nvarchar(max),
  @logger nvarchar(300),
  @properties nvarchar(max),
  @callsite nvarchar(300),
  @exception nvarchar(max)
) AS
BEGIN
  INSERT INTO [dbo].[NLog] (
	[Id],
    [MachineName],
    [Logged],
    [Level],
    [Message],
    [Logger],
    [Properties],
    [Callsite],
    [Exception]
  ) VALUES (
    newid(),
    @machineName,
    @logged,
    @level,
    @message,
    @logger,
    @properties,
    @callsite,
    @exception
  )
  END
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211222115010_Initial_SQL_Data', N'7.0.2');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [UserNotifications] DROP CONSTRAINT [FK_UserNotifications_Users_CreatedBy];
GO

DROP INDEX [IX_UserNotifications_CreatedBy] ON [UserNotifications];
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211224114705_drop foreignkey user notification', N'7.0.2');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[UserNotifications]') AND [c].[name] = N'DeletedBy');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [UserNotifications] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [UserNotifications] ALTER COLUMN [DeletedBy] uniqueidentifier NULL;
GO

DECLARE @var1 sysname;
SELECT @var1 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[SendEmails]') AND [c].[name] = N'DeletedBy');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [SendEmails] DROP CONSTRAINT [' + @var1 + '];');
ALTER TABLE [SendEmails] ALTER COLUMN [DeletedBy] uniqueidentifier NULL;
GO

DECLARE @var2 sysname;
SELECT @var2 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Screens]') AND [c].[name] = N'ModifiedDate');
IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Screens] DROP CONSTRAINT [' + @var2 + '];');
ALTER TABLE [Screens] ADD DEFAULT (GETUTCDATE()) FOR [ModifiedDate];
GO

DECLARE @var3 sysname;
SELECT @var3 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Screens]') AND [c].[name] = N'DeletedBy');
IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Screens] DROP CONSTRAINT [' + @var3 + '];');
ALTER TABLE [Screens] ALTER COLUMN [DeletedBy] uniqueidentifier NULL;
GO

DECLARE @var4 sysname;
SELECT @var4 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ScreenOperations]') AND [c].[name] = N'ModifiedDate');
IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [ScreenOperations] DROP CONSTRAINT [' + @var4 + '];');
ALTER TABLE [ScreenOperations] ADD DEFAULT (GETUTCDATE()) FOR [ModifiedDate];
GO

DECLARE @var5 sysname;
SELECT @var5 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ScreenOperations]') AND [c].[name] = N'DeletedBy');
IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [ScreenOperations] DROP CONSTRAINT [' + @var5 + '];');
ALTER TABLE [ScreenOperations] ALTER COLUMN [DeletedBy] uniqueidentifier NULL;
GO

DECLARE @var6 sysname;
SELECT @var6 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Reminders]') AND [c].[name] = N'DeletedBy');
IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Reminders] DROP CONSTRAINT [' + @var6 + '];');
ALTER TABLE [Reminders] ALTER COLUMN [DeletedBy] uniqueidentifier NULL;
GO

DECLARE @var7 sysname;
SELECT @var7 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Operations]') AND [c].[name] = N'ModifiedDate');
IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [Operations] DROP CONSTRAINT [' + @var7 + '];');
ALTER TABLE [Operations] ADD DEFAULT (GETUTCDATE()) FOR [ModifiedDate];
GO

DECLARE @var8 sysname;
SELECT @var8 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Operations]') AND [c].[name] = N'DeletedBy');
IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [Operations] DROP CONSTRAINT [' + @var8 + '];');
ALTER TABLE [Operations] ALTER COLUMN [DeletedBy] uniqueidentifier NULL;
GO

DECLARE @var9 sysname;
SELECT @var9 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[EmailSMTPSettings]') AND [c].[name] = N'DeletedBy');
IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [EmailSMTPSettings] DROP CONSTRAINT [' + @var9 + '];');
ALTER TABLE [EmailSMTPSettings] ALTER COLUMN [DeletedBy] uniqueidentifier NULL;
GO

DECLARE @var10 sysname;
SELECT @var10 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[DocumentUserPermissions]') AND [c].[name] = N'DeletedBy');
IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [DocumentUserPermissions] DROP CONSTRAINT [' + @var10 + '];');
ALTER TABLE [DocumentUserPermissions] ALTER COLUMN [DeletedBy] uniqueidentifier NULL;
GO

DECLARE @var11 sysname;
SELECT @var11 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Documents]') AND [c].[name] = N'ModifiedDate');
IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [Documents] DROP CONSTRAINT [' + @var11 + '];');
ALTER TABLE [Documents] ADD DEFAULT (GETUTCDATE()) FOR [ModifiedDate];
GO

DECLARE @var12 sysname;
SELECT @var12 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Documents]') AND [c].[name] = N'DeletedBy');
IF @var12 IS NOT NULL EXEC(N'ALTER TABLE [Documents] DROP CONSTRAINT [' + @var12 + '];');
ALTER TABLE [Documents] ALTER COLUMN [DeletedBy] uniqueidentifier NULL;
GO

DECLARE @var13 sysname;
SELECT @var13 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[DocumentRolePermissions]') AND [c].[name] = N'DeletedBy');
IF @var13 IS NOT NULL EXEC(N'ALTER TABLE [DocumentRolePermissions] DROP CONSTRAINT [' + @var13 + '];');
ALTER TABLE [DocumentRolePermissions] ALTER COLUMN [DeletedBy] uniqueidentifier NULL;
GO

DECLARE @var14 sysname;
SELECT @var14 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[DocumentAuditTrails]') AND [c].[name] = N'ModifiedDate');
IF @var14 IS NOT NULL EXEC(N'ALTER TABLE [DocumentAuditTrails] DROP CONSTRAINT [' + @var14 + '];');
ALTER TABLE [DocumentAuditTrails] ADD DEFAULT (GETUTCDATE()) FOR [ModifiedDate];
GO

DECLARE @var15 sysname;
SELECT @var15 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[DocumentAuditTrails]') AND [c].[name] = N'DeletedBy');
IF @var15 IS NOT NULL EXEC(N'ALTER TABLE [DocumentAuditTrails] DROP CONSTRAINT [' + @var15 + '];');
ALTER TABLE [DocumentAuditTrails] ALTER COLUMN [DeletedBy] uniqueidentifier NULL;
GO

DECLARE @var16 sysname;
SELECT @var16 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Categories]') AND [c].[name] = N'ModifiedDate');
IF @var16 IS NOT NULL EXEC(N'ALTER TABLE [Categories] DROP CONSTRAINT [' + @var16 + '];');
ALTER TABLE [Categories] ADD DEFAULT (GETUTCDATE()) FOR [ModifiedDate];
GO

DECLARE @var17 sysname;
SELECT @var17 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Categories]') AND [c].[name] = N'DeletedBy');
IF @var17 IS NOT NULL EXEC(N'ALTER TABLE [Categories] DROP CONSTRAINT [' + @var17 + '];');
ALTER TABLE [Categories] ALTER COLUMN [DeletedBy] uniqueidentifier NULL;
GO

CREATE TABLE [DocumentComments] (
    [Id] uniqueidentifier NOT NULL,
    [DocumentId] uniqueidentifier NOT NULL,
    [Comment] nvarchar(max) NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL,
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_DocumentComments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_DocumentComments_Documents_DocumentId] FOREIGN KEY ([DocumentId]) REFERENCES [Documents] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_DocumentComments_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [Users] ([Id]) ON DELETE NO ACTION
);
GO

CREATE TABLE [DocumentMetaDatas] (
    [Id] uniqueidentifier NOT NULL,
    [DocumentId] uniqueidentifier NOT NULL,
    [Metatag] nvarchar(max) NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL,
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_DocumentMetaDatas] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_DocumentMetaDatas_Documents_DocumentId] FOREIGN KEY ([DocumentId]) REFERENCES [Documents] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [DocumentVersions] (
    [Id] uniqueidentifier NOT NULL,
    [DocumentId] uniqueidentifier NOT NULL,
    [Url] nvarchar(max) NULL,
    [CreatedDate] datetime2 NOT NULL,
    [CreatedBy] uniqueidentifier NOT NULL,
    [ModifiedDate] datetime2 NOT NULL,
    [ModifiedBy] uniqueidentifier NOT NULL,
    [DeletedDate] datetime2 NULL,
    [DeletedBy] uniqueidentifier NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_DocumentVersions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_DocumentVersions_Documents_DocumentId] FOREIGN KEY ([DocumentId]) REFERENCES [Documents] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_DocumentVersions_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [Users] ([Id]) ON DELETE NO ACTION
);
GO

CREATE INDEX [IX_DocumentComments_CreatedBy] ON [DocumentComments] ([CreatedBy]);
GO

CREATE INDEX [IX_DocumentComments_DocumentId] ON [DocumentComments] ([DocumentId]);
GO

CREATE INDEX [IX_DocumentMetaDatas_DocumentId] ON [DocumentMetaDatas] ([DocumentId]);
GO

CREATE INDEX [IX_DocumentVersions_CreatedBy] ON [DocumentVersions] ([CreatedBy]);
GO

CREATE INDEX [IX_DocumentVersions_DocumentId] ON [DocumentVersions] ([DocumentId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220620094937_Version_V3', N'7.0.2');
GO

COMMIT;
GO

