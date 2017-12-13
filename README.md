# Load Complex XML data to SQL Server

This generic SSIS script code loads any complex XML data into SQL Server Database. The table structure based on the XML structure is created dynamically and the data is loaded. There is an option of making this to work as Framework with Framework tables to store the File details and load the relationship between the tables in the XML File. The script loops through the XML files provided in the path and loads the data into the SQL Server database. All these values are configurable.

## How it works

Configure the variables with the required values and run the SSIS package. Refer to the variables section for the details on the variables.

## Setup & Run
Compile the objects from the Code\Script folder in the database in which files to be loaded. This is required only if Framework variable to be set to TRUE.
Open the solution in Visual Studio 2015 & run

##SSIS Variables

* XMLFilePath    - Path from which XML Files will be read.

* XMLFileSpec   - File specification like *.XML.

* XMLSQLServer  - SQL SERVER in which data to be loaded.

* XMLSQLDatabase - SQL Server Database  in which data to be loaded.
* XMLTablePrefix  - Based on the tables in the XML files , Tables will be created with this prefix.

* XMLFrameWork  - When chosen TRUE , Works with the framework table in which the file details will be stored and the relationship between the XML table also stored. To use this the objects from the script folder needs to be created in the database in which the data to be loaded. When chosen FALSE , the tables only will be created and loaded. No need to compile the objects from the script table.


## Framework Objects
* XMLFileMaster - This table stores the processed file name , path and processed date time. Generate a unique FileID for each files processed.

* XMLTableRelationship - This table stores the relationship between the XML tables with in a file.

* XMLErrorLog - The script task generates the INSERT statement internally. In case of error , this table will have the details of the error with the insert statement. This will be help full debugging.

* GenerateXMLFileID - This is a stored procedure used to generate the file Ids.

## Prerequisite
* Visual Studio 2015
* SSDT for 2015
* SQL Server 2012 & above. 
### Change the Target Version in the Visual Studio based on the need.

