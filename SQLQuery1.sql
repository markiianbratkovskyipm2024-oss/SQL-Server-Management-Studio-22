-- 1. Створення послідовностей (Sequences) для сурогатних ключів
CREATE SEQUENCE [Bratkovskiy].Seq_GroupID START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE [Bratkovskiy].Seq_RoomID START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE [Bratkovskiy].Seq_StudentID START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE [Bratkovskiy].Seq_HobbyID START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE [Bratkovskiy].Seq_TeacherID START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE [Bratkovskiy].Seq_SubjectID START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE [Bratkovskiy].Seq_BookID START WITH 1 INCREMENT BY 1;
GO

-- 2. Створення таблиць

-- Таблиця: Кімнати в гуртожитку
CREATE TABLE [Bratkovskiy].Room (
    RoomID INT DEFAULT NEXT VALUE FOR [Bratkovskiy].Seq_RoomID PRIMARY KEY,
    RoomNumber NVARCHAR(10) NOT NULL UNIQUE,
    Capacity INT NOT NULL CHECK (Capacity > 0 AND Capacity <= 3) 
);

-- Таблиця: Групи
CREATE TABLE [Bratkovskiy].StudentGroup (
    GroupID INT DEFAULT NEXT VALUE FOR [Bratkovskiy].Seq_GroupID PRIMARY KEY,
    GroupName NVARCHAR(20) NOT NULL UNIQUE,
    LeaderID INT NULL 
);

-- Таблиця: Студенти (Головна таблиця)
CREATE TABLE [Bratkovskiy].Student (
    StudentID INT DEFAULT NEXT VALUE FOR [Bratkovskiy].Seq_StudentID PRIMARY KEY,
    LastName NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    MiddleName NVARCHAR(50) NULL,
    TicketNumber NVARCHAR(20) NOT NULL UNIQUE,
    BirthYear INT NOT NULL CHECK (BirthYear >= 1900 AND BirthYear <= YEAR(GETDATE())),
    BirthPlace NVARCHAR(100) NULL,
    Address NVARCHAR(200) NULL,
    Gender NCHAR(1) NOT NULL CHECK (Gender IN ('M', 'F')),
    MaritalStatus NVARCHAR(20) DEFAULT 'Single',
    Scholarship DECIMAL(8, 2) DEFAULT 0.00 CHECK (Scholarship >= 0),
    Rating DECIMAL(5, 2) DEFAULT 0.00 CHECK (Rating >= 0 AND Rating <= 100),
    GroupID INT NOT NULL,
    RoomID INT NULL,
    CONSTRAINT FK_Student_Group FOREIGN KEY (GroupID) REFERENCES [Bratkovskiy].StudentGroup(GroupID),
    CONSTRAINT FK_Student_Room FOREIGN KEY (RoomID) REFERENCES [Bratkovskiy].Room(RoomID)
);

-- Додаємо зв'язок для старости групи
ALTER TABLE [Bratkovskiy].StudentGroup
ADD CONSTRAINT FK_Group_Leader FOREIGN KEY (LeaderID) REFERENCES [Bratkovskiy].Student(StudentID);

-- Таблиця: Хобі та стикувальна таблиця
CREATE TABLE [Bratkovskiy].Hobby (
    HobbyID INT DEFAULT NEXT VALUE FOR [Bratkovskiy].Seq_HobbyID PRIMARY KEY,
    HobbyName NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE [Bratkovskiy].StudentHobby (
    StudentID INT NOT NULL,
    HobbyID INT NOT NULL,
    CONSTRAINT PK_StudentHobby PRIMARY KEY (StudentID, HobbyID),
    CONSTRAINT FK_StudentHobby_Student FOREIGN KEY (StudentID) REFERENCES [Bratkovskiy].Student(StudentID) ON DELETE CASCADE,
    CONSTRAINT FK_StudentHobby_Hobby FOREIGN KEY (HobbyID) REFERENCES [Bratkovskiy].Hobby(HobbyID) ON DELETE CASCADE
);

-- Таблиця: Книги та Видача книжок
CREATE TABLE [Bratkovskiy].Book (
    BookID INT DEFAULT NEXT VALUE FOR [Bratkovskiy].Seq_BookID PRIMARY KEY,
    BookNumber NVARCHAR(50) NOT NULL UNIQUE,
    Author NVARCHAR(100) NOT NULL,
    Title NVARCHAR(150) NOT NULL,
    Genre NVARCHAR(50) NULL,
    Price DECIMAL(8, 2) NOT NULL CHECK (Price > 0)
);

CREATE TABLE [Bratkovskiy].LibraryLoan (
    StudentID INT NOT NULL,
    BookID INT NOT NULL UNIQUE, 
    LoanDate DATE NOT NULL DEFAULT GETDATE(),
    ReturnDate DATE NULL,
    CONSTRAINT PK_LibraryLoan PRIMARY KEY (StudentID, BookID),
    CONSTRAINT FK_Loan_Student FOREIGN KEY (StudentID) REFERENCES [Bratkovskiy].Student(StudentID),
    CONSTRAINT FK_Loan_Book FOREIGN KEY (BookID) REFERENCES [Bratkovskiy].Book(BookID),
    CONSTRAINT CHK_Dates CHECK (ReturnDate IS NULL OR ReturnDate >= LoanDate)
);

-- Таблиці для навчального процесу
CREATE TABLE [Bratkovskiy].Teacher (
    TeacherID INT DEFAULT NEXT VALUE FOR [Bratkovskiy].Seq_TeacherID PRIMARY KEY,
    LastName NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    MiddleName NVARCHAR(50) NULL
);

CREATE TABLE [Bratkovskiy].Subject (
    SubjectID INT DEFAULT NEXT VALUE FOR [Bratkovskiy].Seq_SubjectID PRIMARY KEY,
    SubjectName NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE [Bratkovskiy].Exam (
    StudentID INT NOT NULL,
    SubjectID INT NOT NULL,
    TeacherID INT NOT NULL,
    Score INT NOT NULL CHECK (Score >= 0 AND Score <= 100),
    Grade NVARCHAR(20) NOT NULL,
    ExamDate DATE NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_Exam PRIMARY KEY (StudentID, SubjectID, TeacherID),
    CONSTRAINT FK_Exam_Student FOREIGN KEY (StudentID) REFERENCES [Bratkovskiy].Student(StudentID),
    CONSTRAINT FK_Exam_Subject FOREIGN KEY (SubjectID) REFERENCES [Bratkovskiy].Subject(SubjectID),
    CONSTRAINT FK_Exam_Teacher FOREIGN KEY (TeacherID) REFERENCES [Bratkovskiy].Teacher(TeacherID)
);