USE StudentDB; -- Вказуємо вашу базу даних (якщо вона називається інакше - змініть тут назву)
GO

CREATE PROCEDURE [Bratkovskiy].sp_CalculateScholarship
    @p_StudentID INT,
    @p_Month INT,
    @p_Year INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @v_AvgScore DECIMAL(5,2);
    DECLARE @v_Debt DECIMAL(8,2);
    DECLARE @v_NewScholarship DECIMAL(8,2);

    -- 1. Знаходимо середній бал за іспити у вказаному місяці
    SELECT @v_AvgScore = AVG(CAST(Score AS DECIMAL(5,2)))
    FROM [Bratkovskiy].Exam
    WHERE StudentID = @p_StudentID
      AND MONTH(ExamDate) = @p_Month
      AND YEAR(ExamDate) = @p_Year;

    -- Якщо іспитів не було, беремо поточний рейтинг з профілю
    IF @v_AvgScore IS NULL
        SELECT @v_AvgScore = Rating FROM [Bratkovskiy].Student WHERE StudentID = @p_StudentID;

    -- 2. Розраховуємо базову стипендію
    IF @v_AvgScore >= 90.0
        SET @v_NewScholarship = 2500.00;
    ELSE IF @v_AvgScore >= 75.0
        SET @v_NewScholarship = 2000.00;
    ELSE
        SET @v_NewScholarship = 0.00;

    -- 3. Перевірка на борги в бібліотеці
    SELECT @v_Debt = ISNULL(SUM(b.Price), 0)
    FROM [Bratkovskiy].LibraryLoan ll
    JOIN [Bratkovskiy].Book b ON ll.BookID = b.BookID
    WHERE ll.StudentID = @p_StudentID AND ll.ReturnDate IS NULL;

    IF @v_Debt > 100.00
        SET @v_NewScholarship = 0.00;

    -- 4. Записуємо результат у базову таблицю
    UPDATE [Bratkovskiy].Student
    SET Scholarship = @v_NewScholarship,
        Rating = ISNULL(@v_AvgScore, Rating)
    WHERE StudentID = @p_StudentID;
END;
GO