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

### 2. Heatwave Impact on Bleaching Distribution
	•	Calculated percent-of-total using window functions
	•	Compared severity composition under heatwave vs non-heatwave conditions

### 3. Species Impact Analysis
	•	Compared group means
	•	Calculated proportional biodiversity decline

### 4. Heatwave Duration by Location
	•	Explored date intervals
	•	Determined irregular sampling prevents reliable heatwave duration calculation

## Key Findings
	•	Heatwaves increased average SST from 28.14°C to 30.85°C (+2.71°C).
	•	Non-bleaching observations decreased from 31.38% to 21.92% during heatwaves.
	•	High-severity bleaching increased from 17.10% to 20.55%.
	•	Species observations declined from 124.38 to 97.63, a 21.5% decrease.


## Skills Demonstrated
	•	Aggregations using GROUP BY
	•	Conditional logic
	•	Window functions
	•	Percent-of-total calculations
	•	Statistical summaries (AVG, STDDEV)
	•	Analytical interpretation
	•	Limitation assessment
