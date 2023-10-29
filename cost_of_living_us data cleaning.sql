CREATE DATABASE investment;
USE investment

#1.Total Counts of household
SELECT COUNT(case_id) AS counts
FROM cost_of_living_us;

#2.What % of taxes is contained on total cost
SELECT round((tax_avg),1),
round((total_cost_avg),1),
round(((tax_avg/total_cost_avg)*100),1) as Rate_of_tax FROM (SELECT AVG(taxes) as tax_avg, AVG(total_cost) as total_cost_avg
FROM cost_of_living_us) as clu;

SELECT max(total_cost), min(total_cost)
FROM cost_of_living_us;

#3.Compare with segments the different level of segments
SELECT 
CASE
WHEN total_cost <50000 THEN "0-50,000"
WHEN total_cost >=50000 AND total_cost <100000 THEN "50,000-100,000"
WHEN total_cost >=100000 AND total_cost <150000 THEN "100,000-150,000"
WHEN total_cost >=150000 AND total_cost <200000 THEN "150,000-200,000"
ELSE "M200,000+"
END AS total_cost_segments,
COUNT(*) As counts
FROM cost_of_living_us
GROUP BY total_cost_segments
ORDER BY total_cost_segments;

#4. Data showing comparison of costs on different states
SELECT state, 
round(AVG(housing_cost),1) AS housing_unit, 
round(AVG(food_cost),1) AS food_cost_unit, 
round(AVG(transportation_cost),1) AS transportation_cost_unit, 
round(AVG(healthcare_cost),1) AS heathcare_cost_unit
FROM cost_of_living_us
GROUP BY state;

#5. Is there a correlation between family and housing_cost/food_cost
SELECT family_member_count, round(AVG(housing_cost),1), round(AVG(food_cost),1), round(AVG(healthcare_cost),1)
FROM cost_of_living_us
GROUP BY family_member_count
ORDER BY family_member_count;

#6. Which states provides less housing_costs
SELECT state, round(AVG(housing_cost),1) AS housing_StateAVG
FROM cost_of_living_us
GROUP BY state
ORDER BY housing_StateAVG;

#7. What are the averages of each cost
SELECT round(AVG(housing_cost),1) AS housingCostAVG, round(AVG(food_cost),1) AS foodCostAVG, round(AVG(transportation_cost),1) AS transportationCostAVG, round(AVG(healthcare_cost),1) AS healthcareAVG, round(AVG(other_necessities_cost),1) AS OthernesAVG, round(AVG(childcare_cost),1) AS childcareAVG, round(AVG(taxes),1) AS taxesAVG
FROM cost_of_living_us; 

#8. What are the average total cost for each type of family
SELECT family_member_count, round(AVG(total_cost),1)
FROM cost_of_living_us
GROUP BY family_member_count
ORDER BY family_member_count;

