# COVID-19 Global Data Analysis

---

### Table of Contents

- [Overview](#overview)
- [Problem Statement](#problem-statement)
- [Data](#data)
- [Approach](#approach)
- [Tools And Technologies](#tools-and-technologies)
- [Project Files](#project-files)
- [Project Outcome](#project-outcome)
- [How To Run](#how-to-run)
- [Conclusion](#conclusion)
- [License](#license)
- [Author Info](#author-info)

[Back to the Top](#covid-19-global-data-analysis)

---

## Overview

This project analyzes global COVID-19 data using SQL to identify trends in cases, deaths, and vaccinations. The goal is to provide actionable insights that can support public health decision-making and policy formulation across different regions.

[Back to the Top](#covid-19-global-data-analysis)

---

## Problem Statement

The COVID-19 pandemic generated massive amounts of data, but understanding global patterns in deaths and vaccination rates was complex. This project aims to simplify that by querying, cleaning, and analyzing structured data to answer key questions about how the virus impacted different countries.

[Back to the Top](#covid-19-global-data-analysis)

---

## Data

- **Source**: [Public COVID-19 dataset - Our World in Data](https://ourworldindata.org/coronavirus)
- **Description**:
  - Key columns: `country`, `date`, `total_cases`, `total_deaths`, `population`, `new_vaccinations`, `total_vaccinations`, `continent`
  - No target variable; analysis-focused
  - Dataset size: ~500,000+ records covering multiple countries and dates

[Back to the Top](#covid-19-global-data-analysis)

---

## Approach

1. **Data Exploration and Cleaning**:
   - Standardized column names and data types
   - Removed nulls and inconsistent entries
   - Handled date and numerical formatting issues
2. **Data Analysis in SQL**:
   - Used `JOINs`, `CTEs`, `WINDOW` functions for temporal and group analysis
   - Calculated death rates, vaccination rates per population
   - Identified top and bottom countries by various health indicators
3. **Insight Generation**:
   - Analyzed death rates by country to quantify the mortality risk of COVID-19 globally.
   - Identified countries where a large portion of the population contracted COVID, with infection rates exceeding 20% in the hardest-hit regions.
   - Summarized total deaths by continent to highlight regional impact, with clear disparities between continents.
   - Conducted a time-series analysis to track global case and death progression, revealing spikes and changes in death percentages over time.
   - Examined vaccination rollout over time by country, calculating percentage of population vaccinated to compare progress across nations.

[Back to the Top](#covid-19-global-data-analysis)

---

## Tools and Technologies

- Microsoft SQL Server (T-SQL)
- SQL Server Management Studio (SSMS)
- Tableau (Visualization)
- Git & GitHub for version control

[Back to the Top](#covid-19-global-data-analysis)

---

## Project Files

The following are the files in this project.

- [COVID 19 Project Queries](CovidProjectQueries.sql)
- [Tableau Project File](CovidDataVisualization.twb)
- [COVID Deaths Data](data/source/CovidDeaths.csv)
- [COVID Vaccinations](data/source/CovidVaccinations.csv)

[Back to the Top](#covid-19-global-data-analysis)

---

## Project Outcome

- **Death Rate Analysis**: Found significant differences in country-level death rates — some with mortality rates exceeding 5% relative to total cases, emphasizing disparities in healthcare infrastructure.
- **Infection Spread**: Identified that certain countries saw over 25% of their population infected, while others remained under 5%, indicating uneven pandemic control.
- **Continental Mortality Comparison**: Ranked continents by total death counts, with clear geographic trends showing higher impacts in specific regions.
- **Temporal Trends**: Tracked how global cases and deaths evolved over time, revealing peaks in infection followed by sharp rises in death percentages.
- **Vaccination Progress**: Used rolling totals to assess vaccination over time and computed the percentage of population vaccinated, highlighting early vs. late adopters.

Access the dashboard in **Tableau Public** [here](https://public.tableau.com/views/CovidDataVisualization_17520199838690/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

[Back to the Top](#covid-19-global-data-analysis)

---

## How to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/prasanna-sriram/covid19-global-data-analysis.git
   ```

2. Go to the project directory

    ```bash
    cd covid19-global-data-analysis
    ```

3. Open CovidProjectQueries.sql in SQL Server Management Studio

4. Run the queries on the cleaned data provided under [COVID Deaths](data/clean_data/CovidDeaths.xlsx) and [Covid Vaccinations](data/clean_data/CovidVaccinations.xlsx)

[Back to the Top](#covid-19-global-data-analysis)

---

## Conclusion

This SQL-based analysis provided a clear picture of how COVID-19 affected countries and continents differently, both in terms of mortality and vaccination coverage. It showcased the value of structured query analysis in transforming raw health data into interpretable metrics for policymakers and analysts. Future work could include integrating this SQL logic into a Power BI dashboard for interactive, real-time insights and public communication.

[Back to the Top](#covid-19-global-data-analysis)

---

## License

MIT License

Copyright (c) [2025] [Prasanna Sriram]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[Back to the Top](#covid-19-global-data-analysis)

---

## Author Info

- Github - [Github Profile](https://github.com/prasanna-sriram)
- LinkedIn - [Prasanna Sriram](https://www.linkedin.com/in/prasanna-sriram/)
- Tableau - [Tableau Public Profile](https://public.tableau.com/app/profile/prasanna.sriram.ps)

[Back to the Top](#covid-19-global-data)