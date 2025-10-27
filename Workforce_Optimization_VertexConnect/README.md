# Vertex Connect • Workforce Optimization
**Role fit:** Workforce Analyst, Business Analyst  
**Stack:** SQL Server + Power BI

## Business Problem
Inconsistent service metrics and schedule shrinkage degrade SLA. Leadership needs visibility into AHT, FCR, adherence, and staffing demand.

## Data Model
Agents, Attendance, Calls, OfferedCallsForecast

## KPIs
AHT, FCR, Escalation Rate, Adherence, Overtime

## How to Run
1) Execute SQL in `/SQL/vertex_connect_sqlserver_setup.sql`  
2) Import CSVs from `/Data` via Power Query  
3) Relate Calls↔Agents and Attendance↔Agents, and to Dates
