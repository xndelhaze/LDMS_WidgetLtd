# LDMS_WidgetLtd
Scripts and Report for LDMS Coding Challenge
--------------------------------------------
Author: Xavier-Noel Delhaze
Description: .SQL and xml files containing object creation, data population and reports for the LDMS Oracle Coding Challenge.  The files are numbered in order of loading, however some contain code that has to be run in separate batches. 
Each .sql file has some commented headers, corresponding rollbacks and additional comments where relevant.

------------------

Build Instructions

------------------

Step 01: 
  Login to an Oracle Server as sys 

Step 02: 
  Open 01.LDMSTest_Create_User.sql and run the code to create the LBMSTest user/schema, labeled 
  [--01. USER Required to identify schema/tables] in the code

Step 03: 
  Open a new connection to the server with credentials username: LBMSTest; password LBMSTest;

Step 04: 
  Open 02.LDMSTest_Create_Tables.sql, it contains 2 table creation scripts, with the headers: 
  [--02. Create Departments Table - 3 columns (REQ 1)], and 
  [--03. Create Employees Table - 7 columns (REQ 1)]. 
  
  Run them individually using the LBMSTest connection

Step 05:
  Open 03.LDMSTest_Create_Package.sql, which contains a specification and body for the package containing stored procedures and    functions. These are labeled 
  [--04. Create Package Specification to include 3 procedures & a function(REQ 3,4,5,6)] and 
  [--05. Create Package Body to include 3 procedures & a function (REQ 3,4,5,6)]. 
  
  They need to be run separately and in sequence using the LBMSTest connection

Step 06
  Open 04.LDMSTest_Populate_Tables.sql, which contains two data population batches, labeled 
  [--06. Call Procedure to populate Employees table (REQ 2)], and
  [--07. Call Procedure to populate Employees table (REQ 2)]

  They need to be run separately and in sequence using the LBMSTest connection

Step 07
  Under the Reports browser in SQL Developer, right click User-Defined Reports, and select Open Report
  Open LDMSTest_Departments_ReportExport.xml
  This will add the LDMSTest_Departments Report, which contains two linked child reports showing either all employees for a given department, or the total Employee Salary for a Department. 
  This can be exported to HTML if required. 
