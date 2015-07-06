INSERT INTO WorkHours (Date, Task, Comments)
VALUES ('2014-06-30', 'Training SQL', 'very good examples'),
	   ('2013-07-26', 'Practicing SQL', 'So great')

UPDATE WorkHours
SET Task = 'More training'
WHERE Task = 'Training SQl'

DELETE FROM WorkHours
WHERE Task = 'More training'