CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `ProductVersion` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
) CHARACTER SET=utf8mb4;

START TRANSACTION;

ALTER DATABASE CHARACTER SET utf8mb4;

CREATE TABLE `Categories` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `Description` longtext CHARACTER SET utf8mb4 NULL,
    `ParentId` char(36) COLLATE ascii_general_ci NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Categories` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Categories_Categories_ParentId` FOREIGN KEY (`ParentId`) REFERENCES `Categories` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `DocumentTokens` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `DocumentId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Token` char(36) COLLATE ascii_general_ci NOT NULL,
    `CreatedDate` datetime NOT NULL,
    CONSTRAINT `PK_DocumentTokens` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `EmailSMTPSettings` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Host` longtext CHARACTER SET utf8mb4 NOT NULL,
    `UserName` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Password` longtext CHARACTER SET utf8mb4 NOT NULL,
    `IsEnableSSL` tinyint(1) NOT NULL,
    `Port` int NOT NULL,
    `IsDefault` tinyint(1) NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_EmailSMTPSettings` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `LoginAudits` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `UserName` longtext CHARACTER SET utf8mb4 NULL,
    `LoginTime` datetime NOT NULL,
    `RemoteIP` varchar(50) CHARACTER SET utf8mb4 NULL,
    `Status` longtext CHARACTER SET utf8mb4 NULL,
    `Provider` longtext CHARACTER SET utf8mb4 NULL,
    `Latitude` varchar(50) CHARACTER SET utf8mb4 NULL,
    `Longitude` varchar(50) CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_LoginAudits` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `NLog` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `MachineName` longtext CHARACTER SET utf8mb4 NULL,
    `Logged` longtext CHARACTER SET utf8mb4 NULL,
    `Level` longtext CHARACTER SET utf8mb4 NULL,
    `Message` longtext CHARACTER SET utf8mb4 NULL,
    `Logger` longtext CHARACTER SET utf8mb4 NULL,
    `Properties` longtext CHARACTER SET utf8mb4 NULL,
    `Callsite` longtext CHARACTER SET utf8mb4 NULL,
    `Exception` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_NLog` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `Operations` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Operations` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `Roles` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    `Name` varchar(256) CHARACTER SET utf8mb4 NULL,
    `NormalizedName` varchar(256) CHARACTER SET utf8mb4 NULL,
    `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_Roles` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `Screens` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Screens` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `Users` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `FirstName` longtext CHARACTER SET utf8mb4 NULL,
    `LastName` longtext CHARACTER SET utf8mb4 NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    `UserName` varchar(256) CHARACTER SET utf8mb4 NULL,
    `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 NULL,
    `Email` varchar(256) CHARACTER SET utf8mb4 NULL,
    `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 NULL,
    `EmailConfirmed` tinyint(1) NOT NULL,
    `PasswordHash` longtext CHARACTER SET utf8mb4 NULL,
    `SecurityStamp` longtext CHARACTER SET utf8mb4 NULL,
    `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 NULL,
    `PhoneNumber` longtext CHARACTER SET utf8mb4 NULL,
    `PhoneNumberConfirmed` tinyint(1) NOT NULL,
    `TwoFactorEnabled` tinyint(1) NOT NULL,
    `LockoutEnd` datetime(6) NULL,
    `LockoutEnabled` tinyint(1) NOT NULL,
    `AccessFailedCount` int NOT NULL,
    CONSTRAINT `PK_Users` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `RoleClaims` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `OperationId` char(36) COLLATE ascii_general_ci NOT NULL,
    `ScreenId` char(36) COLLATE ascii_general_ci NOT NULL,
    `RoleId` char(36) COLLATE ascii_general_ci NOT NULL,
    `ClaimType` longtext CHARACTER SET utf8mb4 NULL,
    `ClaimValue` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_RoleClaims` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_RoleClaims_Operations_OperationId` FOREIGN KEY (`OperationId`) REFERENCES `Operations` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_RoleClaims_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `Roles` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_RoleClaims_Screens_ScreenId` FOREIGN KEY (`ScreenId`) REFERENCES `Screens` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `ScreenOperations` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `OperationId` char(36) COLLATE ascii_general_ci NOT NULL,
    `ScreenId` char(36) COLLATE ascii_general_ci NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_ScreenOperations` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_ScreenOperations_Operations_OperationId` FOREIGN KEY (`OperationId`) REFERENCES `Operations` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_ScreenOperations_Screens_ScreenId` FOREIGN KEY (`ScreenId`) REFERENCES `Screens` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `Documents` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `CategoryId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `Description` longtext CHARACTER SET utf8mb4 NULL,
    `Url` varchar(255) CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Documents` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Documents_Categories_CategoryId` FOREIGN KEY (`CategoryId`) REFERENCES `Categories` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Documents_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `UserClaims` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `OperationId` char(36) COLLATE ascii_general_ci NOT NULL,
    `ScreenId` char(36) COLLATE ascii_general_ci NOT NULL,
    `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
    `ClaimType` longtext CHARACTER SET utf8mb4 NULL,
    `ClaimValue` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_UserClaims` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_UserClaims_Operations_OperationId` FOREIGN KEY (`OperationId`) REFERENCES `Operations` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_UserClaims_Screens_ScreenId` FOREIGN KEY (`ScreenId`) REFERENCES `Screens` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_UserClaims_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `UserLogins` (
    `LoginProvider` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
    `ProviderKey` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
    `ProviderDisplayName` longtext CHARACTER SET utf8mb4 NULL,
    `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_UserLogins` PRIMARY KEY (`LoginProvider`, `ProviderKey`),
    CONSTRAINT `FK_UserLogins_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `UserRoles` (
    `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
    `RoleId` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_UserRoles` PRIMARY KEY (`UserId`, `RoleId`),
    CONSTRAINT `FK_UserRoles_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `Roles` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_UserRoles_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `UserTokens` (
    `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
    `LoginProvider` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
    `Name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
    `Value` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_UserTokens` PRIMARY KEY (`UserId`, `LoginProvider`, `Name`),
    CONSTRAINT `FK_UserTokens_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `DocumentAuditTrails` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `DocumentId` char(36) COLLATE ascii_general_ci NOT NULL,
    `OperationName` int NOT NULL,
    `AssignToUserId` char(36) COLLATE ascii_general_ci NULL,
    `AssignToRoleId` char(36) COLLATE ascii_general_ci NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_DocumentAuditTrails` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_DocumentAuditTrails_Documents_DocumentId` FOREIGN KEY (`DocumentId`) REFERENCES `Documents` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_DocumentAuditTrails_Roles_AssignToRoleId` FOREIGN KEY (`AssignToRoleId`) REFERENCES `Roles` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_DocumentAuditTrails_Users_AssignToUserId` FOREIGN KEY (`AssignToUserId`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_DocumentAuditTrails_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `DocumentRolePermissions` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `DocumentId` char(36) COLLATE ascii_general_ci NOT NULL,
    `RoleId` char(36) COLLATE ascii_general_ci NOT NULL,
    `StartDate` datetime(6) NULL,
    `EndDate` datetime(6) NULL,
    `IsTimeBound` tinyint(1) NOT NULL,
    `IsAllowDownload` tinyint(1) NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_DocumentRolePermissions` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_DocumentRolePermissions_Documents_DocumentId` FOREIGN KEY (`DocumentId`) REFERENCES `Documents` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_DocumentRolePermissions_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `Roles` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_DocumentRolePermissions_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `DocumentUserPermissions` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `DocumentId` char(36) COLLATE ascii_general_ci NOT NULL,
    `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
    `StartDate` datetime NULL,
    `EndDate` datetime NULL,
    `IsTimeBound` tinyint(1) NOT NULL,
    `IsAllowDownload` tinyint(1) NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_DocumentUserPermissions` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_DocumentUserPermissions_Documents_DocumentId` FOREIGN KEY (`DocumentId`) REFERENCES `Documents` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_DocumentUserPermissions_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_DocumentUserPermissions_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `Reminders` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Subject` longtext CHARACTER SET utf8mb4 NULL,
    `Message` longtext CHARACTER SET utf8mb4 NULL,
    `Frequency` int NULL,
    `StartDate` datetime(6) NOT NULL,
    `EndDate` datetime(6) NULL,
    `DayOfWeek` int NULL,
    `IsRepeated` tinyint(1) NOT NULL,
    `IsEmailNotification` tinyint(1) NOT NULL,
    `DocumentId` char(36) COLLATE ascii_general_ci NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Reminders` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Reminders_Documents_DocumentId` FOREIGN KEY (`DocumentId`) REFERENCES `Documents` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `ReminderSchedulers` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Duration` datetime(6) NOT NULL,
    `IsActive` tinyint(1) NOT NULL,
    `Frequency` int NULL,
    `CreatedDate` datetime(6) NOT NULL,
    `DocumentId` char(36) COLLATE ascii_general_ci NULL,
    `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsRead` tinyint(1) NOT NULL,
    `IsEmailNotification` tinyint(1) NOT NULL,
    `Subject` longtext CHARACTER SET utf8mb4 NULL,
    `Message` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_ReminderSchedulers` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_ReminderSchedulers_Documents_DocumentId` FOREIGN KEY (`DocumentId`) REFERENCES `Documents` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_ReminderSchedulers_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `SendEmails` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Subject` longtext CHARACTER SET utf8mb4 NULL,
    `Message` longtext CHARACTER SET utf8mb4 NULL,
    `FromEmail` longtext CHARACTER SET utf8mb4 NULL,
    `DocumentId` char(36) COLLATE ascii_general_ci NULL,
    `IsSend` tinyint(1) NOT NULL,
    `Email` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_SendEmails` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_SendEmails_Documents_DocumentId` FOREIGN KEY (`DocumentId`) REFERENCES `Documents` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `UserNotifications` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Message` longtext CHARACTER SET utf8mb4 NULL,
    `IsRead` tinyint(1) NOT NULL,
    `DocumentId` char(36) COLLATE ascii_general_ci NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_UserNotifications` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_UserNotifications_Documents_DocumentId` FOREIGN KEY (`DocumentId`) REFERENCES `Documents` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_UserNotifications_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_UserNotifications_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `DailyReminders` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `ReminderId` char(36) COLLATE ascii_general_ci NOT NULL,
    `DayOfWeek` int NOT NULL,
    `IsActive` tinyint(1) NOT NULL,
    CONSTRAINT `PK_DailyReminders` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_DailyReminders_Reminders_ReminderId` FOREIGN KEY (`ReminderId`) REFERENCES `Reminders` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `HalfYearlyReminders` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `ReminderId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Day` int NOT NULL,
    `Month` int NOT NULL,
    `Quarter` int NOT NULL,
    CONSTRAINT `PK_HalfYearlyReminders` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_HalfYearlyReminders_Reminders_ReminderId` FOREIGN KEY (`ReminderId`) REFERENCES `Reminders` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `QuarterlyReminders` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `ReminderId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Day` int NOT NULL,
    `Month` int NOT NULL,
    `Quarter` int NOT NULL,
    CONSTRAINT `PK_QuarterlyReminders` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_QuarterlyReminders_Reminders_ReminderId` FOREIGN KEY (`ReminderId`) REFERENCES `Reminders` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `ReminderNotifications` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `ReminderId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Subject` longtext CHARACTER SET utf8mb4 NULL,
    `Description` longtext CHARACTER SET utf8mb4 NULL,
    `FetchDateTime` datetime(6) NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    `IsEmailNotification` tinyint(1) NOT NULL,
    CONSTRAINT `PK_ReminderNotifications` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_ReminderNotifications_Reminders_ReminderId` FOREIGN KEY (`ReminderId`) REFERENCES `Reminders` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `ReminderUsers` (
    `ReminderId` char(36) COLLATE ascii_general_ci NOT NULL,
    `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_ReminderUsers` PRIMARY KEY (`ReminderId`, `UserId`),
    CONSTRAINT `FK_ReminderUsers_Reminders_ReminderId` FOREIGN KEY (`ReminderId`) REFERENCES `Reminders` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_ReminderUsers_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`)
) CHARACTER SET=utf8mb4;

CREATE INDEX `IX_Categories_ParentId` ON `Categories` (`ParentId`);

CREATE INDEX `IX_DailyReminders_ReminderId` ON `DailyReminders` (`ReminderId`);

CREATE INDEX `IX_DocumentAuditTrails_AssignToRoleId` ON `DocumentAuditTrails` (`AssignToRoleId`);

CREATE INDEX `IX_DocumentAuditTrails_AssignToUserId` ON `DocumentAuditTrails` (`AssignToUserId`);

CREATE INDEX `IX_DocumentAuditTrails_CreatedBy` ON `DocumentAuditTrails` (`CreatedBy`);

CREATE INDEX `IX_DocumentAuditTrails_DocumentId` ON `DocumentAuditTrails` (`DocumentId`);

CREATE INDEX `IX_DocumentRolePermissions_CreatedBy` ON `DocumentRolePermissions` (`CreatedBy`);

CREATE INDEX `IX_DocumentRolePermissions_DocumentId` ON `DocumentRolePermissions` (`DocumentId`);

CREATE INDEX `IX_DocumentRolePermissions_RoleId` ON `DocumentRolePermissions` (`RoleId`);

CREATE INDEX `IX_Documents_CategoryId` ON `Documents` (`CategoryId`);

CREATE INDEX `IX_Documents_CreatedBy` ON `Documents` (`CreatedBy`);

CREATE INDEX `IX_Documents_Url` ON `Documents` (`Url`);

CREATE INDEX `IX_DocumentUserPermissions_CreatedBy` ON `DocumentUserPermissions` (`CreatedBy`);

CREATE INDEX `IX_DocumentUserPermissions_DocumentId` ON `DocumentUserPermissions` (`DocumentId`);

CREATE INDEX `IX_DocumentUserPermissions_UserId` ON `DocumentUserPermissions` (`UserId`);

CREATE INDEX `IX_HalfYearlyReminders_ReminderId` ON `HalfYearlyReminders` (`ReminderId`);

CREATE INDEX `IX_QuarterlyReminders_ReminderId` ON `QuarterlyReminders` (`ReminderId`);

CREATE INDEX `IX_ReminderNotifications_ReminderId` ON `ReminderNotifications` (`ReminderId`);

CREATE INDEX `IX_Reminders_DocumentId` ON `Reminders` (`DocumentId`);

CREATE INDEX `IX_ReminderSchedulers_DocumentId` ON `ReminderSchedulers` (`DocumentId`);

CREATE INDEX `IX_ReminderSchedulers_UserId` ON `ReminderSchedulers` (`UserId`);

CREATE INDEX `IX_ReminderUsers_UserId` ON `ReminderUsers` (`UserId`);

CREATE INDEX `IX_RoleClaims_OperationId` ON `RoleClaims` (`OperationId`);

CREATE INDEX `IX_RoleClaims_RoleId` ON `RoleClaims` (`RoleId`);

CREATE INDEX `IX_RoleClaims_ScreenId` ON `RoleClaims` (`ScreenId`);

CREATE UNIQUE INDEX `RoleNameIndex` ON `Roles` (`NormalizedName`);

CREATE INDEX `IX_ScreenOperations_OperationId` ON `ScreenOperations` (`OperationId`);

CREATE INDEX `IX_ScreenOperations_ScreenId` ON `ScreenOperations` (`ScreenId`);

CREATE INDEX `IX_SendEmails_DocumentId` ON `SendEmails` (`DocumentId`);

CREATE INDEX `IX_UserClaims_OperationId` ON `UserClaims` (`OperationId`);

CREATE INDEX `IX_UserClaims_ScreenId` ON `UserClaims` (`ScreenId`);

CREATE INDEX `IX_UserClaims_UserId` ON `UserClaims` (`UserId`);

CREATE INDEX `IX_UserLogins_UserId` ON `UserLogins` (`UserId`);

CREATE INDEX `IX_UserNotifications_CreatedBy` ON `UserNotifications` (`CreatedBy`);

CREATE INDEX `IX_UserNotifications_DocumentId` ON `UserNotifications` (`DocumentId`);

CREATE INDEX `IX_UserNotifications_UserId` ON `UserNotifications` (`UserId`);

CREATE INDEX `IX_UserRoles_RoleId` ON `UserRoles` (`RoleId`);

CREATE INDEX `EmailIndex` ON `Users` (`NormalizedEmail`);

CREATE UNIQUE INDEX `UserNameIndex` ON `Users` (`NormalizedUserName`);

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20211225124149_Initial', '7.0.3');

COMMIT;

START TRANSACTION;

-- Categories
INSERT `Categories` (`Id`, `Name`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`, `ParentId`) VALUES (N'9cc497f5-1736-4bc6-84a8-316fd983b732', N'HR Policies', NULL, CAST(N'2021-12-22T17:13:13.4469583' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:13:13.4466667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, NULL);
INSERT `Categories` (`Id`, `Name`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`, `ParentId`) VALUES (N'4dbbd372-6acf-4e5d-a1cf-3ca3f7cc190d', N'HR Policies 2020', N'', CAST(N'2021-12-22T17:13:38.7871646' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:13:38.7900000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, N'9cc497f5-1736-4bc6-84a8-316fd983b732');
INSERT `Categories` (`Id`, `Name`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`, `ParentId`) VALUES (N'0e628f62-c710-40f2-949d-5b38583869f2', N'HR Policies 2021', N'', CAST(N'2021-12-22T17:13:48.4922407' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:13:48.4933333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, N'9cc497f5-1736-4bc6-84a8-316fd983b732');
INSERT `Categories` (`Id`, `Name`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`, `ParentId`) VALUES (N'a465e640-4a44-44e9-9821-630cc8da4a4c', N'Confidential', NULL, CAST(N'2021-12-22T17:13:06.8971286' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:13:06.8966667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, NULL);
INSERT `Categories` (`Id`, `Name`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`, `ParentId`) VALUES (N'48c4c825-04d7-44c5-84c8-6d134cb9b36b', N'Logbooks', NULL, CAST(N'2021-12-22T17:12:44.7875398' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:12:44.7900000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, NULL);
INSERT `Categories` (`Id`, `Name`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`, `ParentId`) VALUES (N'e6bc300e-6600-442e-b452-9a13213ab980', N'Quality Assurance Document', NULL, CAST(N'2021-12-22T17:13:25.7641267' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:13:25.7633333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, NULL);
INSERT `Categories` (`Id`, `Name`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`, `ParentId`) VALUES (N'ad57c02a-b6cf-4aa3-aad7-9c014c41b3e6', N'SOP Production', NULL, CAST(N'2021-12-22T17:12:56.6720077' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:12:56.6700000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, NULL);
INSERT `Categories` (`Id`, `Name`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`, `ParentId`) VALUES (N'04226dd5-fedc-4fbd-8ba9-c0a5b72c5b39', N'Resume', NULL, CAST(N'2021-12-22T17:12:49.0555527' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:12:49.0566667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0, NULL);

-- Users
INSERT `Users` (`Id`, `FirstName`, `LastName`, `IsDeleted`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`) VALUES (N'1a5cf5b9-ead8-495c-8719-2d8be776f452', N'Shirley', N'Heitzman', 0, N'employee@gmail.com', N'EMPLOYEE@GMAIL.COM', N'employee@gmail.com', N'EMPLOYEE@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEISmz8S4E4dOhEPhhcQ6xmdJCNeez7fmWB6tXa1h2yKrwD3lO+lX+eKSeKdgPB/Mcw==', N'HFC3ZVYIMS63F5H6FHWNDUFRLRI4RDEG', N'6b2c2644-949a-4d2c-99fe-bb72411b6eb2', N'9904750722', 0, 0, NULL, 1, 0);
INSERT `Users` (`Id`, `FirstName`, `LastName`, `IsDeleted`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`) VALUES (N'4b352b37-332a-40c6-ab05-e38fcf109719', N'David', N'Parnell', 0, N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEM60FYHL5RMKNeB+CxCOI41EC8Vsr1B3Dyrrr2BOtZrxz6doL8o6Tv/tYGDRk20t1A==', N'5D4GQ7LLLVRQJDQFNUGUU763GELSABOJ', N'dde0074a-2914-476c-bd3b-63622da1dbeb', N'1234567890', 0, 0, NULL, 1, 0);

-- Operations
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c288b5d3-419d-4dc0-9e5a-083194016d2c', N'Edit Role', CAST(N'2021-12-22T16:19:27.0969638' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:27.0966667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'41f65d07-9023-4cfb-9c7c-0e3247a012e0', N'View SMTP Settings', CAST(N'2021-12-22T17:10:54.4083253' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:10:54.4100000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'229ad778-c7d3-4f5f-ab52-24b537c39514', N'Delete Document', CAST(N'2021-12-22T16:18:30.3499854' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:30.3533333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'752ae5b8-e34f-4b32-81f2-2cf709881663', N'Edit SMTP Setting', CAST(N'2021-12-22T16:20:21.5000620' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:21.5000000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'6f2717fc-edef-4537-916d-2d527251a5c1', N'View Reminders', CAST(N'2021-12-22T17:10:31.0954098' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:10:31.0966667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'cd46a3a4-ede5-4941-a49b-3df7eaa46428', N'Edit Category', CAST(N'2021-12-22T16:19:11.9766992' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:11.9766667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'63ed1277-1db5-4cf7-8404-3e3426cb4bc5', N'View Documents', CAST(N'2021-12-22T17:08:28.5475520' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:08:28.5566667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'6bc0458e-22f5-4975-b387-4d6a4fb35201', N'Create Reminder', CAST(N'2021-12-22T16:20:01.0047984' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:01.0066667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'1c7d3e31-08ad-43cf-9cf7-4ffafdda9029', N'View Document Audit Trail', CAST(N'2021-12-22T16:19:19.6713411' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:19.6700000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'3ccaf408-8864-4815-a3e0-50632d90bcb6', N'Edit Reminder', CAST(N'2021-12-22T16:20:05.0099657' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:05.0166667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'67ae2b97-b24e-41d5-bf39-56b2834548d0', N'Create Category', CAST(N'2021-12-22T16:19:08.4886748' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:08.4900000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'595a769d-f7ef-45f3-9f9e-60c58c5e1542', N'Send Email', CAST(N'2021-12-22T16:18:38.5891523' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:38.5900000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'e506ec48-b99a-45b4-9ec9-6451bc67477b', N'Assign Permission', CAST(N'2021-12-22T16:19:48.2359350' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:48.2366667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ab45ef6a-a8e6-47ef-a182-6b88e2a6f9aa', N'View Categories', CAST(N'2021-12-22T17:09:09.2608417' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:09:09.2600000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd4d724fc-fd38-49c4-85bc-73937b219e20', N'Reset Password', CAST(N'2021-12-22T16:19:51.9868277' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:51.9866667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'7ba630ca-a9d3-42ee-99c8-766e2231fec1', N'View Dashboard', CAST(N'2021-12-22T16:18:17.4262057' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:17.4300000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'3da78b4d-d263-4b13-8e81-7aa164a3688c', N'Add Reminder', CAST(N'2021-12-22T16:18:42.2181455' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:42.2200000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ab0544d7-2276-4f3b-b450-7f0fa11c3dd9', N'Create SMTP Setting', CAST(N'2021-12-22T16:20:17.6534586' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:17.6533333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'57216dcd-1a1c-4f94-a33d-83a5af2d7a46', N'View Roles', CAST(N'2021-12-22T17:09:43.8015442' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:09:43.8033333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'4f19045b-e9a8-403b-b730-8453ee72830e', N'Delete SMTP Setting', CAST(N'2021-12-22T16:20:25.5731214' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:25.5733333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'fbe77c07-3058-4dbe-9d56-8c75dc879460', N'Assign User Role', CAST(N'2021-12-22T16:19:56.3240583' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:56.3233333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ff4b3b73-c29f-462a-afa4-94a40e6b2c4a', N'View Login Audit Logs', CAST(N'2021-12-22T16:20:13.3631949' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:13.3633333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'239035d5-cd44-475f-bbc5-9ef51768d389', N'Create Document', CAST(N'2021-12-22T16:18:22.7285627' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:22.7300000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'db8825b1-ee4e-49f6-9a08-b0210ed53fd4', N'Create Role', CAST(N'2021-12-22T16:19:23.9337990' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:23.9333333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'31cb6438-7d4a-4385-8a34-b4e8f6096a48', N'View Users', CAST(N'2021-12-22T17:10:05.7725732' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:10:05.7733333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'18a5a8f6-7cb6-4178-857d-b6a981ea3d4f', N'Delete Role', CAST(N'2021-12-22T16:19:30.9951456' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:30.9966667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'6719a065-8a4a-4350-8582-bfc41ce283fb', N'Download Document', CAST(N'2021-12-22T16:18:46.2300299' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:46.2300000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a8dd972d-e758-4571-8d39-c6fec74b361b', N'Edit Document', CAST(N'2021-12-22T16:18:26.4671126' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:26.4666667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'86ce1382-a2b1-48ed-ae81-c9908d00cf3b', N'Create User', CAST(N'2021-12-22T16:19:35.4981545' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:35.4966667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5ea48d56-2ed3-4239-bb90-dd4d70a1b0b2', N'Delete Reminder', CAST(N'2021-12-22T16:20:09.0773918' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:09.0800000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'0a2e19fc-d9f2-446c-8ca3-e6b8b73b5f9b', N'Edit User', CAST(N'2021-12-22T16:19:41.0135872' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:41.0166667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'2ea6ba08-eb36-4e34-92d9-f1984c908b31', N'Share Document', CAST(N'2021-12-22T16:18:34.8231442' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:34.8233333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'9c0e2186-06a4-4207-acbc-f6d8efa430b3', N'Delete Category', CAST(N'2021-12-22T16:19:15.0882259' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:15.0900000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Operations` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'374d74aa-a580-4928-848d-f7553db39914', N'Delete User', CAST(N'2021-12-22T16:19:44.4173351' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:19:44.4166667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);

-- Roles
INSERT `Roles` (`Id`, `IsDeleted`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES (N'c5d235ea-81b4-4c36-9205-2077da227c0a', 0, N'Employee', N'Employee', N'47432aba-cc42-4113-a49d-cb8548e185b2');
INSERT `Roles` (`Id`, `IsDeleted`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES (N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', 0, N'Super Admin', N'Super Admin', N'870b5668-b97a-4406-bead-09022612568c');

-- Screens
INSERT `Screens` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', N'Email', CAST(N'2021-12-22T16:18:01.0788250' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:18:01.0800000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Screens` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'All Documents', CAST(N'2021-12-22T16:17:23.9712198' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:23.9700000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Screens` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'42e44f15-8e33-423a-ad7f-17edc23d6dd3', N'Dashboard', CAST(N'2021-12-22T16:17:16.4668983' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:16.4733333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Screens` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', N'Reminder', CAST(N'2021-12-22T16:17:52.9795843' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:52.9800000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Screens` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f042bbee-d15f-40fb-b79a-8368f2c2e287', N'Login Audit', CAST(N'2021-12-22T16:17:57.4457910' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:57.4466667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Screens` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'2396f81c-f8b5-49ac-88d1-94ed57333f49', N'Document Audit Trail', CAST(N'2021-12-22T16:17:38.6403958' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:38.6400000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Screens` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'User', CAST(N'2021-12-22T16:17:48.8833752' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:48.8833333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Screens` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', N'Assigned Documents', CAST(N'2021-12-24T10:15:02.1617631' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-24T10:15:02.1733333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Screens` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'090ea443-01c7-4638-a194-ad3416a5ea7a', N'Role', CAST(N'2021-12-22T16:17:44.1841942' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:44.1833333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `Screens` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5a5f7cf8-21a6-434a-9330-db91b17d867c', N'Document Category', CAST(N'2021-12-22T16:17:33.3778925' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:17:33.3800000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);

-- Role Claims
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'752ae5b8-e34f-4b32-81f2-2cf709881663', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Email_Edit_SMTP_Setting', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'cd46a3a4-ede5-4941-a49b-3df7eaa46428', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Document_Category_Edit_Category', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'18a5a8f6-7cb6-4178-857d-b6a981ea3d4f', N'090ea443-01c7-4638-a194-ad3416a5ea7a', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Role_Delete_Role', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'db8825b1-ee4e-49f6-9a08-b0210ed53fd4', N'090ea443-01c7-4638-a194-ad3416a5ea7a', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Role_Create_Role', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'c288b5d3-419d-4dc0-9e5a-083194016d2c', N'090ea443-01c7-4638-a194-ad3416a5ea7a', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Role_Edit_Role', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'374d74aa-a580-4928-848d-f7553db39914', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'User_Delete_User', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'0a2e19fc-d9f2-446c-8ca3-e6b8b73b5f9b', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'User_Edit_User', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'86ce1382-a2b1-48ed-ae81-c9908d00cf3b', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'User_Create_User', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'fbe77c07-3058-4dbe-9d56-8c75dc879460', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'User_Assign_User_Role', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'd4d724fc-fd38-49c4-85bc-73937b219e20', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'User_Reset_Password', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'e506ec48-b99a-45b4-9ec9-6451bc67477b', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'User_Assign_Permission', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'1c7d3e31-08ad-43cf-9cf7-4ffafdda9029', N'2396f81c-f8b5-49ac-88d1-94ed57333f49', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Document_Audit_Trail_View_Document_Audit_Trail', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'ff4b3b73-c29f-462a-afa4-94a40e6b2c4a', N'f042bbee-d15f-40fb-b79a-8368f2c2e287', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Login_Audit_View_Login_Audit_Logs', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'67ae2b97-b24e-41d5-bf39-56b2834548d0', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Document_Category_Create_Category', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'5ea48d56-2ed3-4239-bb90-dd4d70a1b0b2', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Reminder_Delete_Reminder', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'6bc0458e-22f5-4975-b387-4d6a4fb35201', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Reminder_Create_Reminder', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'7ba630ca-a9d3-42ee-99c8-766e2231fec1', N'42e44f15-8e33-423a-ad7f-17edc23d6dd3', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Dashboard_View_Dashboard', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'2ea6ba08-eb36-4e34-92d9-f1984c908b31', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_Share_Document', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'a8dd972d-e758-4571-8d39-c6fec74b361b', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_Edit_Document', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'6719a065-8a4a-4350-8582-bfc41ce283fb', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_Download_Document', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'239035d5-cd44-475f-bbc5-9ef51768d389', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_Create_Document', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'3da78b4d-d263-4b13-8e81-7aa164a3688c', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_Add_Reminder', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'595a769d-f7ef-45f3-9f9e-60c58c5e1542', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_Send_Email', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'229ad778-c7d3-4f5f-ab52-24b537c39514', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_Delete_Document', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'4f19045b-e9a8-403b-b730-8453ee72830e', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Email_Delete_SMTP_Setting', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'ab0544d7-2276-4f3b-b450-7f0fa11c3dd9', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Email_Create_SMTP_Setting', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'3ccaf408-8864-4815-a3e0-50632d90bcb6', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Reminder_Edit_Reminder', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'9c0e2186-06a4-4207-acbc-f6d8efa430b3', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Document_Category_Delete_Category', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'ab45ef6a-a8e6-47ef-a182-6b88e2a6f9aa', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Document_Category_View_Categories', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'57216dcd-1a1c-4f94-a33d-83a5af2d7a46', N'090ea443-01c7-4638-a194-ad3416a5ea7a', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Role_View_Roles', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'31cb6438-7d4a-4385-8a34-b4e8f6096a48', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'User_View_Users', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'6f2717fc-edef-4537-916d-2d527251a5c1', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Reminder_View_Reminders', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'63ed1277-1db5-4cf7-8404-3e3426cb4bc5', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'All_Documents_View_Documents', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'41f65d07-9023-4cfb-9c7c-0e3247a012e0', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Email_View_SMTP_Settings', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'7ba630ca-a9d3-42ee-99c8-766e2231fec1', N'42e44f15-8e33-423a-ad7f-17edc23d6dd3', N'c5d235ea-81b4-4c36-9205-2077da227c0a', N'Dashboard_View_Dashboard', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'ab45ef6a-a8e6-47ef-a182-6b88e2a6f9aa', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', N'c5d235ea-81b4-4c36-9205-2077da227c0a', N'Document_Category_View_Categories', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'239035d5-cd44-475f-bbc5-9ef51768d389', N'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', N'c5d235ea-81b4-4c36-9205-2077da227c0a', N'Assigned_Documents_Create_Document', N'');
INSERT `RoleClaims` (`OperationId`, `ScreenId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'239035d5-cd44-475f-bbc5-9ef51768d389', N'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5', N'Assigned_Documents_Create_Document', N'');

-- ScreenOperations
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'6adf6012-0101-48b2-ad54-078d2f7fe96d', N'31cb6438-7d4a-4385-8a34-b4e8f6096a48', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', CAST(N'2021-12-22T17:10:15.7372916' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:10:15.7400000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f54926e2-3ad3-40be-8f7e-14cab77e87bd', N'3ccaf408-8864-4815-a3e0-50632d90bcb6', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', CAST(N'2021-12-22T16:21:45.5996626' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:45.6000000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'87089dd2-149a-49c4-931c-18b47e08561c', N'd4d724fc-fd38-49c4-85bc-73937b219e20', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', CAST(N'2021-12-22T16:21:35.8791295' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:35.8800000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8e82fe1f-8ccd-4cc2-b1ca-1a84dd17a5ab', N'67ae2b97-b24e-41d5-bf39-56b2834548d0', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', CAST(N'2021-12-22T16:21:05.3807145' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:05.3800000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'6a048b38-5b3a-42b0-83fd-2c4d588d0b2f', N'6bc0458e-22f5-4975-b387-4d6a4fb35201', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', CAST(N'2021-12-22T16:21:44.7181855' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:44.7200000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'faf1cb6f-9c20-4ca3-8222-32028b44e484', N'595a769d-f7ef-45f3-9f9e-60c58c5e1542', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T16:20:43.0046514' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:43.0033333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'65dfed53-7855-46f5-ab93-3629fc68ea71', N'1c7d3e31-08ad-43cf-9cf7-4ffafdda9029', N'2396f81c-f8b5-49ac-88d1-94ed57333f49', CAST(N'2021-12-22T16:21:14.2760682' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:14.2800000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'761032d2-822a-4274-ab85-3b389f5ec252', N'2ea6ba08-eb36-4e34-92d9-f1984c908b31', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T16:20:42.2272333' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:42.2300000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5d5e0edc-e14f-48ad-bf1d-3dfbd9ac55aa', N'db8825b1-ee4e-49f6-9a08-b0210ed53fd4', N'090ea443-01c7-4638-a194-ad3416a5ea7a', CAST(N'2021-12-22T16:21:21.0297782' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:21.0300000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'cc5d7643-e418-492f-bbbd-409a336dbce5', N'9c0e2186-06a4-4207-acbc-f6d8efa430b3', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', CAST(N'2021-12-22T16:21:06.6744709' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:06.6800000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c9928f1f-0702-4e37-97a7-431e5c9f819c', N'374d74aa-a580-4928-848d-f7553db39914', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', CAST(N'2021-12-22T16:21:33.4580076' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:33.4600000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'e67675a7-cd03-4b28-bd2f-437a813686b0', N'cd46a3a4-ede5-4941-a49b-3df7eaa46428', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', CAST(N'2021-12-22T16:21:06.0554216' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:06.0533333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8a90c207-7752-4277-83f6-5345ed277d7a', N'57216dcd-1a1c-4f94-a33d-83a5af2d7a46', N'090ea443-01c7-4638-a194-ad3416a5ea7a', CAST(N'2021-12-22T17:09:52.9006960' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:09:52.9000000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'dcba14ed-cb99-44d4-8b4f-53d8f249ed20', N'3da78b4d-d263-4b13-8e81-7aa164a3688c', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T16:20:47.1425483' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:47.1433333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8f065fb5-01c7-4dea-ab19-650392338688', N'752ae5b8-e34f-4b32-81f2-2cf709881663', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', CAST(N'2021-12-22T16:22:00.6107538' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:22:00.6100000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ff092131-a214-48c0-a8e3-68a8723840e1', N'86ce1382-a2b1-48ed-ae81-c9908d00cf3b', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', CAST(N'2021-12-22T16:21:31.6462984' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:31.6466667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd53f507b-c73c-435f-a4d0-69fe616b8d80', N'6f2717fc-edef-4537-916d-2d527251a5c1', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', CAST(N'2021-12-22T17:10:41.8229074' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:10:41.8300000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f8863c5a-4344-41cb-b1fa-83e223d6a7df', N'6719a065-8a4a-4350-8582-bfc41ce283fb', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T16:20:48.9822259' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:48.9833333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'1a0a3737-ee82-46dc-a1b1-8bbc3aee23f6', N'ab0544d7-2276-4f3b-b450-7f0fa11c3dd9', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', CAST(N'2021-12-22T16:22:00.0004601' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:22:00.0000000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'e1278d04-1e53-4885-b7f3-8dd9786ee8ba', N'fbe77c07-3058-4dbe-9d56-8c75dc879460', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', CAST(N'2021-12-22T16:21:36.6827083' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:36.6800000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b13dc77a-32b9-4f48-96de-90539ba688fa', N'41f65d07-9023-4cfb-9c7c-0e3247a012e0', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', CAST(N'2021-12-22T17:11:05.2931233' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:11:05.2933333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'7df88485-9516-4995-9bc2-99dd7edd6bf9', N'229ad778-c7d3-4f5f-ab52-24b537c39514', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T16:20:40.0817371' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:40.0800000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'e99d8d8b-961c-47ad-85d8-a7b57c6a2f65', N'239035d5-cd44-475f-bbc5-9ef51768d389', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T16:20:37.6126421' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:37.6133333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'4de6055c-5f81-44d8-aee2-b966fc442263', N'4f19045b-e9a8-403b-b730-8453ee72830e', N'2e3c07a4-fcac-4303-ae47-0d0f796403c9', CAST(N'2021-12-22T16:22:01.1583447' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:22:01.1566667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'cb980805-4de9-45b6-a12d-bb0f91d549cb', N'e506ec48-b99a-45b4-9ec9-6451bc67477b', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', CAST(N'2021-12-22T16:21:35.0223941' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:35.0233333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd886ffaa-e26f-4e27-b4e5-c3636f6422cf', N'ff4b3b73-c29f-462a-afa4-94a40e6b2c4a', N'f042bbee-d15f-40fb-b79a-8368f2c2e287', CAST(N'2021-12-22T16:21:54.0380761' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:54.0366667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ecf7dc42-fc44-4d1a-b314-d1ff71878d94', N'5ea48d56-2ed3-4239-bb90-dd4d70a1b0b2', N'97ff6eb0-39b3-4ddd-acf1-43205d5a9bb3', CAST(N'2021-12-22T16:21:46.9438819' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:46.9433333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'23ddf867-056f-425b-99ed-d298bbd2d80f', N'0a2e19fc-d9f2-446c-8ca3-e6b8b73b5f9b', N'324bdc51-d71f-4f80-9f28-a30e8aae4009', CAST(N'2021-12-22T16:21:32.5698943' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:32.5700000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f591c7be-4913-44f8-a74c-d2fc44dd5a3e', N'ab45ef6a-a8e6-47ef-a182-6b88e2a6f9aa', N'5a5f7cf8-21a6-434a-9330-db91b17d867c', CAST(N'2021-12-22T17:09:28.4063740' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:09:28.4100000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b4fc0f33-0e9b-4b22-b357-d85125ba8d49', N'a8dd972d-e758-4571-8d39-c6fec74b361b', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T16:20:39.2013274' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:39.2033333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ded2da54-9077-46b4-8d2e-db69890bed25', N'63ed1277-1db5-4cf7-8404-3e3426cb4bc5', N'eddf9e8e-0c70-4cde-b5f9-117a879747d6', CAST(N'2021-12-22T17:08:44.8152974' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T17:08:44.8433333' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'1a3346d9-3c8d-4ae0-9416-db9a157d20f2', N'18a5a8f6-7cb6-4178-857d-b6a981ea3d4f', N'090ea443-01c7-4638-a194-ad3416a5ea7a', CAST(N'2021-12-22T16:21:22.7469170' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:22.7466667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b7d48f9a-c54c-4394-81ce-ea10aba9df87', N'239035d5-cd44-475f-bbc5-9ef51768d389', N'fc97dc8f-b4da-46b1-a179-ab206d8b7efd', CAST(N'2021-12-24T10:15:31.2448701' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-24T10:15:31.2600000' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'51c88956-ea5a-4934-96ba-fd09905a1b0a', N'7ba630ca-a9d3-42ee-99c8-766e2231fec1', N'42e44f15-8e33-423a-ad7f-17edc23d6dd3', CAST(N'2021-12-22T16:20:34.2980924' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:20:34.3066667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);
INSERT `ScreenOperations` (`Id`, `OperationId`, `ScreenId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'044ceb92-87fc-41a5-93a7-ffaf096db766', N'c288b5d3-419d-4dc0-9e5a-083194016d2c', N'090ea443-01c7-4638-a194-ad3416a5ea7a', CAST(N'2021-12-22T16:21:21.8659673' AS DATETIME(6)), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2021-12-22T16:21:21.8666667' AS DATETIME(6)), N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', 0);

-- UserRoles
INSERT `UserRoles` (`UserId`, `RoleId`) VALUES (N'1a5cf5b9-ead8-495c-8719-2d8be776f452', N'c5d235ea-81b4-4c36-9205-2077da227c0a');
INSERT `UserRoles` (`UserId`, `RoleId`) VALUES (N'4b352b37-332a-40c6-ab05-e38fcf109719', N'fedeac7a-a665-40a4-af02-f47ec4b7aff5');


CREATE DEFINER=`root`@`localhost` PROCEDURE `NLog_AddEntry_p`(
  machineName nvarchar(200),
  logged datetime(3),
  level varchar(5),
  message longtext,
  logger nvarchar(300),
  properties longtext,
  callsite nvarchar(300),
  exception longtext
)
BEGIN
  INSERT INTO NLog (
	`Id`,
    `MachineName`,
    `Logged`,
    `Level`,
    `Message`,
    `Logger`,
    `Properties`,
    `Callsite`,
    `Exception`
  ) VALUES (
    uuid(),
    machineName,
    logged,
    level,
    message,
    logger,
    properties,
    callsite,
    exception
  );
  END;

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20211225124206_Initial_SQL_Data', '7.0.3');

COMMIT;

START TRANSACTION;

ALTER TABLE `UserNotifications` MODIFY COLUMN `DeletedBy` char(36) COLLATE ascii_general_ci NULL;

ALTER TABLE `SendEmails` MODIFY COLUMN `DeletedBy` char(36) COLLATE ascii_general_ci NULL;

ALTER TABLE `Screens` MODIFY COLUMN `DeletedBy` char(36) COLLATE ascii_general_ci NULL;

ALTER TABLE `ScreenOperations` MODIFY COLUMN `DeletedBy` char(36) COLLATE ascii_general_ci NULL;

ALTER TABLE `Reminders` MODIFY COLUMN `DeletedBy` char(36) COLLATE ascii_general_ci NULL;

ALTER TABLE `Operations` MODIFY COLUMN `DeletedBy` char(36) COLLATE ascii_general_ci NULL;

ALTER TABLE `EmailSMTPSettings` MODIFY COLUMN `DeletedBy` char(36) COLLATE ascii_general_ci NULL;

ALTER TABLE `DocumentUserPermissions` MODIFY COLUMN `DeletedBy` char(36) COLLATE ascii_general_ci NULL;

ALTER TABLE `Documents` MODIFY COLUMN `DeletedBy` char(36) COLLATE ascii_general_ci NULL;

ALTER TABLE `DocumentRolePermissions` MODIFY COLUMN `DeletedBy` char(36) COLLATE ascii_general_ci NULL;

ALTER TABLE `DocumentAuditTrails` MODIFY COLUMN `DeletedBy` char(36) COLLATE ascii_general_ci NULL;

ALTER TABLE `Categories` MODIFY COLUMN `DeletedBy` char(36) COLLATE ascii_general_ci NULL;

CREATE TABLE `DocumentComments` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `DocumentId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Comment` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_DocumentComments` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_DocumentComments_Documents_DocumentId` FOREIGN KEY (`DocumentId`) REFERENCES `Documents` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_DocumentComments_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `DocumentMetaDatas` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `DocumentId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Metatag` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_DocumentMetaDatas` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_DocumentMetaDatas_Documents_DocumentId` FOREIGN KEY (`DocumentId`) REFERENCES `Documents` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `DocumentVersions` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `DocumentId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Url` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_DocumentVersions` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_DocumentVersions_Documents_DocumentId` FOREIGN KEY (`DocumentId`) REFERENCES `Documents` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_DocumentVersions_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE INDEX `IX_DocumentComments_CreatedBy` ON `DocumentComments` (`CreatedBy`);

CREATE INDEX `IX_DocumentComments_DocumentId` ON `DocumentComments` (`DocumentId`);

CREATE INDEX `IX_DocumentMetaDatas_DocumentId` ON `DocumentMetaDatas` (`DocumentId`);

CREATE INDEX `IX_DocumentVersions_CreatedBy` ON `DocumentVersions` (`CreatedBy`);

CREATE INDEX `IX_DocumentVersions_DocumentId` ON `DocumentVersions` (`DocumentId`);

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20220620111304_Version_V3', '7.0.3');

COMMIT;

