use OnlineQuiz

create table Users (
	ID int identity(1,1) not null,
	userName nvarchar(50) not null,
	password nvarchar(50) not null,
	role int not null,
	email varchar(100) not null,
	primary key (ID)
)

create table Questions (
	ID int identity(1,1) not null,
	questionContent nvarchar(max) not null,
	createdAt datetime default getDate(),
	primary key (ID)
)
INSERT into Questions ( questionContent, createdAt) VALUES ( N'What is the answer?', CAST(N'2020-04-09' AS Date))
INSERT into Questions ( questionContent) VALUES ( N'What is the answer?')
select * from Questions


create table Options (
	ID int not null,
	questionID int,
	content nvarchar(max) not null,
	isRight bit not null, 
	foreign key (questionID) references Questions (ID),
	primary key (ID)
)

create table Result (
	ID int identity(1,1) not null,
	userID  int,
	finishTime datetime default getDate(),
	score float not null,
	foreign key (userID) references Users (ID),
	primary key (ID)
)

INSERT [dbo].[Users] ([userName], [password], [Role], [Email]) VALUES (N'Student', N'123456', 0, N'email@email.com')
INSERT [dbo].[Users] ([userName], [password], [Role], [Email]) VALUES (N'Teacher', N'123456', 1, N'email2@email.com')

INSERT [dbo].[Questions] (ID, [questionContent], [createdAt]) VALUES (1, N'What is the answer?', CAST(N'2020-04-09' AS Date))
INSERT [dbo].[Questions] (ID, [questionContent], [createdAt]) VALUES (2, N'Why this question?', CAST(N'2020-04-11' AS Date))
INSERT [dbo].[Questions] (ID, [questionContent], [createdAt]) VALUES (3, N'Lorem ipsum ahihihhihihhhhhihihiihhhi', CAST(N'2020-04-11' AS Date))

INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (1, 1, N'False')
INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (1, 2, N'Answer')
INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (1, 3, N'Wrong')
INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (2, 1, N'It is necessary.')
INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (2, 2, N'I dont know!')
INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (2, 3, N'This is not right.')
INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (2, 4, N'Hello world')
INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (3, 1, N'A')
INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (3, 2, N'B')
INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (3, 3, N'C is result')
INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (3, 4, N'D')