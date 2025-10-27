# Vertex Connect • Workforce Optimization
**Role fit:** Workforce Analyst, Business Analyst  
**Stack:** SQL Server + Power BI

## Business Problem
Service consistency and schedule adherence were declining due to limited visibility across performance metrics.
Leadership needed a unified view of AHT, FCR, adherence, absenteeism, and call demand to prevent SLA degradation and staffing inefficiencies.

## Data Model
Agents, Attendance, Calls, OfferedCallsForecast, Dates

## KPIs
AHT, FCR, Escalation Rate, Adherence, Overtime

## How to Run
1) Execute SQL in `/SQL/vertex_connect_sqlserver_setup.sql`  
2) Import CSVs from `/Data` via Power Query  
3) Relate Calls↔Agents and Attendance↔Agents, and to Dates

Business Value

✅ Improves SLA protection through proactive monitoring
✅ Supports coaching by exposing team-level variance
✅ Enhances staffing alignment to actual demand
✅ Streamlines leadership reporting
