Select *

From PortfolioProject.dbo.NashvilleHousing


------------------------------------------------------------------------------------------------------------

-- Standardize Date Formate


Select SaleDateConverted, CONVERT(Date,SaleDate)
From PortfolioProject.dbo.NashvilleHousing

Update PortfolioProject.dbo.NashvilleHousing
SET SaleDate = Convert(Date,SaleDate)


ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ADD SaleDateConverted Date;


Update PortfolioProject.dbo.NashvilleHousing
SET SaleDateConverted = Convert(Date,SaleDate)



------------------------------------------------------------------------------------------------------------


-- Populate Property Address data

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
From PortfolioProject.dbo.NashvilleHousing a
JOIN PortfolioProject.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]

Where a.PropertyAddress is null



UPDATE a

SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)

From PortfolioProject.dbo.NashvilleHousing a
JOIN PortfolioProject.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]

Where a.PropertyAddress is null



------------------------------------------------------------------------------------------------------------


-- Breaking out Address into Individual Columns (Address, City, State)

Select
SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress) - 1)  as Address,
SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress) + 1, LEN(PropertyAddress))  as Address
From PortfolioProject.dbo.NashvilleHousing


ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ADD PropertySplitAddress nvarchar(255);


Update PortfolioProject.dbo.NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress) - 1)



ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ADD PropertySplitCity nvarchar(255);


Update PortfolioProject.dbo.NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress) + 1, LEN(PropertyAddress))


-- PARSENAME Method

Select 
PARSENAME(REPLACE(Owneraddress,',','.'), 3),
PARSENAME(REPLACE(Owneraddress,',','.'), 2),
PARSENAME(REPLACE(Owneraddress,',','.'), 1)
From PortfolioProject.dbo.NashvilleHousing


ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ADD OwnerSplitAddress nvarchar(255);

Update PortfolioProject.dbo.NashvilleHousing
SET OwnerSplitAddress = PARSENAME(REPLACE(Owneraddress,',','.'), 3)



ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ADD OwnerSplitCity nvarchar(255);

Update PortfolioProject.dbo.NashvilleHousing
SET OwnerSplitCity = PARSENAME(REPLACE(Owneraddress,',','.'), 2)



ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ADD OwnerSplitState nvarchar(255);

Update PortfolioProject.dbo.NashvilleHousing
SET OwnerSplitState = PARSENAME(REPLACE(Owneraddress,',','.'), 1)

-- Change Y and N to Yes and No in "Sold as Vacant" field


Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From PortfolioProject.dbo.NashvilleHousing
Group by (SoldAsVacant)
Order by 2


Select SoldAsVacant,

CASE When SoldAsVacant = 'Y' THEN 'Yes'
	When SoldAsVacant='N' THEN 'NO'
	ELSE SoldAsVacant
	END
From PortfolioProject.dbo.NashvilleHousing


Update PortfolioProject.dbo.NashvilleHousing
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	When SoldAsVacant='N' THEN 'NO'
	ELSE SoldAsVacant
	END


------------------------------------------------------------------------------------------------------------

-- Remove Duplicates using CTE Window Functions

WITH RowNumCTE AS (
Select *, 
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num

From PortfolioProject.dbo.NashvilleHousing

)

Select * 
From RowNumCTE
Where row_num > 1



------------------------------------------------------------------------------------------------------------

-- Delete Unused Columns

Select *
From PortfolioProject.dbo.NashvilleHousing

ALTER TABLE PortfolioProject.dbo.NashvilleHousing

DROP COLUMN SaleDate
