# PrimeGoods Market • Retail Sales & Inventory
**Role Fit:** Business Analyst, Data Analyst  
**Stack:** SQL Server + Power BI

## Business Problem
PrimeGoods wants to optimize inventory levels, increase gross margin, and understand which products drive revenue and profitability by store and region.

## Data Model
- **Stores**: Location + region
- **SKUs**: Product costs, price, and category
- **Sales**: Daily transactions with promo flag
- **InventorySnapshot**: Stock status vs reorder point

The KPI view (`dbo.vw_Sales_KPI`) provides:
- Units Sold  
- Revenue  
- Cost of Goods Sold (COGS)  
- Gross Margin Dollars  

## Power BI Visuals (Recommended)
- GM% by Category & Store
- On-Hand vs Reorder Point by SKU (Stockout risk)
- Promo vs Non-Promo Revenue & Margin
- Region Performance Comparison (Matrix / Map)

## Key Performance Indicators
- **Revenue**
- **Gross Margin $**
- **Gross Margin %**
- **Promo Lift** (Promo vs Baseline)
- **Inventory Turnover**

## Executive Insight Examples
- A small set of SKUs drives a majority of gross margin; maintaining in-stock levels protects revenue.
- West region underperforms in Electronics. Promotional bundles recommended.
- Adjusting reorder points based on demand patterns reduces Q4 stockouts without excess inventory cost.

## How To Use
1. Run `/SQL/primegoods_sqlserver_setup.sql` in SQL Server
2. Load `/Data/*.csv` into Power BI using Power Query
3. Create relationships:
   - Sales[sku_id] ↔ SKUs[sku_id]
   - Sales[store_id] ↔ Stores[store_id]
4. Build DAX measures for GM%, Inventory Turnover, Promo vs Non-Promo outcomes

## Files Included
- `/Data/*.csv`
- `/SQL/primegoods_sqlserver_setup.sql`
