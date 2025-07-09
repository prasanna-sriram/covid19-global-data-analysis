USE PortfolioProjects
GO

-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- TOTAL CASES v/s TOTAL DEATHS BY COUNTRY ------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
-- Shows the likelihood of dying if you contract COVID in each country
-------------------------------------------------------------------------------------------------------------------------------

SELECT country, final_cases, final_death, 
(
	CASE WHEN final_cases > 0 THEN ROUND((final_death / final_cases) * 100,2)
	ELSE 0
	END
) AS death_percentage
FROM
(
	SELECT country, MAX(total_cases) AS final_cases, MAX(total_deaths) AS final_death
	FROM CovidDeaths
	WHERE continent IS NOT NULL AND LEN(continent) > 0
	GROUP BY country
) AS tc_td
ORDER BY country

-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- TOTAL CASES v/s POPULATION BY COUNTRY --------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
-- Shows the what percentage of the population got COVID in each country
-------------------------------------------------------------------------------------------------------------------------------

SELECT country, MAX(total_cases) AS final_cases, COALESCE(population,0),
(
	CASE WHEN population > 0 THEN ROUND((MAX(total_cases/ population)) * 100,2)
	ELSE 0
	END
) AS infected_percentage
FROM CovidDeaths
WHERE continent IS NOT NULL AND LEN(continent) > 0
GROUP BY country, population
ORDER BY infected_percentage DESC

-------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------- TOTAL DEATHS BY CONTINENT ---------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
-- Shows the total death count grouped by each Continent
-------------------------------------------------------------------------------------------------------------------------------

SELECT continent, MAX(total_deaths) AS final_deaths
FROM CovidDeaths
WHERE LEN(continent) <> 0
GROUP BY continent
ORDER BY final_deaths DESC

-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- TOTAL CASES & DEATHS OVER TIME ---------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
-- Shows how the total cases and deaths varied over time
-------------------------------------------------------------------------------------------------------------------------------

SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, 
(
	CASE WHEN SUM(new_cases) > 0 THEN ROUND((SUM(new_deaths) / SUM(new_cases)) * 100,2)
	ELSE 0
	END
) AS death_percentage
FROM CovidDeaths
WHERE LEN(continent) <> 0
GROUP BY date
ORDER BY 1

-------------------------------------------------------------------------------------------------------------------------------
------------------------------------- TOTAL VACCINATIONS v/s POPULATION OVER TIME ---------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
-- Shows the number of people vaccinated v/s population over time
-------------------------------------------------------------------------------------------------------------------------------

SELECT deaths.country, deaths.date, deaths.continent, deaths.population, vaccines.new_vaccinations,
SUM(vaccines.new_vaccinations) OVER ( PARTITION BY deaths.country ORDER BY deaths.country, deaths.date) AS rolling_people_vaccinated
FROM CovidDeaths deaths
JOIN CovidVaccinations vaccines
ON deaths.country = vaccines.country
AND deaths.date = vaccines.date
WHERE LEN(deaths.continent) <> 0
ORDER BY 1,2

-------------------------------------------------------------------------------------------------------------------------------
-- Shows the percentage of people vaccinated v/s population over time
-------------------------------------------------------------------------------------------------------------------------------

WITH POP_VAC
AS
(
	SELECT deaths.country, deaths.date, deaths.continent, deaths.population, vaccines.new_vaccinations,
	SUM(vaccines.new_vaccinations) OVER ( PARTITION BY deaths.country ORDER BY deaths.country, deaths.date) AS rolling_poeple_vaccinated
	FROM CovidDeaths deaths
	JOIN CovidVaccinations vaccines
	ON deaths.country = vaccines.country
	AND deaths.date = vaccines.date
	WHERE LEN(deaths.continent) <> 0
)

SELECT *, ROUND((rolling_poeple_vaccinated / population) * 100,2) AS percentage_vaccinated
FROM POP_VAC
ORDER BY 1,2

-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- TOTAL CASES v/s TOTAL DEATHS -----------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
-- Shows the global cases and deaths  due to COVID
-------------------------------------------------------------------------------------------------------------------------------

SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, 
(
	CASE WHEN SUM(new_cases) > 0 THEN ROUND((SUM(new_deaths) / SUM(new_cases)) * 100, 2)
	ELSE 0
	END
) AS death_percentage
FROM CovidDeaths
WHERE LEN(continent) <> 0
