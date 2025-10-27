-- PrimeGoods Market Retail Insights (SQL Server)

CREATE TABLE dbo.Stores(
  store_id INT PRIMARY KEY,
  region NVARCHAR(40)
);

CREATE TABLE dbo.SKUs(
  sku_id INT PRIMARY KEY,
  category NVARCHAR(40),
  price DECIMAL(10,2),
  cost DECIMAL(10,2)
);

CREATE TABLE dbo.Sales(
  sale_id INT PRIMARY KEY,
  sale_date DATE,
  store_id INT,
  sku_id INT,
  units INT,
  unit_price DECIMAL(10,2),
  unit_cost DECIMAL(10,2),
  promo_flag BIT
);

CREATE TABLE dbo.InventorySnapshot(
  snapshot_date DATE,
  store_id INT,
  sku_id INT,
  on_hand INT,
  reorder_point INT,
  CONSTRAINT PK_Inv PRIMARY KEY (snapshot_date, store_id, sku_id)
);

CREATE VIEW dbo.vw_Sales_KPI AS
SELECT
  s.sale_date,
  s.store_id,
  s.sku_id,
  SUM(s.units) AS units,
  SUM(s.units * s.unit_price) AS revenue,
  SUM(s.units * s.unit_cost) AS cogs,
  SUM(s.units * (s.unit_price - s.unit_cost)) AS gross_margin
FROM dbo.Sales s
GROUP BY s.sale_date, s.store_id, s.sku_id;
