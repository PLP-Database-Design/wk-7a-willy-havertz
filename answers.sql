--Question 1
SELECT
  pd.OrderID,
  pd.CustomerName,
  LTRIM(RTRIM(s.value)) AS Product
FROM
  ProductDetail AS pd
CROSS APPLY
  STRING_SPLIT(pd.Products, ',') AS s;

--Question 2
-- 1. Create an Orders table holding only order-level attributes
CREATE TABLE Orders AS
SELECT DISTINCT
  OrderID,
  CustomerName
FROM
  OrderDetails;

-- 2. Create an OrderItems table holding the rest
CREATE TABLE OrderItems AS
SELECT
  OrderID,
  Product,
  Quantity
FROM
  OrderDetails;
