/*

Cleaning Data in SQL Queries

*/


Select *
From PortfolioProject.dbo.FIFA2022


--------------------------------------------------------------------------------------------------------------------------

-- Standardize Date Format


Select TransferDate, CONVERT(Date,TransferDate)
From PortfolioProject.dbo.FIFA2022


Update FIFA2022
SET TransferDate = CONVERT(Date,TransferDate)


--------------------------------------------------------------------------------------------------------------------------


-- Breaking out HeightWeight into Individual Columns 

Select HeightWeight
From PortfolioProject.dbo.FIFA2022

SELECT 
    PARSENAME(REPLACE(HeightWeight, ',', '.'), 2)
    PARSENAME(REPLACE(HeightWeight, ',', '.'), 1)
FROM dbo.FIFA2022;


ALTER TABLE FIFA2022
Add HeightSplitWeight Nvarchar(255);

Update FIFA2022
SET HeightSplitWeight = PARSENAME(REPLACE(HeightWeight, ',', '.') , 2)


ALTER TABLE FIFA2022
Add HeightSplitWeight Nvarchar(255);

Update FIFA2022
SET HeightSplitWeight = PARSENAME(REPLACE(HeightWeight, ',', '.') , 1)


--------------------------------------------------------------------------------------------------------------------------


-- Change Y and N to Yes and No in "Transfer as Free Player" field


Select TransferAsFreePlayer
, CASE When TransferAsFreePlayer = 'Y' THEN 'Yes'
	   When TransferAsFreePlayer = 'N' THEN 'No'
	   ELSE TransferAsFreePlayer
	   END
From PortfolioProject.dbo.FIFA2022;


Update FIFA2022
SET TransferAsFreePlayer = CASE When TransferAsFreePlayer = 'Y' THEN 'Yes'
	   When TransferAsFreePlayer = 'N' THEN 'No'
	   ELSE TransferAsFreePlayer
	   END


-----------------------------------------------------------------------------------------------------------------------------------------------------------


-- Remove Duplicates

SELECT DISTINCT *
FROM PortfolioProject.dbo.FIFA2022;


