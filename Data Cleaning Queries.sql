/*

Cleaning Data in SQL Queries
SQLite

*/


Select *
From Housing

--------------------------------------------------------------------------------------------------------------------------

-- Standardize Date Format

SELECT 
    saleDate,
    SUBSTR(saleDate, -4) || '-' || 
    CASE 
        WHEN saleDate LIKE 'January%' THEN '01'
        WHEN saleDate LIKE 'February%' THEN '02'
        WHEN saleDate LIKE 'March%' THEN '03'
        WHEN saleDate LIKE 'April%' THEN '04'
        WHEN saleDate LIKE 'May%' THEN '05'
        WHEN saleDate LIKE 'June%' THEN '06'
        WHEN saleDate LIKE 'July%' THEN '07'
        WHEN saleDate LIKE 'August%' THEN '08'
        WHEN saleDate LIKE 'September%' THEN '09'
        WHEN saleDate LIKE 'October%' THEN '10'
        WHEN saleDate LIKE 'November%' THEN '11'
        WHEN saleDate LIKE 'December%' THEN '12'
    END || '-' ||
    LTRIM(RTRIM(SUBSTR(saleDate, INSTR(saleDate, ' ') + 1, 
                   INSTR(saleDate, ',') - INSTR(saleDate, ' ') - 1)))
AS SaleDateConverted
FROM Housing;


Update Housing
SET SaleDate = 
 SUBSTR(saleDate, -4) || '-' || 
    CASE 
        WHEN saleDate LIKE 'January%' THEN '01'
        WHEN saleDate LIKE 'February%' THEN '02'
        WHEN saleDate LIKE 'March%' THEN '03'
        WHEN saleDate LIKE 'April%' THEN '04'
        WHEN saleDate LIKE 'May%' THEN '05'
        WHEN saleDate LIKE 'June%' THEN '06'
        WHEN saleDate LIKE 'July%' THEN '07'
        WHEN saleDate LIKE 'August%' THEN '08'
        WHEN saleDate LIKE 'September%' THEN '09'
        WHEN saleDate LIKE 'October%' THEN '10'
        WHEN saleDate LIKE 'November%' THEN '11'
        WHEN saleDate LIKE 'December%' THEN '12'
    END || '-' ||
    LTRIM(RTRIM(SUBSTR(saleDate, INSTR(saleDate, ' ') + 1, 
                   INSTR(saleDate, ',') - INSTR(saleDate, ' ') - 1)))

-- If it doesn't Update properly

ALTER TABLE Housing
Add SaleDateConverted Date;

Update Housing
SET SaleDateConverted = 
	SUBSTR(saleDate, -4) || '-' || 
    CASE 
        WHEN saleDate LIKE 'January%' THEN '01'
        WHEN saleDate LIKE 'February%' THEN '02'
        WHEN saleDate LIKE 'March%' THEN '03'
        WHEN saleDate LIKE 'April%' THEN '04'
        WHEN saleDate LIKE 'May%' THEN '05'
        WHEN saleDate LIKE 'June%' THEN '06'
        WHEN saleDate LIKE 'July%' THEN '07'
        WHEN saleDate LIKE 'August%' THEN '08'
        WHEN saleDate LIKE 'September%' THEN '09'
        WHEN saleDate LIKE 'October%' THEN '10'
        WHEN saleDate LIKE 'November%' THEN '11'
        WHEN saleDate LIKE 'December%' THEN '12'
    END || '-' ||
    LTRIM(RTRIM(SUBSTR(saleDate, INSTR(saleDate, ' ') + 1, 
                   INSTR(saleDate, ',') - INSTR(saleDate, ' ') - 1)))

--------------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data

Select PropertyAddress
From Housing
--Where PropertyAddress is null
order by ParcelID

-- to eliminate the null values, we need to do a self join 
-- and populate the data

SELECT 
    a.ParcelID, 
    a.PropertyAddress, 
    b.ParcelID, 
    b.PropertyAddress, 
    COALESCE(a.PropertyAddress, b.PropertyAddress)
FROM Housing AS a
JOIN Housing AS b
    ON a.ParcelID = b.ParcelID
    AND a."UniqueID" <> b."UniqueID"
WHERE a.PropertyAddress IS NULL;


Update a
SET PropertyAddress = COALESCE(a.PropertyAddress,b.PropertyAddress)
From Housing AS a
JOIN Housing AS b
	on a.ParcelID = b.ParcelID
	AND a."UniqueID" <> b."UniqueID"
Where a.PropertyAddress is null

--------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns 
-- the original data is all mixed, we will split it into (Address, City, State)


Select PropertyAddress
From PortfolioProject.dbo.NashvilleHousing
--Where PropertyAddress is null
--order by ParcelID

SELECT 
    SUBSTR(PropertyAddress, 1, INSTR(PropertyAddress, ',') - 1) AS Address
    , TRIM(SUBSTR(PropertyAddress, INSTR(PropertyAddress, ',') + 1)) AS City
FROM Housing;

-- ALter table
ALTER TABLE Housing
ADD PropertySplitAddress TEXT;

Update Housing
SET PropertySplitAddress = SUBSTR(PropertyAddress, 1, INSTR(PropertyAddress, ',') - 1 )


ALTER TABLE Housing
ADD PropertySplitCity TEXT;

Update Housing
SET PropertySplitCity = TRIM(SUBSTR(PropertyAddress, INSTR(PropertyAddress, ',') + 1))


-- check the results 
Select *
From Housing

---- same insue with this column
Select OwnerAddress
From Housing

SELECT 
    TRIM(SUBSTR(OwnerAddress, 1, 
                CASE WHEN INSTR(OwnerAddress, ',') > 0 
                     THEN INSTR(OwnerAddress, ',') - 1 
                     ELSE LENGTH(OwnerAddress) 
                END)) AS Address,
    TRIM(CASE WHEN INSTR(OwnerAddress, ',') > 0 
              THEN SUBSTR(OwnerAddress, 
                          INSTR(OwnerAddress, ',') + 1, 
                          CASE WHEN INSTR(SUBSTR(OwnerAddress, INSTR(OwnerAddress, ',') + 1), ',') > 0 
                               THEN INSTR(SUBSTR(OwnerAddress, INSTR(OwnerAddress, ',') + 1), ',') - 1 
                               ELSE LENGTH(OwnerAddress) 
                          END) 
              ELSE NULL 
         END) AS City,
    TRIM(CASE WHEN INSTR(OwnerAddress, ',') > 0 AND INSTR(SUBSTR(OwnerAddress, INSTR(OwnerAddress, ',') + 1), ',') > 0 
              THEN SUBSTR(OwnerAddress, INSTR(OwnerAddress, ',') + INSTR(SUBSTR(OwnerAddress, INSTR(OwnerAddress, ',') + 1), ',') + 1) 
              ELSE NULL 
         END) AS State
FROM Housing;


-- update into the table
ALTER TABLE Housing
ADD OwnerSplitAddress TEXT;

Update Housing
SET OwnerSplitAddress =  TRIM(SUBSTR(OwnerAddress, 1, 
                CASE WHEN INSTR(OwnerAddress, ',') > 0 
                     THEN INSTR(OwnerAddress, ',') - 1 
                     ELSE LENGTH(OwnerAddress) 
                END))

ALTER TABLE Housing
ADD OwnerSplitCity TEXT;

Update Housing
SET OwnerSplitCity =     TRIM(CASE WHEN INSTR(OwnerAddress, ',') > 0 
              THEN SUBSTR(OwnerAddress, 
                          INSTR(OwnerAddress, ',') + 1, 
                          CASE WHEN INSTR(SUBSTR(OwnerAddress, INSTR(OwnerAddress, ',') + 1), ',') > 0 
                               THEN INSTR(SUBSTR(OwnerAddress, INSTR(OwnerAddress, ',') + 1), ',') - 1 
                               ELSE LENGTH(OwnerAddress) 
                          END) 
              ELSE NULL 
         END) 

ALTER TABLE Housing
ADD OwnerSplitState TEXT;

Update Housing
SET OwnerSplitState =     
	TRIM(CASE WHEN INSTR(OwnerAddress, ',') > 0 AND INSTR(SUBSTR(OwnerAddress, INSTR(OwnerAddress, ',') + 1), ',') > 0 
              THEN SUBSTR(OwnerAddress, INSTR(OwnerAddress, ',') + INSTR(SUBSTR(OwnerAddress, INSTR(OwnerAddress, ',') + 1), ',') + 1) 
              ELSE NULL 
         END) 


-- checking the result 
Select *
From Housing

--------------------------------------------------------------------------------------------------------------------------


-- Change Y and N to Yes and No in "Sold as Vacant" field


Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From Housing
Group by SoldAsVacant
order by 2

-- Y	52
-- N	399
-- Yes	4623
-- No	51403

-- change all Y to Yes, N to No

Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
From Housing

-- update the table
Update Housing
SET SoldAsVacant = 
	CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END


-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates

WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					)  as row_num

From Housing
)
--order by ParcelID

Select *
From RowNumCTE
Where row_num > 1
Order by PropertyAddress


---------------------------------------------------------------------------------------------------------

-- Delete Unused Columns

Select *
From Housing


ALTER TABLE Housing
DROP COLUMN 
OwnerAddress
, TaxDistrict
, PropertyAddress
, SaleDate
