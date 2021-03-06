/****** Object:  StoredProcedure [dbo].[GenerateXMLFileID]    Script Date: 3/3/2017 1:04:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GenerateXMLFileID]
@XMLFileNameWithPath NVARCHAR(MAX)
AS

	DECLARE @FileID INT
	Declare @FileName NVARCHAR(1000)
	Declare @FilePath NVARCHAR(MAX)


	BEGIN TRAN
	SELECT @FileName = reverse(left(reverse(@XMLFileNameWithPath), charindex('\',reverse(@XMLFileNameWithPath), 1) - 1)) 
	SELECT @FilePath = REPLACE(@XMLFileNameWithPath,'\' + @FileName,'')


	SELECT @FileID = ISNULL(MAX(XMLFileID),0) + 1
	  FROM [dbo].[XMLFileMaster] (TABLOCKX)

	INSERT INTO [dbo].[XMLFileMaster]
	(XMLFileID, XMLFileName, XMLFilePath, XMLProcessedDateTime)
	SELECT @FileID,@FileName,@FilePath,GETDATE()

	SELECT CAST(@FileID AS NVARCHAR(15)) AS FileID

	COMMIT
GO
