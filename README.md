# Amtrak Database Management System – Train of Thought Inc.

**Objective:**  
To design and implement a relational database for Amtrak’s operational and financial data, analyze patterns across ridership, rewards, employment, procurements, and budget allocations, and visualize key insights to support strategic decision-making.

---

## Project Overview
This project was completed as part of **BUDT 703: Database Management Systems** at the **University of Maryland**.  
Our team, **Train of Thought Inc.**, developed a fully functional SQL-based data warehouse system for **Amtrak**, integrating datasets from multiple sources to enable operational and strategic analysis.

**Key Goals:**
1. **Train Line Demand Analysis** – Identify the least-performing train routes by analyzing ridership, route frequency, and performance metrics to improve scheduling and efficiency.  
2. **Employment Cost and Budget Allocation Optimization** – Assess how Amtrak allocates budgets across states and identify areas of overspending or underutilization.  
3. **Guest Rewards and Ridership Correlation** – Analyze membership contributions across states and determine loyalty program performance.  
4. **Procurement Value Growth Patterns** – Examine procurement spending at the city and state level to reveal trends and regional disparities.

---

## Database Design

### **Conceptual Design**
The database captures Amtrak’s operations through nine core entities:
- **State**
- **Station**
- **Budget**
- **Route**
- **Procurements**
- **Employment**
- **Rewards**
- **Ridership**
- **Pass**

### **Logical Schema**
Each entity is connected via foreign keys to maintain referential integrity.  

**Schema Highlights:**
```text
State(stateCode, stateName)
Station(stationCode, stationState, stationCity, stationInfoURL, stateCode)
Budget(budgetId, budgetType, budgetPlanYear, budgetStationName, budgetAmount, 
       budgetPriorYearValue, budgetYear, budgetValue, stationCode)
Route(routeId, routeName, routeType, routeFrequency, routeStationsList, 
      routeHostRailroad, routePerformanceYear, routePerformanceValue, stateCode)
Procurements(procurementRecordId, procurementState, procurementCity, 
             procurementYear, procurementValue, stateCode)
Employment(employmentStateRecordId, employmentCount, employmentTotalSalary, 
           employmentYear, stateCode)
Rewards(rewardsId, rewardsMemberCount, rewardsYear, stateCode)
Ridership(ridershipRecordId, ridershipCity, ridershipCityCount, ridershipYear, stationCode)
Pass(stateCode, routeId, stops)
