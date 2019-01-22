-- SQL Scripts used in this project
local scripts = {
   
['CREATE_PATIENT_TABLE'] = "CREATE TABLE IF NOT EXISTS Patient (Id TEXT(255) NOT NULL, LastName TEXT(255),GivenName TEXT(255), Race TEXT(255), PhoneHome TEXT(255),PhoneBusiness TEXT(255), Religion TEXT(255),MaritalStatus TEXT(255),Ssn TEXT(255),LicenseNumber TEXT(255),PRIMARY KEY (Id));]]",
['DROP_PATIENT_TABLE']  = "DROP TABLE Patient;",
['GET_ALL_TABLES']  = "SELECT name FROM sqlite_master WHERE type='table';",
['GET_PATIENTS']  = "SELECT * FROM Patient;"
}

return scripts