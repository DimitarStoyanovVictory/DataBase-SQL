ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [MinLengthConstraint] CHECK (LEN([Password]) >= 5)