CREATE VIEW [Users logged today] AS
SELECT Username
FROM [dbo].[Users] WHERE LoginTime = '2015/07/01'
