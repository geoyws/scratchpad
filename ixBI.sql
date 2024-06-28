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
        SUM(CASE WHEN "salesType" SIMILAR TO '(SaaS - Services|SSA)' THEN "actualAmount" ELSE 0 END) AS "rs",
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
  'Total Sales Order' as 'scope',
  SUM(CASE WHEN "quarter" = 1 THEN SUM("nps", "ps", "recurring")) AS "Q1",
  SUM(CASE WHEN "month" = 1 THEN SUM("nps", "ps", "recurring")) AS "Jan",
  SUM(CASE WHEN "month" = 2 THEN SUM("nps", "ps", "recurring")) AS "Feb",
  SUM(CASE WHEN "month" = 3 THEN SUM("nps", "ps", "recurring")) AS "Mar",
  SUM(CASE WHEN "quarter" = 2 THEN SUM("nps", "ps", "recurring")) AS "Q2",
  SUM(CASE WHEN "month" = 4 THEN SUM("nps", "ps", "recurring")) AS "Apr",
  SUM(CASE WHEN "month" = 5 THEN SUM("nps", "ps", "recurring")) AS "May",
  SUM(CASE WHEN "month" = 6 THEN SUM("nps", "ps", "recurring")) AS "Jun",
  SUM(CASE WHEN "quarter" = 3 THEN SUM("nps", "ps", "recurring")) AS "Q3",
  SUM(CASE WHEN "month" = 7 THEN SUM("nps", "ps", "recurring")) AS "Jul",
  SUM(CASE WHEN "month" = 8 THEN SUM("nps", "ps", "recurring")) AS "Aug",
  SUM(CASE WHEN "month" = 9 THEN SUM("nps", "ps", "recurring")) AS "Sep",
  SUM(CASE WHEN "quarter" = 4 THEN SUM("nps", "ps", "recurring")) AS "Q4",
  SUM(CASE WHEN "month" = 10 THEN SUM("nps", "ps", "recurring")) AS "Oct",
  SUM(CASE WHEN "month" = 11 THEN SUM("nps", "ps", "recurring")) AS "Nov",
  SUM(CASE WHEN "month" = 12 THEN SUM("nps", "ps", "recurring")) AS "Dec",
FROM
  sales_data
GROUP BY
    "market", "businessUnit", "year", "quarter", "month"


