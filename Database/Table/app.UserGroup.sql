SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [app].[UserGroup](
	[PK_UserGroup] [int] IDENTITY(1,1) NOT NULL,
	[FK_User] [int] NOT NULL,
	[FK_Group] [int] NOT NULL,
	[Allow] [bit] NOT NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[PK_UserGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [app].[UserGroup]  WITH CHECK ADD  CONSTRAINT [Constraint_FK_Group_UserGroup] FOREIGN KEY([FK_Group])
REFERENCES [app].[Group] ([PK_Group])
GO
ALTER TABLE [app].[UserGroup] CHECK CONSTRAINT [Constraint_FK_Group_UserGroup]
GO
ALTER TABLE [app].[UserGroup]  WITH CHECK ADD  CONSTRAINT [Constraint_FK_User_UserGroup] FOREIGN KEY([FK_User])
REFERENCES [app].[User] ([PK_User])
GO
ALTER TABLE [app].[UserGroup] CHECK CONSTRAINT [Constraint_FK_User_UserGroup]
GO