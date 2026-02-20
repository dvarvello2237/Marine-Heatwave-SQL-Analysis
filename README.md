# Marine-Heatwave-SQL-Analysis

## Overview
This project analyzes marine observational data using SQL to examine how marine heatwaves influence sea surface temperature, bleaching severity, and species observations.

### Objective

Evaluate how marine heatwaves impact:

	•	Sea surface temperature (SST)
	•	Bleaching severity distribution
	•	Species observations

## Dataset Summary
	•	500 observational records
	•	9 variables
	•	Time-location based measurements

### Key variables:
	•	Sea Surface Temperature (°C)
	•	pH level
	•	Bleaching severity (None, Low, Medium, High)
	•	Species observed
	•	Marine heatwave indicator (Boolean)
	•	Geographic location
	•	Date observed

## Analytical Approach

### 1. SST vs Bleaching Severity
	•	Used GROUP BY aggregation
	•	Calculated AVG() and STDDEV()
	•	Observed modest temperature increase (+0.18°C) between “None” and “High” severity
	•	Higher severity groups exhibited greater SST variability

```sql
SELECT 
    bleaching_severity,
    ROUND(AVG(sst_celsius), 2) AS avg_sst
FROM ocean_climate_raw
GROUP BY bleaching_severity
ORDER BY avg_sst DESC;
```

### 2. Heatwave Impact on Bleaching Distribution
	•	Calculated percent-of-total using window functions
	•	Compared severity composition under heatwave vs non-heatwave conditions

#### Non-Heatwave Conditions

```sql
SELECT
    bleaching_severity,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) 
         FROM ocean_climate_raw 
         WHERE heatwave = False),
    2) AS pct_no_heatwave
FROM ocean_climate_raw
WHERE heatwave = False
GROUP BY bleaching_severity;
```
#### Heatwave Conditions

```sql
SELECT
    bleaching_severity,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) 
         FROM ocean_climate_raw 
         WHERE heatwave = True),
    2) AS pct_heatwave
FROM ocean_climate_raw
WHERE heatwave = True
GROUP BY bleaching_severity;
```

### 3. Species Impact Analysis
	•	Compared group means
	•	Calculated proportional biodiversity decline

```sql
SELECT 
    heatwave,
    ROUND(AVG(sst_celsius), 2) AS avg_sst,
    ROUND(AVG(species_observed), 2) AS avg_species
FROM ocean_climate_raw
GROUP BY heatwave;
```

### 4. Heatwave Duration by Location
	•	Explored date intervals
	•	Determined irregular sampling prevents reliable heatwave duration calculation

## Insights

- Marine heatwaves are associated with substantial temperature increases (+2.71°C) and biodiversity loss (~27 species).
- Bleaching severity shifts measurably during extreme warming events.
- Even modest temperature differences (0.18°C across severity levels) correspond to stress pattern changes.
  
## Tools Used

- PostgreSQL  
- SQL (GROUP BY, aggregation, subqueries, STDDEV)  
- Statistical summarization  


## Limitations

- Irregular observation intervals prevent duration modeling  
- Observational dataset does not establish causal inference  
- Results reflect correlations rather than controlled experimentation  
