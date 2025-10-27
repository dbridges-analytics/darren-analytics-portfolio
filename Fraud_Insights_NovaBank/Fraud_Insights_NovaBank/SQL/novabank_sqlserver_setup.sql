-- NovaBank Fraud Insights (SQL Server)

CREATE TABLE dbo.Customers (
  customer_id INT PRIMARY KEY,
  segment NVARCHAR(20),
  join_date DATE,
  home_region NVARCHAR(40)
);

CREATE TABLE dbo.Transactions (
  txn_id INT PRIMARY KEY,
  customer_id INT,
  txn_ts DATETIME2,
  amount DECIMAL(12,2),
  merchant_cat NVARCHAR(50),
  channel NVARCHAR(20),
  fraud_flag BIT,
  chargeback_flag BIT,
  CONSTRAINT FK_Txn_Cust FOREIGN KEY (customer_id)
    REFERENCES dbo.Customers(customer_id)
);

CREATE VIEW dbo.vw_Fraud_KPI_Daily AS
SELECT
  CAST(txn_ts AS DATE) AS txn_date,
  COUNT(*) AS total_txns,
  SUM(CASE WHEN fraud_flag = 1 THEN 1 ELSE 0 END) AS fraud_txns,
  SUM(CASE WHEN chargeback_flag = 1 THEN 1 ELSE 0 END) AS chargebacks,
  SUM(amount) AS total_amount,
  SUM(CASE WHEN fraud_flag = 1 THEN amount ELSE 0 END) AS fraud_amount
FROM dbo.Transactions
GROUP BY CAST(txn_ts AS DATE);
