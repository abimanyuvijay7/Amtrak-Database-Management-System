USE BUDT703_Project_0506_14;

--What is the membership contribution of each state in each year as a percentage?
SELECT a.State, a.[Rewards Year], a.[Rewards Member Count], 
	   a.[Total Yearly Member Count], ROUND((a.[Rewards Member Count]*1.0)/CAST(a.[Total Yearly Member Count] AS FLOAT)*100,3) AS 'Percentage'
FROM (
	SELECT s.stateName AS 'State', r.rewardsYear AS 'Rewards Year', r.rewardsMemberCount AS 'Rewards Member Count', 
		   SUM(r.rewardsMemberCount) OVER(PARTITION BY r.rewardsYear) AS 'Total Yearly Member Count' 
	FROM [Amtrak.Rewards] r
	LEFT JOIN [Amtrak.State] s ON r.stateCode=s.stateCode
	GROUP BY s.stateName, r.rewardsYear, r.rewardsMemberCount) a
ORDER BY a.[Rewards Year],a.State

--What is the yearly procurement value of goods in the cities compared to the yearly procrement value of the state?
SELECT p.procurementYear AS 'Procurement Year', p.procurementState AS 'Procurementy State', p.procurementCity AS 'Procurement City', p.procurementValue AS 'Procurement Value', 
    SUM(p.procurementValue) OVER (PARTITION BY p.procurementState, p.procurementYear) AS 'Total Value Per Year'
FROM [Amtrak.Procurements] p
ORDER BY CAST(SUBSTRING(p.procurementYear, 3, 2) AS INT), p.procurementState, p.procurementCity


--What are the details of the five least performing routes?
WITH Route_Details AS (
	SELECT DISTINCT r.routeName, r.routeType, r.routeFrequency, r.routePerformanceYear, 
	r.routePerformanceValue
	FROM [Amtrak.Route] r
)
SELECT DISTINCT TOP 5 
    r.routeName AS 'Route Name', r.routeType as 'Route Type', r.routeFrequency AS 'Route Frequency', 
	ROUND(AVG(r.routePerformanceValue),3) AS 'Average Route Performance Value' 
FROM Route_Details r
GROUP BY r.routeName, r.routeType, r.routeFrequency
ORDER BY ROUND(AVG(r.routePerformanceValue),3) ASC


--What percentage of the budget is used for employment costs for each state?
SELECT b.budgetPlanYear AS 'Budget Plan Year',s.stationState AS 'State',
	   SUM(b.budgetAmount) AS 'Total Amount', 
	   COALESCE(SUM(CASE WHEN b.budgetType='Design' THEN b.budgetAmount END),0) AS 'Design Budget',
	   COALESCE(SUM(CASE WHEN b.budgetType='Construction' THEN b.budgetAmount END),0) AS 'Construction Budget' ,
	   COALESCE(SUM(CASE WHEN b.budgetType='Deployment' THEN b.budgetAmount END),0) AS 'Deployment Budget' 
FROM [Amtrak.Budget] b
LEFT JOIN [Amtrak.Station] s ON b.stationCode=s.stationCode
GROUP BY b.budgetPlanYear, s.stationState

