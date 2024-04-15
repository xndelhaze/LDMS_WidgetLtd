    
--04. Create Package Spec to include 4 procedures (REQ 3,4,5,6)
   
CREATE OR REPLACE PACKAGE LDMSTest.pkg_EmployeeChanges AS 

    
    PROCEDURE proc_EmployeeInsert 
        ( 
            p_Employees_ID IN LDMSTest.TBL_Employees.Employees_ID%TYPE,
            p_Employees_Name IN LDMSTest.TBL_Employees.Employees_Name%TYPE,
            p_Employees_Job_Title IN LDMSTest.TBL_Employees.Employees_Job_Title%TYPE,
            p_Employees_Manager_ID IN LDMSTest.TBL_Employees.Employees_Manager_ID%TYPE,
            p_Employees_Date_Hired IN LDMSTest.TBL_Employees.Employees_Date_Hired%TYPE,
            p_Employees_Salary IN LDMSTest.TBL_Employees.Employees_Salary%TYPE,
            p_Employees_Department_ID IN LDMSTest.TBL_Employees.Employees_Department_ID%TYPE
        );
    
    PROCEDURE proc_EmployeeSalaryChange
        (
            p_Employees_ID IN LDMSTest.TBL_Employees.Employees_ID%TYPE,
            p_Percentage IN NUMBER 
        );
        
    PROCEDURE proc_EmployeeDepartmentChange(
        p_Employees_ID IN LDMSTest.TBL_Employees.Employees_ID%TYPE,
        p_Employees_Department_ID IN NUMBER 
        );  
    FUNCTION fn_EmployeeReturnSalary
        (
        p_Employees_ID IN LDMSTest.TBL_Employees.Employees_ID%TYPE
        ) RETURN LDMSTest.TBL_Employees.Employees_Salary%TYPE;

END pkg_EmployeeChanges; 


 --05. Create Package to include 3 procedures (REQ 3,4,5,6)
 
CREATE OR REPLACE PACKAGE BODY pkg_EmployeeChanges AS 
 
 
    /* proc_EmployeeInsert
    Author: XNDelhaze 
    Date: 20240415 
    Version:1.0
    Description: Adds a new employee entry 
    Parameters: 7 IN
    --*/
    PROCEDURE proc_EmployeeInsert 
        ( 
            p_Employees_ID IN LDMSTest.TBL_Employees.Employees_ID%TYPE,
            p_Employees_Name IN LDMSTest.TBL_Employees.Employees_Name%TYPE,
            p_Employees_Job_Title IN LDMSTest.TBL_Employees.Employees_Job_Title%TYPE,
            p_Employees_Manager_ID IN LDMSTest.TBL_Employees.Employees_Manager_ID%TYPE,
            p_Employees_Date_Hired IN LDMSTest.TBL_Employees.Employees_Date_Hired%TYPE,
            p_Employees_Salary IN LDMSTest.TBL_Employees.Employees_Salary%TYPE,
            p_Employees_Department_ID IN LDMSTest.TBL_Employees.Employees_Department_ID%TYPE
        ) AS 
    BEGIN
        INSERT INTO TBL_Employees (
            Employees_ID,
            Employees_Name,
            Employees_Job_Title,
            Employees_Manager_ID,
            Employees_Date_Hired,
            Employees_Salary,
            Employees_Department_ID
            )
        VALUES (
            p_Employees_ID,
            p_Employees_Name,
            p_Employees_Job_Title,
            p_Employees_Manager_ID,
            p_Employees_Date_Hired,
            p_Employees_Salary,
            p_Employees_Department_ID
        );
    END proc_EmployeeInsert;


    /* proc_EmployeeSalaryChange
    Author: XNDelhaze 
    Date: 20240415 
    Version:1.0
    Description: Updates Employee Salary with a given percentage 
    Parameters: 2 IN
    --*/  
    PROCEDURE proc_EmployeeSalaryChange(
        p_Employees_ID IN LDMSTest.TBL_Employees.Employees_ID%TYPE,
        p_Percentage IN NUMBER)
    AS

    BEGIN
        UPDATE 
            LDMSTest.TBL_Employees 
        SET 
            Employees_Salary = Employees_Salary + (Employees_Salary * p_Percentage)
        WHERE
            Employees_ID = p_Employees_ID;
    END proc_EmployeeSalaryChange;
    /* proc_EmployeeDepartmentChange
    Author: XNDelhaze 
    Date: 20240415 
    Version:1.0
    Description: Updates Employee Department 
    Parameters: 2 IN
    --*/    
    PROCEDURE proc_EmployeeDepartmentChange(
        p_Employees_ID IN LDMSTest.TBL_Employees.Employees_ID%TYPE,
        p_Employees_Department_ID IN NUMBER )  
    AS

    BEGIN
         UPDATE 
            LDMSTest.TBL_Employees 
        SET 
            Employees_Department_ID = p_Employees_Department_ID
        WHERE
            Employees_ID = p_Employees_ID;
    END proc_EmployeeDepartmentChange;
    /* fn_EmployeeReturnSalary
    Author: XNDelhaze 
    Date: 20240415 
    Version:1.0
    Description: Returns Employee Salary
    Parameters: 2 IN
    --*/        
    FUNCTION fn_EmployeeReturnSalary(
        p_Employees_ID IN LDMSTest.TBL_Employees.Employees_ID%TYPE)
        --p_Employees_Salary OUT LDMSTest.TBL_Employees.Employees_Salary%TYPE)
        RETURN LDMSTest.TBL_Employees.Employees_Salary%TYPE
    AS
        v_Employees_Salary LDMSTest.TBL_Employees.Employees_Salary%TYPE;

    BEGIN
        SELECT 
            LDMSTest.TBL_Employees.Employees_Salary 
        INTO v_Employees_Salary
        FROM  
            LDMSTest.TBL_Employees
        WHERE
            Employees_ID = p_Employees_ID;
        RETURN v_Employees_Salary;
    END fn_EmployeeReturnSalary;
           
        
 END pkg_EmployeeChanges;
        
        
/* Rollback


DROP PACKAGE LDMSTest.pkg_EmployeeChanges

--*/