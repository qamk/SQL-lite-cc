 --Two segments 30, 87
 SELECT * FROM subscriptions
 LIMIT 10;
 
--Range of months Dec 2016 to Mar 2017
SELECT MIN(subscription_start) AS 'earliest start', MAX(subscription_end) 'latest end' FROM subscriptions;

WITH 
months AS (
  SELECT 
  '2017-01-01' AS 'first_day',
  '2017-01-31' AS 'last_day'
  UNION
  SELECT
  '2017-02-01' AS 'first_day',
  '2017-02-28' AS 'last_day'
  UNION
  SELECT
  '2017-03-01' AS 'first_day',
  '2017-03-31' AS 'last_day'
),
cross_join AS (
  SELECT * FROM subscriptions
  CROSS JOIN months
),
status AS (
SELECT id, first_day AS 'month', 
  CASE
    WHEN 
    ((segment = 87) AND 
    (subscription_start < first_day))
    AND (
      (subscription_end >= first_day) OR
      (subscription_end IS NULL)
    )
    THEN 1
    ELSE 0
  END AS 'is_active_87',
  CASE
    WHEN 
    ((segment = 30) AND 
    (subscription_start < first_day))
    AND (
      (subscription_end >= first_day) OR
      (subscription_end IS NULL)
    )
    THEN 1
    ELSE 0
  END AS 'is_active_30',
  CASE
    WHEN 
    (segment = 87)
    AND (
      (subscription_end 
       BETWEEN first_day AND last_day)  
    )
    THEN 1
    ELSE 0
  END AS 'is_canceled_87',
  CASE
    WHEN 
    (segment = 30)
    AND (
      (subscription_end 
       BETWEEN first_day AND last_day)  
    )
    THEN 1
    ELSE 0
  END AS 'is_canceled_30'
FROM cross_join
),
status_aggregate AS (
SELECT 
  SUM(is_active_87) AS 'sum_active_87', 
  SUM(is_active_30) AS 'sum_active_30',
  SUM(is_canceled_87) AS 'sum_canceled_87',
  SUM(is_canceled_30) AS 'sum_canceled_30'
FROM status
)
SELECT 
ROUND((1.0*sum_canceled_87/sum_active_87),3) 
AS 'churn_87', 
ROUND((1.0*sum_canceled_30/sum_active_30),3) 
AS 'churn_30'
FROM status_aggregate;
