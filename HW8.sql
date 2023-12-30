USE MyFunkDB;

SELECT * FROM Employees;

DELIMITER |
CREATE PROCEDURE AddinggTransact()
BEGIN
START TRANSACTION;

INSERT Employees
(name, telephone)
VALUES
('Victor Johnson', '+1123459'),
('Jack Jackson', '+1123467');

IF EXISTS (SELECT * FROM Employees WHERE name = 'Jack Jackson')
			THEN
				ROLLBACK; 
				
			END IF;	
			
		COMMIT; 
END; |

CALL AddinggTransact; 

DELIMITER |
CREATE TRIGGER delete_emp
BEFORE DELETE ON Employees
FOR EACH ROW 
  BEGIN
    DELETE FROM personalInfo WHERE empID = OLD.EmployeeID; 
    DELETE FROM staff WHERE empID = OLD.EmployeeID;
 END;
    |
    
    select * FROM Employees; |
    select * FROM personalInfo; |
    select * FROM staff;
    
    DELETE FROM Employees WHERE EmployeeID = 1; |
    
    select * FROM Employees; |
    select * FROM personalInfo; |
    select * FROM staff; |
