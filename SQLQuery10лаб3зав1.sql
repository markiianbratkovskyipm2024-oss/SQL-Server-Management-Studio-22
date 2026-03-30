USE StudentDB;
GO

CREATE OR ALTER TRIGGER [Bratkovskiy].trg_Hobby_SurrogateKey
ON [Bratkovskiy].Hobby
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Примусово беремо наступний номер з нашого Sequence
    INSERT INTO [Bratkovskiy].Hobby (HobbyID, HobbyName)
    SELECT 
        NEXT VALUE FOR [Bratkovskiy].Seq_HobbyID, 
        i.HobbyName
    FROM inserted i;
END;
GO