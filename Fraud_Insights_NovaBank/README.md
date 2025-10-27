# NovaBank • Fraud Insights
**Role Fit:** Data Analyst  
**Tech Stack:** SQL Server + Power BI

## Business Problem
NovaBank wants to reduce fraud losses while maintaining customer experience. Leadership needs daily visibility into suspicious transaction behavior and chargebacks.

## Data Model
- **Customers**: customer profile & segment
- **Transactions**: detailed card activity with fraud indication
- **Daily KPI View**: fraud rate, chargeback rate, loss $

## Key KPIs
- **Fraud Rate** = Fraud Transactions ÷ Total Transactions
- **Chargeback Rate**
- **Fraud Loss $**
- **High-risk merchant categories**
- **High-risk hours (00:00–04:59)**

## SQL Server Integration
Run script in `/SQL/novabank_sqlserver_setup.sql` to build tables and view.

## Power BI Dashboard
Recommended visuals:
- Fraud Rate by Merchant Category
- Chargeback Trend by Day
- Heatmap: Hour of Day vs Fraud Flags
- Segmented Risk Profile

## Executive Insights (Example)
- Off-hour online transactions above $300 represent a disproportionate share of fraud losses.
- Targeted monitoring on the riskiest 2% of customers may reduce total fraud loss by ~20%.
- Electronics and Online MCCs drive higher-than-average chargebacks.

## Files Included
- `/Data/transactions.csv`
- `/Data/customers.csv`
- `/SQL/novabank_sqlserver_setup.sql`

