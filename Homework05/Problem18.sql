ALTER TABLE Users
ADD GroupId,
FOREIGN KEY(GroupId) REFERENCES Groups(Id)