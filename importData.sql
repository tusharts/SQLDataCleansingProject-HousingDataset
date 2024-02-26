--Importing Data using OPENROWSET and BULK INSERT	
-- More advanced and looks cooler, but have to configure server appropriately to do correctly
--Wanted to provide this in case you wanted to try it


sp_configure 'show advanced options', 1;
RECONFIGURE;
GO
sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;
GO


USE PortfolioProject 

GO 

EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1 

GO 

EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1 

GO 


-- Using BULK INSERT

USE PortfolioProject;
GO
BULK INSERT nashvilleHousing FROM 'C:\Temp\SQL Server Management Studio\Nashville Housing Data for Data Cleaning Project.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '\n'
);
GO


-- Using OPENROWSET
USE PortfolioProject;
GO
SELECT * INTO nashvilleHousing
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
    'Location of the file\Nashville Housing Data for Data Cleaning Project.csv', [Sheet1$]);
GO

