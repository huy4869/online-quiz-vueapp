GO
create database OnlineQuiz
GO
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

create table Options (
	ID int not null,
	questionID int,
	content nvarchar(max) not null,
	isRight bit not null, 
	foreign key (questionID) references Questions (ID),
)

create table Result (
	ID int identity(1,1) not null,
	userID int,
	finishTime datetime default getDate(),
	score float not null,
	foreign key (userID) references Users(id),
	primary key (ID)
)

INSERT [dbo].[Users] ([userName], [password], [Role], [Email]) VALUES (N'Student', N'1', 0, N'student@gmail.com')
INSERT [dbo].[Users] ([userName], [password], [Role], [Email]) VALUES (N'Teacher', N'1', 1, N'teacher@gmail.com')

INSERT [dbo].[Questions] ([questionContent], [createdAt]) VALUES ( N'What is the answer?', CAST(N'2020-04-09' AS Date))
INSERT [dbo].[Questions] ( [questionContent], [createdAt]) VALUES ( N'Why this question?',CAST(N'2020-04-11' AS Date))
INSERT [dbo].[Questions] ( [questionContent], [createdAt]) VALUES ( N'Lorem ipsum ahihihhihihhhhhihihiihhhi', CAST(N'2020-04-11' AS Date))

INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (0, 3,'ga', N'True')
INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (1, 3,'vit', N'False')
INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (2, 3,'ngan', N'False')
INSERT [dbo].[Options] (ID, questionID, content, isRight) VALUES (3, 3,'ngong', N'False')


select * from Questions order by id desc
select * from Options order by questionID desc
select * from Users
select * from Result

delete from Options where questionID = 17
