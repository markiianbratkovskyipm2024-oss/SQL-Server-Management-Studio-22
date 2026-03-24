-- DELETE для видалення вибраних записів
DELETE FROM [Bratkovskiy].Hobby
WHERE HobbyID NOT IN (SELECT HobbyID FROM [Bratkovskiy].StudentHobby);

-- DELETE для видалення всіх даних з таблиці
DELETE FROM [Bratkovskiy].TopStudentsArchive;
-- (Після цього можна виконати DROP TABLE [Bratkovskiy].TopStudentsArchive)