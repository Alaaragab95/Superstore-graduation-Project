                                                    --Sunnary Overview--

--1-total sales, profit, and quantity sold.
SELECT 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM Central_Region;
-----------------------------------------------------
--2-top 5 customers by total sales.
SELECT top 5
    [Customer Name],
    SUM(Quantity) AS Total_Quantity,
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    SUM(Sales) AS Total_Sales
FROM Central_Region
GROUP BY [Customer Name]
ORDER BY Total_Sales DESC
-----------------------------------------------------
--3-distribution of quantity sold by customer segment.
SELECT 
    Segment,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Quantity) * 100.0 / (SELECT SUM(Quantity) FROM Central_Region), 2) AS Percentage
FROM Central_Region
GROUP BY Segment;
----------------------------------------------------
--4-Year-over-Year (YoY) profit.
SELECT 
    YEAR([Order Date]) AS Year,
    SUM(Profit) AS Total_Profit
FROM 
    Central_Region
GROUP BY 
    YEAR([Order Date])
ORDER BY 
    Year;
----------------------------------------------------
--5-total number of orders per year.
SELECT 
    YEAR([Order Date]) AS Year,
    COUNT(DISTINCT [Order ID]) AS Total_Orders
FROM 
    Central_Region
GROUP BY 
    YEAR([Order Date])
ORDER BY 
    Year DESC;
----------------------------------------------------
                                                    --Sales Analysis--

--6-Total Sales by Year
SELECT 
    YEAR([Order Date]) AS Year,
    SUM(Sales) AS Total_Sales
FROM 
    Central_Region
GROUP BY 
    YEAR([Order Date])
ORDER BY 
    Year DESC;
----------------------------------------------------
--7- total sales by quarter.
SELECT 
    DATEPART(QUARTER, [Order Date]) AS Quarter,
    YEAR([Order Date]) AS Year,
    SUM(Sales) AS Total_Sales
FROM 
    Central_Region
GROUP BY 
    YEAR([Order Date]), DATEPART(QUARTER, [Order Date])
ORDER BY 
    Year DESC, Quarter;
----------------------------------------------------
-- 8-Average sales per category.
SELECT 
    [Category],
    AVG(Sales) AS Average_Sales
FROM 
    Central_Region
GROUP BY 
    [Category]
ORDER BY 
    Average_Sales DESC;
-----------------------------------------------------
--9-top 3 best-selling products.
SELECT top 3
    [Product Name],
    SUM(Sales) AS Total_Sales
FROM 
    Central_Region
GROUP BY 
    [Product Name]
ORDER BY 
    Total_Sales DESC
-----------------------------------------------------
--10-top 5 highest-selling states based on total sales.
SELECT top 5
    [State],
    SUM(Sales) AS Total_Sales
FROM 
    Central_Region
GROUP BY 
    [State]
ORDER BY 
    Total_Sales DESC;
-----------------------------------------------------
--11--- total number of orders by shipping method.
SELECT 
    [Ship Mode],
    COUNT([Order ID]) AS Total_Orders
FROM 
    Central_Region
GROUP BY 
    [Ship Mode]
ORDER BY 
    Total_Orders DESC;
-----------------------------------------------------
                                                     --Profit Analysis--

--12-  total, average, max, min, and variance of profit.
SELECT 
    SUM(Profit) AS Total_Profit,             
    AVG(Profit) AS Average_Profit,          
    MAX(Profit) AS Max_Profit,             
    MIN(Profit) AS Min_Profit,               
    VAR(Profit) AS Profit_Variance           
FROM 
    Central_Region;
-----------------------------------------------------
--13-top 3 sub-categories by total profit.
SELECT TOP 3
    [Sub-Category],
    SUM(Profit) AS Total_Profit
FROM 
    Central_Region
GROUP BY 
    [Sub-Category]
ORDER BY 
    Total_Profit DESC;
-----------------------------------------------------
--14-bottom 3 sub-categories by total profit.
SELECT TOP 3
    [Sub-Category],
    SUM(Profit) AS Total_Profit
FROM 
    Central_Region
GROUP BY 
    [Sub-Category]
ORDER BY 
    Total_Profit ASC;
----------------------------------------------------
--15--- total profit by category and  percentage contribution.
SELECT 
    [Category],
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) * 100.0 / (SELECT SUM(Profit) FROM Central_Region), 2) AS Profit_Percentage
FROM 
    Central_Region
GROUP BY 
    [Category]
ORDER BY 
    Total_Profit DESC;
----------------------------------------------------
--16- total sales and profit by city.
SELECT 
    [City],
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM 
    Central_Region
GROUP BY 
    [City]
ORDER BY 
    Total_Profit DESC;





