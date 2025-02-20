
--Create the Patients table to store processed data.

CREATE TABLE Patients (
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100),
    DOB DATE,
    Gender NVARCHAR(10),
    Contact NVARCHAR(20),
    Address NVARCHAR(255),
    Load_Date DATETIME DEFAULT GETDATE()
);

--Create the ETL_Log table to track file processing.

CREATE TABLE ETL_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    Previous_Row_Count INT,
    Current_Row_Count INT,
    Total_Rows_Loaded INT,
    FileName NVARCHAR(255),
    Load_Date DATETIME DEFAULT GETDATE()
);


--Check processed files in ETL_Log:
SELECT TOP (1000) [LogID]
      ,[Previous_Row_Count]
      ,[Current_Row_Count]
      ,[Total_Rows_Loaded]
      ,[FileName]
      ,[Load_Date]
  FROM [Hospital Project_2 DB].[dbo].[ETL_Log]


  --Check inserted data in Patients table:
  SELECT * FROM Patients ORDER BY Load_Date DESC;
