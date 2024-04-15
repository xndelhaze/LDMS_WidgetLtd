
--06. Call Procedure to populate Employees table (REQ 2)

--This needs populating separately to the 

INSERT INTO LDMSTest.TBL_Departments ("DEPARTMENTS_ID", "DEPARTMENTS_NAME", "DEPARTMENTS_LOCATION")
    VALUES 
        (1,'Management','London');
INSERT INTO LDMSTest.TBL_Departments (Departments_ID, Departments_Name, Departments_Location)
    VALUES 
        (2,'Engineering','Cardiff');
INSERT INTO LDMSTest.TBL_Departments (Departments_ID, Departments_Name, Departments_Location)
    VALUES 
        (3,'Research '||'&'||' Development','Edinburgh');
INSERT INTO LDMSTest.TBL_Departments (Departments_ID, Departments_Name, Departments_Location)
    VALUES 
        (4,'Sales','Belfast');

/* Check Output to verify Department Inserts
      
SELECT * FROM LDMSTest.TBL_Departments;

--*/

--07. Call Procedure to populate Employees table (REQ 2)

BEGIN
    LDMSTest.pkg_EmployeeChanges.proc_EmployeeInsert(90001,'John Smith ','CEO ',NULL,TO_DATE('01/Jan/1995'),100000,1);
    LDMSTest.pkg_EmployeeChanges.proc_EmployeeInsert(90002,'Jimmy Willis ','Manager ',90001,TO_DATE('23/Sep/2003'),52500,4);
    LDMSTest.pkg_EmployeeChanges.proc_EmployeeInsert(90003,'Roxy Jones ','Salesperson ',90002,TO_DATE('11/Feb/2017'),35000,4);
    LDMSTest.pkg_EmployeeChanges.proc_EmployeeInsert(90004,'Selwyn Field ','Salesperson ',90003,TO_DATE('20/May/2015'),32000,4);
    LDMSTest.pkg_EmployeeChanges.proc_EmployeeInsert(90005,'David Hallett ','Engineer ',90006,TO_DATE('17/Apr/2018'),40000,2);
    LDMSTest.pkg_EmployeeChanges.proc_EmployeeInsert(90006,'Sarah Phelps ','Manager ',90001,TO_DATE('21/Mar/2015'),45000,2);
    LDMSTest.pkg_EmployeeChanges.proc_EmployeeInsert(90007,'Louise Harper ','Engineer ',90006,TO_DATE('01/Jan/2013'),47000,2);
    LDMSTest.pkg_EmployeeChanges.proc_EmployeeInsert(90008,'Tina Hart ','Engineer ',90009,TO_DATE('28/July/2014'),45000,3);
    LDMSTest.pkg_EmployeeChanges.proc_EmployeeInsert(90009,'Gus Jones ','Manager ',90001,TO_DATE('15/May/2018'),50000,3);
    LDMSTest.pkg_EmployeeChanges.proc_EmployeeInsert(90010,'Mildred Hall ','Secretary ',90001,TO_DATE('12/Oct/1996'),35000,1);

END;

/* Check Output to verify Employee Inserts
SELECT  * FROM LDMSTest.TBL_Employees;

--*/

/*

--Rollback

DELETE FROM LDMSTest.TBL_Departments;
DELETE FROM LDMSTest.TBL_Employees;

--*/