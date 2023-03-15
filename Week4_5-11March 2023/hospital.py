import sqlite3

#connecting to sqlite3 database
conn = sqlite3.connect('hospital.db')  

print ("Opened database successfully");


#Creating a cursor object
cursor = conn.cursor ()                  

#Creating the tables
'''
CREATE TABLE IF NOT EXISTS doctor (
   DoctorId VARCHAR(5) NOT NULL PRIMARY KEY,
   DoctorName VARCHAR(20) NOT NULL,
   Department VARCHAR(20) NOT NULL
); 


CREATE TABLE IF NOT EXISTS patient(
   PId VARCHAR(5) PRIMARY KEY,
   Name VARCHAR(20) NOT NULL,
   Age INT NOT NULL,
   Weight INT NOT NULL,
   Gender CHAR(1) NOT NULL,
   PhoneNo INT NOT NULL,
   Ailment VARCHAR(20) NOT NULL,
   DoctorId VARCHAR(5) 
   FOREIGN KEY (DoctorId) REFERENCES doctor(DoctorId)
);

CREATE TABLE IF NOT EXISTS lab(
   LabNo VARCHAR(5) PRIMARY KEY,
   PId VARCHAR(5) NOT NULL,
   DoctorId VARCHAR() NOT NULL,
   Weight INT NOT NULL,
   Date DATETIME NOT NULL,
   Category VARCHAR(20) NOT NULL,
   Patient_Type VARCHAR(20) NOT NULL,
   Amount INT NOT NULL,
   FOREIGN KEY (PId) REFERENCES patient (PId),
   FOREIGN KEY (DoctorId) REFERENCES doctor (DoctorId)
);


CREATE TABLE IF NOT EXISTS Inpatient(
   PId VARCHAR(5) NOT NULL,
   Room-No VARCHAR(50) NOT NULL,
   Admission_Date DATETIME NOT NULL,
   Discharge_Date DATETIME,
   LabNo VARCHAR(5) NOT NULL,
   FOREIGN KEY (PId) REFERENCES patient (PId),
   FOREIGN KEY (LabNo) REFERENCES lab (LabNo)
);


CREATE TABLE IF NOT EXISTS Outpatient(
   PId VARCHAR(5) NOT NULL,
   Date DATETIME NOT NULL,
   LabNo VARCHAR(5) NOT NULL,
   FOREIGN KEY (PId) REFERENCES patient (PId),
   FOREIGN KEY (LabNo) REFERENCES lab (LabNo)
);


'''
sql = '''
CREATE TABLE IF NOT EXISTS lab(
   LabNo VARCHAR(5) PRIMARY KEY,
   PId VARCHAR(5) NOT NULL,
   DoctorId VARCHAR() NOT NULL,
   Weight INT NOT NULL,
   Date DATETIME NOT NULL,
   Category VARCHAR(20) NOT NULL,
   Patient_Type VARCHAR(20) NOT NULL,
   Amount INT NOT NULL,
   FOREIGN KEY (PId) REFERENCES patient (PId),
   FOREIGN KEY (DoctorId) REFERENCES doctor (DoctorId)
);
'''
cursor.execute(sql)
print('Table created successfully')


conn.commit() #Commit changes to the database
conn.close()  #close the connection