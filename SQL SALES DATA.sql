select * from salesdataacsv

select product, SUM(Sales) AS 
TotalSales
FROM salesdataacsv
GROUP BY Product

select Region, COUNT(OrderID)
AS NumOfTransactions
FROM salesdataacsv
GROUP BY Region

select Top(1) Product,
SUM(Sales) AS TotalSales
FROM salesdataacsv
GROUP BY Product
ORDER BY TotalSales DESC

select Product, SUM(Sales) AS
TotalRevenue
FROM salesdataacsv
GROUP BY Product

select Month(OrderDate) AS
Month,
SUM(Sales) AS
MonthlySalesTotal
FROM salesdataacsv WHERE
YEAR(OrderDate)=2024
GROUP BY Month(OrderDate)
ORDER BY Month

select TOP (5) Customer_Id,
SUM(Sales) AS
TotalPurchaseAmount FROM
salesdataacsv
GROUP BY Customer_Id
ORDER BY TotalPurchaseAmount
DESC

select Region, SUM(Sales) AS
RegionTotalSales,
FORMAT(ROUND((SUM(Sales)/
CAST((select SUM(Sales)
FROM salesdataacsv ) AS
DECIMAL(10,2))*100),1),'0.#')
AS PercentageOfTotalSales
FROM salesdataacsv
GROUP BY Region
ORDER BY
PercentageOfTotalSales DESC

select Product FROM salesdataacsv
GROUP BY Product
HAVING SUM(CASE
WHEN OrderDate BETWEEN
2024-06-01 AND 2024-08-31
THEN 1 ELSE 0 END)=0