-- ============================================================
-- Project Title: Impact of Marine Heatwaves on Coral Stress
-- Dataset: ocean_climate_raw
-- Author: Daniel Varvello
-- ============================================================

-- ============================================================
-- Research Question 1:
-- Does higher sea surface temperature (SST) correlate 
-- with higher bleaching severity?
-- ============================================================

SELECT 
    bleaching_severity,
    ROUND(AVG(sst_celsius), 2) AS avg_sst
FROM ocean_climate_raw
GROUP BY bleaching_severity
ORDER BY avg_sst DESC;

-- Finding:
-- A modest positive association was observed.
-- The difference between "None" and "High" bleaching severity
-- was approximately 0.18°C, suggesting elevated temperatures 
-- may contribute to bleaching severity.


-- ============================================================
-- Evaluating Temperature Variability by Severity
-- ============================================================

SELECT
    bleaching_severity,
    ROUND(AVG(sst_celsius), 2) AS avg_sst,
    ROUND(STDDEV(sst_celsius), 3) AS std_dev_sst
FROM ocean_climate_raw
GROUP BY bleaching_severity;

-- Finding:
-- Higher bleaching categories exhibited slightly greater 
-- temperature variability (High: ~1.549°C vs None: ~1.281°C).
-- This pattern suggests that both elevated and fluctuating 
-- temperatures may contribute to ecosystem stress.


-- ============================================================
-- Research Question 2:
-- Do marine heatwaves affect ecosystem stress indicators
-- (SST, species observed, bleaching severity)?
-- ============================================================

-- Heatwave vs SST and Species Observed

SELECT 
    heatwave,
    ROUND(AVG(sst_celsius), 2) AS avg_sst,
    ROUND(AVG(species_observed), 2) AS avg_species
FROM ocean_climate_raw
GROUP BY heatwave;

-- Finding:
-- Heatwave conditions were associated with:
-- +2.71°C increase in average SST
-- ~27 fewer species observed
-- This suggests significant ecosystem stress during heatwaves.


-- ============================================================
-- Bleaching Severity Distribution (No Heatwave)
-- ============================================================

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
GROUP BY bleaching_severity
ORDER BY bleaching_severity;


-- ============================================================
-- Bleaching Severity Distribution (Heatwave)
-- ============================================================

SELECT
    bleaching_severity,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) 
         FROM ocean_climate_raw 
         WHERE heatwave = True),
    2) AS pct_no_heatwave
FROM ocean_climate_raw
WHERE heatwave = True
GROUP BY bleaching_severity
ORDER BY bleaching_severity;

-- Finding:
-- During heatwave conditions:
-- Non-bleaching observations decreased from ~31.4% to ~21.9%
-- Severe bleaching increased from ~17.1% to ~20.6%
-- This distributional shift is consistent with increased coral stress 
-- during extreme warming events.


-- ============================================================
-- Research Question 3:
-- What was the duration of heatwaves in a given location, 
-- and how does that effect bleaching severity? 
-- ============================================================

SELECT 
    sea_location, 
    date_observed
FROM ocean_climate_raw
ORDER BY date_observed
LIMIT 20;

-- Conclusion:
-- Observations are not recorded at consistent daily intervals per location.
-- Therefore, the dataset does not support reliable estimation of 
-- sustained heatwave duration.
