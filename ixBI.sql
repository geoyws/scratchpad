WITH sales_data AS (
    SELECT
        "market",
        "businessUnit",
        "year",
        "month",
        "quarter",
        SUM(CASE WHEN "salesType" SIMILAR TO '%New%' THEN "actualAmount" ELSE 0 END) AS "nps",
        SUM(CASE WHEN "salesType" SIMILAR TO 'SaaS - New' THEN "actualAmount" ELSE 0 END) AS "npsSaaS",
        SUM(CASE WHEN "salesType" SIMILAR TO 'Out Right - New' THEN "actualAmount" ELSE 0 END) AS "npsOutright",
        SUM(CASE WHEN "salesType" SIMILAR TO 'Post Sales' THEN "actualAmount" ELSE 0 END) AS "ps",
        SUM(CASE WHEN "salesType" SIMILAR TO '(SaaS - Services|SSA)' THEN "actualAmount" ELSE 0 END) AS "r",
        SUM(CASE WHEN "salesType" SIMILAR TO '(SaaS - Services)' THEN "actualAmount" ELSE 0 END) AS "rsSaaS",
        SUM(CASE WHEN "salesType" SIMILAR TO '(SSA)' THEN "actualAmount" ELSE 0 END) AS "rsSSA"
    FROM
        "bi"."sales" -- Replace with your actual table name
    WHERE
        "year" = 2024
    GROUP BY
        "market", "businessUnit", "year", "quarter", "month"
    ORDER BY
        "market", "businessUnit", "year", "quarter", "month"
)
SELECT
  'Total Sales Order' as "scope",
  SUM(CASE WHEN "quarter" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q1",
  SUM(CASE WHEN "month" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jan",
  SUM(CASE WHEN "month" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Feb",
  SUM(CASE WHEN "month" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Mar",
  SUM(CASE WHEN "quarter" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q2",
  SUM(CASE WHEN "month" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Apr",
  SUM(CASE WHEN "month" = 5 THEN "nps" + "ps" + "r" ELSE 0 END) AS "May",
  SUM(CASE WHEN "month" = 6 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jun",
  SUM(CASE WHEN "quarter" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q3",
  SUM(CASE WHEN "month" = 7 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jul",
  SUM(CASE WHEN "month" = 8 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Aug",
  SUM(CASE WHEN "month" = 9 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Sep",
  SUM(CASE WHEN "quarter" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q4",
  SUM(CASE WHEN "month" = 10 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Oct",
  SUM(CASE WHEN "month" = 11 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Nov",
  SUM(CASE WHEN "month" = 12 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Dec"
FROM
  sales_data
UNION ALL
SELECT
  'Malaysia' as "scope",
  SUM(CASE WHEN "quarter" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q1",
  SUM(CASE WHEN "month" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jan",
  SUM(CASE WHEN "month" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Feb",
  SUM(CASE WHEN "month" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Mar",
  SUM(CASE WHEN "quarter" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q2",
  SUM(CASE WHEN "month" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Apr",
  SUM(CASE WHEN "month" = 5 THEN "nps" + "ps" + "r" ELSE 0 END) AS "May",
  SUM(CASE WHEN "month" = 6 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jun",
  SUM(CASE WHEN "quarter" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q3",
  SUM(CASE WHEN "month" = 7 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jul",
  SUM(CASE WHEN "month" = 8 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Aug",
  SUM(CASE WHEN "month" = 9 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Sep",
  SUM(CASE WHEN "quarter" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q4",
  SUM(CASE WHEN "month" = 10 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Oct",
  SUM(CASE WHEN "month" = 11 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Nov",
  SUM(CASE WHEN "month" = 12 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Dec"
FROM
  sales_data
WHERE
  "market" = 'Malaysia'
--  HQ-Property 
--  HQ-Construction 
--  HQ-Hotel 
--  HQ-HR 
--  Northern 
--  Southern 
--  East Coast 
--  EM-Sabah  
--  EM-Sarawak 
--  Gotta UNION ALL for the above scopes
UNION ALL
SELECT
  'HQ-Property' as "scope",
  SUM(CASE WHEN "quarter" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q1",
  SUM(CASE WHEN "month" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jan",
  SUM(CASE WHEN "month" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Feb",
  SUM(CASE WHEN "month" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Mar",
  SUM(CASE WHEN "quarter" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q2",
  SUM(CASE WHEN "month" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Apr",
  SUM(CASE WHEN "month" = 5 THEN "nps" + "ps" + "r" ELSE 0 END) AS "May",
  SUM(CASE WHEN "month" = 6 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jun",
  SUM(CASE WHEN "quarter" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q3",
  SUM(CASE WHEN "month" = 7 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jul",
  SUM(CASE WHEN "month" = 8 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Aug",
  SUM(CASE WHEN "month" = 9 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Sep",
  SUM(CASE WHEN "quarter" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q4",
  SUM(CASE WHEN "month" = 10 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Oct",
  SUM(CASE WHEN "month" = 11 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Nov",
  SUM(CASE WHEN "month" = 12 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Dec"
FROM
  sales_data
WHERE
  "businessUnit" = 'HQ-Property'
AND
  "market" = 'Malaysia'
UNION ALL
SELECT
  'HQ-Construction' as "scope",
  SUM(CASE WHEN "quarter" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q1",
  SUM(CASE WHEN "month" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jan",
  SUM(CASE WHEN "month" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Feb",
  SUM(CASE WHEN "month" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Mar",
  SUM(CASE WHEN "quarter" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q2",
  SUM(CASE WHEN "month" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Apr",
  SUM(CASE WHEN "month" = 5 THEN "nps" + "ps" + "r" ELSE 0 END) AS "May",
  SUM(CASE WHEN "month" = 6 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jun",
  SUM(CASE WHEN "quarter" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q3",
  SUM(CASE WHEN "month" = 7 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jul",
  SUM(CASE WHEN "month" = 8 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Aug",
  SUM(CASE WHEN "month" = 9 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Sep",
  SUM(CASE WHEN "quarter" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q4",
  SUM(CASE WHEN "month" = 10 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Oct",
  SUM(CASE WHEN "month" = 11 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Nov",
  SUM(CASE WHEN "month" = 12 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Dec"
FROM
  sales_data
WHERE
  "businessUnit" = 'HQ-Construction'
AND
  "market" = 'Malaysia'
UNION ALL
SELECT
  'HQ-Hotel' as "scope",
  SUM(CASE WHEN "quarter" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q1",
  SUM(CASE WHEN "month" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jan",
  SUM(CASE WHEN "month" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Feb",
  SUM(CASE WHEN "month" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Mar",
  SUM(CASE WHEN "quarter" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q2",
  SUM(CASE WHEN "month" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Apr",
  SUM(CASE WHEN "month" = 5 THEN "nps" + "ps" + "r" ELSE 0 END) AS "May",
  SUM(CASE WHEN "month" = 6 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jun",
  SUM(CASE WHEN "quarter" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q3",
  SUM(CASE WHEN "month" = 7 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jul",
  SUM(CASE WHEN "month" = 8 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Aug",
  SUM(CASE WHEN "month" = 9 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Sep",
  SUM(CASE WHEN "quarter" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q4",
  SUM(CASE WHEN "month" = 10 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Oct",
  SUM(CASE WHEN "month" = 11 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Nov",
  SUM(CASE WHEN "month" = 12 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Dec"
FROM
  sales_data
WHERE
  "businessUnit" = 'HQ-Hotel'
AND
  "market" = 'Malaysia'
UNION ALL
SELECT
  'HQ-HR' as "scope",
  SUM(CASE WHEN "quarter" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q1",
  SUM(CASE WHEN "month" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jan",
  SUM(CASE WHEN "month" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Feb",
  SUM(CASE WHEN "month" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Mar",
  SUM(CASE WHEN "quarter" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q2",
  SUM(CASE WHEN "month" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Apr",
  SUM(CASE WHEN "month" = 5 THEN "nps" + "ps" + "r" ELSE 0 END) AS "May",
  SUM(CASE WHEN "month" = 6 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jun",
  SUM(CASE WHEN "quarter" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q3",
  SUM(CASE WHEN "month" = 7 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jul",
  SUM(CASE WHEN "month" = 8 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Aug",
  SUM(CASE WHEN "month" = 9 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Sep",
  SUM(CASE WHEN "quarter" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q4",
  SUM(CASE WHEN "month" = 10 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Oct",
  SUM(CASE WHEN "month" = 11 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Nov",
  SUM(CASE WHEN "month" = 12 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Dec"
FROM
  sales_data
WHERE
  "businessUnit" = 'HQ-HR'
AND
  "market" = 'Malaysia'
UNION ALL
SELECT
  'Northern' as "scope",
  SUM(CASE WHEN "quarter" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q1",
  SUM(CASE WHEN "month" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jan",
  SUM(CASE WHEN "month" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Feb",
  SUM(CASE WHEN "month" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Mar",
  SUM(CASE WHEN "quarter" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q2",
  SUM(CASE WHEN "month" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Apr",
  SUM(CASE WHEN "month" = 5 THEN "nps" + "ps" + "r" ELSE 0 END) AS "May",
  SUM(CASE WHEN "month" = 6 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jun",
  SUM(CASE WHEN "quarter" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q3",
  SUM(CASE WHEN "month" = 7 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jul",
  SUM(CASE WHEN "month" = 8 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Aug",
  SUM(CASE WHEN "month" = 9 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Sep",
  SUM(CASE WHEN "quarter" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q4",
  SUM(CASE WHEN "month" = 10 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Oct",
  SUM(CASE WHEN "month" = 11 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Nov",
  SUM(CASE WHEN "month" = 12 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Dec"
FROM
  sales_data
WHERE
  "businessUnit" = 'Northern'
AND
  "market" = 'Malaysia'
UNION ALL
SELECT
  'Southern' as "scope",
  SUM(CASE WHEN "quarter" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q1",
  SUM(CASE WHEN "month" = 1 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jan",
  SUM(CASE WHEN "month" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Feb",
  SUM(CASE WHEN "month" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Mar",
  SUM(CASE WHEN "quarter" = 2 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q2",
  SUM(CASE WHEN "month" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Apr",
  SUM(CASE WHEN "month" = 5 THEN "nps" + "ps" + "r" ELSE 0 END) AS "May",
  SUM(CASE WHEN "month" = 6 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jun",
  SUM(CASE WHEN "quarter" = 3 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q3",
  SUM(CASE WHEN "month" = 7 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Jul",
  SUM(CASE WHEN "month" = 8 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Aug",
  SUM(CASE WHEN "month" = 9 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Sep",
  SUM(CASE WHEN "quarter" = 4 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Q4",
  SUM(CASE WHEN "month" = 10 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Oct",
  SUM(CASE WHEN "month" = 11 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Nov",
  SUM(CASE WHEN "month" = 12 THEN "nps" + "ps" + "r" ELSE 0 END) AS "Dec"



  




