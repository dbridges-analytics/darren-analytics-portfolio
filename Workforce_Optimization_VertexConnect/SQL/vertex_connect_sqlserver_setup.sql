
-- Vertex Connect Workforce Optimization (SQL Server)
CREATE TABLE dbo.Agents (agent_id INT PRIMARY KEY, agent_name NVARCHAR(100), team NVARCHAR(50), hire_date DATE);
CREATE TABLE dbo.Attendance (work_date DATE, agent_id INT, scheduled_min INT, worked_min INT, absent_flag BIT, overtime_min INT,
  CONSTRAINT FK_Att_Agent FOREIGN KEY (agent_id) REFERENCES dbo.Agents(agent_id));
CREATE TABLE dbo.Calls (call_id INT PRIMARY KEY, call_date DATE, agent_id INT, handle_time_sec INT, fcr_flag BIT, escalated_flag BIT, sentiment NVARCHAR(20), queue NVARCHAR(50),
  CONSTRAINT FK_Call_Agent FOREIGN KEY (agent_id) REFERENCES dbo.Agents(agent_id));
CREATE TABLE dbo.OfferedCallsForecast ([date] DATE PRIMARY KEY, offered_calls INT);
CREATE VIEW dbo.vw_Agent_Daily_KPIs AS
SELECT c.call_date, c.agent_id,
       COUNT(*) AS calls_handled,
       AVG(CAST(c.handle_time_sec AS FLOAT)) AS avg_handle_time_sec,
       AVG(CAST(c.fcr_flag AS FLOAT)) AS fcr_rate,
       AVG(CAST(c.escalated_flag AS FLOAT)) AS escalation_rate
FROM dbo.Calls c
GROUP BY c.call_date, c.agent_id;
CREATE VIEW dbo.vw_Attendance_Daily AS
SELECT work_date, agent_id, scheduled_min, worked_min, absent_flag, overtime_min,
       CASE WHEN scheduled_min>0 THEN worked_min*1.0/scheduled_min END AS adherence
FROM dbo.Attendance;
