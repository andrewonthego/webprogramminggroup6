USE [Group6_db]
GO
/****** Object:  Table [dbo].[tblComments]    Script Date: 10/28/2016 11:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblComments](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[comment] [varchar](max) NOT NULL,
	[project_id] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[Parent_comment_id] [int] NULL,
	[user_id] [int] NOT NULL,
	[creation_date] [datetime] NOT NULL,
 CONSTRAINT [PK_tblComments] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMoney]    Script Date: 10/28/2016 11:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMoney](
	[TransactionType] [int] NULL CONSTRAINT [DF_tblMoney_TransactionType]  DEFAULT ((0)),
	[project_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[amount] [money] NOT NULL,
 CONSTRAINT [PK_tblMoney] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProject]    Script Date: 10/28/2016 11:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProject](
	[project_id] [int] IDENTITY(1,1) NOT NULL,
	[specs] [varchar](max) NULL,
	[project_title] [varchar](200) NOT NULL,
	[IsPublished] [int] NULL,
	[description] [varchar](max) NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[Views] [nchar](10) NULL,
	[AmountGoal] [money] NULL,
	[last_updated] [datetime] NOT NULL,
 CONSTRAINT [PK_tblProject] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProjectUser]    Script Date: 10/28/2016 11:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectUser](
	[project_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblProjectUser] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/28/2016 11:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblComments] ON 

INSERT [dbo].[tblComments] ([comment_id], [comment], [project_id], [UpdatedOn], [Parent_comment_id], [user_id], [creation_date]) VALUES (1, N'Wow, this project is cool!', 1, CAST(N'2016-10-29 04:23:09.893' AS DateTime), NULL, 1, CAST(N'2016-10-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblComments] ([comment_id], [comment], [project_id], [UpdatedOn], [Parent_comment_id], [user_id], [creation_date]) VALUES (2, N'Yeah you are right it really is a cool project!', 1, CAST(N'2016-10-29 04:27:22.960' AS DateTime), 1, 2, CAST(N'2016-10-29 04:27:22.960' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblComments] OFF
INSERT [dbo].[tblMoney] ([TransactionType], [project_id], [user_id], [amount]) VALUES (2, 1, 2, 875.0000)
INSERT [dbo].[tblMoney] ([TransactionType], [project_id], [user_id], [amount]) VALUES (1, 2, 3, 10.0000)
SET IDENTITY_INSERT [dbo].[tblProject] ON 

INSERT [dbo].[tblProject] ([project_id], [specs], [project_title], [IsPublished], [description], [creation_date], [end_date], [Views], [AmountGoal], [last_updated]) VALUES (1, NULL, N'A really cool project', 1, N'Thsi project is super cool', CAST(N'2016-10-28 00:00:00.000' AS DateTime), CAST(N'2016-10-28 00:00:00.000' AS DateTime), N'373       ', 10000.0000, CAST(N'2016-10-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblProject] ([project_id], [specs], [project_title], [IsPublished], [description], [creation_date], [end_date], [Views], [AmountGoal], [last_updated]) VALUES (2, N'Has 100 hours of battery life. 24K resolution!!!', N'Another cool project', 0, N'This project is also cool', CAST(N'2016-10-28 00:00:00.000' AS DateTime), CAST(N'2016-10-28 00:00:00.000' AS DateTime), N'1000      ', 15000.0000, CAST(N'2016-10-28 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblProject] OFF
SET IDENTITY_INSERT [dbo].[tblProjectUser] ON 

INSERT [dbo].[tblProjectUser] ([project_id], [user_id], [id]) VALUES (1, 2, 1)
INSERT [dbo].[tblProjectUser] ([project_id], [user_id], [id]) VALUES (2, 3, 2)
INSERT [dbo].[tblProjectUser] ([project_id], [user_id], [id]) VALUES (2, 2, 3)
SET IDENTITY_INSERT [dbo].[tblProjectUser] OFF
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([user_id], [username], [password], [first_name], [last_name], [creation_date], [last_updated]) VALUES (1, N'ianmoen', N'password123', N'Ian', N'Moen', CAST(N'2016-10-28 00:00:00.000' AS DateTime), CAST(N'2016-10-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblUsers] ([user_id], [username], [password], [first_name], [last_name], [creation_date], [last_updated]) VALUES (2, N'patrickburrus', N'password123', N'Patrick', N'Burrus', CAST(N'2016-10-28 00:00:00.000' AS DateTime), CAST(N'2016-10-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblUsers] ([user_id], [username], [password], [first_name], [last_name], [creation_date], [last_updated]) VALUES (3, N'benjamingelinas', N'password123', N'Benjamin', N'Gelinas', CAST(N'2016-10-28 00:00:00.000' AS DateTime), CAST(N'2016-10-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblUsers] ([user_id], [username], [password], [first_name], [last_name], [creation_date], [last_updated]) VALUES (4, N'andrewanderson', N'password123', N'Andrew', N'Anderson', CAST(N'2016-10-28 00:00:00.000' AS DateTime), CAST(N'2016-10-28 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
ALTER TABLE [dbo].[tblComments]  WITH CHECK ADD  CONSTRAINT [FK_tblComments_tblProject] FOREIGN KEY([project_id])
REFERENCES [dbo].[tblProject] ([project_id])
GO
ALTER TABLE [dbo].[tblComments] CHECK CONSTRAINT [FK_tblComments_tblProject]
GO
ALTER TABLE [dbo].[tblComments]  WITH CHECK ADD  CONSTRAINT [FK_tblComments_tblUsers] FOREIGN KEY([user_id])
REFERENCES [dbo].[tblUsers] ([user_id])
GO
ALTER TABLE [dbo].[tblComments] CHECK CONSTRAINT [FK_tblComments_tblUsers]
GO
ALTER TABLE [dbo].[tblMoney]  WITH CHECK ADD  CONSTRAINT [FK_tblMoney_tblProject] FOREIGN KEY([project_id])
REFERENCES [dbo].[tblProject] ([project_id])
GO
ALTER TABLE [dbo].[tblMoney] CHECK CONSTRAINT [FK_tblMoney_tblProject]
GO
ALTER TABLE [dbo].[tblMoney]  WITH CHECK ADD  CONSTRAINT [FK_tblMoney_tblUsers] FOREIGN KEY([user_id])
REFERENCES [dbo].[tblUsers] ([user_id])
GO
ALTER TABLE [dbo].[tblMoney] CHECK CONSTRAINT [FK_tblMoney_tblUsers]
GO
ALTER TABLE [dbo].[tblProjectUser]  WITH CHECK ADD  CONSTRAINT [FK_tblProjectUser_tblProject] FOREIGN KEY([project_id])
REFERENCES [dbo].[tblProject] ([project_id])
GO
ALTER TABLE [dbo].[tblProjectUser] CHECK CONSTRAINT [FK_tblProjectUser_tblProject]
GO
ALTER TABLE [dbo].[tblProjectUser]  WITH CHECK ADD  CONSTRAINT [FK_tblProjectUser_tblUsers] FOREIGN KEY([user_id])
REFERENCES [dbo].[tblUsers] ([user_id])
GO
ALTER TABLE [dbo].[tblProjectUser] CHECK CONSTRAINT [FK_tblProjectUser_tblUsers]
GO
