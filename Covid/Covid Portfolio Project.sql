
-- Select working data 

Select location,date,total_cases,new_cases,total_deaths,population

From PortfolioProject..CovidDeaths$

Where continent is not null
order by 1,2



-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract the virus 

Select location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage

From PortfolioProject..CovidDeaths$

Where location like '%states%' and continent is not null
order by 1,2



-- Total Cases vs Population
-- Shows what percentage of population got Covid

Select location,date, Population, total_cases, (total_cases/population)*100 as DeathPercentage

From PortfolioProject..CovidDeaths$

Where location like '%states%' and continent is not null

order by 1,2



-- Countries with Highest Infectrion Rate compared to Population

Select location, Population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as InfectionRate

From PortfolioProject..CovidDeaths$

Where continent is not null

group by location, Population

order by InfectionRate desc



-- By Continent

Select continent, MAX(cast(total_deaths as int)) as TotalDeathCount

From PortfolioProject..CovidDeaths$

Where continent is not null

group by continent

order by TotalDeathCount desc



-- Countries with Highest Death Count per Population

Select location, MAX(cast(total_deaths as int)) as TotalDeathCount

From PortfolioProject..CovidDeaths$

Where continent is not null

group by location

order by TotalDeathCount desc



-- Global numbers 

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage

From PortfolioProject..CovidDeaths$

Where continent is not null

order by 1,2



-- Using CTE

With PopvsVac(Continent, Location, Date, Population, new_vaccinations, RollingVaccination) 
as 

-- Total Population vs Vaccinations
( 
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(Cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location, dea.Date) as RollingVaccination

From PortfolioProject..CovidDeaths$ dea
Join PortfolioProject..CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date

Where dea.continent is not null

)

Select *, (RollingVaccination/Population)*100 as PopulationPercentVaccinated
From PopvsVac



-- Temp Table

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingVaccination numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(Cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location, dea.Date) as RollingVaccination

From PortfolioProject..CovidDeaths$ dea
Join PortfolioProject..CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date

Where dea.continent is not null

order by 2,3

Select *, (RollingVaccination/Population)*100 as PopulationPercentVaccinated
From #PercentPopulationVaccinated



-- Create View to store data for later visualizations

Create View PercentPopVaccinated as

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(Cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location, dea.Date) as RollingVaccination

From PortfolioProject..CovidDeaths$ dea
Join PortfolioProject..CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date

Where dea.continent is not null
