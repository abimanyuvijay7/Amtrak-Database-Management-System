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
```
### **Physical Design**
Implemented in SQL Server with full referential integrity, cascading updates/deletes, and numeric-based keys.  
All **DDL** and **DML** scripts are included for table creation, population, and analytical querying.

---

## 📊 Tableau Visualization
A **Tableau dashboard** was developed to visualize key insights derived from the database, including:
- Route performance and efficiency metrics  
- Ridership and guest rewards correlations  
- Budget allocations by state and category  
- Procurement and employment distribution  

📈 **Workbook:** `BUDT703_Project_0506_14_Tableau.twb`

---

## 👥 Contributors
- **Abimanyu Vijay Krishnamoorthy**  
- Rohan Vasudevan  
- Ritesh Narendra Pamadi  
- Pranav Bharatwaj Manikantan  

---

## 🧠 Skills Demonstrated
- SQL (DDL, DML, Joins, Window Functions, Subqueries)  
- Database Normalization (1NF → 3NF)  
- Referential Integrity and Foreign Key Design  
- ETL & Data Cleaning (Excel + SQL)  
- Tableau Dashboard Development  
- Business Intelligence & Data Storytelling  

---

## 📚 Data Sources
- [Amtrak State Fact Sheets](https://www.amtrak.com/about-amtrak/amtrak-facts/state-fact-sheets.html)  
- [Amtrak Reports & Documents](https://www.amtrak.com/about-amtrak/reports-documents.html)  
- [Amtrak Train Routes](https://www.amtrak.com/train-routes)  
- [Great American Stations](https://www.greatamericanstations.com/)  
- [FAA State Codes Reference](https://www.faa.gov/air_traffic/publications/atpubs/cnt_html/appendix_a.html)

---

## 🪄 Repository Contents
| File | Description |
|------|--------------|
| `DDL.sql` | Database schema (table creation, constraints) |
| `DML.sql` | Queries and manipulation commands |
| `INSERT_INTO_*.sql` | Data population scripts |
| `Report.pdf` | Project report including data processing & insights |
| `Slides.pdf` | Final presentation deck |
| `Tableau.twb` | Visualization workbook |

---

## 🧾 License
This project is open-sourced under the [MIT License](LICENSE).

---
